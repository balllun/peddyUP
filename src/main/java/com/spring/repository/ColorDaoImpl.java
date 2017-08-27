package com.spring.repository;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.dao.ColorDao;
import com.spring.model.Color;

@Repository
public class ColorDaoImpl implements ColorDao {
	@Autowired  //มันจะค้นหา auto ใน .xml
	private SessionFactory session;
	
	@Override
	public void add(Color color) {
		session.getCurrentSession().save(color);
	}

	@Override
	public void edit(Color color) {
		session.getCurrentSession().update(color);
	}

	@Override
	public void delete(int colorId) {		
		session.getCurrentSession().delete(getColor(colorId));
	}

	@Override
	public Color getColor(int colorId) {
		return (Color)session.getCurrentSession().get(Color.class, colorId);
	}

	@Override
	public List getAllColor() {
		return session.getCurrentSession().createQuery("from Color").list();
	}

}
