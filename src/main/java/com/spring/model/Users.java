package com.spring.model;

// Generated Mar 29, 2015 5:24:11 AM by Hibernate Tools 4.3.1

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



/**
 * Users generated by hbm2java
 */
@Entity
@Table(name="users")
public class Users implements java.io.Serializable {

	@Id
	@Column(name = "user_id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@ManyToOne
	@JoinColumn(name = "privilege_id")
	private Privilege privilege;
	
/*	private Privilege privilegeByPrivilegeId;
	private Privilege privilegeByPrivilegeUsersUserId;*/
	
	@Column(name="username")
	private String username;
	
	@Column(name="password")
	private String password;
	
	
/*	private Set datas = new HashSet(0);*/
	
	@Transient
	private List<Report> report;
/*	private Set reports = new HashSet(0);
	

	private Set privileges = new HashSet(0);
	
	*/
	
	@OneToOne(fetch=FetchType.EAGER,mappedBy="users")
	private Data data;
	
	public Data getData() {
		return data;
	}

	public void setData(Data data) {
		this.data = data;
	}

	@Transient
	private List<Pedigree> pedigreesForUsersUserId;
	

/*	private Set pedigreesForUsersUserId = new HashSet(0);
	private Set pedigreesForUsersDataDataId = new HashSet(0);
*/
	public Users() {
	}

	public Users(int id/*, Data data, Privilege privilegeByPrivilegeUsersUserId*/) {
		this.id = id;
	/*	this.data = data;
		this.privilegeByPrivilegeUsersUserId = privilegeByPrivilegeUsersUserId;*/
	}

/*	public Users(int userId, Data data, Privilege privilegeByPrivilegeId, Privilege privilegeByPrivilegeUsersUserId,
			String username, String password, Set pedigreesForUsersDataDataId, Set privileges, Set reports,
			Set pedigreesForUsersUserId, Set datas) {
		this.userId = userId;
		this.data = data;
		this.privilegeByPrivilegeId = privilegeByPrivilegeId;
		this.privilegeByPrivilegeUsersUserId = privilegeByPrivilegeUsersUserId;
		this.username = username;
		this.password = password;
		this.pedigreesForUsersDataDataId = pedigreesForUsersDataDataId;
		this.privileges = privileges;
		this.reports = reports;
		this.pedigreesForUsersUserId = pedigreesForUsersUserId;
		this.datas = datas;
	}*/

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public Privilege getPrivilege() {
		return privilege;
	}

	public void setPrivilege(Privilege privilege) {
		this.privilege = privilege;
	}
/*		public Privilege getPrivilegeByPrivilegeId() {
		return this.privilegeByPrivilegeId;
	}

	public void setPrivilegeByPrivilegeId(Privilege privilegeByPrivilegeId) {
		this.privilegeByPrivilegeId = privilegeByPrivilegeId;
	}*/

/*	public Privilege getPrivilegeByPrivilegeUsersUserId() {
		return this.privilegeByPrivilegeUsersUserId;
	}

	public void setPrivilegeByPrivilegeUsersUserId(Privilege privilegeByPrivilegeUsersUserId) {
		this.privilegeByPrivilegeUsersUserId = privilegeByPrivilegeUsersUserId;
	}*/

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

/*	public Set getPrivileges() {
		return this.privileges;
	}

	public void setPrivileges(Set privileges) {
		this.privileges = privileges;
	}*/

	public List<Report> getReport() {
		return report;
	}

	public void setReport(List<Report> report) {
		this.report = report;
	}
	
	
	/*public List<Pedigree> getPedigree() {
		return pedigree;
	}

	public void setPedigree(List<Pedigree> pedigree) {
		this.pedigree = pedigree;
	}*/

	public List<Pedigree> getPedigreesForUsersUserId() {
		return this.pedigreesForUsersUserId;
	}

	public void setPedigreesForUsersUserId(List<Pedigree> pedigreesForUsersUserId) {
		this.pedigreesForUsersUserId = pedigreesForUsersUserId;
	}

	/*public Set getDatas() {
		return this.datas;
	}

	public void setDatas(Set datas) {
		this.datas = datas;
	}*/

}