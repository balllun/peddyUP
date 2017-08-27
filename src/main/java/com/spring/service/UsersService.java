package com.spring.service;

import java.util.List;

import com.spring.model.Users;

public interface UsersService {
	public void add(Users users);
	public void edit(Users users);
	public void delete(int usersId);
	public Users getUsers(int usersId);
	public List getAllUsers();
	
}
