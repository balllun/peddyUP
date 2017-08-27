package com.spring.dao;

import java.util.List;

import com.spring.model.Users;

public interface UsersDao {
	public void add(Users users);
	public void edit(Users users);
	public void delete(int usersId);
	public Users getUsers(int usersId);
	public Users getUserByUsername(String username);
	public List getAllUsers();
}
