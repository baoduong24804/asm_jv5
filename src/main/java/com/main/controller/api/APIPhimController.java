package com.main.controller.api;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.main.model.ChiTietPhim;
import com.main.model.Phim;
import com.main.repository.ChiTietPhimRepository;
import com.main.repository.PhimRepository;

@RestController
public class APIPhimController {
	@Autowired
	PhimRepository phimRepository;
	
	@Autowired
	ChiTietPhimRepository chiTietPhimRepository;

	public static Integer editPhim = null;
// edit phim	
@GetMapping("/animu/api/get/editPhim")
public String geteditPhim() {
	if(APIPhimController.editPhim != null) {
		Phim phim = phimRepository.findById(APIPhimController.editPhim).get();
		return phim.getIdphim()+"," + phim.getTieude();
	}
	return "Vui lòng chọn phim cần chỉnh sửa";
}

// xóa phim
@GetMapping("/animu/api/phim/clearPhim")
public String getclearPhim() {
	APIPhimController.editPhim = null;
		
	
	return " ";
}

@GetMapping("/animu/api/get/phim")
public Phim getPhim() {

	Phim phim = new Phim();
	if(APIPhimController.editPhim != null) {
		Phim p = phimRepository.findById(APIPhimController.editPhim).get();
		//
		phim.setIdphim(p.getIdphim());
		phim.setActive(p.isActive());
		phim.setNgaytao(p.getNgaytao());
		phim.setPoster_url(p.getPoster_url());
		phim.setSlug(p.getSlug());
		phim.setThumb_url(p.getThumb_url());
		phim.setTieude(p.getTieude());
		return phim;
	}

	
    return new Phim();
}

	
	
@GetMapping("/animu/api/get/phim/{idphim}")
public Phim getMethodName(@PathVariable("idphim") int idphim) {

	Phim phim = new Phim();
	Phim p = phimRepository.findById(idphim).get();
	//
	phim.setIdphim(p.getIdphim());
	phim.setActive(p.isActive());
	phim.setNgaytao(p.getNgaytao());
	phim.setPoster_url(p.getPoster_url());
	phim.setSlug(p.getSlug());
	phim.setThumb_url(p.getThumb_url());
	phim.setTieude(p.getTieude());
	APIPhimController.editPhim = idphim;
    return phim;
}


@PostMapping("/animu/api/search/phim")
public List<Phim> getMethodName(@RequestParam(name = "key",required = false) String key) {
	List<Phim> listp = null;
	
	if(key == null) {
		listp = phimRepository.findAll();
	}else {
		listp = phimRepository.findAllPhimLikeTieuDe(key);
	}
	
	
	List<Phim> list =  new ArrayList<Phim>();
	//
	
		for (Phim p : listp) {
			Phim phim = new Phim();
			phim.setIdphim(p.getIdphim());
			phim.setActive(p.isActive());
			phim.setNgaytao(p.getNgaytao());
			phim.setPoster_url(p.getPoster_url());
			phim.setSlug(p.getSlug());
			phim.setThumb_url(p.getThumb_url());
			phim.setTieude(p.getTieude());
			list.add(phim);
		}
	


    return list;
}


	@PostMapping("/animu/api/update/phim/{idphim}")
	public String update(@PathVariable("idphim") int idphim, @RequestBody Phim phim) {
		Phim p = null;
		try {
			Thread.sleep(3000);
			p = phimRepository.findById(idphim).get();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "0,Cập nhật thất bại";
		}
		
		p.setActive(phim.isActive());
		p.setPoster_url(phim.getPoster_url());
		p.setSlug(phim.getSlug());
		p.setThumb_url(phim.getThumb_url());
		p.setTieude(phim.getTieude());
		
		phimRepository.save(p);
		
		
		return "1,Cập nhật thành công Phim[ idphim :"+String.valueOf(p.getIdphim())+"]";
		
	}

	@PostMapping("/animu/api/insert/phim")
	public String insert(@RequestBody Phim phim) {
		Phim p = new Phim();
	
		try {
			Thread.sleep(3000);
			p.setActive(phim.isActive());
			p.setPoster_url(phim.getPoster_url());
			p.setSlug(phim.getSlug());
			p.setThumb_url(phim.getThumb_url());
			p.setTieude(phim.getTieude());
			p.setNgaytao(new Date());
			p.setIdphim(phimRepository.findMaxId() + 1);
			
			phimRepository.save(p);
			
			//them chi tiet cho phim
			ChiTietPhim chiTietPhim = new ChiTietPhim();
			chiTietPhim.setIdphim(p.getIdphim());
			chiTietPhimRepository.save(chiTietPhim);
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "0,Thêm thất bại";
		}
		
		
		
		phimRepository.save(p);
		
		
		return "1,Thêm thành công Phim[ idphim :"+String.valueOf(p.getIdphim())+"]";
		
	}
	
	

}
