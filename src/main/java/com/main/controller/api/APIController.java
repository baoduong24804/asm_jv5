package com.main.controller.api;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.main.model.Phim;
import com.main.repository.NguoiDungRepository;
import com.main.repository.PhimRepository;
import com.utils.Reader;

@RestController
public class APIController {
	@Autowired
	NguoiDungRepository nguoiDungRepository;
	@Autowired
	PhimRepository phimRepository;

	@GetMapping("animu/api/{option}")
	public String getMethodName(@PathVariable("option") int option) {
		String html = "";
		if (option == 1) {
			html = Reader.readFile("\\src\\main\\webapp\\html\\char.html");
		}
		if (option == 2) {
			html = Reader.readFile("\\src\\main\\webapp\\html\\phim.html");
		}
		if (option == 3) {
			html += Reader.readFile("\\src\\main\\webapp\\html\\chitietphim.html");
		}
		if (option == 4) {
			html += Reader.readFile("\\src\\main\\webapp\\html\\tapphim.html");
		}
		if (option == 5) {
			html += Reader.readFile("\\src\\main\\webapp\\html\\nhasx.html");
		}
		if (option == 6) {
			html += Reader.readFile("\\src\\main\\webapp\\html\\phanloai.html");
		}
		if (option == 7) {
			html += Reader.readFile("\\src\\main\\webapp\\html\\nguoidung.html");
		}
		if (option == 8) {
			html += Reader.readFile("\\src\\main\\webapp\\html\\chitietnguoidung.html");
		}
		if (option == 9) {
			html += Reader.readFile("\\src\\main\\webapp\\html\\yeuthich.html");
		}
		if (option == 10) {
			html += Reader.readFile("\\src\\main\\webapp\\html\\mail.html");
		}
		return html;
	}

	@GetMapping("animu/api/char")
	public String getMethodName() {
		String s = "";
		s = nguoiDungRepository.count() + "," + "" + phimRepository.count();
		return s;
	}

	@GetMapping("animu/api/char2")
	public String getMethodName2() {
		String s = "";
		s = nguoiDungRepository.findByNoActive().size() + "," + "" + phimRepository.findByNoActive().size();
		return s;
	}

	// @GetMapping("animu/api/load/listphim")
	// public String listphim() {
	// List<Phim> list = phimRepository.findAll();
	// String s = "";
	// for (Phim phim : list) {
	// s += "<tr>"
	// + "<td>" + phim.getIdphim() + "</td>"
	// + "<td>" + phim.getTieude() + "</td>"
	// + "<td>" + phim.getSlug() + "</td>"
	// + "<td>" + Utils.dateToString(phim.getNgaytao(), "dd-MM-yyyy HH:mm:ss") +
	// "</td>"
	// + "<td>" + phim.getThumb_url() + "</td>"
	// + "<td>" + phim.getPoster_url() + "</td>"
	// + "<td>"+(phim.isActive()? "<span class='online'>" : "<span
	// class='offline'>")+ (phim.isActive()? "Đang hoạt động" : "Không hoạt động") +
	// "</span></td>"
	// + "<td>" + "<button class='btn btn-primary btn-edit-phim'
	// value='"+(phim.getIdphim())+"'>Chỉnh sửa</button>" + "</td>"
	// + "</tr>";
	// }
	//
	// return s;
	// }

	// co phan trang
	@GetMapping("animu/api/load/listphim")
	public List<Phim> phantrang() {
		List<Phim> list = phimRepository.findAll();
		List<Phim> listnew = new ArrayList<Phim>();
		for (Phim phim : list) {
			Phim p = new Phim();
			p.setActive(phim.isActive());
			p.setIdphim(phim.getIdphim());
			p.setNgaytao(phim.getNgaytao());
			p.setPoster_url(phim.getPoster_url());
			p.setSlug(phim.getSlug());
			p.setThumb_url(phim.getThumb_url());
			p.setTieude(phim.getTieude());
			listnew.add(p);
		}

		return listnew;
	}

}
