package com.utils;

import com.model.NguoiDung;

public class UserCurrent {
	private static NguoiDung nguoiDung;
	
	public static NguoiDung getNguoiDung() {
		return UserCurrent.nguoiDung;
	}
	
	public static void setNguoiDung(NguoiDung nguoiDung) {
		UserCurrent.nguoiDung = nguoiDung;
	}
	
	public static void clearNguoiDung() {
		UserCurrent.nguoiDung = null;
	}
}
