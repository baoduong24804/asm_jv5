package com.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.main.controller.mn.phim.PhimController;
import com.main.model.ChiTietPhim;
import com.main.model.NhaXSVaDienVien;
import com.main.model.PhanLoai;
import com.main.model.Phim;
import com.main.model.TapPhim;
import com.main.repository.ChiTietPhimRepository;
import com.main.repository.NguoiDungRepository;
import com.main.repository.NhaXSVaDienVienRepository;
import com.main.repository.PhanLoaiRepository;
import com.main.repository.PhimRepository;
import com.main.repository.TapPhimRepository;

@Service
public class ModelLoader {
	@Autowired
	PhimRepository phimRepository;
	@Autowired
	NguoiDungRepository nguoiDungRepository;
	@Autowired
	ChiTietPhimRepository chiTietPhimRepository;
	@Autowired
	TapPhimRepository tapPhimRepository;
	@Autowired
	NhaXSVaDienVienRepository nhaXSVaDienVienRepository;
	@Autowired
	PhanLoaiRepository phanLoaiRepository;

	public void loadModel(Model model) {
		model.addAttribute("phim", new Phim());// modelAttribute
		model.addAttribute("chitietphim", new ChiTietPhim());// modelAttribute
		model.addAttribute("tapphim", new TapPhim());// modelAttribute
		model.addAttribute("nhasanxuat", new NhaXSVaDienVien());// modelAttribute
		model.addAttribute("phanloai", new PhanLoai());// modelAttribute

		model.addAttribute("tkPhim", phimRepository.count());
		model.addAttribute("tkUser", nguoiDungRepository.count());
	}

	public void loadListPhim(Model model) {
		List<Phim> listphim = phimRepository.findAll();
		model.addAttribute("listphim", listphim);
	}

	public void phimModel(Model model) {
		if (PhimController.idPhim != null) {

			Phim editPhim = phimRepository.findById(PhimController.idPhim).get();
			model.addAttribute("editPhim", editPhim);

		}

	}

	public void chiTietPhimModel(Model model) {
		if (PhimController.idPhim != null) {
			ChiTietPhim chiTietPhim = chiTietPhimRepository.findById(PhimController.idPhim).get();
			model.addAttribute("chiTietPhim", chiTietPhim);
		}
	}

	public void tapPhimModel(Model model) {

		if (PhimController.idPhim != null) {
			List<TapPhim> tapPhims = tapPhimRepository.findAllByIdPhim(PhimController.idPhim);
			model.addAttribute("listTapPhim", tapPhims);
		}
		if (PhimController.idTapphim != null) {

			TapPhim tapPhim = tapPhimRepository.findById(PhimController.idTapphim).get();
			model.addAttribute("tapPhim", tapPhim);
		}
	}

	public void nhaSanXuatModel(Model model) {

		if (PhimController.idPhim != null) {
			List<NhaXSVaDienVien> nhaXSVaDienViens = nhaXSVaDienVienRepository.findAllByIdPhim(PhimController.idPhim);
			model.addAttribute("nhaXSVaDienViens", nhaXSVaDienViens);
			if (PhimController.idNhasx != null) {
				// nhasanxuat
				NhaXSVaDienVien nhasanxuat = nhaXSVaDienVienRepository.findByIdPhimAndIdNhasx(PhimController.idPhim,
						PhimController.idNhasx);
				model.addAttribute("nhasanxuat", nhasanxuat);
			}
		}

	}

	public void phanLoaiModel(Model model) {

//		if(PhimController.idPhim != null) {
//			PhanLoai phanLoai = phanLoaiRepository.findByIdphim(PhimController.idPhim);
//			model.addAttribute("phanLoai", phanLoai);
//			
//		}
		PhanLoai phanLoai = null;
		try {
			phanLoai = phanLoaiRepository.findByIdphim(PhimController.idPhim);
		} catch (Exception e) {
			// TODO: handle exception
		}

		if (phanLoai != null) {
			model.addAttribute("phanLoai", phanLoai);
			model.addAttribute("phanloai", phanLoai);
		} else {
			model.addAttribute("phanLoai", new PhanLoai());
			model.addAttribute("phanloai", null);
		}
		

	}

}
