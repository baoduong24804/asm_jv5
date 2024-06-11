package com.main.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

import org.eclipse.tags.shaded.org.apache.xalan.xsltc.compiler.sym;
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
    public String home(Model model, @RequestParam("p") Optional<Integer> p,
            @RequestParam(name = "loaiphim", required = false) String loaiphim,
            @RequestParam(name = "key", required = false) String key) {
        List<PhanLoai> list = phanLoaiRepository.findAll();
        Set<String> setloaiphim = new HashSet<>();
        Map<String, String> maploaiphim = new HashMap<>();

        for (PhanLoai phanLoai : list) {
            String[] loaiphimList = phanLoai.getLoaiphim().split(",");

            if (loaiphimList.length > 1) {
                for (int i = 0; i < loaiphimList.length; i++) {
                    setloaiphim.add(loaiphimList[i].trim());
                }
            } else {
                setloaiphim.add(phanLoai.getLoaiphim().trim());
            }

        }
        for (String string : setloaiphim) {
            String splitString[] = string.split(":");
            if (splitString.length > 1) {
                maploaiphim.put(splitString[1].trim(), splitString[0].trim());
            }

        }

        model.addAttribute("map", maploaiphim);
        //////

        Pageable pageable = PageRequest.of(p.orElse(0), 12);
        Page<Phim> page = null;
        if (key != null) {
            page = phimRepository.findAllPhimLikeTieuDeAndPage(key, pageable);
        } else {
            if (loaiphim != null) {

                for (String string : setloaiphim) {

                    if (string.split(":").length > 1) {
                        if (string.split(":")[1].trim().equals(loaiphim.trim())) {
                            loaiphim = string.split(":")[0].trim();
                            break;
                        }
                    }
                }
                page = phimRepository.findPhimByPhanLoai(loaiphim, pageable);

            } else {
                page = phimRepository.findPhimAll(pageable);
            }
        }

        // String theLoaiValue = theLoai.orElse("all");

        model.addAttribute("url", "/animu/listmovie");

        model.addAttribute("page", page);

        return "/views/list-of-anime";
    }

}