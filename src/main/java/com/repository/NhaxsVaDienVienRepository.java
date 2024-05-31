package com.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.model.NhaxsVaDienVien;

@Repository
public interface NhaxsVaDienVienRepository extends JpaRepository<NhaxsVaDienVien, Integer>{
	@Query("SELECT Max(i.idnhasxdienvien) as maxId FROM NhaxsVaDienVien i")
    Integer findMaxId();
	

	
//	@Query("SELECT c.cart_id FROM Cart c WHERE c.user.user_id = :userId AND c.item.item_id = :itemId")
//	Integer findCartIDByUserIdAndItemId(@Param("userId") Integer userId, @Param("itemId") Integer itemId);
//	
//	@Query("SELECT c.soluong FROM Cart c WHERE c.user.user_id = :userId AND c.item.item_id = :itemId")
//    Integer findSoluongByUserIdAndItemId(@Param("userId") Integer userId, @Param("itemId") Integer itemId);
}
