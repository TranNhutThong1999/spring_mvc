package com.thong.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thong.Entity.MauSanPham;
import com.thong.InterfaceDAO.IMauSanPhamDAO;
import com.thong.InterfaceService.IMauSanPhamService;

@Service
public class MauSanPhamService implements IMauSanPhamService {
	@Autowired
	private IMauSanPhamDAO mauSanPhamDAO;
	public List<MauSanPham> findAll() {
		// TODO Auto-generated method stub
		return mauSanPhamDAO.findAll();
	}

}
