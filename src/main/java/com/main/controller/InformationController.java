package com.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.main.model.Phim;
import com.main.repository.PhimRepository;

@Controller
@RequestMapping("/animu/listmovie")
public class InformationController {
	@Autowired
	PhimRepository phimresp;
	@GetMapping("information")
	public String home(Model model) {
		List<Phim> list = phimresp.findAll();
		model.addAttribute("items",list);
		return "/views/information";
	}
}
