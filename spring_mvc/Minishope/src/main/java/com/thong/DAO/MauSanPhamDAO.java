package com.thong.DAO;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.thong.Entity.MauSanPham;
import com.thong.InterfaceDAO.IMauSanPhamDAO;

@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class MauSanPhamDAO implements IMauSanPhamDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	@Transactional
	public List<MauSanPham> findAll(){
		Session session =sessionFactory.getCurrentSession();
		List<MauSanPham> list = session.createQuery("from mausanpham").list();
		return list;
	}
}
