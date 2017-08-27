package com.spring.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.model.PedigreeType;
import com.spring.service.PedigreeTypeService;
 
@Controller
public class PedigreeTypeController {
 
	@Autowired
	private PedigreeTypeService pedigreeTypeService;
 
	@RequestMapping("/PedigreeType")
	public String setupForm(Map<String, Object> map){
		PedigreeType pedigreeType = new PedigreeType();
		map.put("pedigreeType", pedigreeType);
		map.put("pedigreeTypeList", pedigreeTypeService.getAllPedigreeType());
		//return "redirect:/edit/pedigreeType/index";
		return "pedigreeType";
	}
	
	@RequestMapping(value="/PedigreeType.do", method=RequestMethod.POST)
	public String doActions(@ModelAttribute PedigreeType pedigreeType, BindingResult result, @RequestParam String action, Map<String, Object> map){
		PedigreeType pedigreeTypeResult = new PedigreeType();
		switch(action.toLowerCase()){	//only in Java7 you can put String in switch
		case "add":
			pedigreeTypeService.add(pedigreeType);
			pedigreeTypeResult = pedigreeType;
			break;
		case "edit":
			pedigreeTypeService.edit(pedigreeType);
			pedigreeTypeResult = pedigreeType;
			break;
		case "delete":
			pedigreeTypeService.delete(pedigreeType.getId());
			pedigreeTypeResult = new PedigreeType();
			break;
		case "search":
			PedigreeType searchedPedigreeType = pedigreeTypeService.getPedigreeType(pedigreeType.getId());
			pedigreeTypeResult = searchedPedigreeType!=null ? searchedPedigreeType : new PedigreeType();
			break;
		}
		map.put("pedigreeType", pedigreeTypeResult);
		map.put("pedigreeTypeList", pedigreeTypeService.getAllPedigreeType());
		return "pedigreeType";
	}
	
	
}