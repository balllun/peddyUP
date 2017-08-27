package com.spring.repository;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.dao.GeographyDao;
import com.spring.model.Geography;

@Repository
public class GeographyDaoImpl implements GeographyDao {
	@Autowired  //มันจะค้นหา auto ใน .xml
	private SessionFactory session;
	
	@Override
	public void add(Geography geography) {
		session.getCurrentSession().save(geography);
	}

	@Override
	public void edit(Geography geography) {
		session.getCurrentSession().update(geography);
	}

	@Override
	public void delete(int geographyId) {		
		session.getCurrentSession().delete(getGeography(geographyId));
	}

	@Override
	public Geography getGeography(int geographyId) {
		return (Geography)session.getCurrentSession().get(Geography.class, geographyId);
	}

	@Override
	public List getAllGeography() {
		return session.getCurrentSession().createQuery("from Geography").list();
	}

}
