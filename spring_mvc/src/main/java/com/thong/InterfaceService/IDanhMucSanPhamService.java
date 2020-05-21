package com.thong.InterfaceService;

import java.util.List;

import com.thong.DTO.DanhMucSanPhamDTO;
import com.thong.Entity.DanhMucSanPham;

public interface IDanhMucSanPhamService {
	List<DanhMucSanPhamDTO> findAll();
	DanhMucSanPhamDTO findOneByIdDanhMuc(int idDanhMuc) ;
}
