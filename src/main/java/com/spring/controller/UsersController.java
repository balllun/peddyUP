package com.spring.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import com.spring.model.Pedigree;
import com.spring.model.Privilege;
import com.spring.model.Users;
import com.spring.service.PrivilegeService;
import com.spring.service.UsersService;
import com.spring.model.Data;
import com.spring.service.DataService;
 
@Controller
public class UsersController {
 
	@Autowired
	private UsersService usersService;
	

	@Autowired
	private DataService dataService;
	
	@Autowired
	 private PrivilegeService  privilegeService;
 
	@RequestMapping("/Users")
	public String setupForm(Map<String, Object> map){
		Users users = new Users();
		map.put("users", users);
		map.put("dataList", getDataList());
		map.put("privilegeList", getPrivilegeList());
		map.put("usersList", usersService.getAllUsers());
		//return "redirect:/edit/users/index";
		return "users";
	}
	
	@RequestMapping(value="/Users.do", method=RequestMethod.POST)
	public String doActions(@ModelAttribute Users users, BindingResult result, @RequestParam String action, Map<String, Object> map){
		Users usersResult = new Users();
		switch(action.toLowerCase()){	//only in Java7 you can put String in switch
		case "add":
			usersService.add(users);
			usersResult = users;
			break;
		case "edit":
			usersService.edit(users);
			usersResult = users;
			break;
		case "delete":
			usersService.delete(users.getId());
			usersResult = new Users();
			break;
		case "search":
			Users searchedUsers = usersService.getUsers(users.getId());
			usersResult = searchedUsers!=null ? searchedUsers : new Users();
			break;
		}
		map.put("users", usersResult);
		map.put("dataList", getDataList());
		map.put("privilegeList", getPrivilegeList());
		map.put("usersList", usersService.getAllUsers());
		
		return "users";
	}
	
	@SuppressWarnings("unchecked")
	private Map<String, String> getDataList(){
		Map<String,String> dataMap = new HashMap<String, String>();
		List<Data> dataList = dataService.getAllData();
		for (Data data : dataList) {
			dataMap.put(data.getId()+"", data.getFName());
		}
		
		return dataMap;
	}
	
	
	@SuppressWarnings("unchecked")
	private Map<String, String> getPrivilegeList(){
		Map<String,String> privilegeMap = new HashMap<String, String>();
		List<Privilege> privilegeList = privilegeService.getAllPrivilege();
		for (Privilege privilege : privilegeList) {
			privilegeMap.put(privilege.getId()+"", privilege.getStatus());
		}
		
		return privilegeMap;
	}
	
}