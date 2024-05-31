package com.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "nhasxvadienvien")
public class NhaxsVaDienVien {
	@Id
	private int idnhasxdienvien;// vaitro: 0: nha san xuat, 1:tac gia
	private int idphim;
	private boolean vaitro;
	private String ten;
}
