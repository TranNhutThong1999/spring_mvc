package com.thong.Entity;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.hibernate.search.annotations.Field;
import org.hibernate.search.annotations.Indexed;
import org.springframework.format.annotation.NumberFormat;
import org.springframework.format.annotation.NumberFormat.Style;

@Indexed
@Entity(name="sanpham")
public class SanPham {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int idSanPham;
	
	@Field
	private String tenSanPham;
	@NumberFormat(style = Style.CURRENCY)
	private int giaTien;
	
	private String moTa;
	
	private String hinhSanPham;
	
	@Field
	private String danhCho;
	

	
	@OneToMany(cascade = CascadeType.ALL,fetch = FetchType.EAGER)
	@JoinColumn(name="idSanPham")
	private Set<ChiTietSanPham> danhSachCTSPham;
	

	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="idDanhMuc")
	private DanhMucSanPham danhMucSanPham;
	
	@ManyToMany(cascade = CascadeType.ALL,fetch = FetchType.EAGER)
	@JoinTable(name="chitietkhuyenmai",
	 joinColumns = {@JoinColumn(name="idSanPham",referencedColumnName = "idSanPham")},
	 inverseJoinColumns = {@JoinColumn(name="idKhuyenMai",referencedColumnName = "idKhuyenMai")})
	Set<KhuyenMai> danhSachKhuyenMai;


	public SanPham() {
		super();
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

	public String getHinhSanPham() {
		return hinhSanPham;
	}

	public void setHinhSanPham(String hinhSanPham) {
		this.hinhSanPham = hinhSanPham;
	}

	public String getDanhCho() {
		return danhCho;
	}

	public void setDanhCho(String danhCho) {
		this.danhCho = danhCho;
	}


	public DanhMucSanPham getDanhMucSanPham() {
		return danhMucSanPham;
	}

	public void setDanhMucSanPham(DanhMucSanPham danhMucSanPham) {
		this.danhMucSanPham = danhMucSanPham;
	}



	

	public Set<ChiTietSanPham> getDanhSachCTSPham() {
		return danhSachCTSPham;
	}

	public void setDanhSachCTSPham(Set<ChiTietSanPham> danhSachCTSPham) {
		this.danhSachCTSPham = danhSachCTSPham;
	}

	public Set<KhuyenMai> getDanhSachKhuyenMai() {
		return danhSachKhuyenMai;
	}

	public void setDanhSachKhuyenMai(Set<KhuyenMai> danhSachKhuyenMai) {
		this.danhSachKhuyenMai = danhSachKhuyenMai;
	}

	@Override
	public String toString() {
		return "SanPham [idSanPham=" + idSanPham + ", tenSanPham=" + tenSanPham + ", giaTien=" + giaTien + ", moTa="
				+ moTa + ", hinhSanPham=" + hinhSanPham + ", danhCho=" + danhCho + ", danhSachCTSPham="
				+ danhSachCTSPham + ", danhMucSanPham=" + danhMucSanPham + ", danhSachKhuyenMai=" + danhSachKhuyenMai
				+ "]";
	}





	
	
}
