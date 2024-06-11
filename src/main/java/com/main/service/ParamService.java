package com.main.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;

@Service
public class ParamService {
	@Autowired
	HttpServletRequest request;

	@Autowired
	ServletContext app;

	public String getString(String name, String defaultValue) {
		String pa = request.getParameter(name);
		return pa == null ? defaultValue : pa;
	}

	public int getInt(String name, int defaultValue) {
		String pa = request.getParameter(name);
		if (pa != null) {
			return Integer.parseInt(pa);
		}
		return defaultValue;
	}

	public double getDouble(String name, double defaultValue) {
		String pa = request.getParameter(name);
		if (pa != null) {
			return Double.parseDouble(pa);
		}
		return defaultValue;
	}

	public boolean getBoolean(String name, boolean defaultValue) {
		String pa = request.getParameter(name);

		if (pa != null && !pa.isEmpty()) {
			int check = Integer.parseInt(pa);

			return check == 1 ? true : false;
		}
		return defaultValue;
	}

	public Date getDate(String name, String pattern) {
		String pa = request.getParameter(name);

		if (pa != null) {

			// Định dạng chuỗi ngày
			SimpleDateFormat inputFormat = new SimpleDateFormat(pattern);

			try {
				// Chuyển đổi chuỗi thành đối tượng Date
				Date date = inputFormat.parse(pa);

				return date;
				// In ra kết quả

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	public String dateToString(Date date, String pattern) {
		try {
			// Định dạng ngày theo định dạng "dd-MM-yyyy"
			SimpleDateFormat dateFormat = new SimpleDateFormat(pattern);
			String formattedDate = dateFormat.format(date);
			return formattedDate;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}

	public boolean save(MultipartFile file, String path) {
		if (file.isEmpty()) {
			return false;
		}

		try {
			String filepath = null;
			String filename = file.getOriginalFilename();
			if (path.startsWith("/") && path.endsWith("/")) {
				filepath = app.getRealPath(path + filename);
			} else {
				filepath = app.getRealPath("/" + path + "/" + filename);
			}

			File filesave = new File(filepath);
			if (!filesave.exists()) {
				filesave.mkdirs();
			}
			file.transferTo(filesave);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return true;
	}
}
