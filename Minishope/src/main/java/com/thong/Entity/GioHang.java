package com.thong.Entity;

public class GioHang {
	private int idSanPham;
	private int soLuong;
	private String tenSanPham;
	private int giaTien;
	private int idMauSanPham;
	private int idSizeSanPham;
	private String tenMauSanPham;
	private String tenSizeSanPham;
	private String hinhSanPham;
	private int idChiTietSanPham;
	
	
	public int getIdChiTietSanPham() {
		return idChiTietSanPham;
	}
	public void setIdChiTietSanPham(int idChiTietSanPham) {
		this.idChiTietSanPham = idChiTietSanPham;
	}
	public String getHinhSanPham() {
		return hinhSanPham;
	}
	public void setHinhSanPham(String hinhSanPham) {
		this.hinhSanPham = hinhSanPham;
	}
	public GioHang() {
		super();
	}
	
	public int getIdSanPham() {
		return idSanPham;
	}
	public void setIdSanPham(int idSanPham) {
		this.idSanPham = idSanPham;
	}
	public int getSoLuong() {
		return soLuong;
	}
	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}
	public String getTenSanPham() {
		return tenSanPham;
	}
	public void setTenSanPham(String tenSanPham) {
		this.tenSanPham = tenSanPham;
	}
	public int getGiaTien() {
		return giaTien;
	}
	public void setGiaTien(int giaTien) {
		this.giaTien = giaTien;
	}
	public int getIdMauSanPham() {
		return idMauSanPham;
	}
	public void setIdMauSanPham(int idMauSanPham) {
		this.idMauSanPham = idMauSanPham;
	}
	public int getIdSizeSanPham() {
		return idSizeSanPham;
	}
	public void setIdSizeSanPham(int idSizeSanPham) {
		this.idSizeSanPham = idSizeSanPham;
	}
	public String getTenMauSanPham() {
		return tenMauSanPham;
	}
	public void setTenMauSanPham(String tenMauSanPham) {
		this.tenMauSanPham = tenMauSanPham;
	}
	public String getTenSizeSanPham() {
		return tenSizeSanPham;
	}
	public void setTenSizeSanPham(String tenSizeSanPham) {
		this.tenSizeSanPham = tenSizeSanPham;
	}
	@Override
	public String toString() {
		return "GioHang [idSanPham=" + idSanPham + ", soLuong=" + soLuong + ", tenSanPham=" + tenSanPham + ", giaTien="
				+ giaTien + ", idMauSanPham=" + idMauSanPham + ", idSizeSanPham=" + idSizeSanPham + ", tenMauSanPham="
				+ tenMauSanPham + ", tenSizeSanPham=" + tenSizeSanPham + ", hinhSanPham=" + hinhSanPham
				+ ", idChiTietSanPham=" + idChiTietSanPham + "]";
	}


}

