package com.thong.Entity;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Embeddable;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity(name = "chitiethoadon")
public class ChiTietHoaDon implements Serializable {
	@EmbeddedId
	private ChiTietHoaDonID chiTietHoaDonID;

	private int soLuong;
	private int giaTien;

	@ManyToOne
	@JoinColumn(name="idHoaDon",insertable = false, updatable = false)
	private HoaDon hoaDon;
	
	@ManyToOne
	@JoinColumn(name="idChiTietSanPham" ,insertable = false, updatable = false)
	private ChiTietSanPham chiTietSanPham;
	
	public ChiTietHoaDonID getChiTietHoaDonID() {
		return chiTietHoaDonID;
	}

	public void setChiTietHoaDonID(ChiTietHoaDonID chiTietHoaDonID) {
		this.chiTietHoaDonID = chiTietHoaDonID;
	}

	public ChiTietHoaDon() {
		super();
	}

	public int getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}

	public int getGiaTien() {
		return giaTien;
	}

	public void setGiaTien(int giaTien) {
		this.giaTien = giaTien;
	}

}
