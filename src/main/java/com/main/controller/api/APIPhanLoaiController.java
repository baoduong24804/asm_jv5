package com.main.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.main.model.PhanLoai;
import com.main.repository.PhanLoaiRepository;

@RestController
public class APIPhanLoaiController {
	@Autowired
	PhanLoaiRepository phanLoaiRepository;
	
	
	@GetMapping("animu/api/get/phanloai")
	public PhanLoai getPhanLoai() {
		if(APIPhimController.editPhim != null) {
			PhanLoai phanLoai = new PhanLoai();
			PhanLoai pl = null;
			
			try {
				pl = phanLoaiRepository.findById(APIPhimController.editPhim).get();
			} catch (Exception e) {
				// TODO: handle exception
			
			}
			
			if(pl != null) {
				phanLoai.setIdphim(pl.getIdphim());
				phanLoai.setLoaiphim(pl.getLoaiphim());
				phanLoai.setNam(pl.getNam());
				phanLoai.setQuocgia(pl.getQuocgia());
				phanLoai.setTheloai(pl.getTheloai());
				
			}else {
				
				PhanLoai phanLoainew = new PhanLoai();
				phanLoainew.setIdphim(APIPhimController.editPhim);
				
				phanLoaiRepository.save(phanLoainew);
				
				phanLoai = phanLoainew;
			}
			
			
			
			
			return phanLoai;
		}else {
			return  null;
		}
		
	}
	
	@PostMapping("/animu/api/update/phanloai")
	public String updatectphanloai(@RequestBody PhanLoai phanLoai) {
		PhanLoai pl = null;
	    try {
	    	if(APIPhimController.editPhim != null) {
	    	try {
	    		pl = phanLoaiRepository.findById(APIPhimController.editPhim).get();
	    		pl.setLoaiphim(phanLoai.getLoaiphim());
	    		pl.setNam(phanLoai.getNam());
	    		pl.setQuocgia(phanLoai.getQuocgia());
	    		pl.setTheloai(phanLoai.getTheloai());
	    		phanLoaiRepository.save(pl);
	    		return "1,Cập nhật thành công Phân loại [idphim: " + APIPhimController.editPhim + "]";
			} catch (Exception e) {
				e.printStackTrace();
				return "0,Cập nhật thất bại - Không tìm thấy Phân loại với ID: " + APIPhimController.editPhim;
			}
		        
		        
	    	}
	    	
	        
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	        return "0,Cập nhật thất bại";
	    }
	    return "0,Cập nhật thất bại";
	}
}
