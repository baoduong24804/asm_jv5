package com.main.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.main.model.ChiTietNguoiDung;

@Repository
public interface ChiTietNguoiDungRepository extends JpaRepository<ChiTietNguoiDung, Integer> {
    @Query("SELECT Max(i.idchitiet) as maxId FROM ChiTietNguoiDung i")
    Integer findMaxId();

    @Query("SELECT i FROM ChiTietNguoiDung i where i.nguoiDung.email LIKE %:keyword%")
    List<ChiTietNguoiDung> findAllByEmail(@Param("keyword") String keyword);

    @Query("SELECT i FROM ChiTietNguoiDung i where i.phim.idphim = :idphim and i.nguoiDung.user_id = :user_id")
    ChiTietNguoiDung findByIdPhimAndUserId(@Param("idphim") Integer idphim, @Param("user_id") Integer user_id);

    // @Query("SELECT c.cart_id FROM Cart c WHERE c.user.user_id = :userId AND
    // c.item.item_id = :itemId")
    // Integer findCartIDByUserIdAndItemId(@Param("userId") Integer userId,
    // @Param("itemId") Integer itemId);
    //
    // @Query("SELECT c.soluong FROM Cart c WHERE c.user.user_id = :userId AND
    // c.item.item_id = :itemId")
    // Integer findSoluongByUserIdAndItemId(@Param("userId") Integer userId,
    // @Param("itemId") Integer itemId);
}
