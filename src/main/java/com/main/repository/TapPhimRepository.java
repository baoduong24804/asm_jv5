package com.main.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.main.model.TapPhim;

@Repository
public interface TapPhimRepository extends JpaRepository<TapPhim, Integer>{
	@Query("SELECT Max(i.idtapphim) as maxId FROM TapPhim i")
    Integer findMaxId();
	
	@Query("select t from TapPhim t where t.phim.idphim =:idphim")
	List<TapPhim> findAllByIdPhim(@Param("idphim") Integer idphim);
	
//	@Query("SELECT c.cart_id FROM Cart c WHERE c.user.user_id = :userId AND c.item.item_id = :itemId")
//	Integer findCartIDByUserIdAndItemId(@Param("userId") Integer userId, @Param("itemId") Integer itemId);
//	
//	@Query("SELECT c.soluong FROM Cart c WHERE c.user.user_id = :userId AND c.item.item_id = :itemId")
//    Integer findSoluongByUserIdAndItemId(@Param("userId") Integer userId, @Param("itemId") Integer itemId);
}
