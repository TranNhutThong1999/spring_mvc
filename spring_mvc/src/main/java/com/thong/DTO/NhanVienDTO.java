package com.thong.DTO;


import com.thong.Entity.ChucVu;
import com.thong.Entity.NhanVien;

public class NhanVienDTO {
	private int idNhanVien;
	private String hoTen;
	private String diaChi;
	private String gioiTinh;
	private String email;
	private String CMND;
	private String soDT;
	private String tenDangNhap;
	private ChucVu chucVu;
	private boolean isEnabled;
	
	public NhanVienDTO() {
		
	}
public NhanVienDTO(NhanVien nv) {
		this.idNhanVien= nv.getIdNhanVien();
		this.hoTen=nv.getHoTen();
		this.diaChi= nv .getDiaChi();
		this.gioiTinh= nv.getGioiTinh();
		this.email=nv.getEmail();
		this.CMND=nv.getCMND();
		this.soDT= nv.getSoDT();
		this.tenDangNhap =nv.getTenDangNhap();
		this.chucVu=nv.getChucVu();
		this.isEnabled= nv.isEnabled();
	}
	
	public int getIdNhanVien() {
		return idNhanVien;
	}
	public void setIdNhanVien(int idNhanVien) {
		this.idNhanVien = idNhanVien;
	}
	public String getHoTen() {
		return hoTen;
	}
	public void setHoTen(String hoTen) {
		this.hoTen = hoTen;
	}
	public String getDiaChi() {
		return diaChi;
	}
	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}
	public String getGioiTinh() {
		return gioiTinh;
	}
	public void setGioiTinh(String gioiTinh) {
		this.gioiTinh = gioiTinh;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCMND() {
		return CMND;
	}
	public void setCMND(String cMND) {
		CMND = cMND;
	}
	public String getSoDT() {
		return soDT;
	}
	public void setSoDT(String soDT) {
		this.soDT = soDT;
	}
	public String getTenDangNhap() {
		return tenDangNhap;
	}
	public void setTenDangNhap(String tenDangNhap) {
		this.tenDangNhap = tenDangNhap;
	}
	public ChucVu getChucVu() {
		return chucVu;
	}
	public void setChucVu(ChucVu chucVu) {
		this.chucVu = chucVu;
	}
	@Override
	public String toString() {
		return "NhanVienDTO [idNhanVien=" + idNhanVien + ", hoTen=" + hoTen + ", diaChi=" + diaChi + ", gioiTinh="
				+ gioiTinh + ", email=" + email + ", CMND=" + CMND + ", soDT=" + soDT + ", tenDangNhap=" + tenDangNhap
				+ ", chucVu=" + chucVu + "]";
	}
	public boolean isEnabled() {
		return isEnabled;
	}
	public void setEnabled(boolean isEnabled) {
		this.isEnabled = isEnabled;
	}
	
	
}
