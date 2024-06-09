package com.main.controller.mn.nguoidung;

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

import com.main.model.MailInfo;
import com.main.model.NguoiDung;
import com.main.service.MailerServiceImpl;
import com.main.service.NguoiDungService;
import com.main.service.SessionService;
import com.utils.AutoCreate;
import com.utils.UserCurrent;
import com.utils.Utils;

@Controller
@RequestMapping("animu")
public class UserController {
	@Autowired
	NguoiDungService nguoiDungService;
	// @Autowired JwtUtils jwtUtils;
	
	@Autowired
	MailerServiceImpl mailerServiceImpl;
	
	@Autowired
	SessionService sessionService;

	@GetMapping("login")
	
	public String login(Model model,@ModelAttribute(name = "nguoidung") NguoiDung nguoiDung) {
		
		model.addAttribute("mes2", sessionService.get("error"));
		
		sessionService.set("error", "");
		
		
		return "/views/account/login";
	}
	
	@GetMapping("logout")
	public String logout() {
		sessionService.set("user", null);
		UserCurrent.clearNguoiDung();
		return "redirect:/";
	}
	

	@PostMapping("login")
	public String postMethodName(@ModelAttribute(name = "nguoidung") NguoiDung nguoiDung,
			Model model, @RequestParam(name = "check-btn", required = false) boolean check) {
		// TODO: process POST request
		if (nguoiDung.getEmail().isEmpty() || nguoiDung.getPassword().isEmpty()) {
			model.addAttribute("mes2", "Vui lòng nhập đầy đủ thông tin");
			return "/views/account/login";
		}

		NguoiDung nguoiDung2 = nguoiDungService.findByEmailAndPassword(nguoiDung.getEmail(), nguoiDung.getPassword(),
				true);
		if (nguoiDung2 != null) {
			UserCurrent.setNguoiDung(nguoiDung2);
		} else {
			model.addAttribute("mes2", "Đăng nhập thất bại");
			return "/views/account/login";
		}

		if (check) {
			// jwtUtils.generateToken(nguoiDung2.getUsername());
		} else {

		}
		//System.out.println(UserCurrent.getNguoiDung().toString());
		sessionService.set("user", nguoiDung2);
		
		model.addAttribute("mes", "Đăng nhập thành công");
		
		String uri = String.valueOf(sessionService.get("security-uri"));
		//System.out.println(uri);
		if(!uri.isEmpty() && uri != null && !uri.equals("null")) {
			sessionService.set("security-uri", "");
			
			return "redirect:"+uri;
		}
		
		//return "/views/login";
		return "redirect:/animu/home";
	}

	@GetMapping("register")
	public String register(@ModelAttribute(name = "nguoidung") NguoiDung nguoiDung) {

		return "/views/account/register";
	}

	@PostMapping("register")
	public String postMethodName(@ModelAttribute(name = "nguoidung") @Validated NguoiDung nguoiDung,
			BindingResult result, @RequestParam(name = "confirmpassword", required = false) String confirmpassword,
			Model model) {
		// TODO: process POST request
		if (result.hasErrors()) {
			model.addAttribute("mes2", "Đăng ký thất bại");
			return "/views/account/register";
		}
		if(!nguoiDung.getPassword().equals(confirmpassword)) {
			model.addAttribute("err", "Xác nhận mật khẩu không chính xác");
			return "/views/account/register";
		}
		if(!nguoiDungService.saveUser(nguoiDung, true)) {
			model.addAttribute("mes2", "Đăng ký thất bại, tài khoản đã có người sử dụng");
			return "/views/account/register";
		};
		
		model.addAttribute("mes", "Đăng ký thành công");
		return "/views/account/register";
	}

	@GetMapping("forgotpass")
	public String forgotpass() {
		return "/views/account/forgotpass";
	}
	
	@PostMapping("forgotpass")
	public String postMethodName(@RequestParam(name = "email", required = false) String email,
			@RequestParam(name = "OTP", required = false) String OTP,
			@RequestParam(name = "btn-send-otp", required = false) boolean btn,
			Model model) {
		// TODO: process POST request
		
		if(email.isEmpty()) {
			model.addAttribute("mes2", "Vui lòng nhập Email");
			
			return "/views/account/forgotpass";
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
				try {
					Integer otp = AutoCreate.generateRandomNumber2(6);
					String body = "Đây là mã OTP để khôi phục tài khoản của bạn: "+otp;
					MailInfo mailInfo = new MailInfo();
					mailInfo.setBody(body);
					mailInfo.setSubject("OTP");
					mailInfo.setFrom("Animu with love <animu@gmail.com>");
					mailInfo.setTo(email);
					mailerServiceImpl.send(mailInfo);
					Utils.setOTP(otp);
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}

			}
			
			
			model.addAttribute("email", email);
			model.addAttribute("mes", "Kiểm tra OTP được gửi qua Email");
			return "/views/account/forgotpass";
		}else {
			// xac nhận
			if(OTP.isEmpty()) {
				model.addAttribute("email", email);
				model.addAttribute("mes2", "Vui lòng nhập OTP");
				
				return "/views/account/forgotpass";
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
					try {
						model.addAttribute("email", email);
						String newpass = AutoCreate.generateRandomString(12);
						String body = "Đây là mật khẩu mới cho tài khoản của bạn: "+newpass;
						MailInfo mailInfo = new MailInfo();
						mailInfo.setBody(body);
						mailInfo.setSubject("Reset Password");
						mailInfo.setFrom("Animu with love <animu@gmail.com>");
						mailInfo.setTo(email);
						mailerServiceImpl.send(mailInfo);
						
						
						ng.setPassword(newpass);
						nguoiDungService.saveUser(ng, false);
						model.addAttribute("mes", "Mật khẩu mới đã được gửi vào Email của bạn");
						Utils.setOTP(0);
					} catch (Exception e) {
						// TODO: handle exception
						e.printStackTrace();
					}
				
				}else {
					model.addAttribute("email", email);
				}

			

		}else {
			
			model.addAttribute("email", email);
			model.addAttribute("mes2", "Mã OTP không chính xác");
		}
		
		//2024-05-23T15:11:59.814345100
		return "/views/account/forgotpass";
	}
}
