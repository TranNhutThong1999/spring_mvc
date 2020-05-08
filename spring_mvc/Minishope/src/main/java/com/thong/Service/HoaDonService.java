package com.thong.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thong.DAO.HoaDonDAO;
import com.thong.Entity.HoaDon;
import com.thong.InterfaceDAO.IHoaDonDAO;
import com.thong.InterfaceService.IHoaDonService;

@Service
public class HoaDonService implements IHoaDonService {
@Autowired
private IHoaDonDAO hoaDonDAO;

public int ThemHoaDon(HoaDon hoaDon) {
	return hoaDonDAO.ThemHoaDon(hoaDon);
}

public List<HoaDon> searchHoaDon(int keyWords) {
	return hoaDonDAO.searchHoaDon(keyWords);
}


}
