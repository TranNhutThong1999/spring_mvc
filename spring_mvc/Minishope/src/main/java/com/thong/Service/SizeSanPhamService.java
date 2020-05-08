package com.thong.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thong.DTO.SanPhamDTO;
import com.thong.Entity.SizeSanPham;
import com.thong.InterfaceDAO.ISizeSanPhamDAO;
import com.thong.InterfaceService.ISanPhamService;
import com.thong.InterfaceService.ISizeSanPhamService;

@Service
public class SizeSanPhamService implements ISizeSanPhamService {
	@Autowired
	private ISizeSanPhamDAO sizeSanPhamDAO;
	public List<SizeSanPham> findAll() {
		return sizeSanPhamDAO.findAll();
	}

	

}
