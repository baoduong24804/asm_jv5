package com.main.controller.api;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.main.model.NguoiDung;
import com.main.repository.NguoiDungRepository;

@RestController
public class APIController {
	@Autowired
	NguoiDungRepository nguoiDungRepository;
	


	
	public static List<NguoiDung> list2 = new ArrayList<NguoiDung>();


	@GetMapping("/api/nguoidung/ngaytao/{option}")
	public List<NguoiDung> getMethodName(@PathVariable(name = "option", required = true) String option) {
		List<NguoiDung> list;
		if (option.equals("all")) {
			list = nguoiDungRepository.findAll();
		} else {
			LocalDate oneYearAgo = LocalDate.now().minusYears(1);
			list = nguoiDungRepository.findUsersCreatedWithinOneYear(oneYearAgo);
		}
		
		list2.removeAll(list2);
		 
		for (NguoiDung n : list) {
			NguoiDung nguoiDung = new NguoiDung();
			nguoiDung.setEmail(n.getEmail());
			nguoiDung.setNgaytao(n.getNgaytao());
			nguoiDung.setUsername(n.getUsername());
			//LocalDate pastDate = LocalDate.of(nguoiDung.getNgaytao().getYear(), nguoiDung.getNgaytao().getMonth(), nguoiDung.getNgaytao().getDayOfMonth());
			//System.out.println(Utils.getDateFromTo(pastDate));
			
			list2.add(nguoiDung);
		}
		return list2;
	}

}
