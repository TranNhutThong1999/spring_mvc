package com.thong.DTO;

import com.thong.Entity.ChiTietSanPham;

public class ChiTietSanPhamDTO {
	private int idChiTietSanPham;
	private int soLuong;
	private int idMauSanPham;
	private String mauSanPham;
	private String tenKichThuoc;
	private int idSize;
	
	public ChiTietSanPhamDTO() {
		
	}
	public ChiTietSanPhamDTO(ChiTietSanPham ctsp) {
		this.idChiTietSanPham=ctsp.getIdChiTietSanPham();
		this.soLuong=ctsp.getSoLuong();
		this.idMauSanPham=ctsp.getMauSanPham().getIdMauSanPham();
		this.mauSanPham=ctsp.getMauSanPham().getMauSanPham();
		this.idSize=ctsp.getSizeSanPham().getIdSize();
		this.tenKichThuoc=ctsp.getSizeSanPham().getTenKichThuoc();
		
	}
	public String getMauSanPham() {
		return mauSanPham;
	}
	public void setMauSanPham(String mauSanPham) {
		this.mauSanPham = mauSanPham;
	}
	public String getTenKichThuoc() {
		return tenKichThuoc;
	}
	public void setTenKichThuoc(String tenKichThuoc) {
		this.tenKichThuoc = tenKichThuoc;
	}
	public int getIdChiTietSanPham() {
		return idChiTietSanPham;
	}
	public void setIdChiTietSanPham(int idChiTietSanPham) {
		this.idChiTietSanPham = idChiTietSanPham;
	}
	public int getSoLuong() {
		return soLuong;
	}
	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}
	public int getIdMauSanPham() {
		return idMauSanPham;
	}
	public void setIdMauSanPham(int idMauSanPham) {
		this.idMauSanPham = idMauSanPham;
	}
	public int getIdSize() {
		return idSize;
	}
	public void setIdSize(int idSize) {
		this.idSize = idSize;
	}
	@Override
	public String toString() {
		return "ChiTietSanPhamDTO [idChiTietSanPham=" + idChiTietSanPham + ", soLuong=" + soLuong + ", idMauSanPham="
				+ idMauSanPham + ", idSize=" + idSize + "]";
	}

	
}
