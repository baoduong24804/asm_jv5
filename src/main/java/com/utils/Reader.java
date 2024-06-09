package com.utils;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;

public class Reader {
	public static String readFile(String file) {
		BufferedReader reader = null;
		StringBuilder s = new StringBuilder();
		Path path = Paths.get(".", file);
		//System.out.println(path);
		try {
			// Đường dẫn tới file cần đọc
			String filePath = path.toString();

			// Tạo đối tượng BufferedReader để đọc file
			reader = new BufferedReader(new FileReader(filePath));

			String line;
			// Đọc từng dòng của file và in ra màn hình
			
			while ((line = reader.readLine()) != null) {
				s.append(line);
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				// Đóng BufferedReader sau khi đọc xong
				if (reader != null) {
					reader.close();
				}
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return s.toString();
	}

}
