package com.thong.DAO;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.thong.Entity.SizeSanPham;
import com.thong.InterfaceDAO.ISizeSanPhamDAO;

@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class SizeSanPhamDAO implements ISizeSanPhamDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	@Transactional
	public List<SizeSanPham> findAll(){
		Session session = sessionFactory.getCurrentSession();
		List<SizeSanPham> list = session.createQuery("from sizesanpham").list();
		return list;
	}
}
