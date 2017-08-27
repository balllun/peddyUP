package com.spring.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.model.Privilege;
import com.spring.service.PrivilegeService;
 
@Controller
public class PrivilegeController {
 
	@Autowired
	private PrivilegeService privilegeService;
 
	@RequestMapping("/Privilege")
	public String setupForm(Map<String, Object> map){
		Privilege privilege = new Privilege();
		map.put("privilege", privilege);
		map.put("privilegeList", privilegeService.getAllPrivilege());
		//return "redirect:/edit/privilege/index";
		return "privilege";
	}
	
	@RequestMapping(value="/Privilege.do", method=RequestMethod.POST)
	public String doActions(@ModelAttribute Privilege privilege, BindingResult result, @RequestParam String action, Map<String, Object> map){
		Privilege privilegeResult = new Privilege();
		switch(action.toLowerCase()){	//only in Java7 you can put String in switch
		case "add":
			privilegeService.add(privilege);
			privilegeResult = privilege;
			break;
		case "edit":
			privilegeService.edit(privilege);
			privilegeResult = privilege;
			break;
		case "delete":
			privilegeService.delete(privilege.getId());
			privilegeResult = new Privilege();
			break;
		case "search":
			Privilege searchedPrivilege = privilegeService.getPrivilege(privilege.getId());
			privilegeResult = searchedPrivilege!=null ? searchedPrivilege : new Privilege();
			break;
		}
		map.put("privilege", privilegeResult);
		map.put("privilegeList", privilegeService.getAllPrivilege());
		return "privilege";
	}
	
	
}