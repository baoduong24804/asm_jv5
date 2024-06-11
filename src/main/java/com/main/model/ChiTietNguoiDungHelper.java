package com.main.model;

import java.util.Date;

import lombok.Data;

@Data
public class ChiTietNguoiDungHelper {
	private int idchitiet;
	private int user_id;
	private int idphim;
	private String tieude;
	private String tapphim;
	private String cmt;
	private String email;
	private String username;
	private int vote;
	private boolean like;
	private Date date;
	private String img;

}
