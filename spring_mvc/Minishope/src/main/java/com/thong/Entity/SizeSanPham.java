package com.thong.Entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.search.annotations.Field;
import org.hibernate.search.annotations.Indexed;

@Indexed
@Entity(name="sizesanpham")
public class SizeSanPham {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int idSize;
	private String tenKichThuoc;
	public SizeSanPham() {
		super();
	}
	public int getIdSize() {
		return idSize;
	}
	public void setIdSize(int idSize) {
		this.idSize = idSize;
	}
	public String getTenKichThuoc() {
		return tenKichThuoc;
	}
	public void setTenKichThuoc(String tenKichThuoc) {
		this.tenKichThuoc = tenKichThuoc;
	}
	@Override
	public String toString() {
		return "SizeSanPham [idSize=" + idSize + ", tenKichThuoc=" + tenKichThuoc + "]";
	}
	
}
