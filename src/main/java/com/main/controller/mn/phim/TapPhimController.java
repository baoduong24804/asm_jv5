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
import com.main.model.Phim;
import com.main.model.TapPhim;
import com.main.repository.ChiTietPhimRepository;
import com.main.repository.PhimRepository;
import com.main.repository.TapPhimRepository;
import com.main.service.ModelLoader;

@Controller
@RequestMapping("animu/control")
public class TapPhimController {
	@Autowired
	ModelLoader modelLoader;
	
	@Autowired
	PhimRepository phimRepository;
	
	@Autowired
	TapPhimRepository tapPhimRepository;
	
	@Autowired
	ChiTietPhimRepository chiTietPhimRepository;
	
	@GetMapping("tapphim")
	public String tapphim(Model model) {
		//
		modelLoader.loadModel(model);
		//
		modelLoader.loadListPhim(model);// tai danh sach phim
		modelLoader.phimModel(model);
		modelLoader.chiTietPhimModel(model);
		modelLoader.tapPhimModel(model);
		modelLoader.phanLoaiModel(model);
		//
		model.addAttribute("action", 3);
		return "/views/phim/control";
	}
	
	@GetMapping("phim/edit/tapphim/{id}")
	public String edittapphim(Model model, @PathVariable Integer id) {
		// chiTietPhim
		PhimController.idTapphim = id;
		
		//modelLoader.loadModel(model);
		//modelLoader.loadListPhim(model);

		// model.addAttribute("action", 1);

		return "redirect:/animu/control/tapphim";
	}
	
	@GetMapping("phim/delete/tapphim/{id}")
	public String deletetapphim(Model model, @PathVariable Integer id) {
		// chiTietPhim
		PhimController.idTapphim = null;
		TapPhim t = tapPhimRepository.findById(id).get();
		tapPhimRepository.delete(t);
		
		

		return "redirect:/animu/control/tapphim";
	}
	
	@PostMapping("/phim/edit/tapphim")
	public String edittapphim(Model model, Phim phim, TapPhim tapphim, ChiTietPhim chitietphim,
			@RequestParam(name = "btn-them-tap-phim", required = false) boolean btn_them_tapphim,
			@RequestParam(name = "btn-chinh-sua-tap-phim", required = false) boolean btn_sua_tapphim) {
		if (btn_them_tapphim) {
			
			tapphim.setIdtapphim(tapPhimRepository.findMaxId() + 1);
			Phim p = phimRepository.findById(PhimController.idPhim).get();
			tapphim.setPhim(p);
			tapPhimRepository.save(tapphim);
			PhimController.idTapphim = null;
		}
		if (btn_sua_tapphim) {
			TapPhim tp = tapPhimRepository.findById(tapphim.getIdtapphim()).get();
			tp.setLink(tapphim.getLink());
			tp.setLink2(tapphim.getLink2());
			tp.setServer(tapphim.getServer());
			tp.setSlug(tapphim.getSlug());
			tp.setTentap(tapphim.getTentap());
			tapPhimRepository.save(tp);
		}
		return "redirect:/animu/control/tapphim";
	}
}
