package com.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.main.model.NguoiDung;
import com.main.model.Phim;
import com.main.service.PhimService;
import com.utils.UserCurrent;


@Controller
@RequestMapping("animu")
public class TrangChuController {
	@Autowired PhimService phimService;
	
	@GetMapping("home")
	public String getMethodName(Model model) {
		NguoiDung ng = UserCurrent.getNguoiDung();
		List<Phim> list = phimService.getAllPhimActive();
		model.addAttribute("movies", list);
		if(ng != null) {
			model.addAttribute("userCurrent", ng);
		}
		return "/views/index";
	}
	
	
}
