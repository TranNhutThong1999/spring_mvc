package com.thong.DTO;

import java.util.Set;

import com.thong.Entity.DanhMucSanPham;

public class DanhMucSanPhamDTO {
	private int idDanhMuc;
	private String tenDanhMuc;
	private String hinhDanhMuc;

	Set<SanPhamDTO> listSanPham;

	public DanhMucSanPhamDTO(DanhMucSanPham dmsp) {
		this.idDanhMuc = dmsp.getIdDanhMuc();
		this.tenDanhMuc = dmsp.getTenDanhMuc();
		this.hinhDanhMuc = dmsp.getHinhDanhMuc();
	}

	public int getIdDanhMuc() {
		return idDanhMuc;
	}

	public void setIdDanhMuc(int idDanhMuc) {
		this.idDanhMuc = idDanhMuc;
	}

	public String getTenDanhMuc() {
		return tenDanhMuc;
	}

	public void setTenDanhMuc(String tenDanhMuc) {
		this.tenDanhMuc = tenDanhMuc;
	}

	public String getHinhDanhMuc() {
		return hinhDanhMuc;
	}

	public void setHinhDanhMuc(String hinhDanhMuc) {
		this.hinhDanhMuc = hinhDanhMuc;
	}

	@Override
	public String toString() {
		return "DanhMucSanPham [idDanhMuc=" + idDanhMuc + ", tenDanhMuc=" + tenDanhMuc + ", hinhDanhMuc=" + hinhDanhMuc;
	}

}
