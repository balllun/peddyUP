package com.spring.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.model.Geography;
import com.spring.service.GeographyService;
 
@Controller
public class GeographyController {
 
	@Autowired
	private GeographyService geographyService;
 
	@RequestMapping("/Geography")
	public String setupForm(Map<String, Object> map){
		Geography geography = new Geography();
		map.put("geography", geography);
		map.put("geographyList", geographyService.getAllGeography());
		//return "redirect:/edit/geography/index";
		return "geography";
	}
	
	@RequestMapping(value="/Geography.do", method=RequestMethod.POST)
	public String doActions(@ModelAttribute Geography geography, BindingResult result, @RequestParam String action, Map<String, Object> map){
		Geography geographyResult = new Geography();
		switch(action.toLowerCase()){	//only in Java7 you can put String in switch
		case "add":
			geographyService.add(geography);
			geographyResult = geography;
			break;
		case "edit":
			geographyService.edit(geography);
			geographyResult = geography;
			break;
		case "delete":
			geographyService.delete(geography.getId());
			geographyResult = new Geography();
			break;
		case "search":
			Geography searchedGeography = geographyService.getGeography(geography.getId());
			geographyResult = searchedGeography!=null ? searchedGeography : new Geography();
			break;
		}
		map.put("geography", geographyResult);
		map.put("geographyList", geographyService.getAllGeography());
		return "geography";
	}
	
	
}