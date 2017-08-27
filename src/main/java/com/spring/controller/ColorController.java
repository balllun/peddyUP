package com.spring.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.model.Color;
import com.spring.service.ColorService;
 
@Controller
public class ColorController {
 
	@Autowired
	private ColorService colorService;
 
	@RequestMapping("/Color")
	public String setupForm(Map<String, Object> map){
		Color color = new Color();
		map.put("color", color);
		map.put("colorList", colorService.getAllColor());
		//return "redirect:/edit/color/index";
		return "color";
	}
	
	@RequestMapping(value="/Color.do", method=RequestMethod.POST)
	public String doActions(@ModelAttribute Color color, BindingResult result, @RequestParam String action, Map<String, Object> map){
		Color colorResult = new Color();
		switch(action.toLowerCase()){	//only in Java7 you can put String in switch
		case "add":
			colorService.add(color);
			colorResult = color;
			break;
		case "edit":
			colorService.edit(color);
			colorResult = color;
			break;
		case "delete":
			colorService.delete(color.getId());
			colorResult = new Color();
			break;
		case "search":
			Color searchedColor = colorService.getColor(color.getId());
			colorResult = searchedColor!=null ? searchedColor : new Color();
			break;
		}
		map.put("color", colorResult);
		map.put("colorList", colorService.getAllColor());
		return "color";
	}
	
	
}