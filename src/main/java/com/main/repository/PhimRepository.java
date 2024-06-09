package com.main.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.main.model.ChiTietPhim;
import com.main.model.Phim;
import com.main.model.TapPhim;

import jakarta.transaction.Transactional;


@Repository
public interface PhimRepository extends JpaRepository<Phim, Integer>{
	@Query("SELECT Max(i.idphim) as maxId FROM Phim i")
    Integer findMaxId();
	
	@Query("SELECT i FROM Phim i where i.active = true")
    List<Phim> findAllPhimActive();
	
	@Query("SELECT p FROM Phim p WHERE p.tieude LIKE %:keyword%")
    List<Phim> findAllPhimLikeTieuDe(@Param("keyword") String keyword);
	
	@Query("SELECT u FROM ChiTietPhim u where u.idphim =:idphim")
	ChiTietPhim findChiTietPhimByID(@Param("idphim") Integer userId);

	@Query("SELECT u FROM TapPhim u where u.phim.idphim =:idphim")
	List<TapPhim> findTapPhimByID(@Param("idphim") Integer userId);
	
	@Query("SELECT u FROM TapPhim u where u.phim.idphim =:idphim and u.idtapphim =:idtapphim")
	TapPhim findTapPhimByIDAndIDPhim(@Param("idtapphim") Integer idtapphim,@Param("idphim") Integer idphim);
	
	@Query("SELECT u FROM TapPhim u where u.phim.idphim =:idphim")
	List<TapPhim> findAllTapPhimByIDAndIDPhim(@Param("idphim") Integer idphim);
	
	@Modifying
    @Transactional
    @Query("UPDATE TapPhim tp SET tp.server = :server, tp.tentap = :tentap, tp.slug = :slug,tp.link = :link,tp.link2 = :link2 WHERE tp.phim.idphim = :idphim AND tp.idtapphim = :idtapphim")
    void updateTapPhim(@Param("idphim") int idphim, @Param("idtapphim") int idtapphim, @Param("server") String newServer, @Param("tentap") String newTentap,@Param("slug") String slug, @Param("link") String newLink,@Param("link2") String newLink2);

	@Query("Select o from Phim o where o.chitietphim.phanLoai.loaiphim =:loaiphim")
	Page<Phim> findPhimByPhanLoai(@Param("loaiphim") String loaiphim, Pageable pageable);
}
