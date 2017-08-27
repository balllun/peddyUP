package com.spring.repository;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.dao.UsersDao;
import com.spring.model.Users;

@Repository
public class UsersDaoImpl implements UsersDao {
	@Autowired  //มันจะค้นหา auto ใน .xml
	private SessionFactory session;
	
	@Override
	public void add(Users users) {
		session.getCurrentSession().save(users);
	}

	@Override
	public void edit(Users users) {
		session.getCurrentSession().update(users);
	}

	@Override
	public void delete(int usersId) {		
		session.getCurrentSession().delete(getUsers(usersId));
	}

	@Override
	public Users getUsers(int usersId) {
		return (Users)session.getCurrentSession().get(Users.class, usersId);
	}

	@Override
	public List getAllUsers() {
		return session.getCurrentSession().createQuery("from Users").list();
	}
	
	@Override
	public Users getUserByUsername(String username) {
		// TODO Auto-generated method stub
		Criteria criteria = session.getCurrentSession().createCriteria(Users.class);
		criteria.add(Restrictions.eq("username",username));
		return (Users) criteria.uniqueResult();
	}

}
