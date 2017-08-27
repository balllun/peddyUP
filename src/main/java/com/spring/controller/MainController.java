package com.spring.controller;

import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.model.SearchDate;
import com.spring.model.Color;
import com.spring.model.Data;
import com.spring.model.Pedigree;
import com.spring.model.PedigreeType;
import com.spring.model.Pedigrees;
import com.spring.model.Privilege;
import com.spring.model.Report;
import com.spring.model.Users;
import com.spring.service.BankService;
import com.spring.service.ColorService;
import com.spring.service.DataService;
import com.spring.service.PedigreeService;
import com.spring.service.PrivilegeService;
import com.spring.service.ReportService;
import com.spring.service.UsersService;
import com.spring.service.PedigreeTypeService;
import com.spring.model.Bank;
import com.spring.model.Data;
import com.spring.dao.UsersDao;

@Controller
public class MainController {

	@Autowired
	private ColorService colorService;

	@Autowired
	private BankService bankService;

	@Autowired
	private UsersService usersService;

	@Autowired
	private PedigreeService pedigreeService;

	@Autowired
	private DataService dataService;
	
	@Autowired
	private ReportService reportService;

	@Autowired
	private PedigreeTypeService pedigreeTypeService;

	@Autowired
	private PrivilegeService privilegeService;

	
	List<Report> reports = null;
	List<Report> reportsprint = null;

	@RequestMapping(value = "/hello/{name:.+}", method = RequestMethod.GET)
	public ModelAndView hello(@PathVariable("name") String name) {


		ModelAndView model = new ModelAndView();
		model.setViewName("index");
		model.addObject("name", name);

		return model;

	}

	@RequestMapping(value = "/")
	public ModelAndView welcome() {

		ModelAndView model = new ModelAndView();
		model.setViewName("index");

		return model;

	}

	@RequestMapping(value = "index")
	public ModelAndView index() {

		ModelAndView model = new ModelAndView();
		model.setViewName("index");

		return model;

	}
	
	
	@RequestMapping(value = "/login")
	public ModelAndView login() {

		ModelAndView model = new ModelAndView();
		model.setViewName("login");

		return model;

	}

	// แสดงห้นาสถานะ
	/*
	 * @RequestMapping("/Privilege") public String
	 * setupFormPrivilege(Map<String, Object> map){ Privilege privilege = new
	 * Privilege(); map.put("privilege", privilege); map.put("privilegeList",
	 * privilegeService.getAllPrivilege()); //return
	 * "redirect:/edit/privilege/index"; return "privilege"; }
	 * 
	 * @RequestMapping(value="/Privilege.do", method=RequestMethod.POST) public
	 * String doActions(@ModelAttribute Privilege privilege, BindingResult
	 * result, @RequestParam String action, Map<String, Object> map){ Privilege
	 * privilegeResult = new Privilege(); switch(action.toLowerCase()){ //only
	 * in Java7 you can put String in switch case "add":
	 * privilegeService.add(privilege); privilegeResult = privilege; break; case
	 * "edit": privilegeService.edit(privilege); privilegeResult = privilege;
	 * break; case "delete": privilegeService.delete(privilege.getId());
	 * privilegeResult = new Privilege(); break; case "search": Privilege
	 * searchedPrivilege = privilegeService.getPrivilege(privilege.getId());
	 * privilegeResult = searchedPrivilege!=null ? searchedPrivilege : new
	 * Privilege(); break; } map.put("privilege", privilegeResult);
	 * map.put("privilegeList", privilegeService.getAllPrivilege()); return
	 * "privilege"; }
	 */

	// แสดงหน้าสมัครสมาชิก
	@RequestMapping(value = "register")
	public String setupFormRegister(Map<String, Object> map) {
		Data data = new Data();
		map.put("data", data);
		map.put("dataList", dataService.getAllData());
		map.put("privilegeList", getPrivilege() );
		// return "redirect:/edit/data/index";
		return "register";
	}

	
	//Map หน้าสมัครสมาชิกส่วนแสดงให้เลือกสถานะ Admin,User
	public Map<String, String> getPrivilege(){
		Map<String, String> map = new HashMap<String, String>();
		List<Privilege> privileges = privilegeService.getAllPrivilege();
		for(Privilege privilege : privileges){
			map.put(privilege.getId()+"", privilege.getStatus());
		}
		
		return map;
	}
	
	@RequestMapping(value = "/register.do", method = RequestMethod.POST)
	public String doActions(@ModelAttribute Data data, BindingResult result, @RequestParam String action,
			Map<String, Object> map) {
		Data dataResult = new Data();
		switch (action.toLowerCase()) { // only in Java7 you can put String in
										// switch
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
			dataResult = searchedData != null ? searchedData : new Data();
			break;
		}
		map.put("data", dataResult);
		map.put("dataList", dataService.getAllData());
		return "register";
	}

	// แสดงตารางเพิ่มสายพันธุ์ในหน้าตั้งค่า
	@RequestMapping(value = "listGene")
	public String showGene(Map<String, Object> map) {
		map.put("pedigreeTypeList", pedigreeTypeService.getAllPedigreeType());
		return "listGene";
	}

	// แสดงตารางเพิ่มสีในหน้าตั้งค่า
	@RequestMapping(value = "listColor")
	public String showColor(Map<String, Object> map) {
		map.put("colorList", colorService.getAllColor());
		return "listColor";
	}

	// แสดงตารางเพิ่มธนาคารในหน้าตั้งค่า
	@RequestMapping(value = "listBank")
	public String showBank(Map<String, Object> map) {
		map.put("bankList", bankService.getAllBank());
		return "listBank";
	}

	// แสดงหน้าการตั้งค่า
	@RequestMapping(value = "Banking")
	public String setupForms(Map<String, Object> map) {
		Color color = new Color();
		map.put("color", color);
		map.put("colorList", colorService.getAllColor());

		Bank bank = new Bank();
		map.put("bank", bank);
		map.put("bankList", bankService.getAllBank());

		PedigreeType pedigreeType = new PedigreeType();
		map.put("pedigreeType", pedigreeType);
		map.put("pedigreeTypeList", pedigreeTypeService.getAllPedigreeType());
		// return "redirect:/edit/color/index";
		return "Banking";
	}

	@RequestMapping(value = "Banking.do", method = RequestMethod.POST)
	public String doActions(@ModelAttribute Color color, BindingResult result, @RequestParam String action,
			Map<String, Object> map) {
		Color colorResult = new Color();
		switch (action.toLowerCase()) { // only in Java7 you can put String in
										// switch
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
			colorResult = searchedColor != null ? searchedColor : new Color();
			break;
		}
		map.put("color", colorResult);
		map.put("colorList", colorService.getAllColor());
		return "Banking";
	}

	// กดลบสายพันธุ์
	@RequestMapping(value = "cancelgene")
	public String cancelgene(@RequestParam("id") int id) {
		pedigreeTypeService.delete(id);

		return "listGene";
	}

	// กดลบสี
	@RequestMapping(value = "cancel")
	public String cancel(@RequestParam("id") int id) {
		colorService.delete(id);

		return "listColor";
	}

	// กดลบธนาคาร
	@RequestMapping(value = "cancelbank")
	public String cancelbank(@RequestParam("id") int id) {
		bankService.delete(id);

		return "listBank";
	}
	
	
	
	// กดลบสี
	@RequestMapping(value = "canceluser")
	public String canceluser(@RequestParam("id") int id) {
		dataService.delete(id);

		return "Manage";
	}

	// แสดงหน้ารายละเอียดพันธุ์ประวัติ
	@RequestMapping(value = "Detail")
	public String setupForm3(Map<String, Object> map) {
		Pedigree pedigree = new Pedigree();
		map.put("pedigree", pedigree);
		map.put("colorList", getColorList());
		map.put("usersList", getUsersList());
		map.put("pedigree1List", getPedigreeList());
		map.put("pedigreeTypeList", getPedigreeTypeList());
		map.put("pedigreeList", pedigreeService.getAllPedigree());
		// return "redirect:/edit/pedigree/index";
		return "Detail";
	}

	@RequestMapping(value = "/Detail.do", method = RequestMethod.POST)
	public String doActions(@ModelAttribute Pedigree pedigree, BindingResult result, @RequestParam String action,
			Map<String, Object> map) {
		Pedigree pedigreeResult = new Pedigree();
		switch (action.toLowerCase()) { // only in Java7 you can put String in
										// switch
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
			pedigreeResult = searchedPedigree != null ? searchedPedigree : new Pedigree();
			break;
		}
		map.put("pedigree", pedigreeResult);
		map.put("pedigreeList", pedigreeService.getAllPedigree());
		map.put("colorList", getColorList());
		map.put("usersList", getUsersList());
		map.put("pedigree1List", getPedigreeList());
		map.put("pedigreeTypeList", getPedigreeTypeList());
		return "redirect:/Detail";
	}

	@RequestMapping(value = "Graph")
	public ModelAndView Graph() {

		ModelAndView model = new ModelAndView();
		model.setViewName("Graph");

		return model;

	}

	@RequestMapping(value = "autocomplete")
	public String autocomplete(Map<String, Object> map) {
		Pedigree pedigree = new Pedigree();
		map.put("pedigree", pedigree);
		map.put("colorList", getColorList());
		map.put("usersList", getUsersList());
		map.put("pedigree1List", getPedigreeList());
		map.put("pedigreeTypeList", getPedigreeTypeList());
		map.put("pedigreeList", pedigreeService.getAllPedigree());
		// return "redirect:/edit/pedigree/index";
		return "autocomplete";
	}
	@RequestMapping(value = "/record.do", method = RequestMethod.POST)
	public String doActionsautocomplete(@ModelAttribute Pedigree pedigree, BindingResult result, @RequestParam String action, Map<String, Object> map){
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
		return "autocomplete";
	}
	
	// แสดงหน้าการจัดการผู้ใช้งาน
	@RequestMapping(value = "Manage")
	public String setupForm1(Map<String, Object> map) {
		Data data = new Data();
		map.put("data", data);
		map.put("dataList", dataService.getAllData());
		map.put("bankList", bankService.getAllBank());
		map.put("privilegeList", privilegeService.getAllPrivilege());
		// return "redirect:/edit/data/index";
		return "Manage";
	}


	public ModelAndView Manage() {

		ModelAndView model = new ModelAndView();
		model.setViewName("Manage");

		return model;

	}

	@RequestMapping(value = "Printing")
	public ModelAndView Printing(Map<String, Object> map) {
		map.put("pedigree", new Pedigree());
		ModelAndView model = new ModelAndView();
		model.setViewName("Printing");

		return model;

	}
	
	@RequestMapping(value = "Print")
	public ModelAndView Print(Map<String, Object> map) {
		map.put("pedigree", new Pedigree());
		ModelAndView model = new ModelAndView();
		model.setViewName("Print");

		return model;

	}
//แสดงหน้าการบันทึกพันธุ์ประวัติ
	@RequestMapping(value = "record")
	public String setupForm2(Map<String, Object> map) {
		Pedigree pedigree = new Pedigree();
		map.put("pedigree", pedigree);
		map.put("colorList", getColorList());
		map.put("usersList", getUsersList());
		map.put("pedigree1List", getPedigreeList());
		map.put("pedigreeTypeList", getPedigreeTypeList());
		
		//ให้เลือกสายพันธุในสามชั่วรุ่นพ่อแม่
		map.put("pedigreeTypeList1", pedigreeTypeService.getAllPedigreeType());
		map.put("pedigreeList", pedigreeService.getAllPedigree());

		return "record";
	}

	
	//ฟังก์ชันการบันทึกพันธุ์ประวัติโค
	@ResponseBody
	@RequestMapping(value = "/addCow")
	public String doAct(@ModelAttribute(value = "pedigree") Pedigree pedigree, BindingResult resultpedigree,HttpSession session) {
		int iduser= (int) session.getAttribute("iduser");
		/*Pedigree pedigree = new Pedigree();*/
		pedigree.setUsersByUsersUserId(usersService.getUsers(iduser));
		pedigreeService.add(pedigree);

		return pedigree.getId()+"";
	}

	@RequestMapping(value = "/record.do", method = RequestMethod.POST)
	public String doActions1(@ModelAttribute Pedigrees pedigrees, BindingResult result, @RequestParam String action,
			Map<String, Object> map) {
		Pedigree pedigreeResult = new Pedigree();

		switch (action.toLowerCase()) { // only in Java7 you can put String in
										// switch
		case "add":
			for (Pedigree pedigree : pedigrees.getPedigrees()) {

				pedigreeService.add(pedigree);
			}
			;
			/* pedigreeResult = pedigree; */
			break;
		/*
		 * case "edit": pedigreeService.edit(pedigree); pedigreeResult =
		 * pedigree; break; case "delete":
		 * pedigreeService.delete(pedigree.getId()); pedigreeResult = new
		 * Pedigree(); break; case "search": Pedigree searchedPedigree =
		 * pedigreeService.getPedigree(pedigree.getId()); pedigreeResult =
		 * searchedPedigree != null ? searchedPedigree : new Pedigree(); break;
		 */
		}
		map.put("pedigree", pedigreeResult);
		map.put("pedigreeList", pedigreeService.getAllPedigree());
		map.put("colorList", getColorList());
		map.put("usersList", getUsersList());
		map.put("pedigree1List", getPedigreeList());
		map.put("pedigreeTypeList", getPedigreeTypeList());
		return "record";
	}

	@SuppressWarnings("unchecked")
	private Map<String, String> getColorList() {
		Map<String, String> colorMap = new HashMap<String, String>();
		List<Color> colorList = colorService.getAllColor();
		for (Color color : colorList) {
			colorMap.put(color.getId() + "", color.getName());
		}

		return colorMap;
	}

	@SuppressWarnings("unchecked")
	private Map<String, String> getUsersList() {
		Map<String, String> usersMap = new HashMap<String, String>();
		List<Users> usersList = usersService.getAllUsers();
		for (Users users : usersList) {
			usersMap.put(users.getId() + "", users.getUsername());
		}

		return usersMap;
	}

	@SuppressWarnings("unchecked")
	private Map<String, String> getPedigreeTypeList() {
		Map<String, String> pedigreeTypeMap = new HashMap<String, String>();
		List<PedigreeType> pedigreeTypeList = pedigreeTypeService.getAllPedigreeType();
		for (PedigreeType pedigreeType : pedigreeTypeList) {
			pedigreeTypeMap.put(pedigreeType.getId() + "", pedigreeType.getGene()+" : "+pedigreeType.getType());
		}

		return pedigreeTypeMap;
	}

	@SuppressWarnings("unchecked")
	private Map<String, String> getPedigreeList() {
		Map<String, String> pedigreeMap = new HashMap<String, String>();
		List<Pedigree> pedigreeList = pedigreeService.getAllPedigree();
		for (Pedigree pedigree : pedigreeList) {
			pedigreeMap.put(pedigree.getId() + "", pedigree.getCName());
		}

		return pedigreeMap;
	}
	
	
	
	//หน้าคำนวณสายเลือด
	@RequestMapping(value = "Calc")
	public String Calc(Map<String, Object> map) {
		Pedigree pedigree = new Pedigree();
		map.put("pedigree", pedigree);
		map.put("pedigreeList", pedigreeService.getAllPedigree());
		return "Calc";
	}

	/*
	 * public ModelAndView Search() {
	 * 
	 * ModelAndView model = new ModelAndView(); model.setViewName("Search");
	 * 
	 * return model; }
	 */
	
	//หน้าค้นหาโค
	@RequestMapping(value = "listSearch")
	public String show2(Map<String, Object> map) {
		map.put("pedigreeList", pedigreeService.getAllPedigree());
		return "listSearch";
	}
	
	//หน้าค้นหาโค(ออกรายงาน)
	@RequestMapping(value = "listSearch2")
	public String allreportlistsearch(Map<String, Object> map) {
		map.put("pedigreeList", pedigreeService.getAllPedigree());
		return "listSearch2";
	}
	
	//หน้าแสดงรายละเอียด
	@RequestMapping(value = "listDetail")
	public String showdetail(Map<String, Object> map) {
		map.put("pedigreeList", pedigreeService.getAllPedigree());
		return "listDetail";
	}
	
	//หน้าแสดงรายละเอียด(ออกรายงาน)
	@RequestMapping(value = "listDetail2")
	public String allreportlistdetail(Map<String, Object> map) {
		map.put("pedigreeList", pedigreeService.getAllPedigree());
		return "listDetail2";
	}
	
	   @RequestMapping(value = "/ped",method =  RequestMethod.GET)
	    public String ped (Map<String,Object>model)   {
		   
		   
		   
		   
		   
		   
		   
		   
		   
		   
		   return "ped";}
	
	
	
//แสดงหน้าการค้นหาโค
	@RequestMapping(value = "Search")
	public String setupForm(Map<String, Object> map) {
		Pedigree pedigree = new Pedigree();
		map.put("pedigree", pedigree);
		/*
		 * map.put("colorList", getColorList()); map.put("usersList",
		 * getUsersList()); map.put("pedigreeTypeList", getPedigreeTypeList());
		 */
		map.put("pedigreeList", pedigreeService.getAllPedigree());
		// return "redirect:/edit/pedigree/index";
		return "Search";
	}

	@RequestMapping(value = "/Search.do", method = RequestMethod.POST)
	public String doActions2(@ModelAttribute Pedigree pedigree, BindingResult result, @RequestParam String action,
			Map<String, Object> map) {
		Pedigree pedigreeResult = new Pedigree();
		switch (action.toLowerCase()) { // only in Java7 you can put String in
										// switch
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
			pedigreeResult = searchedPedigree != null ? searchedPedigree : new Pedigree();
			break;
		}
		map.put("pedigree", pedigreeResult);
		map.put("pedigreeList", pedigreeService.getAllPedigree());
		/*
		 * map.put("colorList", getColorList()); map.put("usersList",
		 * getUsersList()); map.put("pedigreeTypeList", getPedigreeTypeList());
		 */
		return "redirect:/Search";
	}

	//ค้นหาแบบ like ในหน้า search
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "lsearch")
	public String search(@RequestParam("id") int id, @RequestParam("value") String value, Map<String, Object> map) {
		Pedigree pedigree =new Pedigree();
		if (id == 1) {
			pedigree.setCName(value);
			map.put("pedigreeList", pedigreeService.getAllPedigree(pedigree));
		}else if (id == 0) {
			map.put("pedigreeList", pedigreeService.getAllPedigree());
		}else if (id == 2) {
			pedigree.setPrivateNo(value);
			map.put("pedigreeList", pedigreeService.getAllPedigree(pedigree));
		}else if (id == 3) {
			pedigree.setSex(value);
			map.put("pedigreeList", pedigreeService.getAllPedigree(pedigree));
		}else if (id == 4) {
			pedigree.setOwnerName(value);
			map.put("pedigreeList", pedigreeService.getAllPedigree(pedigree));
		}
		
		return "../pages/listSearch";
	}
	
	
	
	//ค้นหาแบบ like ในหน้า AllReport
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "lsearch2")
	public String allreportsearch(@RequestParam("id") int id, @RequestParam("value") String value, Map<String, Object> map) {
		Pedigree pedigree =new Pedigree();
		if (id == 1) {
			pedigree.setCName(value);
			map.put("pedigreeList", pedigreeService.getAllPedigree(pedigree));
		}else if (id == 0) {
			map.put("pedigreeList", pedigreeService.getAllPedigree());
		}else if (id == 2) {
			pedigree.setPrivateNo(value);
			map.put("pedigreeList", pedigreeService.getAllPedigree(pedigree));
		}else if (id == 3) {
			pedigree.setSex(value);
			map.put("pedigreeList", pedigreeService.getAllPedigree(pedigree));
		}else if (id == 4) {
			pedigree.setOwnerName(value);
			map.put("pedigreeList", pedigreeService.getAllPedigree(pedigree));
		}
		
		return "../pages/listSearch2";
	}
	
	
	//แสดงหน้ารายละเอียดการออกใบพันธุ์ประวัติ
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "ldetail")
	public String searchdetail(@RequestParam("value1") String value1, @RequestParam("value2") String value2, Map<String, Object> map) throws ParseException {
	SearchDate search = new SearchDate();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd", new Locale("en","EN"));
		Date d1 = formatter.parse(value1);
		Date d2 = formatter.parse(value2);
		search.setDate1(d1);
		search.setDate2(d2);
		reports = reportService.getAllReportSh(search);
		map.put("reportList", reports);

		return "../pages/listDetail";
	}
	
	
	//แสดงหน้ารายละเอียดการออกใบพันธุ์ประวัติ(ออกรายงาน)
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "ldetail2")
	public String allreportdetail(@RequestParam("value1") String value1, @RequestParam("value2") String value2, Map<String, Object> map) throws ParseException {
	SearchDate search = new SearchDate();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd", new Locale("en","EN"));
		Date d1 = formatter.parse(value1);
		Date d2 = formatter.parse(value2);
		search.setDate1(d1);
		search.setDate2(d2);
		reportsprint = reportService.getAllReportSh(search);
		map.put("reportList", reportsprint);

		return "../pages/listDetail2";
	}
	
	
	
	
	//หน้ารวมออกรายงาน
		@RequestMapping(value = "AllReport")
		public String AllReport(Map<String, Object> map) {
			Pedigree pedigree = new Pedigree();
			map.put("pedigree", pedigree);
			map.put("pedigreeList", pedigreeService.getAllPedigree());
			return "AllReport";
		}
		
		// แสดงหน้ารายละเอียดพันธุ์ประวัติ
		@RequestMapping(value = "AllReport2")
		public String AllReport2(Map<String, Object> map) {
			Pedigree pedigree = new Pedigree();
			map.put("pedigree", pedigree);
			map.put("colorList", getColorList());
			map.put("usersList", getUsersList());
			map.put("pedigree1List", getPedigreeList());
			map.put("pedigreeTypeList", getPedigreeTypeList());
			map.put("pedigreeList", pedigreeService.getAllPedigree());
			return "AllReport2";
		}

	// ส่งไอดีโคไปหน้าแสดงการพิมพ์ และกดพิมพ์เพื่อส่งค่านไอดีในหน้า Printing
	@RequestMapping(value = "Printing={id}")
	public String viewp(@PathVariable("id") int id, Map<String, Object> map) {
		map.put("pedigree", pedigreeService.getPedigree(id));
		map.put("bankList", getBank() );
		map.put("colorList", colorService.getAllColor());
		map.put("pedigreeTypeList", pedigreeTypeService.getAllPedigreeType());
		if(pedigreeService.getPedigree(id).getPedigreeType()!=null){
	String s =  pedigreeService.getPedigree(id).getPedigreeType().getGene();
		map.put("pedee",s );
		}
		map.put("id",id );
		return "Printing";
	}
	
	
	@RequestMapping(value = "Print={id}")
	public String viewprint(@PathVariable("id") int id, Map<String, Object> map) {
		map.put("pedigree", pedigreeService.getPedigree(id));
		map.put("bankList", bankService.getAllBank());
		map.put("colorList", colorService.getAllColor());
		map.put("pedigreeTypeList", pedigreeTypeService.getAllPedigreeType());
		if(pedigreeService.getPedigree(id).getPedigreeType()!=null){
	String s =  pedigreeService.getPedigree(id).getPedigreeType().getGene();
		map.put("pedee",s );
		}
		map.put("id",id );
		return "Print";
	}
	
	

	
	public Map<String, String> getBank(){
		Map<String, String> map = new HashMap<String, String>();
		List<Bank> banks = bankService.getAllBank();
		for(Bank bank  : banks){
			map.put(bank.getId()+"", bank.getName());
		}
		
		return map;
	}
	


	//ลบโคในหน้าค้นหา
	@RequestMapping(value = "cancelsearch")
	public String cancelSearch(@RequestParam("id") int id) {
		pedigreeService.delete(id);

		return "listSearch";
	}

	// ไว้เปลี่ยนชื่อสมาคม BFA No.
	@RequestMapping(value = "name")
	public String name(@RequestParam("id") int id, Map<String, Object> map) {
		map.put("name", pedigreeTypeService.getPedigreeType(id).getDef());

		return "name";
	}
	
	
	//เช๊ค login 
		@Autowired UsersDao usersDao;
		@RequestMapping("Checking")
		public String Checking(Principal principal,HttpSession session){
			String username = principal.getName();
			Users users = usersDao.getUserByUsername(username);
			session.setAttribute("iddata", users.getData().getId());
			session.setAttribute("iduser", users.getId());
			Privilege privilege = users.getPrivilege();
			String url="";
			if((privilege.getStatus()).equals("Admin")){
				url = "redirect:/record";
			}else if((privilege.getStatus()).equals("User")){
				url = "redirect:/Search";
			}
			return url;
		}

		@SuppressWarnings("unchecked")
		@RequestMapping(value="pedigreereport/report_detail")
		public String reportdetail(Map<String, Object> map){
			int i = 1;
			List<Map<String, ?>> list = new ArrayList<Map<String, ?>>();
			
			for (Report report : reports ) {
				
				Map<String, Object> r = new HashMap<String, Object>();
				r.put("numi", i);
				r.put("iddetail", report.getId());
			    r.put("datedetail",report.getDate());
				r.put("cnamedetail",report.getPedigreeId().getCName());
				
				r.put("bankdetail",report.getBank().getName()); 
				// r.put("dataId",report.getDataId());

				list.add(r);
				i++;
			}
			map.put("list",list);
			return "pedigreereport/report_detail";
		}
		
		
		@SuppressWarnings("unchecked")
		@RequestMapping(value="pedigreereport/report_detail2")
		public String reportdetailprint(Map<String, Object> map){
			int i = 1;
			List<Map<String, ?>> list = new ArrayList<Map<String, ?>>();
			if(reportsprint != null){
			for (Report report : reportsprint ) {
				Map<String, Object> r = new HashMap<String, Object>();
				r.put("numi", i);
				r.put("iddetail", report.getId());
			    r.put("datedetail",report.getDate());
				r.put("cnamedetail",report.getPedigreeId().getCName());
				r.put("bankdetail",report.getDataId().getFName()); 
				r.put("bfadetail",report.getPedigreeId().getBbfaNo());
				r.put("ownernamedetail",report.getPedigreeId().getOwnerName());
				r.put("pricedetail",report.getPedigreeId().getPedigreeType().getPrice());
				r.put("paydetail",report.getPedigreeId().getPay());
				list.add(r);
				i++;
			}
		}else {
			String url="";
			url = "redirect:/AllReport2";
		}
			map.put("list",list);
			return "pedigreereport/report_detail";
		}


}