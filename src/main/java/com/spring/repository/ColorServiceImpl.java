package com.spring.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.dao.ColorDao;
import com.spring.model.Color;
import com.spring.service.ColorService;
@Service
public class ColorServiceImpl implements ColorService {
	@Autowired
	private ColorDao colorDao;
	
	@Transactional
	public void add(Color color) {
		colorDao.add(color);
	}

	@Transactional
	public void edit(Color color) {
		colorDao.edit(color);
	}

	@Transactional
	public void delete(int colorId) {
		colorDao.delete(colorId);
	}

	@Transactional
	public Color getColor(int colorId) {
		return colorDao.getColor(colorId);
	}

	@Transactional
	public List getAllColor() {
		return colorDao.getAllColor();
	}

	

}
