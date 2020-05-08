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
	private final int numberShows = 4;
	private final int numberShowsCategory = 4;

	@GetMapping
	public String Default(ModelMap modelMap) {
		List<SanPhamDTO> listAll = sanPhamService.listSanPhamLimit(-1, numberShows, null,null);
		List<SanPhamDTO> list = sanPhamService.listSanPhamLimit(0, numberShows, null,null);
		System.out.println(listAll.size()+" control");
		int du = listAll.size() % numberShows;
		int in = listAll.size() / numberShows;
		if (du > 0) {
			in = in + 1;
		}
		modelMap.addAttribute("numberPagination", in);
		modelMap.addAttribute("listSanPham", list);
		return "SanPham";
	}



	@GetMapping("DanhMuc/{idDanhMuc}")
	public String SanPhamByDanhMuc(@PathVariable int idDanhMuc, ModelMap modelMap) {
		List<SanPhamDTO> listAllSP = sanPhamService.FindByCategory(idDanhMuc, -1, 0, null,null);
		List<SanPhamDTO> list = sanPhamService.FindByCategory(idDanhMuc, 0, numberShowsCategory, null,"giaTien");
		int du = listAllSP.size() % numberShowsCategory;
		int in = listAllSP.size() / numberShowsCategory;
		if (du > 0) {
			in = in + 1;
		}
		modelMap.addAttribute("typeSort", "null");
		modelMap.addAttribute("numberPagination", in);
		modelMap.addAttribute("listSanPham", list);
		modelMap.addAttribute("soLuongSP", numberShowsCategory);
		DanhMucSanPhamDTO dm = danhMucSanPhamService.findDMSPbyidDanhMuc(idDanhMuc);
		modelMap.addAttribute("danhMuc", dm);
		return "SanPham";
	}

	
}
