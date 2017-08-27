package com.spring.model;

// Generated Apr 26, 2015 4:54:59 AM by Hibernate Tools 4.3.1

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 * Privilege generated by hbm2java
 */
@Entity
@Table(name="privilege")
public class Privilege implements java.io.Serializable {

	@Id
	@Column(name = "privilege_id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@Column(name="status")
	private String status;
	
	@Transient
	private List<Users> users;
	/*private Set userses = new HashSet(0);*/

	public Privilege() {
	}

	public Privilege(int id) {
		this.id = id;
	}

	public Privilege(int id, String status/*, Set userses*/) {
		this.id = id;
		this.status = status;
//		this.userses = userses;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	public List<Users> getUsers() {
		return users;
	}

	public void setUsers(List<Users> users) {
		this.users = users;
	}

/*	public Set getUserses() {
		return this.userses;
	}

	public void setUserses(Set userses) {
		this.userses = userses;
	}*/

}