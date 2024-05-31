package com.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.model.TapPhim;
import com.repository.TapPhimRepository;

@Service
public class TapPhimService {
	@Autowired
	private TapPhimRepository tapPhimRepository;

	public List<TapPhim> getAllTapPhim() {

		return tapPhimRepository.findAll();
	}

	/**
	 * Lưu thông tin người dùng.
	 *
	 * @param nguoidung Đối tượng NguoiDung chứa thông tin người dùng.
	 * @param option    Nếu true, thêm người dùng mới; nếu false, cập nhật người
	 *                  dùng hiện có.
	 * @return Đối tượng NguoiDung đã được lưu.
	 */
	public boolean saveTapPhim(TapPhim tapphim) {
		
		tapphim.setIdtapphim(tapPhimRepository.findMaxId() + 1);
		
		tapPhimRepository.save(tapphim);
		return true;
	}

	public Optional<TapPhim> findById(Integer id) {
		return tapPhimRepository.findById(id);
	}

	public boolean removeUser(TapPhim nguoidung) {
		try {
			tapPhimRepository.delete(nguoidung);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
		}

		return false;
	}

	
	
	/**
	 * Lấy danh sách người dùng được sắp xếp theo tên người dùng (username).
	 *
	 * @param option Nếu `true`, sắp xếp theo thứ tự tăng dần (A-Z); nếu `false`, sắp xếp theo thứ tự giảm dần (Z-A).
	 * @return Danh sách người dùng đã được sắp xếp.
	 */
	
	/**
	 * Tìm người dùng dựa vào email và password kèm theo trạng thái active
	 *
	 * @param email email của người dùng
	 * @param password password của người dùng
	 * @param active active = true chỉ tìm người dùng hoạt động, false tìm hết
	 * @return Người dùng dựa vào email và password
	 */
	
}
