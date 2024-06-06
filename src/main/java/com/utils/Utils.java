package com.utils;

import java.text.SimpleDateFormat;
import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Period;
import java.time.temporal.ChronoUnit;
import java.util.Date;

public class Utils {
	
	private static int OTP = 0;
	
	public static void setOTP(int OTP) {
		Utils.OTP = OTP;
	}
	
	public static int getOTP() {
		return Utils.OTP;
	}
	
	public static String getDateFromTo(LocalDate pastDate) {
        LocalDate currentDate = LocalDate.now();
        Period period = Period.between(pastDate, currentDate);
        
        long days = ChronoUnit.DAYS.between(pastDate, currentDate);
       // long months = ChronoUnit.MONTHS.between(pastDate, currentDate);
       // long years = ChronoUnit.YEARS.between(pastDate, currentDate);

        return String.format("%d Năm, %d Tháng, %d Ngày (Tổng số ngày: %d)", 
                              period.getYears(), 
                              period.getMonths(), 
                              period.getDays(),
                              days);
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
