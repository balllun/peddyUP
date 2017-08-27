package com.spring.dao;

import java.util.List;

import com.spring.model.Pedigree;
import com.spring.model.SearchDate;

public interface PedigreeDao {
	public void add(Pedigree pedigree);
	public void edit(Pedigree pedigree);
	public void delete(int pedigreeId);
	public Pedigree getPedigree(int pedigreeId);
	public List getAllPedigree();
	List getAllPedigree(Pedigree pedigree);
	
	List getAllPedigreeSh(SearchDate searchDate);

}
