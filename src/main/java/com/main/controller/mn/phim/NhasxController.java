package com.main.controller.mn.phim;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.main.model.ChiTietPhim;
import com.main.model.NhaXSVaDienVien;
import com.main.model.Phim;
import com.main.model.TapPhim;
import com.main.repository.NhaXSVaDienVienRepository;
import com.main.repository.PhimRepository;
import com.main.repository.TapPhimRepository;
import com.main.service.ModelLoader;

@Controller
@RequestMapping("animu/control")
public class NhasxController {
	@Autowired
	ModelLoader modelLoader;
	
	@Autowired
	TapPhimRepository tapPhimRepository;
	
	@Autowired
	PhimRepository phimRepository;
	
	@Autowired
	NhaXSVaDienVienRepository nhaXSVaDienVienRepository;

	@GetMapping("nhasx")
	public String nhasx(Model model) {
		modelLoader.loadModel(model);
		//
		modelLoader.loadListPhim(model);// tai danh sach phim
		modelLoader.phimModel(model);
		modelLoader.chiTietPhimModel(model);
		modelLoader.tapPhimModel(model);
		modelLoader.nhaSanXuatModel(model);
		modelLoader.phanLoaiModel(model);
		
		model.addAttribute("action", 4);
		return "/views/phim/control";
	}
	//phim/edit/nhasx/{idPhim}/{idNhasx}
	@GetMapping("phim/edit/nhasx/{idNhasx}") //
	public String editphim(Model model, @PathVariable Integer idNhasx) {
		// chiTietPhim
		//PhimController.idPhim = idPhim;
		//PhimController.idTapphim = null;// reset
		PhimController.idNhasx = idNhasx;
		//
		// modelLoader.loadModel(model);
		//
		// modelLoader.loadListPhim(model);// tai danh sach phim

		// model.addAttribute("action", 1);

		return "redirect:/animu/control/nhasx";
	}
	
	@PostMapping("/phim/edit/nhasx")
	public String edittapphim(Model model, Phim phim, TapPhim tapphim, ChiTietPhim chitietphim,
			NhaXSVaDienVien nhasx,
			@RequestParam(name = "ten", required = false) String ten,
			@RequestParam(name = "btn-sua-nhasx", required = false) boolean btn_sua_nhasx) {
		if (btn_sua_nhasx) {
			if(PhimController.idNhasx != null && PhimController.idPhim != null) {
				//nhasanxuat
				NhaXSVaDienVien nhasanxuat = nhaXSVaDienVienRepository.findByIdPhimAndIdNhasx(PhimController.idPhim, PhimController.idNhasx);
				nhasanxuat.setTen(ten);
				nhaXSVaDienVienRepository.save(nhasanxuat);
			}
			
		}
		
		return "redirect:/animu/control/nhasx";
	}
}
