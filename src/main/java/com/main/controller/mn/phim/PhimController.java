package com.main.controller.mn.phim;

import java.util.Date;

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
import com.main.model.PhanLoai;
import com.main.model.Phim;
import com.main.model.TapPhim;
import com.main.repository.ChiTietPhimRepository;
import com.main.repository.NhaXSVaDienVienRepository;
import com.main.repository.PhanLoaiRepository;
import com.main.repository.PhimRepository;
import com.main.repository.TapPhimRepository;
import com.main.service.ModelLoader;

@Controller
@RequestMapping("animu/control")
public class PhimController {
	public static Integer idTapphim = null;
	public static Integer idPhim = null;
	public static Integer idNhasx = null;
	private String mesSuccessPhim = null;
	private String mesErrorPhim = null;

	@Autowired
	ModelLoader modelLoader;

	@Autowired
	PhimRepository phimRepository;

	@Autowired
	TapPhimRepository tapPhimRepository;

	@Autowired
	ChiTietPhimRepository chiTietPhimRepository;

	@Autowired
	NhaXSVaDienVienRepository nhaXSVaDienVienRepository;
	
	@Autowired
	PhanLoaiRepository phanLoaiRepository;

	@GetMapping("phim")
	public String phim(Model model) {
		//
		modelLoader.loadModel(model);
		//
		modelLoader.loadListPhim(model);// tai danh sach phim
		modelLoader.phimModel(model); // Entity Phim tuong tac voi form
		modelLoader.chiTietPhimModel(model);// Entity ChiTietPhim tuong tac voi form
		modelLoader.tapPhimModel(model);// List + Entity TapPhim tuong tac voi form
		modelLoader.nhaSanXuatModel(model);// List + Entity TapPhim tuong tac voi form
		modelLoader.phanLoaiModel(model);// List + Entity TapPhim tuong tac voi form
		//
		if(mesSuccessPhim != null) {
			model.addAttribute("mesSuccessPhim", mesSuccessPhim);
		}
		if(mesErrorPhim != null) {
			model.addAttribute("mesErrorPhim", mesErrorPhim);
		}

		model.addAttribute("action", 1);
		return "/views/phim/control";
	}

	@GetMapping("phim/clear")
	public String clear() {
		PhimController.idPhim = null;
		PhimController.idTapphim = null;
		PhimController.idNhasx = null;
		mesSuccessPhim = null;
		mesErrorPhim = null;
		return "redirect:/animu/control/phim";
	}

	@GetMapping("phim/edit/{idPhim}") //
	public String editphim(Model model, @PathVariable Integer idPhim) {
		// chiTietPhim
		PhimController.idPhim = idPhim;
		PhimController.idTapphim = null;// reset
		//
		// modelLoader.loadModel(model);
		//
		// modelLoader.loadListPhim(model);// tai danh sach phim

		// model.addAttribute("action", 1);
		mesSuccessPhim = null;
		mesErrorPhim = null;

		return "redirect:/animu/control/phim";
	}

	@PostMapping("phim/edit")
	public String savephim(Model model, Phim phim, TapPhim tapphim, ChiTietPhim chitietphim,
			@RequestParam(name = "btn-them-phim", required = false) boolean btn_them,
			@RequestParam(name = "btn-chinh-sua-phim", required = false) boolean btn_sua) {
		// chiTietPhim
		if (btn_them) {
			phim.setIdphim(phimRepository.findMaxId() + 1);
			phim.setNgaytao(new Date());
			ChiTietPhim ct = new ChiTietPhim();
			ct.setNgaychinhsua(new Date());
			ct.setIdphim(phim.getIdphim());
			phim.setChitietphim(ct);
			
			//them phim 
			phimRepository.save(phim);
			
			// nhasx
			NhaXSVaDienVien nhasx = new NhaXSVaDienVien();
			nhasx.setIdnhasxvadv(nhaXSVaDienVienRepository.findMaxId() + 1);
			nhasx.setIdphim(phim.getIdphim());
			nhasx.setVaitro(true);
			nhaXSVaDienVienRepository.save(nhasx);
			
			// nhasx
			NhaXSVaDienVien nhasx2 = new NhaXSVaDienVien();
			nhasx2.setIdnhasxvadv(nhaXSVaDienVienRepository.findMaxId() + 1);
			nhasx2.setIdphim(phim.getIdphim());
			nhasx2.setVaitro(false);
			nhaXSVaDienVienRepository.save(nhasx2);
			
			//phanloai
			PhanLoai pl = new PhanLoai();
			pl.setIdphim(phim.getIdphim());
			phanLoaiRepository.save(pl);
			
			mesSuccessPhim = "Thêm thành công Phim mới";
			
		}
		if (btn_sua) {
			Phim p = phimRepository.findById(phim.getIdphim()).get();
			p.setActive(phim.isActive());
			p.setNgaytao(new Date());
			p.setPoster_url(phim.getPoster_url());
			p.setSlug(phim.getSlug());
			p.setThumb_url(phim.getThumb_url());
			p.setTieude(phim.getTieude());

			phimRepository.save(p);
			
			mesSuccessPhim = "Sửa Phim thành công";
		}

		//
		modelLoader.loadModel(model);
		//
		modelLoader.loadListPhim(model);// tai danh sach phim

		// model.addAttribute("action", 1);

		return "redirect:/animu/control/phim";
	}

}
