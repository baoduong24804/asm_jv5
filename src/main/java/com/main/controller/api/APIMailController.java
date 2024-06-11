package com.main.controller.api;

import java.io.File;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.main.model.MailInfo;
import com.main.model.NguoiDung;
import com.main.repository.MailerService;
import com.main.repository.NguoiDungRepository;

@RestController
public class APIMailController {
	@Autowired
	MailerService mailer;

	@Autowired
	NguoiDungRepository nguoiDungRepository;

	@Value("${upload.directory}")
	private String uploadDirectory;

	private List<NguoiDung> listAdd = new ArrayList<NguoiDung>();

	@GetMapping("/animu/api/clear/listmail")
	public String getMethodName() {

		// listAdd.removeAll(listAdd);
		listAdd = null;
		return "";
	}

	@GetMapping("/animu/api/add/listmail/{type}")
	public List<NguoiDung> addEmail(@PathVariable("type") int type) {
		List<NguoiDung> list = nguoiDungRepository.findAll();
		List<NguoiDung> listreturn = new ArrayList<NguoiDung>();

		if (type == 0) {
			for (NguoiDung nguoiDung : list) {
				NguoiDung ng = new NguoiDung();
				ng.setEmail(nguoiDung.getEmail());
				ng.setUser_id(nguoiDung.getUser_id());
				ng.setUsername(nguoiDung.getUsername());
				ng.setNgaytao(nguoiDung.getNgaytao());
				listreturn.add(ng);
			}
			listAdd = listreturn;
			return listreturn;
		} else {
			for (NguoiDung nguoiDung : list) {
				LocalDate dateToCheck = LocalDate.of(nguoiDung.getNgaytao().getYear(),
						nguoiDung.getNgaytao().getMonth(), nguoiDung.getNgaytao().getDayOfMonth()); // Example date
				boolean isMoreThanOneYearOld = isDateMoreThanOneYearOld(dateToCheck);
				if (isMoreThanOneYearOld) {
					NguoiDung ng = new NguoiDung();
					ng.setEmail(nguoiDung.getEmail());
					ng.setUser_id(nguoiDung.getUser_id());
					ng.setUsername(nguoiDung.getUsername());
					ng.setNgaytao(nguoiDung.getNgaytao());
					listreturn.add(ng);
				}
			}
			listAdd = listreturn;
			return listreturn;
		}

	}

	@PostMapping("/animu/control/guimail")
	public String sendMail(@RequestParam("file") MultipartFile[] file, @RequestParam("from") String from,
			@RequestParam("text") String body, @RequestParam("subject") String subject,
			@RequestParam("options") boolean options) {

		if (listAdd == null || listAdd.size() == 0) {
			return "0,Vui lòng thêm email vào danh sách gửi";
		}

		try {
			MailInfo mailInfo = new MailInfo();
			mailInfo.setFrom(from);
			mailInfo.setTo(listAdd.getFirst().getEmail().toLowerCase().trim());
			mailInfo.setSubject(subject);
			mailInfo.setBody(body);

			if (options) {

				if (listAdd.size() > 1) {
					String cc = "";
					for (NguoiDung ng : listAdd) {
						cc += ng.getEmail() + ",";
					}
					mailInfo.setCc(cc.split(","));
				}

			} else {

				if (listAdd.size() > 1) {
					String bcc = "";
					for (NguoiDung ng : listAdd) {
						bcc += ng.getEmail() + ",";
					}
					mailInfo.setBcc(bcc.split(","));
				}

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

			return "1, Đã thêm vào danh sách chờ. Gửi email sau khoảng 5 giây";
		} catch (Exception e) {
			e.printStackTrace();
			// model.addAttribute("message", "Lỗi khi gửi email: " + e.getMessage());
			e.printStackTrace();
			return "0, Lỗi gửi email";
		}

	}

	public static boolean isDateMoreThanOneYearOld(LocalDate date) {
		LocalDate oneYearAgo = LocalDate.now().minusYears(1);
		return date.isBefore(oneYearAgo);
	}

}
