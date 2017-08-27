package com.spring.service;

import java.util.List;

import com.spring.model.PedigreeType;

public interface PedigreeTypeService {
	public void add(PedigreeType pedigreeType);
	public void edit(PedigreeType pedigreeType);
	public void delete(int pedigreeTypeId);
	public PedigreeType getPedigreeType(int pedigreeTypeId);
	public List getAllPedigreeType();
	
}
