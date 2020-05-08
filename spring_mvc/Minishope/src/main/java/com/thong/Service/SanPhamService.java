package com.thong.Service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thong.DTO.ChiTietSanPhamDTO;
import com.thong.DTO.DanhMucSanPhamDTO;
import com.thong.DTO.SanPhamDTO;
import com.thong.Entity.ChiTietSanPham;
import com.thong.Entity.DanhMucSanPham;
import com.thong.Entity.MauSanPham;
import com.thong.Entity.SanPham;
import com.thong.Entity.SizeSanPham;
import com.thong.InterfaceDAO.ISanPhamDAO;
import com.thong.InterfaceService.ISanPhamService;

@Service
public class SanPhamService implements ISanPhamService {
	@Autowired
	private ISanPhamDAO sanPhamDAO;

	public List<SanPhamDTO> findAll(int begin, int quantity, String typeSort, String sortBy) {
		List<SanPham> list = null;
		list = sanPhamDAO.findAll(begin, quantity, typeSort, sortBy);
		System.out.println(list.size());
		List<SanPhamDTO> listDTO = new ArrayList<SanPhamDTO>();
		for (SanPham sp : list) {
			listDTO.add(convertDTO(sp));
		}
		return listDTO;
	}


	public List<SanPhamDTO> findByCategory(int idDanhMuc, int begin, int quantity, String typeSort, String sortBy) {
		// TODO Auto-generated method stub
		List<SanPham> list = sanPhamDAO.findByCategory(idDanhMuc, begin, quantity, typeSort, sortBy);
		List<SanPhamDTO> listDTO = new ArrayList<SanPhamDTO>();
		for (SanPham sp : list) {
			listDTO.add(convertDTO(sp));
		}
		return listDTO;
	}

	public List<SanPhamDTO> search(String keyWords, int begin, int quantity, String typeSort, String sortBy) {
		// TODO Auto-generated method stub
		List<SanPham> list = sanPhamDAO.search(keyWords, begin, quantity, typeSort, sortBy);
		List<SanPhamDTO> listDTO = new ArrayList<SanPhamDTO>();
		for (SanPham sp : list) {
			listDTO.add(convertDTO(sp));
		}
		return listDTO;
	}

	public void delete(List<Integer> idSanPham) {
		for (Integer i : idSanPham) {
			sanPhamDAO.delete(i);
		}
	}

	public void create(SanPhamDTO sp) {
		SanPham s= convertEntity(sp);
		System.out.println("DTO "+s);
		Integer i=sanPhamDAO.create(s);
	}

	public SanPhamDTO findOneById(int idSanPham) {
		SanPham sp = sanPhamDAO.findOneById(idSanPham);
		SanPhamDTO spDTO = convertDTO(sp);
		System.out.println(spDTO.toString());
		return spDTO;
	}

	public void update(SanPhamDTO spDTO) {
		SanPham sp = convertEntity(spDTO);
		sanPhamDAO.update(sp);
	}

//convert to sp
	private SanPham convertEntity(SanPhamDTO spDTO) {
		SanPham sp = new SanPham();
		sp.setIdSanPham(spDTO.getIdSanPham());
		sp.setDanhCho(spDTO.getDanhCho());
		sp.setGiaTien(spDTO.getGiaTien());
		sp.setHinhSanPham(spDTO.getHinhSanPham());
		sp.setMoTa(spDTO.getMoTa());
		sp.setTenSanPham(spDTO.getTenSanPham());
		DanhMucSanPham dmsp =new DanhMucSanPham();
		dmsp.setIdDanhMuc(spDTO.getIdDanhMuc());
		sp.setDanhMucSanPham(dmsp);
		Set<ChiTietSanPhamDTO> setDTO = spDTO.getDanhSachCTSPham();
		Set<ChiTietSanPham> set = new HashSet<ChiTietSanPham>();
		
		DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy  "); //HH:mm:ss
		for (ChiTietSanPhamDTO item : setDTO) {
			System.out.println(item.toString());
			ChiTietSanPham ctsp = new ChiTietSanPham();
			ctsp.setSoLuong(item.getSoLuong());
			ctsp.setIdChiTietSanPham(item.getIdChiTietSanPham());
			
			Calendar cal = Calendar.getInstance();
			ctsp.setNgayNhap(dateFormat.format(cal.getTime()));
			
			MauSanPham msp = new MauSanPham();
			msp.setIdMauSanPham(item.getIdMauSanPham());
			ctsp.setMauSanPham(msp);
			
			SizeSanPham size = new SizeSanPham();
			size.setIdSize(item.getIdSize());
			ctsp.setSizeSanPham(size);
			set.add(ctsp);
		}
		sp.setDanhSachCTSPham(set);
		return sp;
	}
//convert to DTO
	private SanPhamDTO convertDTO(SanPham sp) {
		SanPhamDTO spDTO = new SanPhamDTO(sp);
		Set<ChiTietSanPham> set = sp.getDanhSachCTSPham();
		Set<ChiTietSanPhamDTO> setDTO = new HashSet<ChiTietSanPhamDTO>();
		for (ChiTietSanPham ctsp : set) {
			setDTO.add(new ChiTietSanPhamDTO(ctsp));
		}
		spDTO.setDanhSachCTSPham(setDTO);
		return spDTO;
	}
}
