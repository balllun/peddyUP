package com.spring.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "geography")
public class Geography implements java.io.Serializable{
	@Id
	@Column(name = "GEO_ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	
	@Transient
	private List<Provinces> provinces;

	@Column(name = "GEO_NAME")
	private String GEO_NAME;
	
	public Geography() {
	}

	public Geography(String GEO_NAME) {
		this.GEO_NAME = GEO_NAME;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public List<Provinces> getProvinces() {
		return provinces;
	}

	public void setProvinces(List<Provinces> provinces) {
		this.provinces = provinces;
	}

	public String getGEO_NAME() {
		return GEO_NAME;
	}

	public void setGEO_NAME(String gEO_NAME) {
		GEO_NAME = gEO_NAME;
	}
	
	
	
	



}
