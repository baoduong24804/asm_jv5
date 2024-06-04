package com.main.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "phanloai")
public class PhanLoai {
	@Id
	private int idphim;
	private String loaiphim;
	private String theloai;
	private String quocgia;
	private int nam;
	
	@OneToOne
    @JoinColumn(name = "idphim")
    private ChiTietPhim chiTietPhim;
	
}
