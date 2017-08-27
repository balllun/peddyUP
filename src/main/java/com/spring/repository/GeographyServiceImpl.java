package com.spring.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.dao.GeographyDao;
import com.spring.model.Geography;
import com.spring.service.GeographyService;
@Service
public class GeographyServiceImpl implements GeographyService {
	@Autowired
	private GeographyDao geographyDao;
	
	@Transactional
	public void add(Geography geography) {
		geographyDao.add(geography);
	}

	@Transactional
	public void edit(Geography geography) {
		geographyDao.edit(geography);
	}

	@Transactional
	public void delete(int geographyId) {
		geographyDao.delete(geographyId);
	}

	@Transactional
	public Geography getGeography(int geographyId) {
		return geographyDao.getGeography(geographyId);
	}

	@Transactional
	public List getAllGeography() {
		return geographyDao.getAllGeography();
	}

	

}
