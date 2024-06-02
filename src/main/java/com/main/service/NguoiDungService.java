package com.main.service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.main.model.NguoiDung;
import com.main.repository.NguoiDungRepository;

@Service
public class NguoiDungService {
	@Autowired
	private NguoiDungRepository nguoiDungRepository;

	public List<NguoiDung> getAllUsers() {

		return nguoiDungRepository.findAll();
	}

	/**
	 * Lưu thông tin người dùng.
	 *
	 * @param nguoidung Đối tượng NguoiDung chứa thông tin người dùng.
	 * @param option    Nếu true, thêm người dùng mới; nếu false, cập nhật người
	 *                  dùng hiện có.
	 * @return Đối tượng NguoiDung đã được lưu.
	 */
	public boolean saveUser(NguoiDung nguoidung, boolean option) {
		// option true: thêm
		// option false: cập nhật
		NguoiDung ng = findByEmailAndPassword(nguoidung.getEmail(), nguoidung.getPassword(), false);
		if(ng != null && option) {
			return false;
		}
		if (option) {
			nguoidung.setUser_id(nguoiDungRepository.findMaxId() + 1);
			nguoidung.setNgaytao(new Date());
			nguoidung.setActive(true);
			nguoidung.setRole(false);
			
		} else {
			//
		}
		nguoiDungRepository.save(nguoidung);
		return true;
	}

	public Optional<NguoiDung> findById(Integer id) {
		return nguoiDungRepository.findById(id);
	}

	public boolean removeUser(NguoiDung nguoidung) {
		try {
			nguoiDungRepository.delete(nguoidung);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
		}

		return false;
	}

	public List<NguoiDung> findUserByKeyword(String keyword) {

		return nguoiDungRepository.findUserByKeyword(keyword);
	}

	public NguoiDung findUserByEmail(String keyword) {

		return nguoiDungRepository.findUserByEmail(keyword);
	}
	
	/**
	 * Lấy danh sách người dùng được sắp xếp theo tên người dùng (username).
	 *
	 * @param option Nếu `true`, sắp xếp theo thứ tự tăng dần (A-Z); nếu `false`, sắp xếp theo thứ tự giảm dần (Z-A).
	 * @return Danh sách người dùng đã được sắp xếp.
	 */
	public List<NguoiDung> sortUserByUsernameASC(boolean option){
		if(option) {
			Sort sort = Sort.by("username").ascending(); // Sắp xếp theo tên tăng dần
			return nguoiDungRepository.findAll(sort);
		}
		
		Sort sort2 = Sort.by("username").descending(); // Sắp xếp theo tên giảm dần
		// Hoặc
		//Sort sort = Sort.by(Sort.Direction.DESC, "email"); // Sắp xếp theo email giảm dần
		return nguoiDungRepository.findAll(sort2);
		
	}
	/**
	 * Tìm người dùng dựa vào email và password kèm theo trạng thái active
	 *
	 * @param email email của người dùng
	 * @param password password của người dùng
	 * @param active active = true chỉ tìm người dùng hoạt động, false tìm hết
	 * @return Người dùng dựa vào email và password
	 */
	public NguoiDung findByEmailAndPassword(String email, String password, boolean active) {
		if(active) {
			return nguoiDungRepository.findByEmailAndPassword(email, password);
		}else {
			return nguoiDungRepository.findByEmailAndPassword2(email, password);
		}
		
	}

	public Integer findMaxId() {
		return nguoiDungRepository.findMaxId();
	}
}
