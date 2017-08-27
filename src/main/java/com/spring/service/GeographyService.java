package com.spring.service;

import java.util.List;

import com.spring.model.Geography;

public interface GeographyService {
	public void add(Geography geography);
	public void edit(Geography geography);
	public void delete(int geographyId);
	public Geography getGeography(int geographyId);
	public List getAllGeography();
	
}
