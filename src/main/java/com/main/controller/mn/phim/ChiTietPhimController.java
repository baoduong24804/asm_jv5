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
import com.main.model.Phim;
import com.main.model.TapPhim;
import com.main.repository.ChiTietPhimRepository;
import com.main.service.ModelLoader;

@Controller
@RequestMapping("animu/control")
public class ChiTietPhimController {
	private String mesSuccessChiTietPhim = null;
	@Autowired
	ModelLoader modelLoader;
	
	@Autowired
	ChiTietPhimRepository chiTietPhimRepository;
	
	@GetMapping("chitietphim")
	public String chitietphim(Model model) {
		modelLoader.loadModel(model);
		//
		modelLoader.loadListPhim(model);// tai danh sach phim
		modelLoader.phimModel(model);
		modelLoader.chiTietPhimModel(model);
		modelLoader.tapPhimModel(model);
		modelLoader.phanLoaiModel(model);
		//
		if(mesSuccessChiTietPhim != null) {
			model.addAttribute("mesSuccessChiTietPhim", mesSuccessChiTietPhim);
		}
		model.addAttribute("action", 2);
		return "/views/phim/control";
	}
	
	@GetMapping("phim/edit/chitietphim/{id}")
	public String editchitietphim(Model model, @PathVariable Integer id) {
		// chiTietPhim
		PhimController.idTapphim = id;
		

		// model.addAttribute("action", 1);
		mesSuccessChiTietPhim = null;

		return "redirect:/animu/control/chitietphim";
	}
	
	@PostMapping("phim/edit/chitietphim")
	public String editchitietphim(Model model, Phim phim, TapPhim tapphim, ChiTietPhim chitietphim,
			@RequestParam(name = "btn-chinh-sua-chi-tiet-phim", required = false) boolean btn_sua_chitietphim) {
		if (btn_sua_chitietphim) {

			ChiTietPhim ct = chiTietPhimRepository.findById(chitietphim.getIdphim()).get();
			ct.setChatluong(chitietphim.getChatluong());
			ct.setMota(chitietphim.getMota());
			ct.setNgaychinhsua(new Date());
			ct.setTapmoinhat(chitietphim.getTapmoinhat());
			ct.setTengoc(chitietphim.getTengoc());
			ct.setThoigian(chitietphim.getThoigian());
			ct.setTongsotap(chitietphim.getTongsotap());

			chiTietPhimRepository.save(ct);
			mesSuccessChiTietPhim = "Sửa chi tiết phim thành công";

		}
		return "redirect:/animu/control/chitietphim";
	}

}
