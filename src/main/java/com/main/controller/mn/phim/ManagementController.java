package com.main.controller.mn.phim;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.main.model.NguoiDung;
import com.main.service.ModelLoader;
import com.main.service.SessionService;
import com.utils.UserCurrent;



@Controller
@RequestMapping("animu/control")
public class ManagementController {
	
	@Autowired
	ModelLoader modelLoader;
	
	@Autowired
	SessionService service;
	
	@GetMapping("")
	public String getMethodName(Model model) {
		NguoiDung ng = (NguoiDung) service.get("user");
		if(ng == null || UserCurrent.getNguoiDung() == null) {
			model.addAttribute("action", 0);

			return "/views/phim/control";
		}
		modelLoader.loadModel(model);
		//
		modelLoader.loadListPhim(model);// tai danh sach phim
		modelLoader.phimModel(model); // Entity Phim tuong tac voi form
		modelLoader.chiTietPhimModel(model);// Entity ChiTietPhim tuong tac voi form
		modelLoader.tapPhimModel(model);// List + Entity TapPhim tuong tac voi form
		modelLoader.nhaSanXuatModel(model);// List + Entity TapPhim tuong tac voi form
		modelLoader.phanLoaiModel(model);// List + Entity TapPhim tuong tac voi form

		model.addAttribute("action", 0);

		return "/views/phim/control";
	}
}
