package com.utils;

import java.text.SimpleDateFormat;
import java.time.Duration;
import java.time.LocalDateTime;
import java.util.Date;

public class Utils {
	
	private static int OTP = 0;
	
	public static void setOTP(int OTP) {
		Utils.OTP = OTP;
	}
	
	public static int getOTP() {
		return Utils.OTP;
	}
	
	
	private static LocalDateTime time = null;

	public static String dateToString(Date date, String pattern) {
		// "yyyy-MM-dd HH:mm:ss.S"
		try {

			SimpleDateFormat dateFormat = new SimpleDateFormat(pattern);
			String formattedDate = dateFormat.format(date);
			return formattedDate;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}

	public static void setTime() {
		if (Utils.time == null) {
			Utils.time = LocalDateTime.now();
		}

	}

	public static void clearTime() {
		Utils.time = null;

	}

	public static LocalDateTime getTime() {
		return Utils.time;
	}

	public static boolean checkTime(LocalDateTime previousTime) {
		LocalDateTime currentTime = LocalDateTime.now();
		Duration duration = Duration.between(previousTime, currentTime);
		return duration.getSeconds() >= 5;

	}

}
