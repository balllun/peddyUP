package com.spring.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.dao.ProvincesDao;
import com.spring.model.Provinces;
import com.spring.service.ProvincesService;
@Service
public class ProvincesServiceImpl implements ProvincesService {
	@Autowired
	private ProvincesDao provincesDao;
	
	@Transactional
	public void add(Provinces provinces) {
		provincesDao.add(provinces);
	}

	@Transactional
	public void edit(Provinces provinces) {
		provincesDao.edit(provinces);
	}

	@Transactional
	public void delete(int provincesId) {
		provincesDao.delete(provincesId);
	}

	@Transactional
	public Provinces getProvinces(int provincesId) {
		return provincesDao.getProvinces(provincesId);
	}

	@Transactional
	public List getAllProvinces() {
		return provincesDao.getAllProvinces();
	}

	

}
