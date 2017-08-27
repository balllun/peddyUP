package com.spring.service;

import java.util.List;

import com.spring.model.Provinces;

public interface ProvincesService {
	public void add(Provinces provinces);
	public void edit(Provinces provinces);
	public void delete(int provincesId);
	public Provinces getProvinces(int provincesId);
	public List getAllProvinces();
	
}
