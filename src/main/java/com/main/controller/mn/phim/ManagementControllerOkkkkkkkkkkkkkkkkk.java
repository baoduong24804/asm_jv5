package com.main.controller.mn.phim;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.main.controller.api.APIPhimController;
import com.main.service.SessionService;



@Controller
@RequestMapping("animu/control/test")
public class ManagementControllerOkkkkkkkkkkkkkkkkk {
	
	@Autowired
	SessionService service;
	
	
	@GetMapping("")
	public String getMethodName(Model model) {
		APIPhimController.editPhim = null;
		
		return "/views/control";
	}
}
