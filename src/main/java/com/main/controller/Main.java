package com.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class Main {
	
	@GetMapping("")
	public String getMethodName(Model model) {
		return "/views/home";
	}
	

	
	
	
}
