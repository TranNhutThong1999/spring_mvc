package com.thong.InterfaceService;

import java.util.List;

import com.thong.DTO.SanPhamDTO;
import com.thong.Entity.SanPham;

public interface ISanPhamService {
	List<SanPhamDTO> findAll(int begin, int quantity, String typeSort, String sortBy);


	List<SanPhamDTO> findByCategory(int idDanhMuc, int begin, int quantity, String typeS, String sortBy);

	List<SanPhamDTO> search(String keyWords, int begin, int quantity, String typeSort, String sortBy);

	void delete(List<Integer> idSanPham);

	void create(SanPhamDTO sp);

	SanPhamDTO findOneById(int idSanPham);

	void update(SanPhamDTO spDTO);

}
