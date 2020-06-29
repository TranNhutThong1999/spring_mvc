package com.thong.DAO;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.thong.Entity.ChiTietHoaDon;
import com.thong.Entity.ChiTietHoaDonID;
import com.thong.InterfaceDAO.IChiTietHoaDonDAO;

@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class ChiTietHoaDonDAO implements IChiTietHoaDonDAO {
	@Autowired
	private SessionFactory sessionFactory;

	@Transactional
	public boolean themChiTietHoaDon(ChiTietHoaDon chiTietHoaDon) {
		Session session = sessionFactory.getCurrentSession();
		ChiTietHoaDonID id= (ChiTietHoaDonID) session.save(chiTietHoaDon);
		if (id != null)return true;
			
		return false;
	}

}
