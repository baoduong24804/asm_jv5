package com.main.controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.main.service.SessionService;


@Controller
public class Main {
	
	@Autowired
	SessionService service;
	
	@Autowired
    private MessageSource messageSource;
	
	@GetMapping("")
	public String getMethodName(Model model, Locale locale) {
		service.set("uri", null);
		
		model.addAttribute("mes", messageSource.getMessage("greeting", null, locale));
		
		//System.out.println( messageSource.getMessage("greeting", null, locale));
		return "/views/home";
	}
	

	
	
	
}
