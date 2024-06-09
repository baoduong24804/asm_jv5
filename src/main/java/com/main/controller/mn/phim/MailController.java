package com.main.controller.mn.phim;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.main.repository.MailerService;
import com.main.service.ModelLoader;

@Controller

public class MailController {

	@Autowired
	MailerService mailer;

	@Value("${upload.directory}")
	private String uploadDirectory;

	@Autowired
	ModelLoader modelLoader;

	public static String mes = null;

	@GetMapping("/animu/control/mail")
	public String tapphim(Model model) {
		modelLoader.loadModel(model);
		//
		modelLoader.loadListPhim(model);// tai danh sach phim
		modelLoader.phimModel(model); // Entity Phim tuong tac voi form
		modelLoader.chiTietPhimModel(model);// Entity ChiTietPhim tuong tac voi form
		modelLoader.tapPhimModel(model);// List + Entity TapPhim tuong tac voi form
		modelLoader.nhaSanXuatModel(model);// List + Entity TapPhim tuong tac voi form
		modelLoader.phanLoaiModel(model);// List + Entity TapPhim tuong tac voi form


		if (mes != null) {
			model.addAttribute("mes", mes);
		}

		mes = null;

		model.addAttribute("action", 9);
		return "/views/phim/control";
	}

	

}
