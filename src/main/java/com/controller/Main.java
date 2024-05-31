package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.service.NguoiDungService;
import com.service.PhimService;


@Controller
public class Main {
	@Autowired
	NguoiDungService nguoiDungService;
	@Autowired
	PhimService phimService;
	
	
	@GetMapping("")
	public String getMethodName(Model model) {
		
		return "/views/index";
	}
	
	
	
}
