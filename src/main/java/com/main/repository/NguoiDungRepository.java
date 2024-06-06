package com.main.repository;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.main.model.NguoiDung;

@Repository
public interface NguoiDungRepository extends JpaRepository<NguoiDung, Integer>{
	@Query("SELECT Max(i.user_id) as maxId FROM NguoiDung i")
    Integer findMaxId();
	
	
	
	@Query("SELECT u FROM NguoiDung u WHERE u.username LIKE %:keyword%")
    List<NguoiDung> findUserByKeyword(@Param("keyword") String keyword);
	
	@Query("SELECT u FROM NguoiDung u WHERE u.email = :keyword")
    NguoiDung findUserByEmail(@Param("keyword") String keyword);
	
	@Query("SELECT u FROM NguoiDung u WHERE u.email = :email AND u.password = :password AND u.active = true")
    NguoiDung findByEmailAndPassword(@Param("email") String email, @Param("password") String password);
	
	@Query("SELECT u FROM NguoiDung u WHERE u.email = :email AND u.password = :password")
    NguoiDung findByEmailAndPassword2(@Param("email") String email, @Param("password") String password);
	
	@Query("SELECT u FROM NguoiDung u WHERE u.ngaytao <= :oneYearAgo")
    List<NguoiDung> findUsersCreatedWithinOneYear(@Param("oneYearAgo") LocalDate oneYearAgo);
	
//	@Query("SELECT c.cart_id FROM Cart c WHERE c.user.user_id = :userId AND c.item.item_id = :itemId")
//	Integer findCartIDByUserIdAndItemId(@Param("userId") Integer userId, @Param("itemId") Integer itemId);
//	
//	@Query("SELECT c.soluong FROM Cart c WHERE c.user.user_id = :userId AND c.item.item_id = :itemId")
//    Integer findSoluongByUserIdAndItemId(@Param("userId") Integer userId, @Param("itemId") Integer itemId);
}
