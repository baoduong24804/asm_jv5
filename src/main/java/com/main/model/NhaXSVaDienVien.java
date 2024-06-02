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
@Table(name = "nhasxvadienvien")
public class NhaXSVaDienVien {
	@Id
	private int idnhasxvadv;// vaitro: 0: nha san xuat, 1:tac gia
	private int idphim;
	private boolean vaitro;
	private String ten;
	
	@OneToMany(mappedBy = "nhaXSVaDienVien", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<ChiTietPhim> chiTietPhims;
	
}
