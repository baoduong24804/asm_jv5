package com.utils;
import java.util.Random;

public class AutoCreate {
	
	public static int generateRandomNumber() {
        Random random = new Random();
        return 1000 + random.nextInt(9000); // Tạo số ngẫu nhiên từ 1000 đến 9999 (bao gồm cả 1000 và 9999)
    }
	
	public static int generateRandomNumber2(int length) {
        // Tính toán giới hạn dưới và giới hạn trên dựa trên length
        int min = (int) Math.pow(10, length - 1); // Ví dụ: length = 3 -> min = 100
        int max = (int) Math.pow(10, length) - 1; // Ví dụ: length = 3 -> max = 999

        Random random = new Random();
        return random.nextInt(max - min + 1) + min; // Sinh số ngẫu nhiên trong khoảng [min, max]
    }
	
	
    public static String generateRandomString(int length) {
        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        Random random = new Random();
        StringBuilder sb = new StringBuilder(length);

        for (int i = 0; i < length; i++) {
            int randomIndex = random.nextInt(characters.length());
            char randomChar = characters.charAt(randomIndex);
            sb.append(randomChar);
        }

        return sb.toString();
    }

    }
