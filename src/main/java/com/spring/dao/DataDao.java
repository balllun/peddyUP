package com.spring.dao;

import java.util.List;

import com.spring.model.Data;

public interface DataDao {
	public void add(Data data);
	public void edit(Data data);
	public void delete(int dataId);
	public Data getData(int dataId);
	public List getAllData();
}
