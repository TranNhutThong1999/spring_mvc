package com.thong.DAO;

import java.util.List;

import org.apache.lucene.search.Sort;
import org.apache.lucene.search.SortField;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.hibernate.search.FullTextSession;
import org.hibernate.search.Search;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.thong.Entity.SanPham;
import com.thong.InterfaceDAO.ISanPhamDAO;

@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
@Transactional
public class SanPhamDAO  implements ISanPhamDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public List<SanPham> findAll(int begin, int quantity, String typeSort, String sortBy) {
		Session session = sessionFactory.getCurrentSession();
		Query query = null;
		String order = "order by sp." + sortBy + " " + typeSort;
		if (typeSort == null || typeSort.isEmpty()) {
			order = "";
		}
		try {
			if (begin == -1) {
				query = session.createQuery("from sanpham sp " + order);
			} else {
				query = session.createQuery("from sanpham sp " + order).setFirstResult(begin).setMaxResults(quantity);
			}
			List<SanPham> list = query.list();
			return list;
		} catch (Exception e) {
			return null;
		}
	}

	@SuppressWarnings("unchecked")
	public List<SanPham> findByCategory(int idDanhMuc, int begin, int quantity, String typeSort, String sortBy) {
		// TODO Auto-generated method stub
		System.out.println(typeSort + " dao");
		Session session = sessionFactory.getCurrentSession();
		List<SanPham> list = null;
		String order = "order by sp." + sortBy + " " + typeSort;
		if (typeSort == null || typeSort.isEmpty() || typeSort.equals("")) {
			order = "";
		}
		try {
			if (begin == -1) {
				list = session.createQuery("from sanpham sp where sp.danhMucSanPham.idDanhMuc=:idDanhMuc " + order)
						.setParameter("idDanhMuc", idDanhMuc).getResultList();
			} else {
				list = session.createQuery("from sanpham sp where sp.danhMucSanPham.idDanhMuc=:idDanhMuc " + order)
						.setParameter("idDanhMuc", idDanhMuc).setFirstResult(begin).setMaxResults(quantity)
						.getResultList();
			}

			return list;
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("null");
			return null;
		}
	}

	public void delete(Integer idSanPham) {
		Session session = sessionFactory.getCurrentSession();
		SanPham sp = session.get(SanPham.class, idSanPham);
		session.delete(sp);
	}

	public List<SanPham> search(String keyWords, int begin, int quantity, String typeSort, String sortBy) {
		Session session = sessionFactory.getCurrentSession();
		String order = "order by sp." + sortBy + " " + typeSort;
		if (typeSort == null || typeSort.isEmpty() || typeSort.equals("")) {
			order = "";
		}
		Query query = session.createQuery("from sanpham sp where sp.tenSanPham like '%" + keyWords
				+ "%' or sp.idSanPham like '%" + keyWords + "%' " + order);
		List<SanPham> list = null;
		if (begin == -1) {
			list = query.getResultList();
		} else {
			list = query.setFirstResult(begin).setMaxResults(quantity).getResultList();
		}
		return list;
	}

	public Integer create(SanPham sp) {
		System.out.println(sp);
		Session session = sessionFactory.getCurrentSession();
		Integer i = (Integer) session.save(sp);
		return i;
	}

	public SanPham findOneById(int idSanPham) {
		Session session = sessionFactory.getCurrentSession();
		SanPham sp = session.get(SanPham.class, idSanPham);
		return sp;
	}

	public void update(SanPham sp) {
		Session session = sessionFactory.getCurrentSession();
		session.update(sp);

	}

}
