package com.thong.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thong.DAO.ChiTietHoaDonDAO;
import com.thong.Entity.ChiTietHoaDon;
import com.thong.InterfaceDAO.IChiTietHoaDonDAO;
import com.thong.InterfaceService.IChiTietHoaDonService;

@Service
public class ChiTietHoaDonService implements IChiTietHoaDonService {
@Autowired
private IChiTietHoaDonDAO chiTietHoaDonDAO;

public boolean themChiTietHoaDon(ChiTietHoaDon chiTietHoaDon) {
	// TODO Auto-generated method stub
	return chiTietHoaDonDAO.themChiTietHoaDon(chiTietHoaDon);
}


}
