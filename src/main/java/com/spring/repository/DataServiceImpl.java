package com.spring.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.dao.DataDao;
import com.spring.model.Data;
import com.spring.service.DataService;
@Service
public class DataServiceImpl implements DataService {
	@Autowired
	private DataDao dataDao;
	
	@Transactional
	public void add(Data data) {
		dataDao.add(data);
	}

	@Transactional
	public void edit(Data data) {
		dataDao.edit(data);
	}

	@Transactional
	public void delete(int dataId) {
		dataDao.delete(dataId);
	}

	@Transactional
	public Data getData(int dataId) {
		return dataDao.getData(dataId);
	}

	@Transactional
	public List getAllData() {
		return dataDao.getAllData();
	}

	

}
