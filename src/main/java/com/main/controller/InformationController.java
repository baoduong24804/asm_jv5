package com.main.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.main.model.ChiTietNguoiDung;
import com.main.model.ChiTietNguoiDungHelper;
import com.main.model.NguoiDung;
import com.main.model.Phim;
import com.main.model.TapPhim;
import com.main.model.YeuThich;
import com.main.repository.ChiTietNguoiDungRepository;
import com.main.repository.NguoiDungRepository;
import com.main.repository.PhimRepository;
import com.main.repository.TapPhimRepository;
import com.main.repository.YeuThichRepository;
import com.main.service.SessionService;
import com.utils.UserCurrent;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
@RequestMapping("/animu/listmovie")
public class InformationController {
	@Autowired
	PhimRepository phimresp;

	@Autowired
	TapPhimRepository tapPhimRepository;

	@Autowired
	SessionService sessionService;

	@Autowired
	ChiTietNguoiDungRepository chiTietNguoiDungRepository;

	@Autowired
	NguoiDungRepository nguoiDungRepository;

	@Autowired
	YeuThichRepository yeuThichRepository;

	private Integer idphim = null;
	private Integer iduser = null;

	@GetMapping("information")
	public String home(Model model) {

		return "/views/information";
	}

	@ResponseBody
	@GetMapping("information/cmt")
	public String postMethodName(@RequestParam("cmt") String cmt) {
		// TODO: process POST request
		if (idphim != null && iduser != null) {
			try {
				ChiTietNguoiDung chiTietNguoiDung = chiTietNguoiDungRepository.findByIdPhimAndUserId(idphim, iduser);
				if (chiTietNguoiDung == null) {
					ChiTietNguoiDung ct = new ChiTietNguoiDung();
					ct.setDate(new Date());
					ct.setIdchitiet(chiTietNguoiDungRepository.findMaxId() + 1);
					if (phimresp.findById(idphim).get() != null) {
						ct.setPhim(phimresp.findById(idphim).get());
					}
					if (nguoiDungRepository.findById(iduser).get() != null) {
						ct.setNguoiDung(nguoiDungRepository.findById(iduser).get());
					}
					ct.setTapphim("");
					ct.setVote(0);
					ct.set_like(false);
					ct.setCmt(cmt);
					chiTietNguoiDungRepository.save(ct);

				} else {
					chiTietNguoiDung.setCmt(cmt);
					chiTietNguoiDungRepository.save(chiTietNguoiDung);
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				return "Lỗi";
			}

		}
		return "Xong";
	}

	@ResponseBody
	@GetMapping("information/like")
	public String like() {
		if (idphim != null && iduser != null) {
			try {
				ChiTietNguoiDung chiTietNguoiDung = chiTietNguoiDungRepository.findByIdPhimAndUserId(idphim, iduser);
				if (chiTietNguoiDung != null) {
					chiTietNguoiDung.set_like(!chiTietNguoiDung.is_like());

					chiTietNguoiDungRepository.save(chiTietNguoiDung);

				} else {
					ChiTietNguoiDung ct = new ChiTietNguoiDung();
					ct.set_like(true);
					ct.setDate(new Date());
					ct.setIdchitiet(chiTietNguoiDungRepository.findMaxId() + 1);
					if (nguoiDungRepository.findById(iduser) != null) {
						ct.setNguoiDung(nguoiDungRepository.findById(iduser).get());
					}

					if (phimresp.findById(idphim) != null) {
						ct.setPhim(phimresp.findById(idphim).get());
					}
					chiTietNguoiDungRepository.save(ct);
				}
				YeuThich yeuThich = new YeuThich();
				yeuThich.setIdyeuthich(yeuThichRepository.findMaxId() + 1);
				yeuThich.setNguoiDung(UserCurrent.getNguoiDung());
				yeuThich.setPhim(phimresp.findById(idphim).get());
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				return "Lỗi";
			}
		}
		return "Xong";
	}

	@GetMapping("information/{slug}")
	public String getMethodName(@PathVariable("slug") String slug, Model model) {

		List<TapPhim> listTapPhim = new ArrayList<>();

		Phim phim = null;
		try {
			phim = phimresp.findPhimBySlug(slug).get(0);
		} catch (Exception e) {
			// TODO: handle exception
			// e.printStackTrace();
		}

		List<ChiTietNguoiDung> listChiTietNguoiDung = chiTietNguoiDungRepository.findAll();
		List<ChiTietNguoiDungHelper> helpcTietNguoiDung = new ArrayList<>();

		if (listChiTietNguoiDung.size() > 0) {
			model.addAttribute("listChiTietNguoiDung", listChiTietNguoiDung);
		}

		NguoiDung user = (NguoiDung) sessionService.get("user");
		if (user != null) {
			model.addAttribute("user", user);
			iduser = user.getUser_id();
		}

		if (phim != null) {
			idphim = phim.getIdphim();
			for (ChiTietNguoiDung chiTietNguoiDung : listChiTietNguoiDung) {
				if (chiTietNguoiDung.getPhim().getIdphim() == phim.getIdphim()) {
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
					ct.setImg(chiTietNguoiDung.getNguoiDung().getImg());
					if (user != null) {
						if (ct.getUser_id() == user.getUser_id()) {
							List<YeuThich> list = yeuThichRepository.findAll();
							if (list.size() > 0) {
								ct.setLike(true);
							}
							model.addAttribute("like", ct.isLike());
						}
					}

					helpcTietNguoiDung.add(ct);
				}

			}
			model.addAttribute("helpcTietNguoiDung", helpcTietNguoiDung);
			///
			model.addAttribute("phim", phim);
			List<TapPhim> tapPhims = tapPhimRepository.findAllByIdPhim(phim.getIdphim());

			if (tapPhims.size() > 0) {
				for (TapPhim tapPhim : tapPhims) {
					TapPhim t = new TapPhim();
					t.setIdtapphim(tapPhim.getIdtapphim());
					t.setLink(tapPhim.getLink().trim());
					t.setServer(tapPhim.getServer());
					t.setSlug(tapPhim.getSlug());
					t.setTentap(tapPhim.getTentap());
					t.setLink2(tapPhim.getLink2().trim());

					listTapPhim.add(t);
				}

				model.addAttribute("listTapPhim", listTapPhim);
			}

		}

		return "/views/information";

	}

}
