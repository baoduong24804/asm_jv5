package com.main.controller.mn.phim;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.main.controller.api.APIController;
import com.main.model.MailInfo;
import com.main.model.NguoiDung;
import com.main.repository.MailerService;
import com.main.service.MailerServiceImpl;
import com.main.service.ModelLoader;

@Controller

public class MailController {

	@Autowired
	MailerService mailer;

	@Value("${upload.directory}")
	private String uploadDirectory;

	@Autowired
	ModelLoader modelLoader;

	public static String mes = null;

	@GetMapping("/animu/control/mail")
	public String tapphim(Model model) {
		//
		modelLoader.loadModel(model);
		//
		modelLoader.loadListPhim(model);// tai danh sach phim
		modelLoader.phimModel(model);
		modelLoader.chiTietPhimModel(model);
		modelLoader.tapPhimModel(model);
		modelLoader.phanLoaiModel(model);
		//

		if (mes != null) {
			model.addAttribute("mes", mes);
		}

		mes = null;

		model.addAttribute("action", 9);
		return "/views/phim/control";
	}

	@PostMapping("/animu/control/guimail")
	public String sendMail(@RequestParam("file") MultipartFile[] file, @RequestParam("from") String from,
			@RequestParam("text") String body, @RequestParam("subject") String subject,
			@RequestParam("options") boolean options) {

		mes = null;

		if (MailerServiceImpl.list.size() > 0) {
			mes = "Đang gửi";
			return "redirect:/animu/control/mail";
		}

		if (APIController.list2.size() <= 0) {
			mes = "Vui lòng thêm Email vào hàng chờ";
			return "redirect:/animu/control/mail";
		}

		try {
			MailInfo mailInfo = new MailInfo();
			mailInfo.setFrom(from);
			mailInfo.setTo(APIController.list2.getFirst().getEmail().toLowerCase().trim());
			mailInfo.setSubject(subject);
			mailInfo.setBody(body);

			if (options) {
				String cc = "";

				if (APIController.list2.size() > 1) {
					for (NguoiDung ng : APIController.list2) {
						cc += ng.getEmail() + ",";
					}
				}
				mailInfo.setCc(cc.split(","));
			} else {

				String bcc = "";

				if (APIController.list2.size() > 1) {
					for (NguoiDung ng : APIController.list2) {
						bcc += ng.getEmail() + ",";
					}
				}
				mailInfo.setBcc(bcc.split(","));

			}

			if (file.length > 0 && file != null) {
				// Lấy đường dẫn tuyệt đối
				String absolutePath = new File(uploadDirectory).getAbsolutePath();

				// Kiểm tra và tạo thư mục tải lên nếu chưa tồn tại
				File uploadDir = new File(absolutePath);
				if (!uploadDir.exists()) {
					uploadDir.mkdirs();
				}

				List<String> attachmentPaths = new ArrayList<>();
				for (MultipartFile attachment : file) {
					if (!attachment.isEmpty()) {
						String path = absolutePath + File.separator + attachment.getOriginalFilename();
						File dest = new File(path);
						attachment.transferTo(dest);
						attachmentPaths.add(path);
					}
				}
				mailInfo.setAttachments(attachmentPaths.toArray(new String[0]));
			}

			mailer.queue(mailInfo);
			// model.addAttribute("message", "Email đã được đưa vào hàng đợi và sẽ được gửi
			// sớm.");
			APIController.list2 = new ArrayList<>();
			return "redirect:/animu/control/mail";
		} catch (Exception e) {
			e.printStackTrace();
			// model.addAttribute("message", "Lỗi khi gửi email: " + e.getMessage());
			return "redirect:/animu/control/mail";
		}

	}

}
