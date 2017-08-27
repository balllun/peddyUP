package com.spring.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.dao.BankDao;
import com.spring.model.Bank;
import com.spring.service.BankService;
@Service
public class BankServiceImpl implements BankService {
	@Autowired
	private BankDao bankDao;
	
	@Transactional
	public void add(Bank bank) {
		bankDao.add(bank);
	}

	@Transactional
	public void edit(Bank bank) {
		bankDao.edit(bank);
	}

	@Transactional
	public void delete(int bankId) {
		bankDao.delete(bankId);
	}

	@Transactional
	public Bank getBank(int bankId) {
		return bankDao.getBank(bankId);
	}

	@Transactional
	public List getAllBank() {
		return bankDao.getAllBank();
	}

	

}
