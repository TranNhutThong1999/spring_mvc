package com.thong.InterfaceDAO;

import java.util.List;

import com.thong.Entity.NhanVien;

public interface INhanVienDAO {
	NhanVien checkLogin(String userName, String password);

	int saveNhanVien(NhanVien nv);

	boolean checkUserName(String userName);

	List<NhanVien> searchNhanVien(String keyWords,String sortBy,String typeSort,int begin,int quantity);
	
	List<NhanVien> findAll(int begin,int quantity,String sortBy,String typeSort);
	
	void Delete (List<Integer> idUser);
	
	NhanVien findOneById(int idUser);
	
	boolean checkEmail(String email) ;
	
	NhanVien findByUserName(String userName);
	
	 void updateNhanVien(NhanVien nv);
	 
	 NhanVien findByToken(String token);
}
