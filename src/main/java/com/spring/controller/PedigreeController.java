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
import org.springframework.web.servlet.ModelAndView;

import com.spring.model.Pedigree;
import com.spring.service.PedigreeService;
import com.spring.model.Color;
import com.spring.service.ColorService;
import com.spring.model.Users;
import com.spring.service.UsersService; 
import com.spring.model.PedigreeType;
import com.spring.service.PedigreeTypeService; 

@Controller
public class PedigreeController {
 
	@Autowired
	private PedigreeService pedigreeService;
 
	@Autowired
	private ColorService colorService;
	
	@Autowired
	private UsersService usersService;

	@Autowired
	private PedigreeTypeService pedigreeTypeService;
	
	@RequestMapping("/pedigree")
	public ModelAndView Main(Map<String, Object> map) {
		
		Pedigree pedigree = new Pedigree();
		map.put("pedigree",pedigree);
		/*map.put("pedigreeList", pedigreeService.getAllPedigree());*/
		map.put("pedigreeList", getPedigreeList());
		map.put("colorList", getColorList());
		map.put("usersList", getUsersList());
		map.put("pedigreeTypeList", getPedigreeTypeList());
		ModelAndView model = new ModelAndView("/pedigree");
		return model;

	}
	
	@RequestMapping("/Pedigree")
	public String setupForm(Map<String, Object> map){
		Pedigree pedigree = new Pedigree();
		map.put("pedigree", pedigree);
		map.put("colorList", getColorList());
		map.put("usersList", getUsersList());
		map.put("pedigreeTypeList", getPedigreeTypeList());
		map.put("pedigree1List", getPedigreeList());
		map.put("pedigreeList", pedigreeService.getAllPedigree());
		//return "redirect:/edit/pedigree/index";
		return "pedigree";
	}
	
	@RequestMapping(value="/Pedigree.do", method=RequestMethod.POST)
	public String doActions(@ModelAttribute Pedigree pedigree, BindingResult result, @RequestParam String action, Map<String, Object> map){
		Pedigree pedigreeResult = new Pedigree();
		switch(action.toLowerCase()){	//only in Java7 you can put String in switch
		case "add":
			pedigreeService.add(pedigree);
			pedigreeResult = pedigree;
			break;
		case "edit":
			pedigreeService.edit(pedigree);
			pedigreeResult = pedigree;
			break;
		case "delete":
			pedigreeService.delete(pedigree.getId());
			pedigreeResult = new Pedigree();
			break;
		case "search":
			Pedigree searchedPedigree = pedigreeService.getPedigree(pedigree.getId());
			pedigreeResult = searchedPedigree!=null ? searchedPedigree : new Pedigree();
			break;
		}
		map.put("pedigree", pedigreeResult);
		map.put("pedigreeList", pedigreeService.getAllPedigree());
		map.put("colorList", getColorList());
		map.put("usersList", getUsersList());
		map.put("pedigree1List", getPedigreeList());
		map.put("pedigreeTypeList", getPedigreeTypeList());
		return "pedigree";
	}
	@SuppressWarnings("unchecked")
	private Map<String, String> getColorList(){
		Map<String,String> colorMap = new HashMap<String, String>();
		List<Color> colorList = colorService.getAllColor();
		for (Color color : colorList) {
			colorMap.put(color.getId()+"", color.getName());
		}
		
		return colorMap;
	}
	
	@SuppressWarnings("unchecked")
	private Map<String, String> getUsersList(){
		Map<String,String> usersMap = new HashMap<String, String>();
		List<Users> usersList = usersService.getAllUsers();
		for (Users users : usersList) {
			usersMap.put(users.getId()+"", users.getUsername());
		}
		
		return usersMap;
	}
	
	@SuppressWarnings("unchecked")
	private Map<String, String> getPedigreeTypeList(){
		Map<String,String> pedigreeTypeMap = new HashMap<String, String>();
		List<PedigreeType> pedigreeTypeList = pedigreeTypeService.getAllPedigreeType();
		for (PedigreeType pedigreeType : pedigreeTypeList) {
			pedigreeTypeMap.put(pedigreeType.getId()+"", pedigreeType.getType());
		}
		
		return pedigreeTypeMap;
	}
	
	@SuppressWarnings("unchecked")
	private Map<String, String> getPedigreeList(){
		Map<String,String> pedigreeMap = new HashMap<String, String>();
		List<Pedigree> pedigreeList = pedigreeService.getAllPedigree();
		for (Pedigree pedigree : pedigreeList) {
			pedigreeMap.put(pedigree.getId()+"", pedigree.getCName());
		}
		
		return pedigreeMap;
	}
	
	
	
}