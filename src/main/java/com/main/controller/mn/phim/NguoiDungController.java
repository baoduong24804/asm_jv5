package com.main.controller.mn.phim;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.main.service.ModelLoader;

@Controller
@RequestMapping("animu/control")
public class NguoiDungController {

	@Autowired
	ModelLoader modelLoader;
	
	@GetMapping("nguoidung")
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
		
		model.addAttribute("action", 6);
		return "/views/phim/control";
	}
	
	
}
