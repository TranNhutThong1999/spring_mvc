package com.thong.Controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.thong.DTO.SanPhamDTO;
import com.thong.Entity.HinhSanPham;
import com.thong.InterfaceService.ISanPhamService;

@Controller
@RequestMapping("/ChiTiet")
@SessionAttributes({"gioHang"})
public class ChiTietSanPhamController {
	@Autowired
	private ISanPhamService sanPhamService;
	
	@GetMapping("/{idSanPham}")
	public String Default(@PathVariable int idSanPham ,ModelMap modelMap) {
		SanPhamDTO list = sanPhamService.findOneById(idSanPham);
		for(HinhSanPham sp:list.getHinhSanPham()) {
			System.out.println(sp);
		}
		modelMap.addAttribute("chitiet", idSanPham);
		modelMap.addAttribute("ChiTietSanPham", list);
		return "ChiTietSanPham";
		
	}
}
