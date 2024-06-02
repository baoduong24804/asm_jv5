package com.main.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "chitietnguoidung")
public class ChiTietNguoiDung {
	@Id
	private int idchitiet;
	//private int user_id;
	//private int idphim;
	private boolean is_like;
	private int vote;
	private String cmt;
	
	@ManyToOne
	@JoinColumn(name = "user_id")
	private NguoiDung nguoiDung;
	
	@ManyToOne
	@JoinColumn(name = "idphim")
	private Phim phim;
}
