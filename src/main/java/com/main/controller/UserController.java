package com.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.main.model.NguoiDung;
import com.main.service.NguoiDungService;
import com.utils.Email;
import com.utils.UserCurrent;
import com.utils.Utils;

@Controller
@RequestMapping("animu")
public class UserController {
	@Autowired
	NguoiDungService nguoiDungService;
	// @Autowired JwtUtils jwtUtils;

	@GetMapping("login")
	public String login(@ModelAttribute(name = "nguoidung") NguoiDung nguoiDung) {
		return "/views/login";
	}

	@PostMapping("login")
	public String postMethodName(@ModelAttribute(name = "nguoidung") NguoiDung nguoiDung,
			Model model, @RequestParam(name = "check-btn", required = false) boolean check) {
		// TODO: process POST request
		if (nguoiDung.getEmail().isEmpty() || nguoiDung.getPassword().isEmpty()) {
			model.addAttribute("mes2", "Vui lòng nhập đầy đủ thông tin");
			return "/views/login";
		}

		NguoiDung nguoiDung2 = nguoiDungService.findByEmailAndPassword(nguoiDung.getEmail(), nguoiDung.getPassword(),
				true);
		if (nguoiDung2 != null) {
			UserCurrent.setNguoiDung(nguoiDung2);
		} else {
			model.addAttribute("mes2", "Đăng nhập thất bại");
			return "/views/login";
		}

		if (check) {
			// jwtUtils.generateToken(nguoiDung2.getUsername());
		} else {

		}
		//System.out.println(UserCurrent.getNguoiDung().toString());
		model.addAttribute("mes", "Đăng nhập thành công");
		
		//return "/views/login";
		return "redirect:/animu/home";
	}

	@GetMapping("register")
	public String register(@ModelAttribute(name = "nguoidung") NguoiDung nguoiDung) {

		return "/views/register";
	}

	@PostMapping("register")
	public String postMethodName(@ModelAttribute(name = "nguoidung") @Validated NguoiDung nguoiDung,
			BindingResult result, @RequestParam(name = "confirmpassword", required = false) String confirmpassword,
			Model model) {
		// TODO: process POST request
		if (result.hasErrors()) {
			model.addAttribute("mes2", "Đăng ký thất bại");
			return "/views/register";
		}
		if(!nguoiDung.getPassword().equals(confirmpassword)) {
			model.addAttribute("err", "Xác nhận mật khẩu không chính xác");
			return "/views/register";
		}
		if(!nguoiDungService.saveUser(nguoiDung, true)) {
			model.addAttribute("mes2", "Đăng ký thất bại, tài khoản đã có người sử dụng");
			return "/views/register";
		};
		
		model.addAttribute("mes", "Đăng ký thành công");
		return "/views/register";
	}

	@GetMapping("forgotpass")
	public String forgotpass() {
		return "/views/forgotpass";
	}
	
	@PostMapping("forgotpass")
	public String postMethodName(@RequestParam(name = "email", required = false) String email,
			@RequestParam(name = "OTP", required = false) String OTP,
			@RequestParam(name = "btn-send-otp", required = false) boolean btn,
			Model model) {
		// TODO: process POST request
		
		if(email.isEmpty()) {
			model.addAttribute("mes2", "Vui lòng nhập Email");
			
			return "/views/forgotpass";
		}
		
		if(btn) {
//			Utils.setTime();
//			if(!Utils.checkTime(Utils.getTime())) {
//				model.addAttribute("email", email);
//				model.addAttribute("mes2", "Vui lòng chờ 60s để gửi lại OTP");
//				
//			}else {
//				model.addAttribute("email", email);
//				model.addAttribute("mes", "Kiểm tra OTP được gửi qua Email");
//				Utils.clearTime();
//			}
			NguoiDung ng = nguoiDungService.findUserByEmail(email);
			if(ng != null) {
				Utils.setOTP(Integer.valueOf(Email.sendMail(email,true,0)));
			}
			
			
			model.addAttribute("email", email);
			model.addAttribute("mes", "Kiểm tra OTP được gửi qua Email");
			return "/views/forgotpass";
		}else {
			// xac nhận
			if(OTP.isEmpty()) {
				model.addAttribute("email", email);
				model.addAttribute("mes2", "Vui lòng nhập OTP");
				
				return "/views/forgotpass";
			}
		}
		
		//kiem tra otp
		int otp = 1;
		try {
			otp = Integer.valueOf(OTP);
		} catch (Exception e) {
			// TODO: handle exception
		}
		if(Utils.getOTP() != 0 && otp == Utils.getOTP()) {
				NguoiDung ng = nguoiDungService.findUserByEmail(email);
				if(ng != null) {
					
				model.addAttribute("email", email);
				String pass = Email.sendMail(email, false, 5);
				ng.setPassword(pass);
				nguoiDungService.saveUser(ng, false);
				model.addAttribute("mes", "Mật khẩu mới đã được gửi vào Email của bạn");
				Utils.setOTP(0);
				}else {
					model.addAttribute("email", email);
				}

			

		}else {
			
			model.addAttribute("email", email);
			model.addAttribute("mes2", "Mã OTP không chính xác");
		}
		
		//2024-05-23T15:11:59.814345100
		return "/views/forgotpass";
	}
}
