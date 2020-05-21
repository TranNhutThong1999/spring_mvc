package com.thong.Admin;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.thong.DTO.NhanVienDTO;
import com.thong.Entity.ChucVu;
import com.thong.InterfaceService.IChucVuService;
import com.thong.InterfaceService.INhanVienService;
import com.thong.Service.NhanVienService;
import com.thong.Util.MessagesUtil;

@Controller
@RequestMapping("Admin-User/")
public class NhanVIenManager {
	@Autowired
	private IChucVuService chucVuService;
	@Autowired
	private INhanVienService nhanVienService;
	@Autowired
	private MessagesUtil messagesUtil;

	private final int numberShows = 7;

	@GetMapping
	public String Default(ModelMap modelMap, ServletRequest re) {
		List<NhanVienDTO> list = nhanVienService.findAll(-1, 0, null, null);
		List<NhanVienDTO> listLimit = nhanVienService.findAll(0, numberShows, null, null);
		for(NhanVienDTO nv :list) {
			System.out.println(nv.getIdNhanVien() +":"+nv.isEnabled());
		}
		List<ChucVu> cv = chucVuService.findAll();
		modelMap.addAttribute("roles", cv);
		double num = Math.ceil((double) list.size() / numberShows);
		modelMap.addAttribute("numberPagination", num);
		modelMap.addAttribute("soLuongSP", numberShows);
		modelMap.addAttribute("ListUser", listLimit);
		if (re.getParameter("message") != null) {
			Map<String, String> map = messagesUtil.Messages(re.getParameter("message"));
			System.out.println(map.get("message"));
			modelMap.addAttribute("message", map.get("message"));
			modelMap.addAttribute("alert", map.get("alert"));
		}
		return "admin/Admin_User";

	}

	@GetMapping("Search/")
	public String Search_User(ModelMap modelMap, @RequestParam String keyWords) {
		List<NhanVienDTO> list = nhanVienService.searchNhanVien(keyWords, null, null, -1, 0);
		List<NhanVienDTO> listLimit = nhanVienService.searchNhanVien(keyWords, null, null, 0, numberShows);
		List<ChucVu> cv = chucVuService.findAll();
		modelMap.addAttribute("roles", cv);
		double num = Math.ceil((double) list.size() / numberShows);
		modelMap.addAttribute("soLuongSP", numberShows);
		modelMap.addAttribute("numberPagination", num);
		modelMap.addAttribute("ListUser", listLimit);
		modelMap.addAttribute("keyWords", keyWords);
		return "admin/Admin_User";
	}
}
