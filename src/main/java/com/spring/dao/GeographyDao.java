package com.spring.dao;

import java.util.List;

import com.spring.model.Geography;

public interface GeographyDao {
	public void add(Geography geography);
	public void edit(Geography geography);
	public void delete(int geographyId);
	public Geography getGeography(int geographyId);
	public List getAllGeography();
}
