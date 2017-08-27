package com.spring.dao;

import java.util.List;

import com.spring.model.Privilege;

public interface PrivilegeDao {
	public void add(Privilege privilege);
	public void edit(Privilege privilege);
	public void delete(int privilegeId);
	public Privilege getPrivilege(int privilegeId);
	public List getAllPrivilege();

}
