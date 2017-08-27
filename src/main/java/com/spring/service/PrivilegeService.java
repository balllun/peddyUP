package com.spring.service;

import java.util.List;

import com.spring.model.Privilege;

public interface PrivilegeService {
	public void add(Privilege privilege);
	public void edit(Privilege privilege);
	public void delete(int privilegeId);
	public Privilege getPrivilege(int privilegeId);
	public List getAllPrivilege();
	
}
