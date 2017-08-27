package com.spring.repository;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.dao.ProvincesDao;
import com.spring.model.Geography;
import com.spring.model.Provinces;

@Repository
public class ProvincesDaoImpl implements ProvincesDao {
	@Autowired  //มันจะค้นหา auto ใน .xml
	private SessionFactory session;
	
	@Override
	public void add(Provinces provinces) {
		session.getCurrentSession().save(provinces);
	}

	@Override
	public void edit(Provinces provinces) {
		session.getCurrentSession().update(provinces);
	}

	@Override
	public void delete(int provincesId) {		
		session.getCurrentSession().delete(getProvinces(provincesId));
	}

	@Override
	public Provinces getProvinces(int provincesId) {
		return (Provinces)session.getCurrentSession().get(Provinces.class, provincesId);
	}

	@Override
	public List getAllProvinces() {
		return session.getCurrentSession().createQuery("from Provinces").list();
	}

	

}
