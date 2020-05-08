package com.thong.Service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thong.DAO.DanhMucSanPhamDAO;
import com.thong.DTO.DanhMucSanPhamDTO;
import com.thong.Entity.DanhMucSanPham;
import com.thong.InterfaceDAO.IDanhMucSanPhamDAO;
import com.thong.InterfaceService.IDanhMucSanPhamService;

@Service
public class DanhMucSanPhamService implements IDanhMucSanPhamService {
	@Autowired
	private IDanhMucSanPhamDAO danhMucSanPhamDAO;
	
	public List<DanhMucSanPhamDTO> ListDanhMucSanPham() {
		// TODO Auto-generated method stub
		List<DanhMucSanPham> list=danhMucSanPhamDAO.ListDanhMucSanPham();
		List<DanhMucSanPhamDTO> listDTO = new ArrayList<DanhMucSanPhamDTO>();
		for (DanhMucSanPham dmsp : list) {
			listDTO.add(new DanhMucSanPhamDTO(dmsp));
		}
		return listDTO;
	}

	public DanhMucSanPhamDTO findDMSPbyidDanhMuc(int idDanhMuc) {
		// TODO Auto-generated method stub
		return new DanhMucSanPhamDTO(danhMucSanPhamDAO.findDMSPbyidDanhMuc(idDanhMuc));
	}
	public DanhMucSanPhamDTO convertDTO(DanhMucSanPham dmsp) {
		return null;
	}
}
