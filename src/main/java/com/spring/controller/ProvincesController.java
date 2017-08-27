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

import com.spring.model.Provinces;
import com.spring.service.ProvincesService;
import com.spring.model.Geography;
import com.spring.service.GeographyService;
 
@Controller
public class ProvincesController {
 
	@Autowired
	private ProvincesService provincesService;
 
	@Autowired
	private GeographyService geographyService;

	@RequestMapping("/provinces")
	public ModelAndView Main(Map<String, Object> map) {
		
		Provinces provinces = new Provinces();
		map.put("provinces",provinces);
		map.put("provincesList", provincesService.getAllProvinces());
		
		map.put("geographyList", getGeographyList());
		
		ModelAndView model = new ModelAndView("/provinces");
		return model;

	}
	
	@RequestMapping("/Provinces")
	public String setupForm(Map<String, Object> map){
		Provinces provinces = new Provinces();
		map.put("provinces", provinces);
		map.put("provincesList", provincesService.getAllProvinces());
		//return "redirect:/edit/provinces/index";
		return "provinces";
	}
	
	@RequestMapping(value="/Provinces.do", method=RequestMethod.POST)
	public String doActions(@ModelAttribute Provinces provinces, BindingResult result, @RequestParam String action, Map<String, Object> map){
		Provinces provincesResult = new Provinces();
		switch(action.toLowerCase()){	//only in Java7 you can put String in switch
		case "add":
			provincesService.add(provinces);
			provincesResult = provinces;
			break;
		case "edit":
			provincesService.edit(provinces);
			provincesResult = provinces;
			break;
		case "delete":
			provincesService.delete(provinces.getId());
			provincesResult = new Provinces();
			break;
		case "search":
			Provinces searchedProvinces = provincesService.getProvinces(provinces.getId());
			provincesResult = searchedProvinces!=null ? searchedProvinces : new Provinces();
			break;
		}
		map.put("provinces", provincesResult);
		map.put("provincesList", provincesService.getAllProvinces());
		map.put("geographyList", getGeographyList());
		return "provinces";
	}
	@SuppressWarnings("unchecked")
	private Map<String, String> getGeographyList(){
		Map<String,String> geoMap = new HashMap<String, String>();
		List<Geography> geoList = geographyService.getAllGeography();
		for (Geography geography : geoList) {
			geoMap.put(geography.getId()+"", geography.getGEO_NAME());
		}
		
		return geoMap;
	}
	
	
}