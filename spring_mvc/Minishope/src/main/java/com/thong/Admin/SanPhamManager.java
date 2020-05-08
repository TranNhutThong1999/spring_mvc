package com.thong.Admin;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.thong.DTO.DanhMucSanPhamDTO;
import com.thong.DTO.SanPhamDTO;
import com.thong.InterfaceDAO.IDanhMucSanPhamDAO;
import com.thong.InterfaceService.IDanhMucSanPhamService;
import com.thong.InterfaceService.IMauSanPhamService;
import com.thong.InterfaceService.ISanPhamService;
import com.thong.InterfaceService.ISizeSanPhamService;
import com.thong.Service.MauSanPhamService;
import com.thong.Service.SanPhamService;

import Util.MessagesUtil;

@Controller
@RequestMapping("Admin-SanPham/")
@SessionAttributes({"ListDanhMucSanPham"})
public class SanPhamManager {
	@Autowired
	private ISanPhamService sanPhamService;
	@Autowired
	private IMauSanPhamService mauSanPhamService;
	@Autowired
	private ISizeSanPhamService sizeSanPhamService;
	@Autowired
	private IDanhMucSanPhamService danhMucSanPhamService;
	@Autowired
	private MessagesUtil messagesUtil;
	
	private final int numberShows = 5;

	@GetMapping
	public String Default(ModelMap modelMap, ServletRequest re) {
		List<SanPhamDTO> listAll = sanPhamService.listSanPhamLimit(-1, 0, null,null);
		List<SanPhamDTO> list = sanPhamService.listSanPhamLimit(0, numberShows, null,null);
		int du = listAll.size() % numberShows;
		int in = listAll.size() / numberShows;
		if (du > 0) {
			in = in + 1;
		}
		
		if(re.getParameter("message")!= null) {
			Map<String,String> map = messagesUtil.Messages(re.getParameter("message"));
			System.out.println( map.get("message"));
			modelMap.addAttribute("message", map.get("message"));
			modelMap.addAttribute("alert", map.get("alert"));
		}
		modelMap.addAttribute("ListDanhMucSanPham", danhMucSanPhamService.ListDanhMucSanPham());
		modelMap.addAttribute("sizeSanPham", sizeSanPhamService.findAll());
		modelMap.addAttribute("mauSanPham", mauSanPhamService.findAll());
		modelMap.addAttribute("numberPagination", in);
		modelMap.addAttribute("listSanPham", list);
		modelMap.addAttribute("soLuongSP", numberShows);
		return "admin/index";
	}

	@GetMapping("DanhMuc/{idDanhMuc}")
	public String SanPhamByDanhMuc(@PathVariable int idDanhMuc, ModelMap modelMap) {
		List<SanPhamDTO> listAllSP = sanPhamService.FindByCategory(idDanhMuc, -1, 0, null,null);
		List<SanPhamDTO> list = sanPhamService.FindByCategory(idDanhMuc, 0, numberShows, null,null);
		int du = listAllSP.size() % numberShows;
		int in = listAllSP.size() / numberShows;
		if (du > 0) {
			in = in + 1;
		}
		modelMap.addAttribute("sizeSanPham", sizeSanPhamService.findAll());
		modelMap.addAttribute("mauSanPham", mauSanPhamService.findAll());
		modelMap.addAttribute("numberPagination", in);
		modelMap.addAttribute("listSanPham", list);
		modelMap.addAttribute("soLuongSP", numberShows);
	
		System.out.println(listAllSP.size()+" size");
		return "admin/index";
	}
	@GetMapping("Search")
	public String SearchSanPham(@RequestParam String keyWords, ModelMap modelMap) {
		List<SanPhamDTO> listAllSP = sanPhamService.searchByFTS(keyWords,-1,0,null,null);
		List<SanPhamDTO> list = sanPhamService.searchByFTS(keyWords,0,numberShows,null,null);
		int du = listAllSP.size() % numberShows;
		int in = listAllSP.size() / numberShows;
		if (du > 0) {
			in = in + 1;
		}
		modelMap.addAttribute("sizeSanPham", sizeSanPhamService.findAll());
		modelMap.addAttribute("mauSanPham", mauSanPhamService.findAll());
		modelMap.addAttribute("keyWords", keyWords);
		modelMap.addAttribute("numberPagination", in);
		modelMap.addAttribute("listSanPham", list);
		modelMap.addAttribute("soLuongSP", numberShows);

		if(list==null || list.size()==0) {
			modelMap.addAttribute("messenger_Search_Error", "không tìm thấy sản phẩm");
		}
		return "admin/index";
	}
}
