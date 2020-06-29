package com.thong.DTO;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.search.annotations.Field;
import org.hibernate.search.annotations.Indexed;

import com.thong.Entity.SizeSanPham;

public class SizeSanPhamDTO {
	private int idSize;
	private String tenKichThuoc;
	public SizeSanPhamDTO( SizeSanPham s) {
		this.idSize=s.getIdSize();
		this.tenKichThuoc=s.getTenKichThuoc();
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
