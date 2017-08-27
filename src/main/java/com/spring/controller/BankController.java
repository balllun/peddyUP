package com.spring.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.model.Bank;
import com.spring.service.BankService;
 
@Controller
public class BankController {
 
	@Autowired
	private BankService bankService;
 
	@RequestMapping("/Bank")
	public String setupForm(Map<String, Object> map){
		Bank bank = new Bank();
		map.put("bank", bank);
		map.put("bankList", bankService.getAllBank());
		//return "redirect:/edit/bank/index";
		return "bank";
	}
	
	@RequestMapping(value="/Bank.do", method=RequestMethod.POST)
	public String doActions(@ModelAttribute Bank bank, BindingResult result, @RequestParam String action, Map<String, Object> map){
		Bank bankResult = new Bank();
		switch(action.toLowerCase()){	//only in Java7 you can put String in switch
		case "add":
			bankService.add(bank);
			bankResult = bank;
			break;
		case "edit":
			bankService.edit(bank);
			bankResult = bank;
			break;
		case "delete":
			bankService.delete(bank.getId());
			bankResult = new Bank();
			break;
		case "search":
			Bank searchedBank = bankService.getBank(bank.getId());
			bankResult = searchedBank!=null ? searchedBank : new Bank();
			break;
		}
		map.put("bank", bankResult);
		map.put("bankList", bankService.getAllBank());
		return "bank";
	}
	
	
}