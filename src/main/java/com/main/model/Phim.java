package com.main.model;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@Table(name = "phim")
@AllArgsConstructor
@NoArgsConstructor
public class Phim {
	@Id
	private int idphim;
	private String tieude;
	private String slug;
	private String thumb_url;
	private String poster_url;
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	private Date ngaytao;
	private boolean active;
	
	@OneToMany(mappedBy = "phim", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<TapPhim> tapphim;
	
	@OneToOne(mappedBy = "phim", cascade = CascadeType.ALL, orphanRemoval = true)
    private ChiTietPhim chitietphim;
	
	@OneToMany(mappedBy = "phim", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<YeuThich> yeuThichs;
	
	@OneToMany(mappedBy = "phim", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<ChiTietNguoiDung> chiTietNguoiDungs;
	
}
