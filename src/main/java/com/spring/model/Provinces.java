package com.spring.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "provinces")
public class Provinces implements java.io.Serializable {
	
	
	@Id
	@Column(name = "PROVINCE_ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	

	@Column(name = "PROVINCE_NAME")
	private String PROVINCE_NAME;
	
	@Column(name = "PROVINCE_CODE")
	private String PROVINCE_CODE;
	
	@ManyToOne
	@JoinColumn(name = "GEO_ID")
	private Geography  geography;
	
	
	public Provinces() {
	}

	public Provinces(Geography geography, String PROVINCE_CODE, String PROVINCE_NAME) {
		this.geography = geography;
		this.PROVINCE_CODE = PROVINCE_CODE;
		this.PROVINCE_NAME = PROVINCE_NAME;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPROVINCE_NAME() {
		return PROVINCE_NAME;
	}

	public void setPROVINCE_NAME(String pROVINCE_NAME) {
		PROVINCE_NAME = pROVINCE_NAME;
	}

	public String getPROVINCE_CODE() {
		return PROVINCE_CODE;
	}

	public void setPROVINCE_CODE(String pROVINCE_CODE) {
		PROVINCE_CODE = pROVINCE_CODE;
	}

	public Geography getGeography() {
		return geography;
	}

	public void setGeography(Geography geography) {
		this.geography = geography;
	}


	



}
