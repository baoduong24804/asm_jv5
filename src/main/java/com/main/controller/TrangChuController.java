package com.main.controller;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.main.model.NguoiDung;
import com.main.model.People;
import com.main.model.Phim;
import com.main.repository.PhimRepository;
import com.main.service.SessionService;
import com.utils.UserCurrent;

@Controller
@RequestMapping("animu")
public class TrangChuController {
	@Autowired
	PhimRepository phimRepository;

	@Autowired
	private MessageSource messageSource;

	@Autowired
	SessionService service;

	@GetMapping("home")
	public String getMethodName(Model model, Locale locale) {
		NguoiDung ng = UserCurrent.getNguoiDung();
		if (ng == null) {
			ng = (NguoiDung) service.get("user");
		}
		List<Phim> list = phimRepository.findAllPhimOrderByNgayTaoDESC(PageRequest.of(0, 12));
		model.addAttribute("movies", list);

		if (ng != null) {
			model.addAttribute("user", ng);
		}

		model.addAttribute("theloai", messageSource.getMessage("theloai", null, locale));
		model.addAttribute("phimbo", messageSource.getMessage("phimbo", null, locale));
		model.addAttribute("phimle", messageSource.getMessage("phimle", null, locale));
		model.addAttribute("phimchieurap", messageSource.getMessage("phimchieurap", null, locale));
		model.addAttribute("thinhhanh", messageSource.getMessage("thinhhanh", null, locale));
		model.addAttribute("taikhoan", messageSource.getMessage("taikhoan", null, locale));
		model.addAttribute("taikhoan", messageSource.getMessage("taikhoan", null, locale));
		model.addAttribute("tapmoi", messageSource.getMessage("tapmoi", null, locale));
		model.addAttribute("bosuutap", messageSource.getMessage("bosuutap", null, locale));

		return "/views/index";
	}

	// @ResponseBody
	// @GetMapping("api/{param}")
	// public String getMethodName(@PathVariable("param") String x) {
	// System.out.println(x);
	// return x;
	// }

	@ResponseBody
	@PostMapping("api/post")
	public String getMethodName3(@RequestBody People p) {
		System.out.println(p.getUsername());
		System.out.println(p.getPassword());
		return "";
	}

	@GetMapping("test")
	public String getMethodName() {
		return "/views/test";
	}

}
