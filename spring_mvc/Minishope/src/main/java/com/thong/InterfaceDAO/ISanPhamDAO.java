package com.thong.InterfaceDAO;

import java.util.List;

import com.thong.Entity.SanPham;

public interface ISanPhamDAO {
	List<SanPham> listSanPhamLimit(int begin, int quantity, String typeSort, String sortBy);

	SanPham ChiTietSanPham(int idSanPham);

	List<SanPham> FindByCategory(int idDanhMuc, int begin, int quantity, String typeSort, String sortBy);

	List<SanPham> searchByFTS(String keyWords, int begin, int quantity, String typeSort, String sortBy);

	void deleteProduct(Integer idSanPham);

	Integer createProduct(SanPham sp);

	SanPham findOneById(int idSanPham);

	void UpdateProduct(SanPham sp);
}
