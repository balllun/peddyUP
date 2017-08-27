package com.spring.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.model.Report;
import com.spring.service.ReportService;
import com.spring.model.Bank;
import com.spring.service.BankService;
import com.spring.model.Users;
import com.spring.service.UsersService;

@Controller
public class ReportController {
 
	@Autowired
	private ReportService reportService;
 
	@Autowired
	private BankService bankService;
	
	@Autowired
	private UsersService usersService;

	@RequestMapping("/report")
	public ModelAndView Main(Map<String, Object> map) {
		
		Report report = new Report();
		map.put("report",report);
		map.put("reportList", reportService.getAllReport());
		
		map.put("bankList", getBankList());
		map.put("usersList", getUsersList());
		ModelAndView model = new ModelAndView("/report");
		return model;

	}
	
	@RequestMapping("/Report")
	public String setupForm(Map<String, Object> map){
		Report report = new Report();
		map.put("report", report);
		map.put("bankList", getBankList());
		map.put("usersList", getUsersList());
		map.put("reportList", reportService.getAllReport());
		//return "redirect:/edit/report/index";
		return "report";
	}
	
	@RequestMapping(value="/Report.do", method=RequestMethod.POST)
	public String doActions(@ModelAttribute Report report, BindingResult result, @RequestParam String action, Map<String, Object> map){
		Report reportResult = new Report();
		switch(action.toLowerCase()){	//only in Java7 you can put String in switch
		case "add":
			reportService.add(report);
			reportResult = report;
			break;
		case "edit":
			reportService.edit(report);
			reportResult = report;
			break;
		case "delete":
			reportService.delete(report.getId());
			reportResult = new Report();
			break;
		case "search":
			Report searchedReport = reportService.getReport(report.getId());
			reportResult = searchedReport!=null ? searchedReport : new Report();
			break;
		}
		map.put("report", reportResult);
		map.put("reportList", reportService.getAllReport());
		map.put("bankList", getBankList());
		map.put("usersList", getUsersList());
		return "report";
	}
	@SuppressWarnings("unchecked")
	private Map<String, String> getBankList(){
		Map<String,String> bankMap = new HashMap<String, String>();
		List<Bank> bankList = bankService.getAllBank();
		for (Bank bank : bankList) {
			bankMap.put(bank.getId()+"", bank.getName());
		}
		
		return bankMap;
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
	
	
	
/*	@RequestMapping(value = "/member/report")
	public ModelAndView Report(ModelMap modelMap) {//ModelMap modelMap
		MemberReport memberReport = new MemberReport();
		modelMap.put("memberslist", memberReport.findAll(memberService));
		ModelAndView model = new ModelAndView("/member/report");
		return model;
	}*/
	

	
	
	
}