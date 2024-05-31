package com.model;

import java.util.Date;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "chitietphim")
public class ChiTietPhim {
	@Id
	private int idphim;
	
	private int tongsotap;
	private int thoigian;
	private int tapmoinhat;
	private String chatluong;
	private String mota;
	private Date ngaychinhsua;
	private String tengoc;
	
	@OneToOne
    @JoinColumn(name = "idphim")
    private Phim phim;
}
