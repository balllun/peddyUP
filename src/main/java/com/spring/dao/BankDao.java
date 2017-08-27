package com.spring.dao;

import java.util.List;

import com.spring.model.Bank;

public interface BankDao {
	public void add(Bank bank);
	public void edit(Bank bank);
	public void delete(int bankId);
	public Bank getBank(int bankId);
	public List getAllBank();
}
