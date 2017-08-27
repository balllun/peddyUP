package com.spring.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.dao.PedigreeTypeDao;
import com.spring.model.PedigreeType;
import com.spring.service.PedigreeTypeService;
@Service
public class PedigreeTypeImpl implements PedigreeTypeService {
	@Autowired
	private PedigreeTypeDao pedigreeTypeDao;
	
	@Transactional
	public void add(PedigreeType pedigreeType) {
		pedigreeTypeDao.add(pedigreeType);
	}

	@Transactional
	public void edit(PedigreeType pedigreeType) {
		pedigreeTypeDao.edit(pedigreeType);
	}

	@Transactional
	public void delete(int pedigreeTypeId) {
		pedigreeTypeDao.delete(pedigreeTypeId);
	}

	@Transactional
	public PedigreeType getPedigreeType(int pedigreeTypeId) {
		return pedigreeTypeDao.getPedigreeType(pedigreeTypeId);
	}

	@Transactional
	public List getAllPedigreeType() {
		return pedigreeTypeDao.getAllPedigreeType();
	}

	

}
