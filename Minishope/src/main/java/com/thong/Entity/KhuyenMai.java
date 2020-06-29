package com.thong.Entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;



@Entity(name="khuyenmai")
public class KhuyenMai {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int idKhuyenMai;
	private String moTa;
	private String hinhKhuyenMai;
	private String ngayBatDau;
	private String ngayKetThuc;
	private String giaGiam;
	
	@ManyToMany(cascade = CascadeType.ALL,fetch = FetchType.EAGER)
	@JoinTable(name="chitietkhuyenmai",
	 joinColumns = {@JoinColumn(name="idKhuyenMai",referencedColumnName = "idKhuyenMai")},
	 inverseJoinColumns = {@JoinColumn(name="idSanPham",referencedColumnName = "idSanPham")})
	Set<SanPham> danhSPKhuyenMai;
	
	public KhuyenMai() {
		super();
	}
	public int getIdKhuyenMai() {
		return idKhuyenMai;
	}
	public void setIdKhuyenMai(int idKhuyenMai) {
		this.idKhuyenMai = idKhuyenMai;
	}
	public String getMoTa() {
		return moTa;
	}
	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}
	public String getHinhKhuyenMai() {
		return hinhKhuyenMai;
	}
	public void setHinhKhuyenMai(String hinhKhuyenMai) {
		this.hinhKhuyenMai = hinhKhuyenMai;
	}
	public String getNgayBatDau() {
		return ngayBatDau;
	}
	public void setNgayBatDau(String ngayBatDau) {
		this.ngayBatDau = ngayBatDau;
	}
	public String getNgayKetThuc() {
		return ngayKetThuc;
	}
	public void setNgayKetThuc(String ngayKetThuc) {
		this.ngayKetThuc = ngayKetThuc;
	}
	public String getGiaGiam() {
		return giaGiam;
	}
	public void setGiaGiam(String giaGiam) {
		this.giaGiam = giaGiam;
	}
//	public Set<SanPham> getDanhSPKhuyenMai() {
//		return danhSPKhuyenMai;
//	}
//	public void setDanhSPKhuyenMai(Set<SanPham> danhSPKhuyenMai) {
//		this.danhSPKhuyenMai = danhSPKhuyenMai;
//	}
	
	
}
