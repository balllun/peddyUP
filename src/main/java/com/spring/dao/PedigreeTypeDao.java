package com.spring.dao;

import java.util.List;

import com.spring.model.PedigreeType;

public interface PedigreeTypeDao {
	public void add(PedigreeType pedigreeType);
	public void edit(PedigreeType pedigreeType);
	public void delete(int pedigreeTypeId);
	public PedigreeType getPedigreeType(int pedigreeTypeId);
	public List getAllPedigreeType();
}
