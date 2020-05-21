package com.thong.Controller;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.thong.Entity.ChiTietHoaDon;
import com.thong.Entity.ChiTietHoaDonID;
import com.thong.Entity.GioHang;
import com.thong.Entity.HoaDon;
import com.thong.InterfaceService.IChiTietHoaDonService;
import com.thong.InterfaceService.IHoaDonService;
import com.thong.Service.ChiTietHoaDonService;
import com.thong.Service.HoaDonService;

@Controller
@RequestMapping("HoaDon/")
@SessionAttributes({"gioHang","tongSoLuongGioHang"})
public class HoaDonController {
	@Autowired
	private IHoaDonService hoaDonService;
	
	@Autowired
	private IChiTietHoaDonService chiTietHoaDonService;
	
	@PostMapping("ThemHoaDon/")
	public String ThemHoaDon(ModelMap modelMap,@RequestParam String tenKhachHang,@RequestParam String soDT,@RequestParam String hinhThucGiaoHang,@RequestParam String diaChiGiaoHang,@RequestParam String ghiChu,HttpSession session  ) {
		HoaDon hoaDon= new HoaDon();
		hoaDon.setSoDT(soDT);
		hoaDon.setTenKhachHang(tenKhachHang);
		hoaDon.setDiaChiGiaoHang(diaChiGiaoHang);
		hoaDon.setGhiChu(ghiChu);
		hoaDon.setHinhThucGiaoHang(hinhThucGiaoHang);
		System.out.println(hinhThucGiaoHang);
		hoaDon.setTinhTrang("đang chờ duyệt");
		
		
		int id=hoaDonService.themHoaDon(hoaDon);
		
		List<GioHang> list = (List<GioHang>) session.getAttribute("gioHang");
		for (GioHang gh : list) {
			ChiTietHoaDonID chiTietHoaDonID = new ChiTietHoaDonID();
			chiTietHoaDonID.setIdChiTietSanPham(gh.getIdChiTietSanPham());
			chiTietHoaDonID.setIdHoaDon(hoaDon.getIdHoaDon());
			
			ChiTietHoaDon chiTietHoaDon = new ChiTietHoaDon();
			chiTietHoaDon.setChiTietHoaDonID(chiTietHoaDonID);
			chiTietHoaDon.setGiaTien(gh.getGiaTien());
			chiTietHoaDon.setSoLuong(gh.getSoLuong());
			
			chiTietHoaDonService.themChiTietHoaDon(chiTietHoaDon);
		}
		modelMap.addAttribute("tongSoLuongGioHang", 0);
		modelMap.addAttribute("gioHang", null);
		return "redirect:/Home/";
	}
}
