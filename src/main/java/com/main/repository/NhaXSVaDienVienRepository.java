package com.main.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.main.model.NhaXSVaDienVien;

@Repository
public interface NhaXSVaDienVienRepository extends JpaRepository<NhaXSVaDienVien, Integer>{
	@Query("SELECT Max(i.idnhasxvadv) as maxId FROM NhaXSVaDienVien i")
    Integer findMaxId();
	
	@Query("SELECT n FROM NhaXSVaDienVien n where n.idphim = :idPhim")
	List<NhaXSVaDienVien> findAllByIdPhim(@Param("idPhim") Integer idPhim);
	
	@Query("SELECT n FROM NhaXSVaDienVien n where n.idphim = :idPhim and n.idnhasxvadv = :idnhasxvadv")
	NhaXSVaDienVien findByIdPhimAndIdNhasx(@Param("idPhim") Integer idPhim,@Param("idnhasxvadv") Integer idnhasxvadv);
	
//	@Query("SELECT c.cart_id FROM Cart c WHERE c.user.user_id = :userId AND c.item.item_id = :itemId")
//	Integer findCartIDByUserIdAndItemId(@Param("userId") Integer userId, @Param("itemId") Integer itemId);
//	
//	@Query("SELECT c.soluong FROM Cart c WHERE c.user.user_id = :userId AND c.item.item_id = :itemId")
//    Integer findSoluongByUserIdAndItemId(@Param("userId") Integer userId, @Param("itemId") Integer itemId);
}
