package com.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "yeuthich")
public class YeuThich {
	@Id
	private int idyeuthich;
	private int user_id;
	private int idphim;
}
