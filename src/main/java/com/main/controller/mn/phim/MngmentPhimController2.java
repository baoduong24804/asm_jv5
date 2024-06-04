package com.main.controller.mn.phim;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.main.model.ChiTietPhim;
import com.main.model.Phim;
import com.main.model.TapPhim;
import com.main.repository.ChiTietPhimRepository;
import com.main.repository.NguoiDungRepository;
import com.main.repository.PhimRepository;
import com.main.repository.TapPhimRepository;

@Controller
@RequestMapping("animu/control")
public class MngmentPhimController2 {
	private Integer idPhim = null;
	private Integer idTapphim = null;

	@Autowired
	PhimRepository phimRepository;
	@Autowired
	ChiTietPhimRepository chiTietPhimRepository;
	@Autowired
	TapPhimRepository tapPhimRepository;
	@Autowired
	NguoiDungRepository nguoiDungRepository;

	@GetMapping("")
	public String getMethodName(Model model) {
		// model
		loadModel(model);
		//
		loadListPhim(model);
		//

		model.addAttribute("action", 0);

		return "/views/phim/control";
	}

	public void loadModel(Model model) {
		model.addAttribute("phim", new Phim());
		model.addAttribute("chitietphim", new ChiTietPhim());
		model.addAttribute("tapphim", new TapPhim());

		model.addAttribute("tkPhim", phimRepository.count());
		model.addAttribute("tkUser", nguoiDungRepository.count());
	}

	public void loadListPhim(Model model) {
		List<Phim> listphim = phimRepository.findAll();
		model.addAttribute("listphim", listphim);
	}

	@GetMapping("phim")
	public String phim(Model model) {
		loadModel(model);
		//
		loadListPhim(model);
		//
		phimModel(model);
		chiTietPhimModel(model);
		tapPhimModel(model, idTapphim);
		//

		model.addAttribute("action", 1);
		return "/views/phim/control";
	}

	@GetMapping("phim/clear")
	public String clear() {
		this.idPhim = null;
		this.idTapphim = null;
		return "redirect:/animu/control/phim";
	}

	@GetMapping("phim/edit/{id}")
	public String editphim(Model model, @PathVariable Integer id) {
		// chiTietPhim
		idPhim = id;
		loadModel(model);
		loadListPhim(model);

		// model.addAttribute("action", 1);

		return "redirect:/animu/control/phim";
	}

	@GetMapping("phim/edit/chitietphim/{id}")
	public String editchitietphim(Model model, @PathVariable Integer id) {
		// chiTietPhim
		idTapphim = id;
		loadModel(model);
		loadListPhim(model);

		// model.addAttribute("action", 1);

		return "redirect:/animu/control/chitietphim";
	}

	@PostMapping("phim/edit/chitietphim")
	public String editchitietphim(Model model, Phim phim, TapPhim tapphim, ChiTietPhim chitietphim,
			@RequestParam(name = "btn-chinh-sua-chi-tiet-phim", required = false) boolean btn_sua_chitietphim) {
		if (btn_sua_chitietphim) {

			ChiTietPhim ct = chiTietPhimRepository.findById(chitietphim.getIdphim()).get();
			ct.setChatluong(chitietphim.getChatluong());
			ct.setMota(chitietphim.getMota());
			ct.setNgaychinhsua(new Date());
			ct.setTapmoinhat(chitietphim.getTapmoinhat());
			ct.setTengoc(chitietphim.getTengoc());
			ct.setThoigian(chitietphim.getThoigian());
			ct.setTongsotap(chitietphim.getTongsotap());

			chiTietPhimRepository.save(ct);

		}
		return "redirect:/animu/control/chitietphim";
	}

	@GetMapping("phim/edit/tapphim/{id}")
	public String edittapphim(Model model, @PathVariable Integer id) {
		// chiTietPhim
		this.idTapphim = id;
		
		loadModel(model);
		loadListPhim(model);

		// model.addAttribute("action", 1);

		return "redirect:/animu/control/tapphim";
	}
	
	@GetMapping("phim/delete/tapphim/{id}")
	public String deletetapphim(Model model, @PathVariable Integer id) {
		// chiTietPhim
		this.idTapphim = null;
		TapPhim t = tapPhimRepository.findById(id).get();
		tapPhimRepository.delete(t);
		
		

		return "redirect:/animu/control/tapphim";
	}
	

	@PostMapping("/phim/edit/tapphim")
	public String edittapphim(Model model, Phim phim, TapPhim tapphim, ChiTietPhim chitietphim,
			@RequestParam(name = "btn-them-tap-phim", required = false) boolean btn_them_tapphim,
			@RequestParam(name = "btn-chinh-sua-tap-phim", required = false) boolean btn_sua_tapphim) {
		if (btn_them_tapphim) {
			System.out.println("hool");
			tapphim.setIdtapphim(tapPhimRepository.findMaxId() + 1);
			Phim p = phimRepository.findById(idPhim).get();
			tapphim.setPhim(p);
			tapPhimRepository.save(tapphim);
			idTapphim = null;
		}
		if (btn_sua_tapphim) {
			TapPhim tp = tapPhimRepository.findById(tapphim.getIdtapphim()).get();
			tp.setLink(tapphim.getLink());
			tp.setLink2(tapphim.getLink2());
			tp.setServer(tapphim.getServer());
			tp.setSlug(tapphim.getSlug());
			tp.setTentap(tapphim.getTentap());
			tapPhimRepository.save(tp);
		}
		return "redirect:/animu/control/tapphim";
	}

	@PostMapping("phim/edit")
	public String savephim(Model model, Phim phim, TapPhim tapphim, ChiTietPhim chitietphim,
			@RequestParam(name = "btn-them-phim", required = false) boolean btn_them,
			@RequestParam(name = "btn-chinh-sua-phim", required = false) boolean btn_sua) {
		// chiTietPhim
		if (btn_them) {
			phim.setIdphim(phimRepository.findMaxId() + 1);
			phim.setNgaytao(new Date());
			ChiTietPhim ct = new ChiTietPhim();
			ct.setNgaychinhsua(new Date());
			ct.setIdphim(phim.getIdphim());
			phim.setChitietphim(ct);

			phimRepository.save(phim);
		}
		if (btn_sua) {
			Phim p = phimRepository.findById(phim.getIdphim()).get();
			p.setActive(phim.isActive());
			p.setNgaytao(new Date());
			p.setPoster_url(phim.getPoster_url());
			p.setSlug(phim.getSlug());
			p.setThumb_url(phim.getThumb_url());
			p.setTieude(phim.getTieude());

			phimRepository.save(p);
		}

		loadModel(model);
		loadListPhim(model);

		// model.addAttribute("action", 1);

		return "redirect:/animu/control/phim";
	}

	public void chiTietPhimModel(Model model) {
		if(idPhim != null) {
			ChiTietPhim chiTietPhim = chiTietPhimRepository.findById(idPhim).get();
			model.addAttribute("chiTietPhim", chiTietPhim);
		}


	}

	public void tapPhimModel(Model model, Integer idtapphim) {
		
		if(idPhim != null) {
			List<TapPhim> tapPhims = tapPhimRepository.findAllByIdPhim(idPhim);
			model.addAttribute("listTapPhim", tapPhims);
		}
		if (idtapphim != null) {

			TapPhim tapPhim = tapPhimRepository.findById(idtapphim).get();
			model.addAttribute("tapPhim", tapPhim);
		}
	}

	public void phimModel(Model model ) {
		if (idPhim != null) {

			Phim editPhim = phimRepository.findById(idPhim).get();
			model.addAttribute("editPhim", editPhim);

		}

	}

	@GetMapping("chitietphim")
	public String chitietphim(Model model) {
		// model
		loadModel(model);
		//
		phimModel(model);
		chiTietPhimModel(model);
		tapPhimModel(model, idTapphim);
		//
		loadListPhim(model);
		//
		model.addAttribute("action", 2);
		return "/views/phim/control";
	}

	@GetMapping("tapphim")
	public String tapphim(Model model) {
		loadModel(model);
		//
		phimModel(model);
		chiTietPhimModel(model);
		tapPhimModel(model, idTapphim);
		//
		loadListPhim(model);
		//
		model.addAttribute("action", 3);
		return "/views/phim/control";
	}

	@GetMapping("nhasx")
	public String nhasx(Model model) {
		// model
		loadModel(model);
		//
		//edit(idPhim, model, null);
		//
		loadListPhim(model);
		//
		model.addAttribute("action", 4);
		return "/views/phim/control";
	}

	@GetMapping("phanloai")
	public String phanloai(Model model) {
		// model
		loadModel(model);
		//
		//edit(idPhim, model, null);
		//
		loadListPhim(model);
		//
		model.addAttribute("action", 5);
		return "/views/phim/control";
	}

}
