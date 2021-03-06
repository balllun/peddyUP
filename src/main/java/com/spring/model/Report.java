package com.spring.model;

// Generated Mar 29, 2015 3:21:58 AM by Hibernate Tools 4.3.1

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


/**
 * Report generated by hbm2java
 */

@Entity
@Table(name = "report")
public class Report implements java.io.Serializable {

	@Id
	@Column(name = "report_id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@ManyToOne
	@JoinColumn(name = "bank_id")
	private Bank bank;
	
	
	@Column(name = "date")
	private Date date = new Date();
	
/*	@Column(name="date")
	@Temporal(TemporalType.DATE)
	private Date date;*/
	
	@ManyToOne
	@JoinColumn(name = "pedigree_id")
	private Pedigree pedigreeId;
	
	@ManyToOne
	@JoinColumn(name = "data_id")
	private Data dataId;
	
/*	@Column(name = "data_id")
	private int dataId;*/

	public Report() {
	}

	public Report(Bank bank, Data dataId) {
		this.bank = bank;
		this.dataId = dataId;
	}

	/*public Report(Bank bank, Users users, Date date, Integer pedigreeId, int dataId) {
		this.bank = bank;
		this.users = users;
		this.date = date;
		this.pedigreeId = pedigreeId;
		this.dataId = dataId;
	}*/

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Bank getBank() {
		return bank;
	}

	public void setBank(Bank bank) {
		this.bank = bank;
	}


	public Date getDate() {
		return this.date;
	}

	public void setDate(Date date) {
		this.date = date;
	}


	

	public Pedigree getPedigreeId() {
		return pedigreeId;
	}

	public void setPedigreeId(Pedigree pedigreeId) {
		this.pedigreeId = pedigreeId;
	}

	public Data getDataId() {
		return dataId;
	}

	public void setDataId(Data dataId) {
		this.dataId = dataId;
	}



}
