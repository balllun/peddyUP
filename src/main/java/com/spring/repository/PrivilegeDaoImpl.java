package com.spring.repository;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.dao.PrivilegeDao;
import com.spring.model.Bank;
import com.spring.model.Privilege;

@Repository
public class PrivilegeDaoImpl implements PrivilegeDao {
	@Autowired  //มันจะค้นหา auto ใน .xml
	private SessionFactory session;
	
	@Override
	public void add(Privilege privilege) {
		session.getCurrentSession().save(privilege);
	}

	@Override
	public void edit(Privilege privilege) {
		session.getCurrentSession().update(privilege);
	}

	@Override
	public void delete(int privilegeId) {		
		session.getCurrentSession().delete(getPrivilege(privilegeId));
	}

	@Override
	public Privilege getPrivilege(int privilegeId) {
		return (Privilege)session.getCurrentSession().get(Privilege.class, privilegeId);
	}

	@Override
	public List getAllPrivilege() {
		return session.getCurrentSession().createQuery("from Privilege").list();
	}

	

}
