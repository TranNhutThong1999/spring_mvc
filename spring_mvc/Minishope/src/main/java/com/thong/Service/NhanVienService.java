package com.thong.Service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.thong.DAO.NhanVienDAO;
import com.thong.DTO.NhanVienDTO;
import com.thong.Entity.ChucVu;
import com.thong.Entity.NhanVien;
import com.thong.InterfaceDAO.INhanVienDAO;
import com.thong.InterfaceService.INhanVienService;

@Service
public class NhanVienService implements INhanVienService {
	@Autowired
	private INhanVienDAO nhanVienDAO;
	@Autowired
	private BCryptPasswordEncoder bCrypt;

	public NhanVienDTO checkLogin(String userName, String password) {
		NhanVien nv =nhanVienDAO.checkLogin(userName,bCrypt.encode( password));
		if(nv== null) {
			return null;
		}
		return new NhanVienDTO(nv);
	}
	public int saveNhanVien(NhanVien nv) {
	
		if(nv.getChucVu()==null) {
			ChucVu cv = new ChucVu();
			cv.setIdChucVu(3);
			nv.setChucVu(cv);
		}
		nv.setMatKhau(bCrypt.encode(nv.getMatKhau()));
		System.out.println("mat khau "+nv.getMatKhau());
		System.out.println(nv.toString());
		return nhanVienDAO.saveNhanVien(nv);
	}
	public  boolean checkUserName(String userName) {
		return nhanVienDAO.checkUserName(userName);
		
	}
	public List<NhanVienDTO> searchNhanVien(String keyWords,String sortBy,String typeSort,int begin,int quantity){
	List<NhanVien> listNV = nhanVienDAO.searchNhanVien(keyWords,sortBy,typeSort,begin,quantity);
	
	List<NhanVienDTO> listNVDTO = new ArrayList<NhanVienDTO>();;
	for(NhanVien nv: listNV) {
		NhanVienDTO nvDTO = new NhanVienDTO(nv);
		listNVDTO.add(nvDTO);
	}
		return listNVDTO ;
	}
	public List<NhanVienDTO> findAll(int begin, int quantity, String sortBy, String typeSort) {
		List<NhanVien>  list = nhanVienDAO.findAll(begin, quantity, sortBy, typeSort);
		List<NhanVienDTO> listDTO = new ArrayList<NhanVienDTO>();
		for(NhanVien nv :list) {
			NhanVienDTO nvDTO = new NhanVienDTO(nv);
			listDTO.add(nvDTO);
		}

		return listDTO;
	}
	public void Delete(List<Integer> idUser) {
		nhanVienDAO.Delete(idUser);
		
	}
	public NhanVienDTO findOneById(int idUser) {
		NhanVien nv = nhanVienDAO.findOneById(idUser);
		NhanVienDTO nvDTO = new NhanVienDTO(nv);
		return nvDTO;
	}
	public boolean checkEmail(String email) {
		// TODO Auto-generated method stub
		return nhanVienDAO.checkEmail(email);
	}
	public NhanVien findByUserName(String userName) {
		// TODO Auto-generated method stub
		return nhanVienDAO.findByUserName(userName);
	}
	public void updateNhanVien(NhanVien nv) {
		nv.setMatKhau(bCrypt.encode(nv.getMatKhau()));
		nhanVienDAO.updateNhanVien(nv);
		
	}
	public NhanVien findByToken(String token) {
		// TODO Auto-generated method stub
		return nhanVienDAO.findByToken(token);
	}
}
