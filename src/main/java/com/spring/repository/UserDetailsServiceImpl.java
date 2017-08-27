package com.spring.repository;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.dao.UsersDao;
import com.spring.model.Users;

@Service("userDetailsService")
public class UserDetailsServiceImpl implements UserDetailsService {

	@Autowired
	private UsersDao usersDao;
	
	
	@Override
	@Transactional(readOnly =true)
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		Users users = usersDao.getUserByUsername(username);
		if(users!=null){
			String password = users.getPassword();
			
			boolean enabled = true;
			boolean accountNonExpired = true;
			boolean credentialsNonExpired = true;
			boolean accountNonLocked = true;
			
			Collection<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
				authorities.add(new GrantedAuthorityImpl(users.getPrivilege().getStatus()));
				org.springframework.security.core.userdetails.User securityUser = new 
						org.springframework.security.core.userdetails.User(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
				return securityUser;
		}else{
			throw new UsernameNotFoundException("Users Not Found!!!");
		}
	}

}
