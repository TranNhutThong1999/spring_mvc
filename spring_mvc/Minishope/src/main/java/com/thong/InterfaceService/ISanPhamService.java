package com.thong.InterfaceService;

import java.util.List;

import com.thong.DTO.SanPhamDTO;
import com.thong.Entity.SanPham;

public interface ISanPhamService {
	List<SanPhamDTO> listSanPhamLimit(int begin, int quantity, String typeSort, String sortBy);

	SanPhamDTO ChiTietSanPham(int idSanPham);

	List<SanPhamDTO> FindByCategory(int idDanhMuc, int begin, int quantity, String typeS, String sortBy);

	List<SanPhamDTO> searchByFTS(String keyWords, int begin, int quantity, String typeSort, String sortBy);

	void deleteProduct(List<Integer> idSanPham);

	void createProduct(SanPhamDTO sp);

	SanPhamDTO findOneById(int idSanPham);

	void UpdateProduct(SanPhamDTO spDTO);

}
