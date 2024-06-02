package com.main.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "yeuthich")
public class YeuThich {
	@Id
	private int idyeuthich;
	//private int user_id;
	//private int idphim;
	
	@ManyToOne
	@JoinColumn(name = "user_id")
	private NguoiDung nguoiDung;
	
	@ManyToOne
	@JoinColumn(name = "idphim")
	private Phim phim;
	
}
