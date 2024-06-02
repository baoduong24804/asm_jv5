package com.main.model;

import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
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
	
	@OneToMany(mappedBy = "phanLoai", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<ChiTietPhim> chiTietPhims;

}
