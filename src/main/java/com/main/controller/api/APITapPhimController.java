package com.main.controller.api;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.main.model.Phim;
import com.main.model.TapPhim;
import com.main.repository.PhimRepository;
import com.main.repository.TapPhimRepository;


@RestController
public class APITapPhimController {
	@Autowired
	TapPhimRepository tapPhimRepository;
	
	@Autowired
	PhimRepository phimRepository;
	
	@GetMapping("/animu/api/get/tapphim")
	public List<TapPhim> getMethodName() {
		List<TapPhim> list = new ArrayList<TapPhim>();
		if(APIPhimController.editPhim == null) {
			return list;
		}
		
		List<TapPhim> listtp = tapPhimRepository.findAllByIdPhim(APIPhimController.editPhim);
		for (TapPhim tapPhim : listtp) {
			TapPhim t = new TapPhim();
			t.setIdtapphim(tapPhim.getIdtapphim());
			t.setLink(tapPhim.getLink());
			t.setLink2(tapPhim.getLink2());
			t.setServer(tapPhim.getServer());
			t.setSlug(tapPhim.getSlug());
			t.setTentap(tapPhim.getTentap());
			list.add(t);
		}
		return list;
		
	}
	
	@GetMapping("/animu/api/get/tapphim/{idtapphim}")
	public TapPhim getMethodName(@PathVariable("idtapphim") String idtapphim) {
		TapPhim tapPhim = new TapPhim();
		TapPhim t = tapPhimRepository.findById(Integer.parseInt(idtapphim)).get();
		tapPhim.setIdtapphim(t.getIdtapphim());
		tapPhim.setLink(t.getLink());
		tapPhim.setLink2(t.getLink2());
		tapPhim.setServer(t.getServer());
		tapPhim.setSlug(t.getSlug());
		tapPhim.setTentap(t.getTentap());
		return tapPhim;
	}
	
	
	@GetMapping("/animu/api/delete/tapphim/{idtapphim}")
	public String delete(@PathVariable("idtapphim") String idtapphim) {
		try {
			tapPhimRepository.deleteById(Integer.parseInt(idtapphim));
			return "1,Xoá thành công tập phim [ idtapphim[ "+idtapphim+" ]";
		} catch (Exception e) {
			// TODO: handle exception
			return "0,Xóa thất bại";
		}
		
	}
	
	@PostMapping("/animu/api/update/tapphim/{idtapphim}")
	public String update(@PathVariable("idtapphim") int idtapphim, @RequestBody TapPhim tapPhim) {
		TapPhim p = null;
		try {
		
			p = tapPhimRepository.findById(idtapphim).get();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "0,Cập nhật thất bại";
		}
		
		p.setTentap(tapPhim.getTentap());
		p.setLink(tapPhim.getLink());
		p.setLink2(tapPhim.getLink2());
		p.setServer(tapPhim.getServer());
		p.setSlug(tapPhim.getSlug());
		
		
		
		
		tapPhimRepository.save(p);
		
		
		return "1,Cập nhật thành công Tập phim[ idtapphim :"+String.valueOf(idtapphim)+"]";
		
	}
	
	@PostMapping("/animu/api/insert/tapphim")
	public String insert(@RequestBody TapPhim tapPhim) {
		if(APIPhimController.editPhim == null) {
			return "0,Thêm thất bại";
		}
		
		try {
			
			Phim phim = phimRepository.findById(APIPhimController.editPhim).get();
			
			TapPhim p = new TapPhim();
			
			p.setPhim(phim);
			p.setIdtapphim(tapPhimRepository.findMaxId() + 1);
			p.setTentap(tapPhim.getTentap());
			p.setLink(tapPhim.getLink());
			p.setLink2(tapPhim.getLink2());
			p.setServer(tapPhim.getServer());
			p.setSlug(tapPhim.getSlug());
			
			tapPhimRepository.save(p);
			
			return "1,Thêm thành công Tập phim[ idtapphim :"+String.valueOf(p.getIdtapphim())+"]";
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "0,Cập nhật thất bại";
		}
		


		
		
	
		
	}
	
	
}
