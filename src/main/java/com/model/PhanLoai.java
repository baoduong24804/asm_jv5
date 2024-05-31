package com.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "phanloai")
public class PhanLoai {
	@Id
	private int idphanloai;
	//private int idphim;
	private String loaiphim;
	private String theloai;
	private String quocgia;
	private int nam;
	
	@ManyToOne
    @JoinColumn(name = "idphim")
    private Phim phim;

}
