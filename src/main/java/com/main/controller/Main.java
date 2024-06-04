package com.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.main.repository.ChiTietNguoiDungRepository;
import com.main.repository.ChiTietPhimRepository;
import com.main.repository.NguoiDungRepository;
import com.main.repository.NhaXSVaDienVienRepository;
import com.main.repository.PhanLoaiRepository;
import com.main.repository.PhimRepository;
import com.main.repository.TapPhimRepository;
import com.main.repository.YeuThichRepository;


@Controller
public class Main {
	@Autowired
	ChiTietNguoiDungRepository chiTietNguoiDungRepository;
	@Autowired
	ChiTietPhimRepository chiTietPhimRepository;
	@Autowired
	NguoiDungRepository nguoiDungRepository;
	@Autowired
	NhaXSVaDienVienRepository nhaXSVaDienVienRepository;
	@Autowired
	PhanLoaiRepository phanLoaiRepository;
	@Autowired
	PhimRepository phimRepository;
	@Autowired
	TapPhimRepository tapPhimRepository;
	@Autowired
	YeuThichRepository yeuThichRepository;
	
	@ResponseBody
	@GetMapping("")
	public String getMethodName(Model model) {
//		StringBuilder s = new StringBuilder();
//		s.append(chiTietNguoiDungRepository.findAll().toString());
		//s.append(chiTietPhimRepository.findAll());
//		s.append(nguoiDungRepository.findAll().toString());
//		s.append(nhaXSVaDienVienRepository.findAll().toString());
//		s.append(phanLoaiRepository.findAll().toString());
//		s.append(phimRepository.findAll().toString());
//		s.append(tapPhimRepository.findAll().toString());
//		s.append(yeuThichRepository.findAll().toString());
//		for (YeuThich c : yeuThichRepository.findAll()) {
//			System.out.println(c.getNguoiDung().getUsername()+c.getPhim().getTieude()+c.getPhim().get);
//		}
		return "ok";
	}
	
	
	
}
