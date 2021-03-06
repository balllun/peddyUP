package com.spring.model2;

// Generated Apr 26, 2015 4:54:59 AM by Hibernate Tools 4.3.1

import java.util.HashSet;
import java.util.Set;

/**
 * Color generated by hbm2java
 */
public class Color implements java.io.Serializable {

	private Integer id;
	private String cname;
	private Set pedigrees = new HashSet(0);

	public Color() {
	}

	public Color(String cname, Set pedigrees) {
		this.cname = cname;
		this.pedigrees = pedigrees;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCname() {
		return this.cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public Set getPedigrees() {
		return this.pedigrees;
	}

	public void setPedigrees(Set pedigrees) {
		this.pedigrees = pedigrees;
	}

}
