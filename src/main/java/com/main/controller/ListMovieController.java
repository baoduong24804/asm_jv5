package com.main.controller;


import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.main.model.PhanLoai;
import com.main.model.Phim;
import com.main.repository.PhanLoaiRepository;
import com.main.repository.PhimRepository;
import com.main.service.PhimService;


@Controller
@RequestMapping("/animu")
public class ListMovieController {

    @Autowired
    PhimService phimService;

    @Autowired
    PhimRepository phimRepository;

    @Autowired
    PhanLoaiRepository phanLoaiRepository;

    @GetMapping("/listmovie")
    public String home(Model model, @RequestParam("p") Optional<Integer> p, @RequestParam("theloai") Optional<String> theLoai) {
        List<PhanLoai> list = phanLoaiRepository.findAll();
        Pageable pageable = PageRequest.of(p.orElse(0), 12);
       Page<Phim> page;
       String theLoaiValue = theLoai.orElse("all");

        if (theLoaiValue.equals("all")) {
            page = phimRepository.findAll(pageable);
        } else {
            page = phimRepository.findPhimByPhanLoai(theLoaiValue, pageable);
        }
        model.addAttribute("url", "/animu/listmovie");        
        model.addAttribute("theloai", theLoaiValue);
        model.addAttribute("page", page);
    	model.addAttribute("phanloai", list);
        return "/views/list-of-anime";
    }

}