package com.main.controller.api;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.main.model.ChiTietNguoiDung;
import com.main.model.ChiTietNguoiDungHelper;
import com.main.repository.ChiTietNguoiDungRepository;

@RestController
public class APIChiTietNguoiDungController {
	@Autowired
	ChiTietNguoiDungRepository chiTietNguoiDungRepository;

	@GetMapping("/animu/api/load/chitietnguoidung")
	public Map<Integer, ChiTietNguoiDungHelper> getMethodName() {
		Map<Integer, ChiTietNguoiDungHelper> list = new HashMap<Integer, ChiTietNguoiDungHelper>();
		List<ChiTietNguoiDung> listct = chiTietNguoiDungRepository.findAll();

		for (ChiTietNguoiDung chiTietNguoiDung : listct) {
			ChiTietNguoiDungHelper ct = new ChiTietNguoiDungHelper();
			ct.setIdchitiet(chiTietNguoiDung.getIdchitiet());
			ct.setLike(chiTietNguoiDung.is_like());
			ct.setCmt(chiTietNguoiDung.getCmt());
			ct.setEmail(chiTietNguoiDung.getNguoiDung().getEmail());
			ct.setIdphim(chiTietNguoiDung.getPhim().getIdphim());
			ct.setTieude(chiTietNguoiDung.getPhim().getTieude());
			ct.setUser_id(chiTietNguoiDung.getNguoiDung().getUser_id());
			ct.setUsername(chiTietNguoiDung.getNguoiDung().getUsername());
			ct.setVote(chiTietNguoiDung.getVote());
			ct.setTapphim(chiTietNguoiDung.getTapphim());
			ct.setDate(chiTietNguoiDung.getDate());

			list.put(chiTietNguoiDung.getIdchitiet(), ct);
		}
		return list;
	}

	@GetMapping("/animu/api/delete/all/{id}")
	public String deleteAll(@PathVariable("id") String id) {

		chiTietNguoiDungRepository.deleteById(Integer.parseInt(id));
		ChiTietNguoiDung chiTietNguoiDung = chiTietNguoiDungRepository.findById(Integer.parseInt(id)).get();
		if (chiTietNguoiDung != null) {
			chiTietNguoiDung.setCmt("");
			chiTietNguoiDung.set_like(false);
			chiTietNguoiDung.setVote(0);
			chiTietNguoiDung.setDate(new Date());
			chiTietNguoiDungRepository.save(chiTietNguoiDung);
			return "1, Xóa thành công chi tiết người dùng [" + id + "]";
		} else {
			return "0, Xóa thất bại chi tiết người dùng [" + id + "]";
		}

	}

	@GetMapping("/animu/api/delete/cmt/{id}")
	public String deleteCmt(@PathVariable("id") String id) {
		ChiTietNguoiDung chiTietNguoiDung = chiTietNguoiDungRepository.findById(Integer.parseInt(id)).get();
		if (chiTietNguoiDung != null) {
			chiTietNguoiDung.setCmt("");
			chiTietNguoiDungRepository.save(chiTietNguoiDung);
			return "1, Xóa thành công bình luận chi tiết người dùng [" + id + "]";
		} else {
			return "0, Xóa thất bại bình luận chi tiết người dùng [" + id + "]";
		}

	}

	@PostMapping("/animu/api/search/chitietnguoidung")
	public Map<Integer, ChiTietNguoiDungHelper> search(@RequestParam(name = "key", required = false) String key) {
		List<ChiTietNguoiDung> listct = null;
		Map<Integer, ChiTietNguoiDungHelper> list = new HashMap<Integer, ChiTietNguoiDungHelper>();
		if (key == null) {
			listct = chiTietNguoiDungRepository.findAll();

		} else {
			listct = chiTietNguoiDungRepository.findAllByEmail(key);
			for (ChiTietNguoiDung chiTietNguoiDung : listct) {
				ChiTietNguoiDungHelper ct = new ChiTietNguoiDungHelper();
				ct.setIdchitiet(chiTietNguoiDung.getIdchitiet());
				ct.setLike(chiTietNguoiDung.is_like());
				ct.setCmt(chiTietNguoiDung.getCmt());
				ct.setEmail(chiTietNguoiDung.getNguoiDung().getEmail());
				ct.setIdphim(chiTietNguoiDung.getPhim().getIdphim());
				ct.setTieude(chiTietNguoiDung.getPhim().getTieude());
				ct.setUser_id(chiTietNguoiDung.getNguoiDung().getUser_id());
				ct.setUsername(chiTietNguoiDung.getNguoiDung().getUsername());
				ct.setVote(chiTietNguoiDung.getVote());
				ct.setTapphim(chiTietNguoiDung.getTapphim());
				ct.setDate(chiTietNguoiDung.getDate());

				list.put(chiTietNguoiDung.getIdchitiet(), ct);
			}

		}

		return list;
	}

}
