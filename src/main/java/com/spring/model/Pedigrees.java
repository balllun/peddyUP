package com.spring.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "pedigree")
public class Pedigrees {

	private List<Pedigree> pedigrees;

	public List<Pedigree> getPedigrees() {
		return pedigrees;
	}

	public void setPedigrees(List<Pedigree> pedigrees) {
		this.pedigrees = pedigrees;
	}
}
