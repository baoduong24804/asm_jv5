package com.main.service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.model.ChiTietPhim;
import com.main.model.Phim;
import com.main.model.TapPhim;
import com.main.repository.PhimRepository;

@Service
public class PhimService {
	@Autowired
	private PhimRepository phimRepository;
	
	public List<Phim> getAllPhims() {
		
		
        return phimRepository.findAll();
    }
	
		public List<Phim> getAllPhimActive() {
		
		
        return phimRepository.findAllPhimActive();
    }

	/**
	 * Lưu thông tin người dùng.
	 *
	 * @param phim Đối tượng Phim chứa thông tin phim
	 * @param option Nếu true, thêm phim mới; nếu false, cập nhật phim hiện có.
	 * @return Đối tượng Phim đã được lưu.
	 */
    public Phim savePhim(Phim phim, boolean option) {
    	// option true: thêm
    	// option false: cập nhật
    	if(option) {
			ChiTietPhim chiTietPhim = new ChiTietPhim();
			chiTietPhim.setNgaychinhsua(new Date());
			
			

			
    		phim.setIdphim(phimRepository.findMaxId() + 1);
    		chiTietPhim.setIdphim(phim.getIdphim());
    		
    		phim.setChitietphim(chiTietPhim);
    	}else {
    		//
    	}
    	
    	
        return phimRepository.save(phim);
    }
    
    public Optional<Phim> findById(Integer id) {
        return phimRepository.findById(id);
    }
    
    public Integer findMaxId() {
    	
    	return phimRepository.findMaxId();
    }
    
    public ChiTietPhim findChiTietPhimByID(Integer id){
    	return phimRepository.findChiTietPhimByID(id);
    }

    public List<Phim> findAllById(List<Integer> list){
    	return phimRepository.findAllById(list);
    }
    
    public List<TapPhim> findTapPhimByID(Integer id){
    	return phimRepository.findTapPhimByID(id);
    }
    
    public TapPhim findTapPhimByIDAndIDPhim(Integer idtapphim, Integer idphim) {
    	return phimRepository.findTapPhimByIDAndIDPhim(idtapphim, idphim);
    }
    
    public List<TapPhim> findAllTapPhimByIDAndIDPhim(Integer idphim) {
    	return phimRepository.findAllTapPhimByIDAndIDPhim( idphim);
    }
    
    public void updateTapPhim(Integer idphim, Integer idtapphim, String server, String tentap,String slug, String link, String link2) {
     phimRepository.updateTapPhim(idphim, idtapphim, server, tentap, slug, link, link2);
    }
}
