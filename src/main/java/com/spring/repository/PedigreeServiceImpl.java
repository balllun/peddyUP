package com.spring.repository;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.dao.PedigreeDao;
import com.spring.model.Pedigree;
import com.spring.model.SearchDate;
import com.spring.service.PedigreeService;
@Service
public class PedigreeServiceImpl implements PedigreeService {
	@Autowired
	private PedigreeDao pedigreeDao;
	
	@Transactional
	public void add(Pedigree pedigree) {
		pedigreeDao.add(pedigree);
	}

	@Transactional
	public void edit(Pedigree pedigree) {
		pedigreeDao.edit(pedigree);
	}

	@Transactional
	public void delete(int pedigreeId) {
		pedigreeDao.delete(pedigreeId);
	}

	@Transactional
	public Pedigree getPedigree(int pedigreeId) {
		return pedigreeDao.getPedigree(pedigreeId);
	}

	@Transactional
	public List getAllPedigree() {
		return pedigreeDao.getAllPedigree();
	}

	@Transactional
	public List getAllPedigree(Pedigree pedigree) {
		// TODO Auto-generated method stub
		return pedigreeDao.getAllPedigree(pedigree);
	}

	@Transactional
	public List getAllPedigreeSh(SearchDate searchDate) {
		// TODO Auto-generated method stub
		return pedigreeDao.getAllPedigreeSh(searchDate);
	}



	

}
