package com.main.controller.api;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.main.model.NguoiDung;
import com.main.repository.NguoiDungRepository;



@RestController
public class APINguoiDungController {
	@Autowired
	NguoiDungRepository nguoiDungRepository;
	
	@GetMapping("/animu/api/get/nguoidung/list")
	public List<NguoiDung> getMethodName() {
		List<NguoiDung> list = new ArrayList<NguoiDung>();
		List<NguoiDung> ls = nguoiDungRepository.findAll();
		for (NguoiDung nguoiDung : ls) {
			NguoiDung ng = new NguoiDung();
			ng.setActive(nguoiDung.isActive());
			ng.setEmail(nguoiDung.getEmail());
			ng.setNgaytao(nguoiDung.getNgaytao());
			ng.setPassword(nguoiDung.getPassword());
			ng.setRole(nguoiDung.getRole());
			ng.setUser_id(nguoiDung.getUser_id());
			ng.setUsername(nguoiDung.getUsername());
			list.add(ng);
		}
		return list;
	}
	
	@GetMapping("/animu/api/import/Excel")
	public String importExcel() {
		return new String();
	}
	
	
	@GetMapping("/animu/api/get/nguoidung/vaitro")
	public Map<String, String> getVaiTro() {
	    Map<String, String> map = new HashMap<String, String>();
	    List<NguoiDung> ls = nguoiDungRepository.findAll();
	    for (NguoiDung nguoiDung : ls) {
	    	String value = "";
	    	String key = "";
	    	if(nguoiDung.getRole() == 2) {
	    		value = "Manager";
	    		key = "2";
	    	}else if(nguoiDung.getRole() == 1) {
	    		value = "Member Vip";
	    		key = "1";
	    	}else {
	    		value = "Member";
	    		key = "0";
	    	}
	       
	        
	        map.put(key, value);
	    }
	    return map;
	}

	
	@GetMapping("/animu/api/update/nguoidung/{id}")
	public String getMethodName(@PathVariable("id") String id) {
		try {
		
			NguoiDung ng = nguoiDungRepository.findById(Integer.parseInt(id)).get();
			ng.setActive(!ng.isActive());
			nguoiDungRepository.save(ng);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "0,Cập nhật thất bại người dùng [idnguoidung : "+id+"]";
		}
		
		
		return "1,Cập nhật thành công người dùng [idnguoidung : "+id+"]";
	}
	
	@PostMapping("/animu/api/search/nguoidung")
	public List<NguoiDung> search(@RequestParam(name = "key",required = false) String key, @RequestParam(name = "option",required = false) Integer option) {
		List<NguoiDung> listp = null;
		
		if(key == null) {
			
			if(option == 0) {
				listp = nguoiDungRepository.findALLByRole(0);
			}else if(option == 1) {
				listp = nguoiDungRepository.findALLByRole(1);
			}else if(option == 2) {
				listp = nguoiDungRepository.findALLByRole(2);
			}else {
				listp = nguoiDungRepository.findAll();
			}
			
		}else {
			
			if(option == 0) {
				listp = nguoiDungRepository.findUserLikeEmailAndRole(key,0);
			}else if(option == 1) {
				listp = nguoiDungRepository.findUserLikeEmailAndRole(key,1);
			}else if(option == 2) {
				listp = nguoiDungRepository.findUserLikeEmailAndRole(key,2);
			}else {
				listp = nguoiDungRepository.findUserLikeEmail(key);
			}
		}
		
		
		List<NguoiDung> list =  new ArrayList<NguoiDung>();
		//
		
			for (NguoiDung ng : listp) {
				NguoiDung nguoiDung = new NguoiDung();
				nguoiDung.setActive(ng.isActive());
				nguoiDung.setEmail(ng.getEmail());
				nguoiDung.setNgaytao(ng.getNgaytao());
				nguoiDung.setPassword(ng.getPassword());
				nguoiDung.setRole(ng.getRole());
				nguoiDung.setUser_id(ng.getUser_id());
				nguoiDung.setUsername(ng.getUsername());
				list.add(nguoiDung);
			}
		


	    return list;
	}
	
	
}
