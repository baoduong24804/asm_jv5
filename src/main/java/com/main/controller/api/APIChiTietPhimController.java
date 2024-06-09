package com.main.controller.api;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.main.model.ChiTietPhim;
import com.main.repository.ChiTietPhimRepository;
	

@RestController
public class APIChiTietPhimController {
	@Autowired
	ChiTietPhimRepository chiTietPhimRepository;
	
	
	@GetMapping("animu/api/get/chitietphim")
	public ChiTietPhim getChiTietPhim() {
		if(APIPhimController.editPhim != null) {
			ChiTietPhim ctphim = new ChiTietPhim();
			ChiTietPhim chitietphim = null;
			
			try {
				chitietphim = chiTietPhimRepository.findById(APIPhimController.editPhim).get();
			} catch (Exception e) {
				// TODO: handle exception
			
			}
			
			if(chitietphim != null) {
				
				ctphim.setIdphim(chitietphim.getIdphim());
				ctphim.setTengoc(chitietphim.getTengoc());
				ctphim.setTongsotap(chitietphim.getTongsotap());
				ctphim.setTapmoinhat(chitietphim.getTapmoinhat());
				ctphim.setThoigian(chitietphim.getThoigian());
				ctphim.setChatluong(chitietphim.getChatluong()); 
				ctphim.setMota(chitietphim.getMota());
				ctphim.setNgaychinhsua(chitietphim.getNgaychinhsua());
			}else {
				
				ChiTietPhim ctphimnew = new ChiTietPhim();
				ctphimnew.setIdphim(APIPhimController.editPhim);
				ctphimnew.setNgaychinhsua(new Date());
				chiTietPhimRepository.save(ctphimnew);
				ctphim = ctphimnew;
			}
			
			
			
			
			return ctphim;
		}else {
			return  null;
		}
		
	}
	
	@GetMapping("/animu/api/get/editChiTietPhim")
	public String geteditChiTietPhim() {
		if(APIPhimController.editPhim != null) {
			ChiTietPhim ctphim = chiTietPhimRepository.findById(APIPhimController.editPhim).get();
			return ctphim.getIdphim()+"," + ctphim.getTengoc();
		}
		return "Vui lòng chọn chi tiết phim cần chỉnh sửa";
	}
	
	
	
	@PostMapping("/animu/api/update/chitietphim")
	public String updatectphim(@RequestBody ChiTietPhim ctphim) {
		
	    try {
	    	if(APIPhimController.editPhim != null) {
	    	
		        ChiTietPhim ct = chiTietPhimRepository.findById(APIPhimController.editPhim).get();
		        
		        if (ct == null) {
		            return "0,Cập nhật thất bại - Không tìm thấy chi tiết phim với ID: " + APIPhimController.editPhim;
		        }
		        
		
		        ct.setTongsotap(ctphim.getTongsotap());
		        ct.setThoigian(ctphim.getThoigian());
		        ct.setTapmoinhat(ctphim.getTapmoinhat());
		        ct.setChatluong(ctphim.getChatluong());
		        ct.setMota(ctphim.getMota());
		        ct.setNgaychinhsua(new Date());
		        ct.setTengoc(ctphim.getTengoc());
		        
		       
		        
		        
		        chiTietPhimRepository.save(ct);
		        
		        return "1,Cập nhật thành công Chi tiết phim [idphim: " + APIPhimController.editPhim + "]";
	    	}
	    	
	        
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	        return "0,Cập nhật thất bại";
	    }
	    return "0,Cập nhật thất bại";
	}

}