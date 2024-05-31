package com.model;

import java.util.Date;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;

@Data
@Entity
@Table(name = "nguoidung")
public class NguoiDung {
	@Id
	private int user_id;
	@NotBlank(message = "Vui lòng nhập Username")
	private String username;
	@NotBlank(message = "Vui lòng nhập Email")
	private String email;
	@NotBlank(message = "Vui lòng nhập mật khẩu")
	private String password;
	private Date ngaytao;
	private boolean active;
	private boolean role;
}
