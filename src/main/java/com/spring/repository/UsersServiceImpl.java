package com.spring.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.dao.UsersDao;
import com.spring.model.Users;
import com.spring.service.UsersService;
@Service
public class UsersServiceImpl implements UsersService {
	@Autowired
	private UsersDao usersDao;
	
	@Transactional
	public void add(Users users) {
		usersDao.add(users);
	}

	@Transactional
	public void edit(Users users) {
		usersDao.edit(users);
	}

	@Transactional
	public void delete(int usersId) {
		usersDao.delete(usersId);
	}

	@Transactional
	public Users getUsers(int usersId) {
		return usersDao.getUsers(usersId);
	}

	@Transactional
	public List getAllUsers() {
		return usersDao.getAllUsers();
	}

	

}
