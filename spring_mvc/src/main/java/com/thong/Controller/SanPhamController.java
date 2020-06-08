package com.thong.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thong.DTO.DanhMucSanPhamDTO;
import com.thong.DTO.SanPhamDTO;
import com.thong.Entity.DanhMucSanPham;
import com.thong.Entity.SanPham;
import com.thong.InterfaceService.IDanhMucSanPhamService;
import com.thong.InterfaceService.ISanPhamService;
import com.thong.Service.DanhMucSanPhamService;
import com.thong.Service.SanPhamService;

@Controller
@RequestMapping("SanPham/")
public class SanPhamController {
	@Autowired
	private ISanPhamService sanPhamService;
	@Autowired
	private IDanhMucSanPhamService danhMucSanPhamService;
	
	private final int numberShows = 18;

	@GetMapping
	public String Default(ModelMap modelMap) {
		List<SanPhamDTO> listAll = sanPhamService.findAll(-1, numberShows, null,null);
		List<SanPhamDTO> list = sanPhamService.findAll(0, numberShows, null,null);
		int du = listAll.size() % numberShows;
		int in = listAll.size() / numberShows;
		if (du > 0) {
			in = in + 1;
		}
		modelMap.addAttribute("sanpham", "Sản phẩm");
		modelMap.addAttribute("numberPagination", in);
		modelMap.addAttribute("danhSachSanPham", list);
		modelMap.addAttribute("soLuongSP", numberShows);
		return "SanPham";
	}



	@GetMapping("DanhMuc/{idDanhMuc}")
	public String sanPhamByDanhMuc(@PathVariable int idDanhMuc, ModelMap modelMap) {
		List<SanPhamDTO> listAllSP = sanPhamService.findByCategory(idDanhMuc, -1, 0, null,null);
		List<SanPhamDTO> list = sanPhamService.findByCategory(idDanhMuc, 0, numberShows, null,"giaTien");
		int du = listAllSP.size() % numberShows;
		int in = listAllSP.size() / numberShows;
		if (du > 0) {
			in = in + 1;
		}
		DanhMucSanPhamDTO dmsp = danhMucSanPhamService.findOneByIdDanhMuc(idDanhMuc);
		modelMap.addAttribute("danhmuc", dmsp.getTenDanhMuc());
		modelMap.addAttribute("typeSort", "null");
		modelMap.addAttribute("numberPagination", in);
		modelMap.addAttribute("danhSachSanPham", list);
		modelMap.addAttribute("soLuongSP", numberShows);
		DanhMucSanPhamDTO dm = danhMucSanPhamService.findOneByIdDanhMuc(idDanhMuc);
		modelMap.addAttribute("danhMuc", dm);
		return "SanPham";
	}

	
}
