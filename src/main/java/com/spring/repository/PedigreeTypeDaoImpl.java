package com.spring.repository;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.dao.PedigreeTypeDao;
import com.spring.model.PedigreeType;

@Repository
public class PedigreeTypeDaoImpl implements PedigreeTypeDao {
	@Autowired  //มันจะค้นหา auto ใน .xml
	private SessionFactory session;
	
	@Override
	public void add(PedigreeType pedigreeType) {
		session.getCurrentSession().save(pedigreeType);
	}

	@Override
	public void edit(PedigreeType pedigreeType) {
		session.getCurrentSession().update(pedigreeType);
	}

	@Override
	public void delete(int pedigreeTypeId) {		
		session.getCurrentSession().delete(getPedigreeType(pedigreeTypeId));
	}

	@Override
	public PedigreeType getPedigreeType(int pedigreeTypeId) {
		return (PedigreeType)session.getCurrentSession().get(PedigreeType.class, pedigreeTypeId);
	}

	@Override
	public List getAllPedigreeType() {
		return session.getCurrentSession().createQuery("from PedigreeType").list();
	}

}
