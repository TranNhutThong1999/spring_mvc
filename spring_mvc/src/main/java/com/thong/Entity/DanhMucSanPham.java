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
import javax.persistence.OneToMany;

import org.hibernate.search.annotations.Field;

@Entity(name="danhmucsanpham")
public class DanhMucSanPham {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int idDanhMuc;
	private String tenDanhMuc;
	private String hinhDanhMuc;
	
	
	@OneToMany(mappedBy = "danhMucSanPham",fetch = FetchType.LAZY)
	Set<SanPham> listSanPham= new HashSet<SanPham>();
	
	public DanhMucSanPham() {
		super();
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
		return "DanhMucSanPham [idDanhMuc=" + idDanhMuc + ", tenDanhMuc=" + tenDanhMuc + ", hinhDanhMuc=" + hinhDanhMuc
				;
	}
	
}
