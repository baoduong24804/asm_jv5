package com.main.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "tapphim")
public class TapPhim {
	@Id
	private int idtapphim;
	//private int idphim;
	private String server;
	private String tentap;
	private String link;
	private String link2;
	private String slug;
	@ManyToOne
    @JoinColumn(name = "idphim")
    private Phim phim;
}
