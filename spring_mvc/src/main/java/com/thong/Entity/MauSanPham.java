package com.thong.Entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.search.annotations.Field;
import org.hibernate.search.annotations.Indexed;
@Indexed
@Entity(name="mausanpham")
public class MauSanPham {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int idMauSanPham;
	@Field
	private String mauSanPham;
	public MauSanPham() {
		super();
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
