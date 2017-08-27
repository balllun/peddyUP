package com.spring.controller;

import org.apache.log4j.chainsaw.Main;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.report.ProductReport;

@Controller
@RequestMapping(value = "product")
public class ProductController {
	
	@RequestMapping(method=RequestMethod.GET)
	public String index(ModelMap modelMap){
		ProductReport pr = new ProductReport();
		modelMap.put("listProducts", pr.findAll());
		return "index";
	}
	
}
