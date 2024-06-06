package com.main.controller.mn.phim;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.main.model.PhanLoai;
import com.main.repository.PhanLoaiRepository;
import com.main.service.ModelLoader;

@Controller
@RequestMapping("animu/control")
public class PhanLoaiController {
	private String mesSuccessPhanLoai = null;
	
	@Autowired
	ModelLoader modelLoader;
	
	@Autowired
	PhanLoaiRepository phanLoaiRepository;
	
	@GetMapping("phanloai")
	public String phanloai(Model model) {
		modelLoader.loadModel(model);
		//
		modelLoader.loadListPhim(model);// tai danh sach phim
		modelLoader.phimModel(model);
		modelLoader.chiTietPhimModel(model);
		modelLoader.tapPhimModel(model);
		modelLoader.nhaSanXuatModel(model);
		modelLoader.phanLoaiModel(model);
		//
		if(mesSuccessPhanLoai != null) {
			model.addAttribute("mesSuccessPhanLoai", mesSuccessPhanLoai);
		}
		
		model.addAttribute("action", 5);
		return "/views/phim/control";
	}
	@GetMapping("phim/edit/phanloai/{idPhim}") //
	public String editphim(Model model, @PathVariable Integer idPhim) {
		// chiTietPhim
		//PhimController.idPhim = idPhim;
		//PhimController.idTapphim = null;// reset
		PhimController.idPhim = idPhim;
		//
		// modelLoader.loadModel(model);
		//
		// modelLoader.loadListPhim(model);// tai danh sach phim

		// model.addAttribute("action", 1);
		mesSuccessPhanLoai = null;

		return "redirect:/animu/control/phanloai";
	}
	
	@PostMapping("/phim/edit/phanloai")
	public String edittapphim(Model model, PhanLoai phanLoai,
			@RequestParam(name = "btn-sua-phanloai", required = false) boolean btn_sua_phanloai) {
		if (btn_sua_phanloai) {
			if(PhimController.idPhim != null) {
			
				PhanLoai pl = phanLoaiRepository.findByIdphim(PhimController.idPhim);
				pl.setLoaiphim(phanLoai.getLoaiphim());
				pl.setNam(phanLoai.getNam());
				pl.setQuocgia(phanLoai.getQuocgia());
				pl.setTheloai(phanLoai.getTheloai());
				phanLoaiRepository.save(pl);
				
				mesSuccessPhanLoai = "Sửa phân loại thành công";
			}
			
		}
		
		return "redirect:/animu/control/phanloai";
	}
}
