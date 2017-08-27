package com.spring.repository;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.dao.BankDao;
import com.spring.model.Bank;

@Repository
public class BankDaoImpl implements BankDao {
	@Autowired  //มันจะค้นหา auto ใน .xml
	private SessionFactory session;
	
	@Override
	public void add(Bank bank) {
		session.getCurrentSession().save(bank);
	}

	@Override
	public void edit(Bank bank) {
		session.getCurrentSession().update(bank);
	}

	@Override
	public void delete(int bankId) {		
		session.getCurrentSession().delete(getBank(bankId));
	}

	@Override
	public Bank getBank(int bankId) {
		return (Bank)session.getCurrentSession().get(Bank.class, bankId);
	}

	@Override
	public List getAllBank() {
		return session.getCurrentSession().createQuery("from Bank").list();
	}

}
