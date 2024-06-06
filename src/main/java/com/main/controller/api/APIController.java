package com.main.controller.api;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.main.model.Phim;
import com.main.repository.PhimRepository;

@RestController
public class APIController {
	@Autowired
	PhimRepository phimRepository;

	@GetMapping("/api/phim")
	public List<Phim> getMethodName() {
		List<Phim> list = phimRepository.findAll();
		List<Phim> list2 = new ArrayList<Phim>();
		for (Phim phim : list) {
			Phim p = new Phim(phim.getIdphim(), phim.getTieude(), phim.getSlug(), phim.getThumb_url(),
					phim.getPoster_url(), phim.getNgaytao(), phim.isActive(), null, null, null, null);
			list2.add(p);
		}
		return list2;
	}

}
