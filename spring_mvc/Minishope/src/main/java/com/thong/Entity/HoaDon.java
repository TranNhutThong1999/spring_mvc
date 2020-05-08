package com.thong.Entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.OneToMany;

import org.hibernate.search.annotations.Field;
import org.hibernate.search.annotations.Indexed;
@Indexed
@Entity(name="hoadon")
public class HoaDon {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int idHoaDon;
	@Field
	private String ngayLap;
	@Field
	private String tenKhachHang;
	@Field
	private String soDT;
	private String diaChiGiaoHang;
	private String tinhTrang;
	private String hinhThucGiaoHang;
	private String ghiChu;

	@OneToMany(cascade = CascadeType.ALL,mappedBy = "hoaDon")
	Set<ChiTietHoaDon> danhSachCTHD;
	
	public Set<ChiTietHoaDon> getDanhSachCTHD() {
		return danhSachCTHD;
	}

	public void setDanhSachCTHD(Set<ChiTietHoaDon> danhSachCTHD) {
		this.danhSachCTHD = danhSachCTHD;
	}

	public String getTinhTrang() {
		return tinhTrang;
	}

	public void setTinhTrang(String tinhTrang) {
		this.tinhTrang = tinhTrang;
	}

	public int getIdHoaDon() {
		return idHoaDon;
	}
	public void setIdHoaDon(int idHoaDon) {
		this.idHoaDon = idHoaDon;
	}
	public String getNgayLap() {
		return ngayLap;
	}
	public void setNgayLap(String ngayLap) {
		this.ngayLap = ngayLap;
	}
	public String getTenKhachHang() {
		return tenKhachHang;
	}
	public void setTenKhachHang(String tenKhachHang) {
		this.tenKhachHang = tenKhachHang;
	}
	public String getSoDT() {
		return soDT;
	}
	public void setSoDT(String soDT) {
		this.soDT = soDT;
	}
	public String getDiaChiGiaoHang() {
		return diaChiGiaoHang;
	}
	public void setDiaChiGiaoHang(String diaChiGiaoHang) {
		this.diaChiGiaoHang = diaChiGiaoHang;
	}

	public String getHinhThucGiaoHang() {
		return hinhThucGiaoHang;
	}

	public void setHinhThucGiaoHang(String hinhThucGiaoHang) {
		this.hinhThucGiaoHang = hinhThucGiaoHang;
	}

	public String getGhiChu() {
		return ghiChu;
	}

	public void setGhiChu(String ghiChu) {
		this.ghiChu = ghiChu;
	}

	
}
