package com.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.main.model.ChiTietNguoiDung;
import com.main.model.NguoiDung;
import com.main.model.YeuThich;
import com.main.repository.ChiTietNguoiDungRepository;
import com.main.repository.NguoiDungRepository;
import com.main.repository.YeuThichRepository;
import com.main.service.ParamService;
import com.main.service.SessionService;
import com.utils.UserCurrent;

@Controller
public class UserController2 {
	@Autowired
	NguoiDungRepository ndrespository;
	@Autowired
	ChiTietNguoiDungRepository ctndrespository;
	@Autowired
	YeuThichRepository likerespository;
	@Autowired
	SessionService ss;
	@Autowired
	ParamService paramservice;

	@GetMapping("/animu/user")
	public String getMethodName(Model model) {
		// Thay đổi thông tin
		NguoiDung nd = new NguoiDung();
		NguoiDung nd1 = UserCurrent.getNguoiDung();

		if (nd1 == null) {
			nd1 = (NguoiDung) ss.get("user");
			return "redirect:/animu/login";
		}
		nd.setUser_id(nd1.getUser_id());
		nd.setUsername(nd1.getUsername());
		nd.setEmail(nd1.getEmail());
		nd.setImg(nd1.getImg());
		model.addAttribute("useredit", nd);
		// Video đã xem
		List<ChiTietNguoiDung> list = ctndrespository.findAll();
		List<YeuThich> list1 = likerespository.findAll();
		model.addAttribute("videosdathich", list1);
		model.addAttribute("page", list);
		return "/views/user";
	}

	@PostMapping("/animu/user/changeinformation")
	public String Update(Model model,
			@RequestParam("username") String username,
			@RequestParam("email") String email,
			@RequestParam("file") MultipartFile file) {
		NguoiDung nd1 = UserCurrent.getNguoiDung();

		NguoiDung nd = ndrespository.findById(nd1.getUser_id()).orElse(null);

		try {
			if (nd != null) {
				nd.setUsername(username);
				nd.setEmail(email);
				UserCurrent.getNguoiDung().setUsername(nd.getUsername());
				ss.set("user", UserCurrent.getNguoiDung());
				if (!file.isEmpty()) {
					String tenfile = "/image/";
					Boolean filesave = paramservice.save(file, tenfile);
					if (filesave) {
						nd.setImg("/image/" + file.getOriginalFilename());
						UserCurrent.getNguoiDung().setImg(nd.getImg());

					} else {
						model.addAttribute("MessUpdateImg", "Không thể thay đổi ảnh");
						return "redirect:/animu/user";
					}
				}
				ndrespository.save(nd);
				System.out.println("Update thành công");
				model.addAttribute("messupdate", "Update thành công");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/animu/user";
	}

	@PostMapping("animu/user/changepassword")
	public String thaydoimatkhau(@RequestParam("password") String password,
			@RequestParam("new-password") String newpassword,
			@RequestParam("confirm-password") String confirmpassword,
			Model model) {
		NguoiDung nd = UserCurrent.getNguoiDung();

		String message;
		if (!password.equals(nd.getPassword())) {
			message = "Mật khẩu hiện tại không đúng";
			System.out.println("Mật khẩu hiện tại không đúng");

		} else if (!newpassword.equals(confirmpassword)) {
			message = "Mật khẩu mới và xác nhận mật khẩu không khớp";
			System.out.println("Mật khẩu mới và xác nhận mật khẩu không khớp");
		} else {

			nd.setPassword(newpassword);
			ndrespository.save(nd);
			message = "Đổi mật khẩu thành công";
			System.out.println("Đổi mật khẩu thành công");
		}
		model.addAttribute("messupdate", message);
		return "redirect:/animu/user";
	}
}
