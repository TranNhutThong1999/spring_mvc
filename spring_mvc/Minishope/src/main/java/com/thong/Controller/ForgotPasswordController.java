package com.thong.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.thong.Entity.NhanVien;
import com.thong.InterfaceService.INhanVienService;

@Controller
@RequestMapping("Forgot_Password")
public class ForgotPasswordController {
	@Autowired
	private INhanVienService nhanVienService;

	
}
