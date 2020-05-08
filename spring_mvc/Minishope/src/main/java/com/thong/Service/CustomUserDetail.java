package com.thong.Service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.thong.DAO.NhanVienDAO;
import com.thong.DTO.MyUser;
import com.thong.Entity.NhanVien;

@Service
public class CustomUserDetail implements UserDetailsService{
	@Autowired
	private NhanVienDAO nhanVienDAO;
	//add context-can bas-packet
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		System.out.println("da vao "+username);	
		NhanVien nv = nhanVienDAO.findByUserName(username);
		if(nv==null) {
			throw new UsernameNotFoundException("user not found");
		}
		List<GrantedAuthority> authortity = new ArrayList<GrantedAuthority>();
		authortity.add(new SimpleGrantedAuthority(nv.getChucVu().getTenChucVu()));
		MyUser user = new MyUser(nv.getTenDangNhap(), nv.getMatKhau(), true, true, true, true, authortity);
		user.setCMND(nv.getCMND());
		user.setDiaChi(nv.getDiaChi());
		user.setEmail(nv.getEmail());
		user.setGioiTinh(nv.getGioiTinh());
		user.setHoTen(nv.getHoTen());
		user.setSoDT(nv.getSoDT());
		System.out.println(user.toString());
		return user;
	}
	
	
	
}
