package com.spring.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.model.Data;
import com.spring.model.Pedigree;
import com.spring.model.PedigreeType;
import com.spring.model.Privilege;
import com.spring.model.Users;
import com.spring.model.Bank;
import com.spring.model.Color;
import com.spring.service.DataService;
import com.spring.service.PedigreeService;
import com.spring.service.PedigreeTypeService;
import com.spring.service.PrivilegeService;
import com.spring.service.UsersService;
import com.spring.service.BankService;
import com.spring.service.ColorService;


@Controller
public class EditController {

	@Autowired
	private PedigreeService pedigreeService;

	@Autowired
	private DataService dataService;
	
	@Autowired
	private ColorService colorService;
	
	@Autowired
	private PedigreeTypeService pedigreeTypeService;

	@Autowired
	private BankService bankService;
	
	@Autowired
	private UsersService usersService;
	
	@Autowired
	private PrivilegeService privilegeService;


	@ResponseBody
	@RequestMapping(value = "update_mem", method = RequestMethod.POST)
	public String update_mem(@RequestParam("id") int id,
			@RequestParam("user") int user, @RequestParam("FName") String FName,
			@RequestParam("LName") String LName, @RequestParam("idNo") String idNo,
			@RequestParam("address") String address, @RequestParam("phone") String phone,
			@RequestParam("mail") String mail,@RequestParam("privilege") int privilege, Map<String, Object> map) {

		
		Users userid	= usersService.getUsers(user);
		userid.setPrivilege(privilegeService.getPrivilege(privilege));
		usersService.edit(userid);
		Data data = dataService.getData(id);
		data.setFName(FName);
		data.setLName(LName);
		data.setIdNo(idNo);
		data.setAddress(address);
		data.setPhone(phone);
		data.setMail(mail);
		userid.getPrivilege();
		data.setUsers(userid);
		dataService.edit(data);

		return "ok";
	}
	
	@ResponseBody
	@RequestMapping(value = "update_pedigreeType", method = RequestMethod.POST)
	public String update_PedigreeType(@RequestParam("id") int id, @RequestParam("gene") String gene,
			@RequestParam("def") String def, @RequestParam("type") String type,
			@RequestParam("price") int price) {

		PedigreeType pedigreeType = pedigreeTypeService.getPedigreeType(id);
		pedigreeType.setGene(gene);
		pedigreeType.setDef(def);
		pedigreeType.setType(type);
		pedigreeType.setPrice(price);
		pedigreeTypeService.edit(pedigreeType);

		return "ok";
	}
	
	@ResponseBody
	@RequestMapping(value = "update_bank", method = RequestMethod.POST)
	public String update_Bank(@RequestParam("id") int id, @RequestParam("name") String name,
			@RequestParam("defName") String defName) {

		Bank bank = bankService.getBank(id);
		bank.setName(name);
		bank.setDefName(defName);
		bankService.edit(bank);

		return "ok";
	}
	
	@ResponseBody
	@RequestMapping(value = "update_color", method = RequestMethod.POST)
	public String update_Color(@RequestParam("id") int id, @RequestParam("name") String name) {

		Color color = colorService.getColor(id);
		color.setName(name);
		colorService.edit(color);

		return "ok";
	}

	

	@ResponseBody
	@RequestMapping(value = "update_pedigree", method = RequestMethod.POST)

	public String update_pedigree(@RequestParam("id") int id,

	@RequestParam("sex") String sex,
	@RequestParam("color") int color,
	@RequestParam("breeder") String breeder, @RequestParam("CName") String CName,
			@RequestParam("privateNo") String privateNo, @RequestParam("bbfaNo") String bbfaNo,
			@RequestParam("owner") String owner, @RequestParam("band") String band,
			@RequestParam("farmName") String farmName,
			@RequestParam("ownerName") String ownerName, 
			@RequestParam("dateDelivery") String dateDelivery, @RequestParam("calved") String calved,

	@RequestParam("pedigreeSireId.id") int pedigreeSireId_id,
			@RequestParam("pedigreeSireId.CName") String pedigreeSireId_CName,
			@RequestParam("pedigreeSireId.privateNo") String pedigreeSireId_privateNo,
			@RequestParam("pedigreeSireId.bbfaNo") String pedigreeSireId_bbfaNo,

	@RequestParam("pedigreeDamId.id") int pedigreeDamId_id,
			@RequestParam("pedigreeDamId.CName") String pedigreeDamId_CName,
			@RequestParam("pedigreeDamId.privateNo") String pedigreeDamId_privateNo,
			@RequestParam("pedigreeDamId.bbfaNo") String pedigreeDamId_bbfaNo,

@RequestParam("pedigreeSireId.pedigreeSireId.id") int pedigreeSireId_pedigreeSireId_id,
			@RequestParam("pedigreeSireId.pedigreeSireId.CName") String pedigreeSireId_pedigreeSireId_CName,
			@RequestParam("pedigreeSireId.pedigreeSireId.privateNo") String pedigreeSireId_pedigreeSireId_privateNo,
			@RequestParam("pedigreeSireId.pedigreeSireId.bbfaNo") String pedigreeSireId_pedigreeSireId_bbfaNo,

	@RequestParam("pedigreeSireId.pedigreeDamId.id") int pedigreeSireId_pedigreeDamId_id,
			@RequestParam("pedigreeSireId.pedigreeDamId.CName") String pedigreeSireId_pedigreeDamId_CName,
			@RequestParam("pedigreeSireId.pedigreeDamId.privateNo") String pedigreeSireId_pedigreeDamId_privateNo,
			@RequestParam("pedigreeSireId.pedigreeDamId.bbfaNo") String pedigreeSireId_pedigreeDamId_bbfaNo,
			
	@RequestParam("pedigreeDamId.pedigreeSireId.id") int pedigreeDamId_pedigreeSireId_id,
			@RequestParam("pedigreeDamId.pedigreeSireId.CName") String pedigreeDamId_pedigreeSireId_CName,
			@RequestParam("pedigreeDamId.pedigreeSireId.privateNo") String pedigreeDamId_pedigreeSireId_privateNo,
			@RequestParam("pedigreeDamId.pedigreeSireId.bbfaNo") String pedigreeDamId_pedigreeSireId_bbfaNo,
			
	@RequestParam("pedigreeDamId.pedigreeDamId.id") int pedigreeDamId_pedigreeDamId_id,
			@RequestParam("pedigreeDamId.pedigreeDamId.CName") String pedigreeDamId_pedigreeDamId_CName,
			@RequestParam("pedigreeDamId.pedigreeDamId.privateNo") String pedigreeDamId_pedigreeDamId_privateNo,
			@RequestParam("pedigreeDamId.pedigreeDamId.bbfaNo") String pedigreeDamId_pedigreeDamId_bbfaNo,

	@RequestParam("pedigreeSireId.pedigreeSireId.pedigreeSireId.id") int pedigreeSireId_pedigreeSireId_pedigreeSireId_id,
			@RequestParam("pedigreeSireId.pedigreeSireId.pedigreeSireId.CName") String pedigreeSireId_pedigreeSireId_pedigreeSireId_CName,
			@RequestParam("pedigreeSireId.pedigreeSireId.pedigreeSireId.privateNo") String pedigreeSireId_pedigreeSireId_pedigreeSireId_privateNo,
			@RequestParam("pedigreeSireId.pedigreeSireId.pedigreeSireId.bbfaNo") String pedigreeSireId_pedigreeSireId_pedigreeSireId_bbfaNo,

	@RequestParam("pedigreeSireId.pedigreeSireId.pedigreeDamId.id") int pedigreeSireId_pedigreeSireId_pedigreeDamId_id,
			@RequestParam("pedigreeSireId.pedigreeSireId.pedigreeDamId.CName") String pedigreeSireId_pedigreeSireId_pedigreeDamId_CName,
			@RequestParam("pedigreeSireId.pedigreeSireId.pedigreeDamId.privateNo") String pedigreeSireId_pedigreeSireId_pedigreeDamId_privateNo,
			@RequestParam("pedigreeSireId.pedigreeSireId.pedigreeDamId.bbfaNo") String pedigreeSireId_pedigreeSireId_pedigreeDamId_bbfaNo,

	@RequestParam("pedigreeSireId.pedigreeDamId.pedigreeSireId.id") int pedigreeSireId_pedigreeDamId_pedigreeSireId_id,
			@RequestParam("pedigreeSireId.pedigreeDamId.pedigreeSireId.CName") String pedigreeSireId_pedigreeDamId_pedigreeSireId_CName,
			@RequestParam("pedigreeSireId.pedigreeDamId.pedigreeSireId.privateNo") String pedigreeSireId_pedigreeDamId_pedigreeSireId_privateNo,
			@RequestParam("pedigreeSireId.pedigreeDamId.pedigreeSireId.bbfaNo") String pedigreeSireId_pedigreeDamId_pedigreeSireId_bbfaNo,

	@RequestParam("pedigreeSireId.pedigreeDamId.pedigreeDamId.id") int pedigreeSireId_pedigreeDamId_pedigreeDamId_id,
			@RequestParam("pedigreeSireId.pedigreeDamId.pedigreeDamId.CName") String pedigreeSireId_pedigreeDamId_pedigreeDamId_CName,
			@RequestParam("pedigreeSireId.pedigreeDamId.pedigreeDamId.privateNo") String pedigreeSireId_pedigreeDamId_pedigreeDamId_privateNo,
			@RequestParam("pedigreeSireId.pedigreeDamId.pedigreeDamId.bbfaNo") String pedigreeSireId_pedigreeDamId_pedigreeDamId_bbfaNo,
			
	@RequestParam("pedigreeDamId.pedigreeSireId.pedigreeSireId.id") int pedigreeDamId_pedigreeSireId_pedigreeSireId_id,
			@RequestParam("pedigreeDamId.pedigreeSireId.pedigreeSireId.CName") String pedigreeDamId_pedigreeSireId_pedigreeSireId_CName,
			@RequestParam("pedigreeDamId.pedigreeSireId.pedigreeSireId.privateNo") String pedigreeDamId_pedigreeSireId_pedigreeSireId_privateNo,
			@RequestParam("pedigreeDamId.pedigreeSireId.pedigreeSireId.bbfaNo") String pedigreeDamId_pedigreeSireId_pedigreeSireId_bbfaNo,
			
	@RequestParam("pedigreeDamId.pedigreeSireId.pedigreeDamId.id") int pedigreeDamId_pedigreeSireId_pedigreeDamId_id,
			@RequestParam("pedigreeDamId.pedigreeSireId.pedigreeDamId.CName") String pedigreeDamId_pedigreeSireId_pedigreeDamId_CName,
			@RequestParam("pedigreeDamId.pedigreeSireId.pedigreeDamId.privateNo") String pedigreeDamId_pedigreeSireId_pedigreeDamId_privateNo,
			@RequestParam("pedigreeDamId.pedigreeSireId.pedigreeDamId.bbfaNo") String pedigreeDamId_pedigreeSireId_pedigreeDamId_bbfaNo,
			
	@RequestParam("pedigreeDamId.pedigreeDamId.pedigreeSireId.id") int pedigreeDamId_pedigreeDamId_pedigreeSireId_id,
			@RequestParam("pedigreeDamId.pedigreeDamId.pedigreeSireId.CName") String pedigreeDamId_pedigreeDamId_pedigreeSireId_CName,
			@RequestParam("pedigreeDamId.pedigreeDamId.pedigreeSireId.privateNo") String pedigreeDamId_pedigreeDamId_pedigreeSireId_privateNo,
			@RequestParam("pedigreeSireId.pedigreeDamId.pedigreeSireId.bbfaNo") String pedigreeDamId_pedigreeDamId_pedigreeSireId_bbfaNo,

	@RequestParam("pedigreeDamId.pedigreeDamId.pedigreeDamId.id") int pedigreeDamId_pedigreeDamId_pedigreeDamId_id,
			@RequestParam("pedigreeDamId.pedigreeDamId.pedigreeDamId.CName") String pedigreeDamId_pedigreeDamId_pedigreeDamId_CName,
			@RequestParam("pedigreeDamId.pedigreeDamId.pedigreeDamId.privateNo") String pedigreeDamId_pedigreeDamId_pedigreeDamId_privateNo,
			@RequestParam("pedigreeDamId.pedigreeDamId.pedigreeDamId.bbfaNo") String pedigreeDamId_pedigreeDamId_pedigreeDamId_bbfaNo) {
		// ≈Ÿ°
		Color colorID = colorService.getColor(color);
		Pedigree pedigree = pedigreeService.getPedigree(id);
		pedigree.setSex(sex);
		/*pedigree.getColor().setName(color);;*/
		pedigree.setColor(colorID);
		pedigree.setBreeder(breeder);
		pedigree.setCName(CName);
		pedigree.setPrivateNo(privateNo);
		pedigree.setBbfaNo(bbfaNo);
		pedigree.setOwner(owner);
		pedigree.setBand(band);
		pedigree.setFarmName(farmName);
		pedigree.setOwnerName(ownerName);
		pedigree.setDateDelivery(dateDelivery);
		pedigree.setCalved(calved);
		pedigreeService.edit(pedigree);
		
		
	
		
		// æËÕ
		pedigree = pedigreeService.getPedigree(pedigreeSireId_id);
		pedigree.setCName(pedigreeSireId_CName);
		pedigree.setPrivateNo(pedigreeSireId_privateNo);
		pedigree.setBbfaNo(pedigreeSireId_bbfaNo);
		pedigreeService.edit(pedigree);
		// ·¡Ë
		pedigree = pedigreeService.getPedigree(pedigreeDamId_id);
		pedigree.setCName(pedigreeDamId_CName);
		pedigree.setPrivateNo(pedigreeDamId_privateNo);
		pedigree.setBbfaNo(pedigreeDamId_bbfaNo);
		pedigreeService.edit(pedigree);
		// æËÕ æËÕ
		pedigree = pedigreeService.getPedigree(pedigreeSireId_pedigreeSireId_id);
		pedigree.setCName(pedigreeSireId_pedigreeDamId_CName);
		pedigree.setPrivateNo(pedigreeSireId_pedigreeDamId_privateNo);
		pedigree.setBbfaNo(pedigreeSireId_pedigreeDamId_bbfaNo);
		pedigreeService.edit(pedigree);
		// æËÕ ·¡Ë
		pedigree = pedigreeService.getPedigree(pedigreeSireId_pedigreeDamId_id);
		pedigree.setCName(pedigreeSireId_pedigreeDamId_CName);
		pedigree.setPrivateNo(pedigreeSireId_pedigreeDamId_privateNo);
		pedigree.setBbfaNo(pedigreeSireId_pedigreeDamId_bbfaNo);
		pedigreeService.edit(pedigree);
		// ·¡Ë æËÕ
		pedigree = pedigreeService.getPedigree(pedigreeDamId_pedigreeSireId_id);
		pedigree.setCName(pedigreeDamId_pedigreeSireId_CName);
		pedigree.setPrivateNo(pedigreeDamId_pedigreeSireId_privateNo);
		pedigree.setBbfaNo(pedigreeDamId_pedigreeSireId_bbfaNo);
		pedigreeService.edit(pedigree);
		// ·¡Ë ·¡Ë
		pedigree = pedigreeService.getPedigree(pedigreeDamId_pedigreeDamId_id);
		pedigree.setCName(pedigreeDamId_pedigreeDamId_CName);
		pedigree.setPrivateNo(pedigreeDamId_pedigreeDamId_privateNo);
		pedigree.setBbfaNo(pedigreeDamId_pedigreeDamId_bbfaNo);
		pedigreeService.edit(pedigree);
		// æËÕ æËÕ æËÕ
		pedigree = pedigreeService.getPedigree(pedigreeSireId_pedigreeSireId_pedigreeSireId_id);
		pedigree.setCName(pedigreeSireId_pedigreeSireId_pedigreeSireId_CName);
		pedigree.setPrivateNo(pedigreeSireId_pedigreeSireId_pedigreeSireId_privateNo);
		pedigree.setBbfaNo(pedigreeSireId_pedigreeSireId_pedigreeSireId_bbfaNo);
		pedigreeService.edit(pedigree);
		// æËÕ æËÕ ·¡Ë
		pedigree = pedigreeService.getPedigree(pedigreeSireId_pedigreeSireId_pedigreeDamId_id);
		pedigree.setCName(pedigreeSireId_pedigreeSireId_pedigreeDamId_CName);
		pedigree.setPrivateNo(pedigreeSireId_pedigreeSireId_pedigreeDamId_privateNo);
		pedigree.setBbfaNo(pedigreeSireId_pedigreeSireId_pedigreeDamId_bbfaNo);
		pedigreeService.edit(pedigree);
		// æËÕ ·¡Ë æËÕ
		pedigree = pedigreeService.getPedigree(pedigreeSireId_pedigreeDamId_pedigreeSireId_id);
		pedigree.setCName(pedigreeSireId_pedigreeDamId_pedigreeSireId_CName);
		pedigree.setPrivateNo(pedigreeSireId_pedigreeDamId_pedigreeSireId_privateNo);
		pedigree.setBbfaNo(pedigreeSireId_pedigreeDamId_pedigreeSireId_bbfaNo);
		pedigreeService.edit(pedigree);
		// æËÕ ·¡Ë ·¡Ë
		pedigree = pedigreeService.getPedigree(pedigreeSireId_pedigreeDamId_pedigreeDamId_id);
		pedigree.setCName(pedigreeSireId_pedigreeDamId_pedigreeDamId_CName);
		pedigree.setPrivateNo(pedigreeSireId_pedigreeDamId_pedigreeDamId_privateNo);
		pedigree.setBbfaNo(pedigreeSireId_pedigreeDamId_pedigreeDamId_bbfaNo);
		pedigreeService.edit(pedigree);
		// ·¡Ë æËÕ æËÕ
		pedigree = pedigreeService.getPedigree(pedigreeDamId_pedigreeSireId_pedigreeSireId_id);
		pedigree.setCName(pedigreeDamId_pedigreeSireId_pedigreeSireId_CName);
		pedigree.setPrivateNo(pedigreeDamId_pedigreeSireId_pedigreeSireId_privateNo);
		pedigree.setBbfaNo(pedigreeDamId_pedigreeSireId_pedigreeSireId_bbfaNo);
		pedigreeService.edit(pedigree);
		// ·¡Ë æËÕ ·¡Ë
		pedigree = pedigreeService.getPedigree(pedigreeDamId_pedigreeSireId_pedigreeDamId_id);
		pedigree.setCName(pedigreeDamId_pedigreeSireId_pedigreeDamId_CName);
		pedigree.setPrivateNo(pedigreeDamId_pedigreeSireId_pedigreeDamId_privateNo);
		pedigree.setBbfaNo(pedigreeDamId_pedigreeSireId_pedigreeDamId_bbfaNo);
		pedigreeService.edit(pedigree);
		// ·¡Ë ·¡Ë æËÕ
		pedigree = pedigreeService.getPedigree(pedigreeDamId_pedigreeDamId_pedigreeSireId_id);
		pedigree.setCName(pedigreeDamId_pedigreeDamId_pedigreeSireId_CName);
		pedigree.setPrivateNo(pedigreeDamId_pedigreeDamId_pedigreeSireId_privateNo);
		pedigree.setBbfaNo(pedigreeDamId_pedigreeDamId_pedigreeSireId_bbfaNo);
		pedigreeService.edit(pedigree);
		// ·¡Ë ·¡Ë ·¡Ë
		pedigree = pedigreeService.getPedigree(pedigreeDamId_pedigreeDamId_pedigreeDamId_id);
		pedigree.setCName(pedigreeDamId_pedigreeDamId_pedigreeDamId_CName);
		pedigree.setPrivateNo(pedigreeDamId_pedigreeDamId_pedigreeDamId_privateNo);
		pedigree.setBbfaNo(pedigreeDamId_pedigreeDamId_pedigreeDamId_bbfaNo);
		pedigreeService.edit(pedigree);

		return "ok";
	}

}
