package com.thong.Entity;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.hibernate.annotations.ManyToAny;

@Entity(name="chitietsanpham")
public class ChiTietSanPham {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int idChiTietSanPham;
	
	private int soLuong;
	
	private String ngayNhap;
	
	@OneToOne
	@JoinColumn(name="idMau")
	private MauSanPham mauSanPham;
	
	@OneToOne
	@JoinColumn(name="idSize")
	private SizeSanPham sizeSanPham;
	
	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="idSanPham")
	private SanPham sanPham;

	@OneToMany(cascade = CascadeType.ALL,mappedBy = "chiTietSanPham",fetch = FetchType.LAZY)
	Set<ChiTietHoaDon> danhSachCTHD;



	@Override
	public String toString() {
		return "ChiTietSanPham [idChiTietSanPham=" + idChiTietSanPham + ", soLuong=" + soLuong + ", ngayNhap="
				+ ngayNhap + ", mauSanPham=" + mauSanPham + ", sizeSanPham=" + sizeSanPham + "]";
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

	public String getNgayNhap() {
		return ngayNhap;
	}

	public void setNgayNhap(String ngayNhap) {
		this.ngayNhap = ngayNhap;
	}

	public MauSanPham getMauSanPham() {
		return mauSanPham;
	}

	public void setMauSanPham(MauSanPham mauSanPham) {
		this.mauSanPham = mauSanPham;
	}

	public SizeSanPham getSizeSanPham() {
		return sizeSanPham;
	}

	public void setSizeSanPham(SizeSanPham sizeSanPham) {
		this.sizeSanPham = sizeSanPham;
	}

//	public SanPham getSanPham() {
//		return sanPham;
//	}
//
//	public void setSanPham(SanPham sanPham) {
//		this.sanPham = sanPham;
//	}



}
