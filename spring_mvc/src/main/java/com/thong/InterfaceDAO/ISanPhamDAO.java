package com.thong.InterfaceDAO;

import java.util.List;

import com.thong.Entity.SanPham;

public interface ISanPhamDAO {
	List<SanPham> findAll(int begin, int quantity, String typeSort, String sortBy);

	List<SanPham> findByCategory(int idDanhMuc, int begin, int quantity, String typeSort, String sortBy);

	List<SanPham> search(String keyWords, int begin, int quantity, String typeSort, String sortBy);

	void delete(Integer idSanPham);

	Integer create(SanPham sp);

	SanPham findOneById(int idSanPham);

	void update(SanPham sp);
}
