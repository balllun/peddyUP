package com.spring.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.dao.PrivilegeDao;
import com.spring.model.Privilege;
import com.spring.service.PrivilegeService;
@Service
public class PrivilegeServiceImpl implements PrivilegeService {
	@Autowired
	private PrivilegeDao privilegeDao;
	
	@Transactional
	public void add(Privilege privilege) {
		privilegeDao.add(privilege);
	}

	@Transactional
	public void edit(Privilege privilege) {
		privilegeDao.edit(privilege);
	}

	@Transactional
	public void delete(int privilegeId) {
		privilegeDao.delete(privilegeId);
	}

	@Transactional
	public Privilege getPrivilege(int privilegeId) {
		return privilegeDao.getPrivilege(privilegeId);
	}

	@Transactional
	public List getAllPrivilege() {
		return privilegeDao.getAllPrivilege();
	}

	

}
