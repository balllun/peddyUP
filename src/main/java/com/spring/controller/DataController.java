package com.spring.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.model.Data;
import com.spring.model.Users;
import com.spring.service.DataService;
import com.spring.service.UsersService;
 
@Controller
public class DataController {
 
	@Autowired
	private DataService dataService;
 
	@RequestMapping("/Data")
	public String setupForm(Map<String, Object> map){
		Data data = new Data();
		map.put("data", data);
		map.put("dataList", dataService.getAllData());
		//return "redirect:/edit/data/index";
		return "data";
	}
	
	@Autowired
	UsersService usersService;
	@RequestMapping(value="/Data.do", method=RequestMethod.POST)
	public String doActions(@ModelAttribute Data data, BindingResult result, @RequestParam String action, Map<String, Object> map){
		Data dataResult = new Data();
		switch(action.toLowerCase()){	//only in Java7 you can put String in switch
		case "add":
			dataService.add(data);
			dataResult = data;
			break;
		case "edit":
			dataService.edit(data);
			dataResult = data;
			break;
		case "delete":
			dataService.delete(data.getId());
			dataResult = new Data();
			break;
		case "search":
			Data searchedData = dataService.getData(data.getId());
			dataResult = searchedData!=null ? searchedData : new Data();
			break;
		}
		map.put("data", dataResult);
		map.put("dataList", dataService.getAllData());
		return "data";
	}
	
	
}