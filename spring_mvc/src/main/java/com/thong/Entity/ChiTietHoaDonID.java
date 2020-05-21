  package com.thong.Entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;

@Embeddable
public class ChiTietHoaDonID implements Serializable {
	private int idHoaDon;
	private int idChiTietSanPham;

	
	public ChiTietHoaDonID() {
	
	}
	public int getIdHoaDon() {
		return idHoaDon;
	}
	public void setIdHoaDon(int idHoaDon) {
		this.idHoaDon = idHoaDon;
	}
	public int getIdChiTietSanPham() {
		return idChiTietSanPham;
	}
	public void setIdChiTietSanPham(int idChiTietSanPham) {
		this.idChiTietSanPham = idChiTietSanPham;
	}
	@Override
	public boolean equals(Object o) {
		if ( this == o ) {
			return true;
		}
		if ( o == null || getClass() != o.getClass() ) {
			return false;
		}
		ChiTietHoaDonID chitiet = (ChiTietHoaDonID) o;
		return Objects.equals( idHoaDon, chitiet.idHoaDon ) &&
				Objects.equals( idChiTietSanPham, chitiet.idChiTietSanPham );
	}

	@Override
	public int hashCode() {
		return Objects.hash( idHoaDon, idChiTietSanPham );
	}
	
}
