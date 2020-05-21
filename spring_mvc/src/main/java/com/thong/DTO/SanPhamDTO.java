package com.thong.DTO;

import java.util.List;
import java.util.Set;

import com.thong.Entity.ChiTietSanPham;
import com.thong.Entity.HinhSanPham;
import com.thong.Entity.SanPham;

public class SanPhamDTO {
	private int idSanPham;
	private String tenSanPham;
	private int giaTien;
	private String moTa;
	private List<HinhSanPham> hinhSanPham;
	private String danhCho;
	private int idDanhMuc;
	private String tenDanhMuc;
	private Set<ChiTietSanPhamDTO> danhSachCTSPham;
	private int tongSoLuong;
	public SanPhamDTO() {
		
	}
	public SanPhamDTO(SanPham sp) {
		super();
		this.idSanPham = sp.getIdSanPham();
		this.tenSanPham = sp.getTenSanPham();
		this.giaTien = sp.getGiaTien();
		this.moTa = sp.getMoTa();
		this.hinhSanPham = sp.getHinhSanPham();
		this.danhCho = sp.getDanhCho();
		this.idDanhMuc=sp.getDanhMucSanPham().getIdDanhMuc();
		this.tenDanhMuc=sp.getDanhMucSanPham().getTenDanhMuc();
		
	}
	
	public int getTongSoLuong() {
		return tongSoLuong;
	}
	public void setTongSoLuong(int tongSoLuong) {
		this.tongSoLuong = tongSoLuong;
	}
	public int getIdSanPham() {
		return idSanPham;
	}
	public void setIdSanPham(int idSanPham) {
		this.idSanPham = idSanPham;
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
	public String getMoTa() {
		return moTa;
	}
	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}

	public List<HinhSanPham> getHinhSanPham() {
		return hinhSanPham;
	}
	public void setHinhSanPham(List<HinhSanPham> hinhSanPham) {
		this.hinhSanPham = hinhSanPham;
	}
	public String getDanhCho() {
		return danhCho;
	}
	public void setDanhCho(String danhCho) {
		this.danhCho = danhCho;
	}
	public Set<ChiTietSanPhamDTO> getDanhSachCTSPham() {
		return danhSachCTSPham;
	}
	public void setDanhSachCTSPham(Set<ChiTietSanPhamDTO> danhSachCTSPham) {
		this.danhSachCTSPham = danhSachCTSPham;
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
	@Override
	public String toString() {
		return "SanPhamDTO [idSanPham=" + idSanPham + ", tenSanPham=" + tenSanPham + ", giaTien=" + giaTien + ", moTa="
				+ moTa + ", hinhSanPham=" + hinhSanPham + ", danhCho=" + danhCho + ", idDanhMuc=" + idDanhMuc
				+ ", tenDanhMuc=" + tenDanhMuc + ", danhSachCTSPham=" + danhSachCTSPham + "]";
	}

	
}
