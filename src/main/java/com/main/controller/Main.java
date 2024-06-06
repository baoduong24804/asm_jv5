package com.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.main.service.SessionService;


@Controller
public class Main {
	
	@Autowired
	SessionService service;
	
	@GetMapping("")
	public String getMethodName(Model model) {
		service.set("uri", null);
		
		return "/views/home";
	}
	

	
	
	
}
