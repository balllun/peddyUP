package com.spring.repository;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.dao.DataDao;
import com.spring.model.Data;

@Repository
public class DataDaoImpl implements DataDao {
	@Autowired  //มันจะค้นหา auto ใน .xml
	private SessionFactory session;
	
	@Override
	public void add(Data data) {
		session.getCurrentSession().save(data);
	}

	@Override
	public void edit(Data data) {
		session.getCurrentSession().update(data);
	}

	@Override
	public void delete(int dataId) {		
		session.getCurrentSession().delete(getData(dataId));
	}

	@Override
	public Data getData(int dataId) {
		return (Data)session.getCurrentSession().get(Data.class, dataId);
	}

	@Override
	public List getAllData() {
		return session.getCurrentSession().createQuery("from Data").list();
	}

}
