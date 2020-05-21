package com.thong.DAO;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.thong.Entity.DanhMucSanPham;
import com.thong.InterfaceDAO.IDanhMucSanPhamDAO;

@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
@Transactional
public class DanhMucSanPhamDAO implements IDanhMucSanPhamDAO {
	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	public List<DanhMucSanPham> findAll() {
		Session session = sessionFactory.getCurrentSession();
		try {
			List<DanhMucSanPham> list = session.createQuery("from danhmucsanpham").list();
			return list;
		} catch (Exception e) {
			// TODO: handle exception
			return null;
		}
	}
	public DanhMucSanPham findOneByIdDanhMuc(int idDanhMuc) {
		Session session = sessionFactory.getCurrentSession();
		try {
			DanhMucSanPham list = (DanhMucSanPham) session.createQuery("from danhmucsanpham dm where dm.idDanhMuc=:idDanhMuc ").setParameter("idDanhMuc", idDanhMuc).getSingleResult();
			return list;
		} catch (Exception e) {
			// TODO: handle exception
			return null;
		}
	}
}
