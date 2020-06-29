package com.thong.DTO;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.search.annotations.Field;
import org.hibernate.search.annotations.Indexed;

import com.thong.Entity.MauSanPham;
public class MauSanPhamDTO {
	private int idMauSanPham;
	private String mauSanPham;
	public MauSanPhamDTO(MauSanPham m) {
		this.idMauSanPham=m.getIdMauSanPham();
		this.mauSanPham=m.getMauSanPham();
	}
	public int getIdMauSanPham() {
		return idMauSanPham;
	}
	public void setIdMauSanPham(int idMauSanPham) {
		this.idMauSanPham = idMauSanPham;
	}
	public String getMauSanPham() {
		return mauSanPham;
	}
	public void setMauSanPham(String mauSanPham) {
		this.mauSanPham = mauSanPham;
	}
	@Override
	public String toString() {
		return "MauSanPham [idMauSanPham=" + idMauSanPham + ", mauSanPham=" + mauSanPham + "]";
	}
	
}
