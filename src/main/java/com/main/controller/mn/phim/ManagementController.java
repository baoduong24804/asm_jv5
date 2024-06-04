package com.main.controller.mn.phim;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.main.service.ModelLoader;



@Controller
@RequestMapping("animu/control")
public class ManagementController {
	
	@Autowired
	ModelLoader modelLoader;
	
	@GetMapping("")
	public String getMethodName(Model model) {
		// model
		//loadModel(model);
		modelLoader.loadModel(model);
		//
		modelLoader.loadListPhim(model);// tai danh sach phim
		//

		model.addAttribute("action", 0);

		return "/views/phim/control";
	}
}
