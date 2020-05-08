package com.thong.InterfaceDAO;

import java.util.List;

import com.thong.Entity.DanhMucSanPham;

public interface IDanhMucSanPhamDAO {
	List<DanhMucSanPham> ListDanhMucSanPham();
	DanhMucSanPham findDMSPbyidDanhMuc(int idDanhMuc) ;
}
