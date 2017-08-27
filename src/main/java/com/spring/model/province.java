package com.spring.model;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;




@Entity
@Table(name="province")
public class province {
	
	
	@Column(name="PROVINCE_ID")
	private String province_id;
	
	
	@Column(name="PROVINCE_CODE")
	private String province_code;
	
	
	@Column(name="PROVINCE_NAME")
	private String province_name;
	
	@Column(name="GEO_ID")
	private String geo_id;

	public String getProvince_id() {
		return province_id;
	}

	public void setProvince_id(String province_id) {
		this.province_id = province_id;
	}

	public String getProvince_code() {
		return province_code;
	}

	public void setProvince_code(String province_code) {
		this.province_code = province_code;
	}

	public String getProvince_name() {
		return province_name;
	}

	public void setProvince_name(String province_name) {
		this.province_name = province_name;
	}

	public String getGeo_id() {
		return geo_id;
	}

	public void setGeo_id(String geo_id) {
		this.geo_id = geo_id;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
