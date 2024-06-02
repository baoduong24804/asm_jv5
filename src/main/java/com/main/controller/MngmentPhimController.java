package com.main.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.main.model.ChiTietPhim;
import com.main.model.Phim;
import com.main.model.TapPhim;
import com.main.service.PhimService;
import com.main.service.TapPhimService;


@Controller
@RequestMapping("animu/control")
public class MngmentPhimController {
	@Autowired PhimService phimService;
	@Autowired TapPhimService tapPhimService;
	
	@GetMapping("phim")
	public String getMethodName(Model model,@RequestParam(name = "idphim",required = false) Integer idphim,
			@ModelAttribute(name = "phim") Phim phim,
			@ModelAttribute(name = "chitietphim") ChiTietPhim chiTietPhim,
			@ModelAttribute(name = "tapphim") TapPhim tapPhim,
			@RequestParam(name = "action",required = false) Integer action,
			@RequestParam(name = "idtapphim",required = false) Integer idtapphim,
			@RequestParam(name = "btn-them-phim",required = false) boolean btnThem,
			@RequestParam(name = "btn-chinh-sua-phim",required = false) boolean btnSua,
			@RequestParam(name = "active",required = false) boolean active,
			@RequestParam(name = "clear",required = false) boolean clear,
			@RequestParam(name = "btn-chitiet",required = false) boolean btnChiTiet,
			@RequestParam(name = "mota",required = false) String mota,
			@RequestParam(name = "phim.idphim",required = false) Integer idphim2,
			@RequestParam(name = "btnThemTapPhim",required = false) boolean btnThemTapPhim,
			@RequestParam(name = "btnChinhSuaTapPhim",required = false) boolean btnChinhSuaTapPhim){
		
			
		
		if(idphim != null) {
			try {
				Phim phim2;
				if(clear == true) {
					phim2 = null;
					model.addAttribute("editPhim", phim2);
				}else {
					phim2 = phimService.findById(idphim).get();
					model.addAttribute("editPhim", phim2);
				}
				
				
				
				ChiTietPhim chiTietPhim2 =  phimService.findChiTietPhimByID(idphim);
				model.addAttribute("chiTietPhim", chiTietPhim2);
				
				List<TapPhim> listTapPhim =  phimService.findTapPhimByID(idphim);
				model.addAttribute("listTapPhim", listTapPhim);
			} catch (Exception e) {
				// TODO: handle exception
			}
			
		}
		if(action != null) {
			if(action == 3 && idphim != null && idtapphim != null) {
				TapPhim tapPhim2 = phimService.findTapPhimByIDAndIDPhim(idtapphim, idphim);
				model.addAttribute("tapPhim", tapPhim2);
			}
		}
		
		if(btnSua == true) {
			try {
				Phim phimEdit = phimService.findById(idphim).get();
				phimEdit.setActive(active);
				phimEdit.setTieude(phim.getTieude());
				phimEdit.setSlug(phim.getSlug());
				phimEdit.setThumb_url(phim.getThumb_url());
				phimEdit.setPoster_url(phim.getPoster_url());
				phimService.savePhim(phimEdit, false);
				model.addAttribute("mes", "Cập nhật Phim thành công");
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			
		}
		if(btnThem == true) {
			try {
				Phim phimEdit = new Phim();
				//phimEdit.setIdphim();
				phimEdit.setActive(active);
				phimEdit.setTieude(phim.getTieude());
				phimEdit.setSlug(phim.getSlug());
				phimEdit.setThumb_url(phim.getThumb_url());
				phimEdit.setPoster_url(phim.getPoster_url());
				phimEdit.setNgaytao(new Date());

				phimService.savePhim(phimEdit, true);
				model.addAttribute("mes", "Thêm Phim mới thành công");
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			
		}
		if(btnChiTiet == true) {
			try {
				Phim ph = phimService.findById(idphim).get();
				ChiTietPhim chiTietPhim3 = phimService.findChiTietPhimByID(idphim);
				chiTietPhim3.setTengoc(chiTietPhim.getTengoc());
				chiTietPhim3.setTapmoinhat(chiTietPhim.getTapmoinhat());
				chiTietPhim3.setTongsotap(chiTietPhim.getTongsotap());
				chiTietPhim3.setThoigian(chiTietPhim.getThoigian());
				chiTietPhim3.setChatluong(chiTietPhim.getChatluong());
				chiTietPhim3.setMota(mota);
				ph.setChitietphim(chiTietPhim3);
				phimService.savePhim(ph, false);
				model.addAttribute("mes", "Cập nhật Chi Tiết Phim thành công");
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		
		if(btnChinhSuaTapPhim == true) {

			phimService.updateTapPhim(idphim2, idtapphim, tapPhim.getServer(),tapPhim.getTentap(),tapPhim.getSlug(),tapPhim.getLink(),tapPhim.getLink2());

			
			model.addAttribute("mes", "Cập nhật Tập Phim thành công");
		}

		if(btnThemTapPhim == true) {
			
			TapPhim tapPhim2 = new TapPhim();
			Phim p = phimService.findById(idphim2).get();
			tapPhim2.setPhim(p);
			tapPhim2.setServer(tapPhim.getServer());
			tapPhim2.setTentap(tapPhim.getTentap());
			tapPhim2.setSlug(tapPhim.getSlug());
			tapPhim2.setLink(tapPhim.getLink());
			tapPhim2.setLink2(tapPhim.getLink2());
			
			tapPhimService.saveTapPhim(tapPhim);
			model.addAttribute("mes", "Thêm Tập Phim mới thành công");
		}
			
			
			List<Phim> list2 = phimService.getAllPhims();
			model.addAttribute("listphim", list2);
			

			
			
		

		return "/views/phimcontrol";
	}
	
}
