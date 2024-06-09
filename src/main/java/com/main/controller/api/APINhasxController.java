package com.main.controller.api;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.main.model.NhaXSVaDienVien;
import com.main.repository.NhaXSVaDienVienRepository;

@RestController
public class APINhasxController {
	@Autowired
	NhaXSVaDienVienRepository nhaXSVaDienVienRepository;

	@GetMapping("/animu/api/get/nhasx/{idnhasxvadv}")
	public NhaXSVaDienVien getMethodName(@PathVariable("idnhasxvadv") String idnhasxvadv) {
		NhaXSVaDienVien nhaXSVaDienVien = new NhaXSVaDienVien();
		NhaXSVaDienVien n = nhaXSVaDienVienRepository.findById(Integer.parseInt(idnhasxvadv)).get();
		
		nhaXSVaDienVien.setIdnhasxvadv(n.getIdnhasxvadv());
		nhaXSVaDienVien.setIdphim(n.getIdphim());
		nhaXSVaDienVien.setTen(n.getTen());
		nhaXSVaDienVien.setVaitro(n.isVaitro());
		
		
		return nhaXSVaDienVien;
	}
	
	@GetMapping("animu/api/get/listnhasx")
	public List<NhaXSVaDienVien> getnhasx() {
		List<NhaXSVaDienVien> list = new ArrayList<NhaXSVaDienVien>();
		if (APIPhimController.editPhim != null) {
			List<NhaXSVaDienVien> listnhasx = null;

			try {
				listnhasx = nhaXSVaDienVienRepository.findAllByIdPhim(APIPhimController.editPhim);
				if (listnhasx.size() == 0) {

					// nhasx
					NhaXSVaDienVien n = new NhaXSVaDienVien();
					n.setVaitro(false);
					n.setIdnhasxvadv(nhaXSVaDienVienRepository.findMaxId() + 1);
					n.setIdphim(APIPhimController.editPhim);
					nhaXSVaDienVienRepository.save(n);

					NhaXSVaDienVien n2 = new NhaXSVaDienVien();
					n.setVaitro(true);
					n.setIdnhasxvadv(nhaXSVaDienVienRepository.findMaxId() + 1);
					n.setIdphim(APIPhimController.editPhim);
					nhaXSVaDienVienRepository.save(n);

				}
				if (listnhasx.size() == 1) {
					NhaXSVaDienVien nhaXSVaDienVien = listnhasx.getFirst();
					if (nhaXSVaDienVien.isVaitro()) {// 1 cai la nhasx
						// nhasx
						NhaXSVaDienVien n = new NhaXSVaDienVien();
						n.setVaitro(false);
						n.setIdnhasxvadv(nhaXSVaDienVienRepository.findMaxId() + 1);
						n.setIdphim(APIPhimController.editPhim);
						nhaXSVaDienVienRepository.save(n);
					} else {
						NhaXSVaDienVien n = new NhaXSVaDienVien();
						n.setVaitro(true);
						n.setIdnhasxvadv(nhaXSVaDienVienRepository.findMaxId() + 1);
						n.setIdphim(APIPhimController.editPhim);
						nhaXSVaDienVienRepository.save(n);
					}
				}

				if (listnhasx.size() >= 2) {
					for (NhaXSVaDienVien nhaXSVaDienVien : listnhasx) {
						NhaXSVaDienVien n = new NhaXSVaDienVien();
						n.setIdnhasxvadv(nhaXSVaDienVien.getIdnhasxvadv());
						n.setIdphim(nhaXSVaDienVien.getIdphim());
						n.setTen(nhaXSVaDienVien.getTen());
						n.setVaitro(nhaXSVaDienVien.isVaitro());
						list.add(n);
					}
					return list;
				}
			} catch (Exception e) {
				e.printStackTrace();
				return null;

			}
		}
		return null;
	}
	
	
	@PostMapping("/animu/api/update/nhasx/{idnhasxvadv}")
	public String update(@PathVariable("idnhasxvadv") String idnhasxvadv, @RequestBody NhaXSVaDienVien nhaXSVaDienVien) {
		NhaXSVaDienVien p = null;
		try {
		
			p = nhaXSVaDienVienRepository.findById(Integer.parseInt(idnhasxvadv)).get();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "0,Cập nhật thất bại";
		}
		
		
		p.setTen(nhaXSVaDienVien.getTen());
		
		
		
		
		nhaXSVaDienVienRepository.save(p);
		
		
		return "1,Cập nhật thành công Nhà sản xuất và diễn viên[ idnhasxvadv :"+String.valueOf(idnhasxvadv)+"]";
		
	}
	
}
