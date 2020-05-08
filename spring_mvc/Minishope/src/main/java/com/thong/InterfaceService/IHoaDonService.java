package com.thong.InterfaceService;

import java.util.List;

import org.springframework.stereotype.Service;

import com.thong.Entity.HoaDon;

public interface IHoaDonService {
	int ThemHoaDon(HoaDon hoaDon);
	List<HoaDon> searchHoaDon(int keyWords);
}
