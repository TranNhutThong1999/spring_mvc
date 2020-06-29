package com.thong.DAO;

import java.util.List;

import org.apache.lucene.search.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.search.FullTextSession;
import org.hibernate.search.Search;
import org.hibernate.search.query.dsl.QueryBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.thong.Entity.HoaDon;
import com.thong.InterfaceDAO.IHoaDonDAO;

@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class HoaDonDAO  implements IHoaDonDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	@Transactional
	public int themHoaDon(HoaDon hoaDon) {
		Session session = sessionFactory.getCurrentSession();
		int id=(Integer) session.save(hoaDon);
		return id;
	}
	
}
