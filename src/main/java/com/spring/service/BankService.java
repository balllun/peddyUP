package com.spring.service;

import java.util.List;

import com.spring.model.Bank;

public interface BankService {
	public void add(Bank bank);
	public void edit(Bank bank);
	public void delete(int bankId);
	public Bank getBank(int bankId);
	public List getAllBank();
	
}
