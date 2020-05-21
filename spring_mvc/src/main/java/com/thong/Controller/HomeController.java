package com.thong.Controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.thong.DAO.SanPhamDAO;
import com.thong.DTO.DanhMucSanPhamDTO;
import com.thong.DTO.SanPhamDTO;
import com.thong.Entity.DanhMucSanPham;
import com.thong.Entity.SanPham;
import com.thong.InterfaceService.IDanhMucSanPhamService;
import com.thong.InterfaceService.ISanPhamService;
import com.thong.Service.DanhMucSanPhamService;
import com.thong.Service.SanPhamService;

@Controller
@RequestMapping("/")
@SessionAttributes({"gioHang","tongSoLuongGioHang","ListDanhMucSanPham"})
public class HomeController {
	@Autowired
	private ISanPhamService sanPhamService;
	
	@Autowired
	private IDanhMucSanPhamService danhMucSanPhamService;
	
	
	@GetMapping("Home")
	public String Default(ModelMap modelMap) {
		List<SanPhamDTO> listSP = sanPhamService.findAll(0,14,null,null);
		modelMap.addAttribute("danhSachSanPham", listSP);
		List<DanhMucSanPhamDTO> listDanhMuc= danhMucSanPhamService.findAll();
		modelMap.addAttribute("ListDanhMucSanPham", listDanhMuc);
		return "Home";
	}
	@GetMapping("/author")
	public String author(HttpServletRequest request, ModelMap modelMap) {
		return "redirect:/login?message=author";
	}
//	@ResponseBody
//	public String loadHome() throws IOException {
//		ApplicationContext context = new ClassPathXmlApplicationContext("IoC.xml");
//		ResourceURL r = (ResourceURL) context.getBean("resoucre");
//		Resource re = r.getResource("https://www.sitepoint.com/colors-json-example/");
//		BufferedReader reader = new BufferedReader(new InputStreamReader(( re.getInputStream())));
//		StringBuilder t = new StringBuilder();
//		String line = "";
//		while ((line = reader.readLine()) != null) {
//			t.append(line);
//		}
//		System.out.println(t.toString());
//		return t.toString();
//	}

}