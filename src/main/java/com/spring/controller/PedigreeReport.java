package com.spring.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.model.Pedigree;
import com.spring.model.Report;
import com.spring.service.BankService;
import com.spring.service.DataService;
import com.spring.service.PedigreeService;
import com.spring.service.ReportService;

@Controller
public class PedigreeReport {
	@Autowired
	private ReportService reportService;

	@Autowired
	private PedigreeService pedigreeService;

	@Autowired
	private DataService dataService;
	
	@Autowired
	private BankService bankService;
	
	//Global List
	List<Report> reports = null;
	
/*	@SuppressWarnings("unchecked")
	@RequestMapping(value="product/reports/report_leg")
	public String reportleg(Map<String, Object> map){
		Date date = null;
		List<Map<String, ?>> list = new ArrayList<Map<String, ?>>();
		
		//List<Leg> legs =reportLeg;
		int i =0,n = 0,j=0;
		Double  SumWeight = 0.0;
		String dis=null, Sweight = null, run= null, weightcool = null;
		for(Leg leg : reportLeg){
			Map<String, Object> m  = new HashMap<String, Object>();
			n++;
			if(n != 2){
			m.put("barcodeCarcass", leg.getCarcassId().getBarcode());
			m.put("typeCarcass", leg.getCarcassId().getTypemeetId().getSubtype());
			weightcool = String.valueOf(leg.getCarcassId().getWeightCool());
			m.put("weightcool", weightcool);
			m.put("barcode", leg.getBarcode());
			m.put("typemeet", leg.getTypemeetId().getSubtype());
			m.put("weight", leg.getWeight());
			SumWeight += leg.getWeight();
			run = String.valueOf(++i);
			m.put("num",run);
			m.put("dis","");
			m.put("SumWeight","");
			}else{
				m.put("barcodeCarcass","");
				m.put("typeCarcass","");
				m.put("weightcool", "");
				m.put("barcode", leg.getBarcode());
				m.put("typemeet", leg.getTypemeetId().getSubtype());
				m.put("weight", leg.getWeight());
				SumWeight += leg.getWeight();
				dis = String.valueOf(leg.getCarcassId().getWeightCool() - SumWeight);
				m.put("dis",dis);
				Sweight = String.valueOf(SumWeight);
				m.put("SumWeight",Sweight);
				m.put("num","");
				n=0;
				SumWeight = 0.0;
			}
			list.add(m);
			
		}
		Format formatshow = new SimpleDateFormat("dd MMMM yyyy",new Locale("th","TH"));
		String DateSt = formatshow.format(DateStart);
		String DateEn = formatshow.format(DateEnd);
		
		map.put("DateStart", DateSt);
		map.put("DateEnd", DateEn);
		map.put("result", i);
		map.put("list",list);
		return "product/reports/report_leg";
	}*/
	
	
	
	
	
	
	
	
	@RequestMapping(value = "ReportBeefMasterPrinting")
	public String viewp(@RequestParam("id") int id, Map<String, Object> map,HttpSession session,@RequestParam("bank") int bank) {
		Pedigree pedigree = pedigreeService.getPedigree(id);
		int iddata= (int) session.getAttribute("iddata");
		Report report = new Report();
		report.setDate(new Date());
		report.setDataId(dataService.getData(iddata));
		report.setPedigreeId(pedigree);
		report.setBank(bankService.getBank(bank));
		reportService.add(report);
		if (pedigree.getSex() != null) {
			map.put("sex", pedigree.getSex());
		} else {
			map.put("sex", "-");
		}
		if (pedigree.getCName() != null) {
			map.put("cname", pedigree.getCName());
		} else {
			map.put("cname", "-");
		}
		if (pedigree.getColor() != null) {
			map.put("color", pedigree.getColor().getName());
		} else {
			map.put("color", "-");
		}
		if (pedigree.getBbfaNo() != null) {
			map.put("bfa", pedigree.getBbfaNo());
		} else {
			map.put("bfa", "-");
		}
		if (pedigree.getPrivateNo() != null) {
			map.put("privateNo", pedigree.getPrivateNo());
		} else {
			map.put("privateNo", "-");
		}
		if (pedigree.getBand() != null) {
			map.put("band", pedigree.getBand());
		} else {
			map.put("band", "-");
		}
		if (pedigree.getBreeder() != null) {
			map.put("breeder", pedigree.getBreeder());
		} else {
			map.put("breeder", "-");
		}
		if (pedigree.getOwnerName() != null) {
			map.put("ownerName", pedigree.getOwnerName());
		} else {
			map.put("ownerName", "-");
		}
		if (pedigree.getDateDelivery() != null) {
			map.put("dateDelivery", pedigree.getDateDelivery());
		} else {
			map.put("dateDelivery", "-");
		}
		if (pedigree.getCalved() != null) {
			map.put("calved", pedigree.getCalved());
		} else {
			map.put("calved", "-");
		}
		// ÃØè¹¾èÍáÁè BeefMaster
		if (pedigree.getPedigreesireid() != null) {
			map.put("sire", pedigree.getPedigreesireid().getCName());
			map.put("sireprivate", pedigree.getPedigreesireid().getPrivateNo());
			map.put("sirebfa", pedigree.getPedigreesireid().getBbfaNo());
		} else {
			map.put("sire", "-");
			map.put("sireprivate", "");
			map.put("sirebfa", "");
		}
		if (pedigree.getPedigreedamid() != null) {
			map.put("dam", pedigree.getPedigreedamid().getCName());
			map.put("damprivate", pedigree.getPedigreedamid().getPrivateNo());
			map.put("dambfa", pedigree.getPedigreedamid().getBbfaNo());
		} else {
			map.put("dam", "-");
			map.put("damprivate", "");
			map.put("dambfa", "");
		}
		// ÃØè¹»Ùè ÂèÒ µÒ ÂÒÂ BeefMaster
		if (pedigree.getPedigreesireid() != null) {
			if (pedigree.getPedigreesireid().getPedigreesireid() != null) {
				map.put("grandpa", pedigree.getPedigreesireid().getPedigreesireid().getCName());
				map.put("grandpaprivate", pedigree.getPedigreesireid().getPedigreesireid().getPrivateNo());
				map.put("grandpabfa", pedigree.getPedigreesireid().getPedigreesireid().getBbfaNo());
			} else {
				map.put("grandpa", "-");
				map.put("grandpaprivate", "");
				map.put("grandpabfa", "");
			}
		} else {
			map.put("grandpa", "-");
			map.put("grandpaprivate", "");
			map.put("grandpabfa", "");
		}
		if (pedigree.getPedigreesireid() != null) {
			if (pedigree.getPedigreesireid().getPedigreedamid() != null) {
				map.put("grandmama", pedigree.getPedigreesireid().getPedigreedamid().getCName());
				map.put("grandmamaprivate", pedigree.getPedigreesireid().getPedigreedamid().getPrivateNo());
				map.put("grandmamabfa", pedigree.getPedigreesireid().getPedigreedamid().getBbfaNo());
			} else {
				map.put("grandmama", "-");
				map.put("grandmamaprivate", "");
				map.put("grandmamabfa", "");
			}
		} else {
			map.put("grandmama", "-");
			map.put("grandmamaprivate", "");
			map.put("grandmamabfa", "");
		}

		if (pedigree.getPedigreedamid() != null) {
			if (pedigree.getPedigreedamid().getPedigreesireid() != null) {
				map.put("grandfather", pedigree.getPedigreedamid().getPedigreesireid().getCName());
				map.put("grandfatherprivate", pedigree.getPedigreedamid().getPedigreesireid().getPrivateNo());
				map.put("grandfatherbfa", pedigree.getPedigreedamid().getPedigreesireid().getBbfaNo());
			} else {
				map.put("grandfather", "-");
				map.put("grandfatherprivate", "");
				map.put("grandfatherbfa", "");
			}
		} else {
			map.put("grandfather", "-");
			map.put("grandfatherprivate", "");
			map.put("grandfatherbfa", "");
		}

		if (pedigree.getPedigreedamid() != null) {
			if (pedigree.getPedigreedamid().getPedigreedamid() != null) {
				map.put("grandma", pedigree.getPedigreedamid().getPedigreedamid().getCName());
				map.put("grandmaprivate", pedigree.getPedigreedamid().getPedigreedamid().getPrivateNo());
				map.put("grandmabfa", pedigree.getPedigreedamid().getPedigreedamid().getBbfaNo());
			} else {
				map.put("grandma", "-");
				map.put("grandmaprivate", "");
				map.put("grandmabfa", "");
			}
		} else {
			map.put("grandma", "-");
			map.put("grandmaprivate", "");
			map.put("grandmabfa", "");
		}

		// ÃØè¹·Ç´ BeefMaster
		if (pedigree.getPedigreesireid() != null) {
		if (pedigree.getPedigreesireid().getPedigreesireid() != null) {
			if (pedigree.getPedigreesireid().getPedigreesireid().getPedigreesireid() != null) {
				map.put("tgrandpa", pedigree.getPedigreesireid().getPedigreesireid().getPedigreesireid().getCName());
				map.put("tgrandpaprivate",
						pedigree.getPedigreesireid().getPedigreesireid().getPedigreesireid().getPrivateNo());
				map.put("tgrandpabfa",
						pedigree.getPedigreesireid().getPedigreesireid().getPedigreesireid().getBbfaNo());
			} else {
				map.put("tgrandpa", "-");
				map.put("tgrandpaprivate", "");
				map.put("tgrandpabfa", "");
			}
		} else {
			map.put("tgrandpa", "-");
			map.put("tgrandpaprivate", "");
			map.put("tgrandpabfa", "");
		}
		} else {
			map.put("tgrandpa", "-");
			map.put("tgrandpaprivate", "");
			map.put("tgrandpabfa", "");
		}
		
		if (pedigree.getPedigreesireid() != null) {
		if (pedigree.getPedigreesireid().getPedigreesireid() != null) {
			if (pedigree.getPedigreesireid().getPedigreesireid().getPedigreedamid() != null) {
				map.put("tgrandmama", pedigree.getPedigreesireid().getPedigreesireid().getPedigreedamid().getCName());
				map.put("tgrandmamaprivate",
						pedigree.getPedigreesireid().getPedigreesireid().getPedigreedamid().getPrivateNo());
				map.put("tgrandmamabfa",
						pedigree.getPedigreesireid().getPedigreesireid().getPedigreedamid().getBbfaNo());
			} else {
				map.put("tgrandmama", "-");
				map.put("tgrandmamaprivate", "");
				map.put("tgrandmamabfa", "");
			}
		} else {
			map.put("tgrandmama", "-");
			map.put("tgrandmamaprivate", "");
			map.put("tgrandmamabfa", "");
		}
		} else {
			map.put("tgrandmama", "-");
			map.put("tgrandmamaprivate", "");
			map.put("tgrandmamabfa", "");
		}

		if (pedigree.getPedigreesireid() != null) {
		if (pedigree.getPedigreesireid().getPedigreedamid() != null) {
			if (pedigree.getPedigreesireid().getPedigreedamid().getPedigreesireid() != null) {
				map.put("tgrandfather", pedigree.getPedigreesireid().getPedigreedamid().getPedigreesireid().getCName());
				map.put("tgrandfatherprivate",
						pedigree.getPedigreesireid().getPedigreedamid().getPedigreesireid().getPrivateNo());
				map.put("tgrandfatherbfa",
						pedigree.getPedigreesireid().getPedigreedamid().getPedigreesireid().getBbfaNo());
			} else {
				map.put("tgrandfather", "-");
				map.put("tgrandfatherprivate", "");
				map.put("tgrandfatherbfa", "");
			}
		} else {
			map.put("tgrandfather", "-");
			map.put("tgrandfatherprivate", "");
			map.put("tgrandfatherbfa", "");
		}
		} else {
			map.put("tgrandfather", "-");
			map.put("tgrandfatherprivate", "");
			map.put("tgrandfatherbfa", "");
		}
		
		if (pedigree.getPedigreesireid()!= null) {
		if (pedigree.getPedigreesireid().getPedigreedamid() != null) {
			if (pedigree.getPedigreesireid().getPedigreedamid().getPedigreedamid() != null) {
				map.put("tgrandma", pedigree.getPedigreesireid().getPedigreedamid().getPedigreedamid().getCName());
				map.put("tgrandmaprivate",
						pedigree.getPedigreesireid().getPedigreedamid().getPedigreedamid().getPrivateNo());
				map.put("tgrandmabfa", pedigree.getPedigreesireid().getPedigreedamid().getPedigreedamid().getBbfaNo());
			} else {
				map.put("tgrandma", "-");
				map.put("tgrandmaprivate", "");
				map.put("tgrandmabfa", "");
			}
		} else {
			map.put("tgrandma", "-");
			map.put("tgrandmaprivate", "");
			map.put("tgrandmabfa", "");
		}
		} else {
			map.put("tgrandma", "-");
			map.put("tgrandmaprivate", "");
			map.put("tgrandmabfa", "");
		}
		
		if (pedigree.getPedigreedamid() != null) {
		if (pedigree.getPedigreedamid().getPedigreesireid() != null) {
			if (pedigree.getPedigreedamid().getPedigreesireid().getPedigreesireid() != null) {
				map.put("sgrandpa", pedigree.getPedigreedamid().getPedigreesireid().getPedigreesireid().getCName());
				map.put("sgrandpaprivate",
						pedigree.getPedigreedamid().getPedigreesireid().getPedigreesireid().getPrivateNo());
				map.put("sgrandpabfa", pedigree.getPedigreedamid().getPedigreesireid().getPedigreesireid().getBbfaNo());
			} else {
				map.put("sgrandpa", "-");
				map.put("sgrandpaprivate", "");
				map.put("sgrandpabfa", "");
			}
		} else {
			map.put("sgrandpa", "-");
			map.put("sgrandpaprivate", "");
			map.put("sgrandpabfa", "");
		}
		} else {
			map.put("sgrandpa", "-");
			map.put("sgrandpaprivate", "");
			map.put("sgrandpabfa", "");
		}
		
		if (pedigree.getPedigreedamid() != null) {
		if (pedigree.getPedigreedamid().getPedigreesireid() != null) {
			if (pedigree.getPedigreedamid().getPedigreesireid().getPedigreedamid() != null) {
				map.put("sgrandmama", pedigree.getPedigreedamid().getPedigreesireid().getPedigreedamid().getCName());
				map.put("sgrandmamaprivate",
						pedigree.getPedigreedamid().getPedigreesireid().getPedigreedamid().getPrivateNo());
				map.put("sgrandmamabfa",
						pedigree.getPedigreedamid().getPedigreesireid().getPedigreedamid().getBbfaNo());
			} else {
				map.put("sgrandmama", "-");
				map.put("sgrandmamaprivate", "");
				map.put("sgrandmamabfa", "");
			}
		} else {
			map.put("sgrandmama", "-");
			map.put("sgrandmamaprivate", "");
			map.put("sgrandmamabfa", "");
		}
		} else {
			map.put("sgrandmama", "-");
			map.put("sgrandmamaprivate", "");
			map.put("sgrandmamabfa", "");
		}
		
		if (pedigree.getPedigreedamid()!= null) {
		if (pedigree.getPedigreedamid().getPedigreedamid() != null) {
			if (pedigree.getPedigreedamid().getPedigreedamid().getPedigreesireid() != null) {
				map.put("sgrandfather", pedigree.getPedigreedamid().getPedigreedamid().getPedigreesireid().getCName());
				map.put("sgrandfatherprivate",
						pedigree.getPedigreedamid().getPedigreedamid().getPedigreesireid().getPrivateNo());
				map.put("sgrandfatherbfa",
						pedigree.getPedigreedamid().getPedigreedamid().getPedigreesireid().getBbfaNo());
			} else {
				map.put("sgrandfather", "-");
				map.put("sgrandfatherprivate", "");
				map.put("sgrandfatherbfa", "");
			}
		} else {
			map.put("sgrandfather", "-");
			map.put("sgrandfatherprivate", "");
			map.put("sgrandfatherbfa", "");
		}
		} else {
			map.put("sgrandfather", "-");
			map.put("sgrandfatherprivate", "");
			map.put("sgrandfatherbfa", "");
		}
		
		if (pedigree.getPedigreedamid() != null) {
		if (pedigree.getPedigreedamid().getPedigreedamid() != null) {
			if (pedigree.getPedigreedamid().getPedigreedamid().getPedigreedamid() != null) {
				map.put("sgrandma", pedigree.getPedigreedamid().getPedigreesireid().getPedigreedamid().getCName());
				map.put("sgrandmaprivate",
						pedigree.getPedigreedamid().getPedigreesireid().getPedigreedamid().getPrivateNo());
				map.put("sgrandmabfa", pedigree.getPedigreedamid().getPedigreesireid().getPedigreedamid().getBbfaNo());
			} else {
				map.put("sgrandma", "-");
				map.put("sgrandmaprivate", "");
				map.put("sgrandmabfa", "");
			}
		} else {
			map.put("sgrandma", "-");
			map.put("sgrandmaprivate", "");
			map.put("sgrandmabfa", "");
		}
		} else {
			map.put("sgrandma", "-");
			map.put("sgrandmaprivate", "");
			map.put("sgrandmabfa", "");
		}

		return "/pedigreereport/reportbeefmaster";
	}
	
	
	
	
	//Report Angus
	@RequestMapping(value = "ReportAngusPrinting")
	public String viewangus(@RequestParam("id") int id, Map<String, Object> map,HttpSession session,@RequestParam("bank") int bank) {
		Pedigree pedigree = pedigreeService.getPedigree(id);
		int iddata= (int) session.getAttribute("iddata");
		Report report = new Report();
		report.setDate(new Date());
		report.setDataId(dataService.getData(iddata));
		report.setPedigreeId(pedigree);
		report.setBank(bankService.getBank(bank));
		reportService.add(report);
		if (pedigree.getSex() != null) {
			map.put("sex_angus", pedigree.getSex());
		} else {
			map.put("sex_angus", "-");
		}
		if (pedigree.getCName() != null) {
			map.put("cname_angus", pedigree.getCName());
		} else {
			map.put("cname_angus", "-");
		}
		if (pedigree.getColor() != null) {
			map.put("color_angus", pedigree.getColor().getName());
		} else {
			map.put("color_angus", "-");
		}
		if (pedigree.getBbfaNo() != null) {
			map.put("bfa_angus", pedigree.getBbfaNo());
		} else {
			map.put("bfa_angus", "-");
		}
		if (pedigree.getPrivateNo() != null) {
			map.put("privateNo_angus", pedigree.getPrivateNo());
		} else {
			map.put("privateNo_angus", "-");
		}
		if (pedigree.getBand() != null) {
			map.put("band_angus", pedigree.getBand());
		} else {
			map.put("band_angus", "-");
		}
		if (pedigree.getBreeder() != null) {
			map.put("breeder_angus", pedigree.getBreeder());
		} else {
			map.put("breeder_angus", "-");
		}
		if (pedigree.getOwnerName() != null) {
			map.put("ownerName_angus", pedigree.getOwnerName());
		} else {
			map.put("ownerName_angus", "-");
		}
		if (pedigree.getDateDelivery() != null) {
			map.put("dateDelivery_angus", pedigree.getDateDelivery());
		} else {
			map.put("dateDelivery_angus", "-");
		}
		if (pedigree.getCalved() != null) {
			map.put("calved_angus", pedigree.getCalved());
		} else {
			map.put("calved_angus", "-");
		}
		// ÃØè¹¾èÍáÁè BeefMaster
		if (pedigree.getPedigreesireid() != null) {
			map.put("sire_angus", pedigree.getPedigreesireid().getCName());
			map.put("sireprivate_angus", pedigree.getPedigreesireid().getPrivateNo());
			map.put("sirebfa_angus", pedigree.getPedigreesireid().getBbfaNo());
		} else {
			map.put("sire_angus", "-");
			map.put("sireprivate_angus", "");
			map.put("sirebfa_angus", "");
		}
		if (pedigree.getPedigreedamid() != null) {
			map.put("dam_angus", pedigree.getPedigreedamid().getCName());
			map.put("damprivate_angus", pedigree.getPedigreedamid().getPrivateNo());
			map.put("dambfa_angus", pedigree.getPedigreedamid().getBbfaNo());
		} else {
			map.put("dam_angus", "-");
			map.put("damprivate_angus", "");
			map.put("dambfa_angus", "");
		}
		// ÃØè¹»Ùè ÂèÒ µÒ ÂÒÂ BeefMaster
		if (pedigree.getPedigreesireid() != null) {
			if (pedigree.getPedigreesireid().getPedigreesireid() != null) {
				map.put("grandpa_angus", pedigree.getPedigreesireid().getPedigreesireid().getCName());
				map.put("grandpaprivate_angus", pedigree.getPedigreesireid().getPedigreesireid().getPrivateNo());
				map.put("grandpabfa_angus", pedigree.getPedigreesireid().getPedigreesireid().getBbfaNo());
			} else {
				map.put("grandpa_angus", "-");
				map.put("grandpaprivate_angus", "");
				map.put("grandpabfa_angus", "");
			}
		} else {
			map.put("grandpa_angus", "-");
			map.put("grandpaprivate_angus", "");
			map.put("grandpabfa_angus", "");
		}
		if (pedigree.getPedigreesireid() != null) {
			if (pedigree.getPedigreesireid().getPedigreedamid() != null) {
				map.put("grandmama_angus", pedigree.getPedigreesireid().getPedigreedamid().getCName());
				map.put("grandmamaprivate_angus", pedigree.getPedigreesireid().getPedigreedamid().getPrivateNo());
				map.put("grandmamabfa_angus", pedigree.getPedigreesireid().getPedigreedamid().getBbfaNo());
			} else {
				map.put("grandmama_angus", "-");
				map.put("grandmamaprivate_angus", "");
				map.put("grandmamabfa_angus", "");
			}
		} else {
			map.put("grandmama_angus", "-");
			map.put("grandmamaprivate_angus", "");
			map.put("grandmamabfa_angus", "");
		}

		if (pedigree.getPedigreedamid() != null) {
			if (pedigree.getPedigreedamid().getPedigreesireid() != null) {
				map.put("grandfather_angus", pedigree.getPedigreedamid().getPedigreesireid().getCName());
				map.put("grandfatherprivate_angus", pedigree.getPedigreedamid().getPedigreesireid().getPrivateNo());
				map.put("grandfatherbfa_angus", pedigree.getPedigreedamid().getPedigreesireid().getBbfaNo());
			} else {
				map.put("grandfather_angus", "-");
				map.put("grandfatherprivate_angus", "");
				map.put("grandfatherbfa_angus", "");
			}
		} else {
			map.put("grandfather_angus", "-");
			map.put("grandfatherprivate_angus", "");
			map.put("grandfatherbfa_angus", "");
		}

		if (pedigree.getPedigreedamid() != null) {
			if (pedigree.getPedigreedamid().getPedigreedamid() != null) {
				map.put("grandma_angus", pedigree.getPedigreedamid().getPedigreedamid().getCName());
				map.put("grandmaprivate_angus", pedigree.getPedigreedamid().getPedigreedamid().getPrivateNo());
				map.put("grandmabfa_angus", pedigree.getPedigreedamid().getPedigreedamid().getBbfaNo());
			} else {
				map.put("grandma_angus", "-");
				map.put("grandmaprivate_angus", "");
				map.put("grandmabfa_angus", "");
			}
		} else {
			map.put("grandma_angus", "-");
			map.put("grandmaprivate_angus", "");
			map.put("grandmabfa_angus", "");
		}

		// ÃØè¹·Ç´ BeefMaster
		if (pedigree.getPedigreesireid() != null) {
		if (pedigree.getPedigreesireid().getPedigreesireid() != null) {
			if (pedigree.getPedigreesireid().getPedigreesireid().getPedigreesireid() != null) {
				map.put("tgrandpa_angus", pedigree.getPedigreesireid().getPedigreesireid().getPedigreesireid().getCName());
				map.put("tgrandpaprivate_angus",
						pedigree.getPedigreesireid().getPedigreesireid().getPedigreesireid().getPrivateNo());
				map.put("tgrandpabfa_angus",
						pedigree.getPedigreesireid().getPedigreesireid().getPedigreesireid().getBbfaNo());
			} else {
				map.put("tgrandpa_angus", "-");
				map.put("tgrandpaprivate_angus", "");
				map.put("tgrandpabfa_angus", "");
			}
		} else {
			map.put("tgrandpa_angus", "-");
			map.put("tgrandpaprivate_angus", "");
			map.put("tgrandpabfa_angus", "");
		}
		} else {
			map.put("tgrandpa_angus", "-");
			map.put("tgrandpaprivate_angus", "");
			map.put("tgrandpabfa_angus", "");
		}
		
		if (pedigree.getPedigreesireid() != null) {
		if (pedigree.getPedigreesireid().getPedigreesireid() != null) {
			if (pedigree.getPedigreesireid().getPedigreesireid().getPedigreedamid() != null) {
				map.put("tgrandmama_angus", pedigree.getPedigreesireid().getPedigreesireid().getPedigreedamid().getCName());
				map.put("tgrandmamaprivate_angus",
						pedigree.getPedigreesireid().getPedigreesireid().getPedigreedamid().getPrivateNo());
				map.put("tgrandmamabfa_angus",
						pedigree.getPedigreesireid().getPedigreesireid().getPedigreedamid().getBbfaNo());
			} else {
				map.put("tgrandmama_angus", "-");
				map.put("tgrandmamaprivate_angus", "");
				map.put("tgrandmamabfa_angus", "");
			}
		} else {
			map.put("tgrandmama_angus", "-");
			map.put("tgrandmamaprivate_angus", "");
			map.put("tgrandmamabfa_angus", "");
		}
		} else {
			map.put("tgrandmama_angus", "-");
			map.put("tgrandmamaprivate_angus", "");
			map.put("tgrandmamabfa_angus", "");
		}

		if (pedigree.getPedigreesireid() != null) {
		if (pedigree.getPedigreesireid().getPedigreedamid() != null) {
			if (pedigree.getPedigreesireid().getPedigreedamid().getPedigreesireid() != null) {
				map.put("tgrandfather_angus", pedigree.getPedigreesireid().getPedigreedamid().getPedigreesireid().getCName());
				map.put("tgrandfatherprivate_angus",
						pedigree.getPedigreesireid().getPedigreedamid().getPedigreesireid().getPrivateNo());
				map.put("tgrandfatherbfa_angus",
						pedigree.getPedigreesireid().getPedigreedamid().getPedigreesireid().getBbfaNo());
			} else {
				map.put("tgrandfather_angus", "-");
				map.put("tgrandfatherprivate_angus", "");
				map.put("tgrandfatherbfa_angus", "");
			}
		} else {
			map.put("tgrandfather_angus", "-");
			map.put("tgrandfatherprivate_angus", "");
			map.put("tgrandfatherbfa_angus", "");
		}
		} else {
			map.put("tgrandfather_angus", "-");
			map.put("tgrandfatherprivate_angus", "");
			map.put("tgrandfatherbfa_angus", "");
		}
		
		if (pedigree.getPedigreesireid()!= null) {
		if (pedigree.getPedigreesireid().getPedigreedamid() != null) {
			if (pedigree.getPedigreesireid().getPedigreedamid().getPedigreedamid() != null) {
				map.put("tgrandma_angus", pedigree.getPedigreesireid().getPedigreedamid().getPedigreedamid().getCName());
				map.put("tgrandmaprivate_angus",
						pedigree.getPedigreesireid().getPedigreedamid().getPedigreedamid().getPrivateNo());
				map.put("tgrandmabfa_angus", pedigree.getPedigreesireid().getPedigreedamid().getPedigreedamid().getBbfaNo());
			} else {
				map.put("tgrandma_angus", "-");
				map.put("tgrandmaprivate_angus", "");
				map.put("tgrandmabfa_angus", "");
			}
		} else {
			map.put("tgrandma_angus", "-");
			map.put("tgrandmaprivate_angus", "");
			map.put("tgrandmabfa_angus", "");
		}
		} else {
			map.put("tgrandma_angus", "-");
			map.put("tgrandmaprivate_angus", "");
			map.put("tgrandmabfa_angus", "");
		}
		
		if (pedigree.getPedigreedamid() != null) {
		if (pedigree.getPedigreedamid().getPedigreesireid() != null) {
			if (pedigree.getPedigreedamid().getPedigreesireid().getPedigreesireid() != null) {
				map.put("sgrandpa_angus", pedigree.getPedigreedamid().getPedigreesireid().getPedigreesireid().getCName());
				map.put("sgrandpaprivate_angus",
						pedigree.getPedigreedamid().getPedigreesireid().getPedigreesireid().getPrivateNo());
				map.put("sgrandpabfa_angus", pedigree.getPedigreedamid().getPedigreesireid().getPedigreesireid().getBbfaNo());
			} else {
				map.put("sgrandpa_angus", "-");
				map.put("sgrandpaprivate_angus", "");
				map.put("sgrandpabfa", "");
			}
		} else {
			map.put("sgrandpa_angus", "-");
			map.put("sgrandpaprivate_angus", "");
			map.put("sgrandpabfa_angus", "");
		}
		} else {
			map.put("sgrandpa_angus", "-");
			map.put("sgrandpaprivate_angus", "");
			map.put("sgrandpabfa_angus", "");
		}
		
		if (pedigree.getPedigreedamid() != null) {
		if (pedigree.getPedigreedamid().getPedigreesireid() != null) {
			if (pedigree.getPedigreedamid().getPedigreesireid().getPedigreedamid() != null) {
				map.put("sgrandmama_angus", pedigree.getPedigreedamid().getPedigreesireid().getPedigreedamid().getCName());
				map.put("sgrandmamaprivate_angus",
						pedigree.getPedigreedamid().getPedigreesireid().getPedigreedamid().getPrivateNo());
				map.put("sgrandmamabfa_angus",
						pedigree.getPedigreedamid().getPedigreesireid().getPedigreedamid().getBbfaNo());
			} else {
				map.put("sgrandmama_angus", "-");
				map.put("sgrandmamaprivate_angus", "");
				map.put("sgrandmamabfa_angus", "");
			}
		} else {
			map.put("sgrandmama_angus", "-");
			map.put("sgrandmamaprivate_angus", "");
			map.put("sgrandmamabfa_angus", "");
		}
		} else {
			map.put("sgrandmama_angus", "-");
			map.put("sgrandmamaprivate_angus", "");
			map.put("sgrandmamabfa_angus", "");
		}
		
		if (pedigree.getPedigreedamid()!= null) {
		if (pedigree.getPedigreedamid().getPedigreedamid() != null) {
			if (pedigree.getPedigreedamid().getPedigreedamid().getPedigreesireid() != null) {
				map.put("sgrandfather_angus", pedigree.getPedigreedamid().getPedigreedamid().getPedigreesireid().getCName());
				map.put("sgrandfatherprivate_angus",
						pedigree.getPedigreedamid().getPedigreedamid().getPedigreesireid().getPrivateNo());
				map.put("sgrandfatherbfa_angus",
						pedigree.getPedigreedamid().getPedigreedamid().getPedigreesireid().getBbfaNo());
			} else {
				map.put("sgrandfathe_angusr", "-");
				map.put("sgrandfatherprivate_angus", "");
				map.put("sgrandfatherbfa_angus", "");
			}
		} else {
			map.put("sgrandfather_angus", "-");
			map.put("sgrandfatherprivate_angus", "");
			map.put("sgrandfatherbfa_angus", "");
		}
		} else {
			map.put("sgrandfather_angus", "-");
			map.put("sgrandfatherprivate_angus", "");
			map.put("sgrandfatherbfa_angus", "");
		}
		
		if (pedigree.getPedigreedamid() != null) {
		if (pedigree.getPedigreedamid().getPedigreedamid() != null) {
			if (pedigree.getPedigreedamid().getPedigreedamid().getPedigreedamid() != null) {
				map.put("sgrandma_angus", pedigree.getPedigreedamid().getPedigreesireid().getPedigreedamid().getCName());
				map.put("sgrandmaprivate_angus",
						pedigree.getPedigreedamid().getPedigreesireid().getPedigreedamid().getPrivateNo());
				map.put("sgrandmabfa_angus", pedigree.getPedigreedamid().getPedigreesireid().getPedigreedamid().getBbfaNo());
			} else {
				map.put("sgrandma_angus", "-");
				map.put("sgrandmaprivate_angus", "");
				map.put("sgrandmabfa_angus", "");
			}
		} else {
			map.put("sgrandma_angus", "-");
			map.put("sgrandmaprivate_angus", "");
			map.put("sgrandmabfa_angus", "");
		}
		} else {
			map.put("sgrandma_angus", "-");
			map.put("sgrandmaprivate_angus", "");
			map.put("sgrandmabfa_angus", "");
		}

		return "/pedigreereport/reportangus";
	}
	
	

	
	//ReportCharolais
	@RequestMapping(value = "ReportCharolaisPrinting")
		public String viewcharolais(@RequestParam("id") int id, Map<String, Object> map,HttpSession session,@RequestParam("bank") int bank) {
			Pedigree pedigree = pedigreeService.getPedigree(id);
			int iddata= (int) session.getAttribute("iddata");
			Report report = new Report();
			report.setDate(new Date());
			report.setDataId(dataService.getData(iddata));
			report.setPedigreeId(pedigree);
			report.setBank(bankService.getBank(bank));
			reportService.add(report);
		if (pedigree.getSex() != null) {
			map.put("sex_charolais", pedigree.getSex());
		} else {
			map.put("sex_charolais", "-");
		}
		if (pedigree.getCName() != null) {
			map.put("cname_charolais", pedigree.getCName());
		} else {
			map.put("cname_charolais", "-");
		}
		if (pedigree.getColor() != null) {
			map.put("color_charolais", pedigree.getColor().getName());
		} else {
			map.put("color_charolais", "-");
		}
		if (pedigree.getBbfaNo() != null) {
			map.put("bfa_charolais", pedigree.getBbfaNo());
		} else {
			map.put("bfa_charolais", "-");
		}
		if (pedigree.getPrivateNo() != null) {
			map.put("privateNo_charolais", pedigree.getPrivateNo());
		} else {
			map.put("privateNo_charolais", "-");
		}
		if (pedigree.getBand() != null) {
			map.put("band_charolais", pedigree.getBand());
		} else {
			map.put("band_charolais", "-");
		}
		if (pedigree.getBreeder() != null) {
			map.put("breeder_charolais", pedigree.getBreeder());
		} else {
			map.put("breede_charolaisr", "-");
		}
		if (pedigree.getOwnerName() != null) {
			map.put("ownerName_charolais", pedigree.getOwnerName());
		} else {
			map.put("ownerName_charolais", "-");
		}
		if (pedigree.getDateDelivery() != null) {
			map.put("dateDelivery_charolais", pedigree.getDateDelivery());
		} else {
			map.put("dateDelivery_charolais", "-");
		}
		if (pedigree.getCalved() != null) {
			map.put("calved_charolais", pedigree.getCalved());
		} else {
			map.put("calved_charolais", "-");
		}
		// ÃØè¹¾èÍáÁè Charolais
		if (pedigree.getPedigreesireid() != null) {
			map.put("sire_charolais", pedigree.getPedigreesireid().getCName());
			map.put("sireprivate_charolais", pedigree.getPedigreesireid().getPrivateNo());
			map.put("sirebfa_charolais", pedigree.getPedigreesireid().getBbfaNo());
		} else {
			map.put("sire_charolais", "-");
			map.put("sireprivate_charolais", "");
			map.put("sirebfa_charolais", "");
		}
		if (pedigree.getPedigreedamid() != null) {
			map.put("dam_charolais", pedigree.getPedigreedamid().getCName());
			map.put("damprivate_charolais", pedigree.getPedigreedamid().getPrivateNo());
			map.put("dambfa_charolais", pedigree.getPedigreedamid().getBbfaNo());
		} else {
			map.put("dam_charolais", "-");
			map.put("damprivat_charolaise", "");
			map.put("dambfa_charolais", "");
		}
		// ÃØè¹»Ùè ÂèÒ µÒ ÂÒÂ Charolais
		if (pedigree.getPedigreesireid() != null) {
			if (pedigree.getPedigreesireid().getPedigreesireid() != null) {
				map.put("grandpa_charolais", pedigree.getPedigreesireid().getPedigreesireid().getCName());
				map.put("grandpaprivate_charolais", pedigree.getPedigreesireid().getPedigreesireid().getPrivateNo());
				map.put("grandpabfa_charolais", pedigree.getPedigreesireid().getPedigreesireid().getBbfaNo());
			} else {
				map.put("grandpa_charolais", "-");
				map.put("grandpaprivate_charolais", "");
				map.put("grandpabfa_charolais", "");
			}
		} else {
			map.put("grandpa_charolais", "-");
			map.put("grandpaprivate_charolais", "");
			map.put("grandpabfa_charolais", "");
		}
		if (pedigree.getPedigreesireid() != null) {
			if (pedigree.getPedigreesireid().getPedigreedamid() != null) {
				map.put("grandmama_charolais", pedigree.getPedigreesireid().getPedigreedamid().getCName());
				map.put("grandmamaprivate_charolais", pedigree.getPedigreesireid().getPedigreedamid().getPrivateNo());
				map.put("grandmamabfa_charolais", pedigree.getPedigreesireid().getPedigreedamid().getBbfaNo());
			} else {
				map.put("grandmama_charolais", "-");
				map.put("grandmamaprivate_charolais", "");
				map.put("grandmamabfa_charolais", "");
			}
		} else {
			map.put("grandmama_charolais", "-");
			map.put("grandmamaprivate_charolais", "");
			map.put("grandmamabfa_charolais", "");
		}

		if (pedigree.getPedigreedamid() != null) {
			if (pedigree.getPedigreedamid().getPedigreesireid() != null) {
				map.put("grandfather_charolais", pedigree.getPedigreedamid().getPedigreesireid().getCName());
				map.put("grandfatherprivate_charolais", pedigree.getPedigreedamid().getPedigreesireid().getPrivateNo());
				map.put("grandfatherbfa_charolais", pedigree.getPedigreedamid().getPedigreesireid().getBbfaNo());
			} else {
				map.put("grandfather_charolais", "-");
				map.put("grandfatherprivate_charolais", "");
				map.put("grandfatherbfa_charolais", "");
			}
		} else {
			map.put("grandfather_charolais", "-");
			map.put("grandfatherprivate_charolais", "");
			map.put("grandfatherbfa_charolais", "");
		}

		if (pedigree.getPedigreedamid() != null) {
			if (pedigree.getPedigreedamid().getPedigreedamid() != null) {
				map.put("grandma_charolais", pedigree.getPedigreedamid().getPedigreedamid().getCName());
				map.put("grandmaprivate_charolais", pedigree.getPedigreedamid().getPedigreedamid().getPrivateNo());
				map.put("grandmabfa_charolais", pedigree.getPedigreedamid().getPedigreedamid().getBbfaNo());
			} else {
				map.put("grandma_charolais", "-");
				map.put("grandmaprivate_charolais", "");
				map.put("grandmabfa_charolais", "");
			}
		} else {
			map.put("grandma_charolais", "-");
			map.put("grandmaprivate_charolais", "");
			map.put("grandmabfa_charolais", "");
		}

		// ÃØè¹·Ç´ BeefMaster
		if (pedigree.getPedigreesireid() != null) {
		if (pedigree.getPedigreesireid().getPedigreesireid() != null) {
			if (pedigree.getPedigreesireid().getPedigreesireid().getPedigreesireid() != null) {
				map.put("tgrandpa_charolais", pedigree.getPedigreesireid().getPedigreesireid().getPedigreesireid().getCName());
				map.put("tgrandpaprivate_charolais",
						pedigree.getPedigreesireid().getPedigreesireid().getPedigreesireid().getPrivateNo());
				map.put("tgrandpabfa_charolais",
						pedigree.getPedigreesireid().getPedigreesireid().getPedigreesireid().getBbfaNo());
			} else {
				map.put("tgrandpa_charolais", "-");
				map.put("tgrandpaprivate_charolais", "");
				map.put("tgrandpabfa_charolais", "");
			}
		} else {
			map.put("tgrandpa_charolais", "-");
			map.put("tgrandpaprivate_charolais", "");
			map.put("tgrandpabfa_charolais", "");
		}
		} else {
			map.put("tgrandpa_charolais", "-");
			map.put("tgrandpaprivate_charolais", "");
			map.put("tgrandpabfa_charolais", "");
		}
		
		if (pedigree.getPedigreesireid() != null) {
		if (pedigree.getPedigreesireid().getPedigreesireid() != null) {
			if (pedigree.getPedigreesireid().getPedigreesireid().getPedigreedamid() != null) {
				map.put("tgrandmama_charolais", pedigree.getPedigreesireid().getPedigreesireid().getPedigreedamid().getCName());
				map.put("tgrandmamaprivate_charolais",
						pedigree.getPedigreesireid().getPedigreesireid().getPedigreedamid().getPrivateNo());
				map.put("tgrandmamabfa_charolais",
						pedigree.getPedigreesireid().getPedigreesireid().getPedigreedamid().getBbfaNo());
			} else {
				map.put("tgrandmama_charolais", "-");
				map.put("tgrandmamaprivate_charolais", "");
				map.put("tgrandmamabfa_charolais", "");
			}
		} else {
			map.put("tgrandmama_charolais", "-");
			map.put("tgrandmamaprivate_charolais", "");
			map.put("tgrandmamabfa_charolais", "");
		}
		} else {
			map.put("tgrandmama_charolais", "-");
			map.put("tgrandmamaprivate_charolais", "");
			map.put("tgrandmamabfa_charolais", "");
		}

		if (pedigree.getPedigreesireid() != null) {
		if (pedigree.getPedigreesireid().getPedigreedamid() != null) {
			if (pedigree.getPedigreesireid().getPedigreedamid().getPedigreesireid() != null) {
				map.put("tgrandfather_charolais", pedigree.getPedigreesireid().getPedigreedamid().getPedigreesireid().getCName());
				map.put("tgrandfatherprivate_charolais",
						pedigree.getPedigreesireid().getPedigreedamid().getPedigreesireid().getPrivateNo());
				map.put("tgrandfatherbfa_charolais",
						pedigree.getPedigreesireid().getPedigreedamid().getPedigreesireid().getBbfaNo());
			} else {
				map.put("tgrandfather_charolais", "-");
				map.put("tgrandfatherprivate_charolais", "");
				map.put("tgrandfatherbfa_charolais", "");
			}
		} else {
			map.put("tgrandfather_charolais", "-");
			map.put("tgrandfatherprivate_charolais", "");
			map.put("tgrandfatherbfa_charolais", "");
		}
		} else {
			map.put("tgrandfather_charolais", "-");
			map.put("tgrandfatherprivate_charolais", "");
			map.put("tgrandfatherbfa_charolais", "");
		}
		
		if (pedigree.getPedigreesireid()!= null) {
		if (pedigree.getPedigreesireid().getPedigreedamid() != null) {
			if (pedigree.getPedigreesireid().getPedigreedamid().getPedigreedamid() != null) {
				map.put("tgrandma_charolais", pedigree.getPedigreesireid().getPedigreedamid().getPedigreedamid().getCName());
				map.put("tgrandmaprivate_charolais",
						pedigree.getPedigreesireid().getPedigreedamid().getPedigreedamid().getPrivateNo());
				map.put("tgrandmabfa_charolais", pedigree.getPedigreesireid().getPedigreedamid().getPedigreedamid().getBbfaNo());
			} else {
				map.put("tgrandma_charolais", "-");
				map.put("tgrandmaprivate_charolais", "");
				map.put("tgrandmabfa_charolais", "");
			}
		} else {
			map.put("tgrandma_charolais", "-");
			map.put("tgrandmaprivate_charolais", "");
			map.put("tgrandmabfa_charolais", "");
		}
		} else {
			map.put("tgrandma_charolais", "-");
			map.put("tgrandmaprivate_charolais", "");
			map.put("tgrandmabfa_charolais", "");
		}
		
		if (pedigree.getPedigreedamid() != null) {
		if (pedigree.getPedigreedamid().getPedigreesireid() != null) {
			if (pedigree.getPedigreedamid().getPedigreesireid().getPedigreesireid() != null) {
				map.put("sgrandpa_charolais", pedigree.getPedigreedamid().getPedigreesireid().getPedigreesireid().getCName());
				map.put("sgrandpaprivate_charolais",
						pedigree.getPedigreedamid().getPedigreesireid().getPedigreesireid().getPrivateNo());
				map.put("sgrandpabfa_charolais", pedigree.getPedigreedamid().getPedigreesireid().getPedigreesireid().getBbfaNo());
			} else {
				map.put("sgrandpa_charolais", "-");
				map.put("sgrandpaprivate_charolais", "");
				map.put("sgrandpabfa_charolais", "");
			}
		} else {
			map.put("sgrandpa_charolais", "-");
			map.put("sgrandpaprivate_charolais", "");
			map.put("sgrandpabfa_charolais", "");
		}
		} else {
			map.put("sgrandpa_charolais", "-");
			map.put("sgrandpaprivate_charolais", "");
			map.put("sgrandpabfa_charolais", "");
		}
		
		if (pedigree.getPedigreedamid() != null) {
		if (pedigree.getPedigreedamid().getPedigreesireid() != null) {
			if (pedigree.getPedigreedamid().getPedigreesireid().getPedigreedamid() != null) {
				map.put("sgrandmama_charolais", pedigree.getPedigreedamid().getPedigreesireid().getPedigreedamid().getCName());
				map.put("sgrandmamaprivate_charolais",
						pedigree.getPedigreedamid().getPedigreesireid().getPedigreedamid().getPrivateNo());
				map.put("sgrandmamabfa_charolais",
						pedigree.getPedigreedamid().getPedigreesireid().getPedigreedamid().getBbfaNo());
			} else {
				map.put("sgrandmama_charolais", "-");
				map.put("sgrandmamaprivate_charolais", "");
				map.put("sgrandmamabfa_charolais", "");
			}
		} else {
			map.put("sgrandmama_charolais", "-");
			map.put("sgrandmamaprivate_charolais", "");
			map.put("sgrandmamabfa_charolais", "");
		}
		} else {
			map.put("sgrandmama_charolais", "-");
			map.put("sgrandmamaprivate_charolais", "");
			map.put("sgrandmamabfa_charolais", "");
		}
		
		if (pedigree.getPedigreedamid()!= null) {
		if (pedigree.getPedigreedamid().getPedigreedamid() != null) {
			if (pedigree.getPedigreedamid().getPedigreedamid().getPedigreesireid() != null) {
				map.put("sgrandfather_charolais", pedigree.getPedigreedamid().getPedigreedamid().getPedigreesireid().getCName());
				map.put("sgrandfatherprivate_charolais",
						pedigree.getPedigreedamid().getPedigreedamid().getPedigreesireid().getPrivateNo());
				map.put("sgrandfatherbfa_charolais",
						pedigree.getPedigreedamid().getPedigreedamid().getPedigreesireid().getBbfaNo());
			} else {
				map.put("sgrandfathe_charolais", "-");
				map.put("sgrandfatherprivate_charolais", "");
				map.put("sgrandfatherbfa_charolais", "");
			}
		} else {
			map.put("sgrandfather_charolais", "-");
			map.put("sgrandfatherprivate_charolais", "");
			map.put("sgrandfatherbfa_charolais", "");
		}
		} else {
			map.put("sgrandfather_charolais", "-");
			map.put("sgrandfatherprivate_charolais", "");
			map.put("sgrandfatherbfa_charolais", "");
		}
		
		if (pedigree.getPedigreedamid() != null) {
		if (pedigree.getPedigreedamid().getPedigreedamid() != null) {
			if (pedigree.getPedigreedamid().getPedigreedamid().getPedigreedamid() != null) {
				map.put("sgrandma_charolais", pedigree.getPedigreedamid().getPedigreesireid().getPedigreedamid().getCName());
				map.put("sgrandmaprivate_charolais",
						pedigree.getPedigreedamid().getPedigreesireid().getPedigreedamid().getPrivateNo());
				map.put("sgrandmabfa_charolais", pedigree.getPedigreedamid().getPedigreesireid().getPedigreedamid().getBbfaNo());
			} else {
				map.put("sgrandma_charolais", "-");
				map.put("sgrandmaprivate_charolais", "");
				map.put("sgrandmabfa_charolais", "");
			}
		} else {
			map.put("sgrandma_charolais", "-");
			map.put("sgrandmaprivate_charolais", "");
			map.put("sgrandmabfa_charolais", "");
		}
		} else {
			map.put("sgrandma_charolais", "-");
			map.put("sgrandmaprivate_charolais", "");
			map.put("sgrandmabfa_charolais", "");
		}

		return "/pedigreereport/reportcharolais";
	}
	
	
	
	
	//Report Brahman
	@RequestMapping(value = "ReportBrahmanPrinting")
	public String viewbrahman(@RequestParam("id") int id, Map<String, Object> map,HttpSession session,@RequestParam("bank") int bank) {
		Pedigree pedigree = pedigreeService.getPedigree(id);
		int iddata= (int) session.getAttribute("iddata");
		Report report = new Report();
		report.setDate(new Date());
		report.setDataId(dataService.getData(iddata));
		report.setPedigreeId(pedigree);
		report.setBank(bankService.getBank(bank));
		reportService.add(report);
		if (pedigree.getSex() != null) {
			map.put("sex_brahman", pedigree.getSex());
		} else {
			map.put("sex_brahman", "-");
		}
		if (pedigree.getCName() != null) {
			map.put("cname_brahman", pedigree.getCName());
		} else {
			map.put("cname_brahman", "-");
		}
		if (pedigree.getColor() != null) {
			map.put("color_brahman", pedigree.getColor().getName());
		} else {
			map.put("color_brahman", "-");
		}
		if (pedigree.getBbfaNo() != null) {
			map.put("bfa_brahman", pedigree.getBbfaNo());
		} else {
			map.put("bfa_brahman", "-");
		}
		if (pedigree.getPrivateNo() != null) {
			map.put("privateNo_brahman", pedigree.getPrivateNo());
		} else {
			map.put("privateNo_brahman", "-");
		}
		if (pedigree.getBand() != null) {
			map.put("band_brahman", pedigree.getBand());
		} else {
			map.put("band_brahman", "-");
		}
		if (pedigree.getBreeder() != null) {
			map.put("breeder_brahman", pedigree.getBreeder());
		} else {
			map.put("breeder_brahman", "-");
		}
		if (pedigree.getOwnerName() != null) {
			map.put("ownerName_brahman", pedigree.getOwnerName());
		} else {
			map.put("ownerName_brahman", "-");
		}
		if (pedigree.getDateDelivery() != null) {
			map.put("dateDelivery_brahman", pedigree.getDateDelivery());
		} else {
			map.put("dateDelivery_brahman", "-");
		}
		if (pedigree.getCalved() != null) {
			map.put("calved_brahman", pedigree.getCalved());
		} else {
			map.put("calved_brahman", "-");
		}
		// ÃØè¹¾èÍáÁè BeefMaster
		if (pedigree.getPedigreesireid() != null) {
			map.put("sire_brahman", pedigree.getPedigreesireid().getCName());
			map.put("sireprivate_brahman", pedigree.getPedigreesireid().getPrivateNo());
			map.put("sirebfa_brahman", pedigree.getPedigreesireid().getBbfaNo());
		} else {
			map.put("sire_brahman", "-");
			map.put("sireprivate_brahman", "");
			map.put("sirebfa_brahman", "");
		}
		if (pedigree.getPedigreedamid() != null) {
			map.put("dam_brahman", pedigree.getPedigreedamid().getCName());
			map.put("damprivate_brahman", pedigree.getPedigreedamid().getPrivateNo());
			map.put("dambfa_brahman", pedigree.getPedigreedamid().getBbfaNo());
		} else {
			map.put("dam_brahman", "-");
			map.put("damprivate_brahman", "");
			map.put("dambfa_brahman", "");
		}
		// ÃØè¹»Ùè ÂèÒ µÒ ÂÒÂ Brahman
		if (pedigree.getPedigreesireid() != null) {
			if (pedigree.getPedigreesireid().getPedigreesireid() != null) {
				map.put("grandpa_brahman", pedigree.getPedigreesireid().getPedigreesireid().getCName());
				map.put("grandpaprivate_brahman", pedigree.getPedigreesireid().getPedigreesireid().getPrivateNo());
				map.put("grandpabfa_brahman", pedigree.getPedigreesireid().getPedigreesireid().getBbfaNo());
			} else {
				map.put("grandpa_brahman", "-");
				map.put("grandpaprivate_brahman", "");
				map.put("grandpabfa_brahman", "");
			}
		} else {
			map.put("grandpa_brahman", "-");
			map.put("grandpaprivate_brahman", "");
			map.put("grandpabfa_brahman", "");
		}
		if (pedigree.getPedigreesireid() != null) {
			if (pedigree.getPedigreesireid().getPedigreedamid() != null) {
				map.put("grandmama_brahman", pedigree.getPedigreesireid().getPedigreedamid().getCName());
				map.put("grandmamaprivate_brahman", pedigree.getPedigreesireid().getPedigreedamid().getPrivateNo());
				map.put("grandmamabfa_brahman", pedigree.getPedigreesireid().getPedigreedamid().getBbfaNo());
			} else {
				map.put("grandmama_brahman", "-");
				map.put("grandmamaprivate_brahman", "");
				map.put("grandmamabfa_brahman", "");
			}
		} else {
			map.put("grandmama_brahman", "-");
			map.put("grandmamaprivate_brahman", "");
			map.put("grandmamabfa_brahman", "");
		}

		if (pedigree.getPedigreedamid() != null) {
			if (pedigree.getPedigreedamid().getPedigreesireid() != null) {
				map.put("grandfather_brahman", pedigree.getPedigreedamid().getPedigreesireid().getCName());
				map.put("grandfatherprivate_brahman", pedigree.getPedigreedamid().getPedigreesireid().getPrivateNo());
				map.put("grandfatherbfa_brahman", pedigree.getPedigreedamid().getPedigreesireid().getBbfaNo());
			} else {
				map.put("grandfather_brahman", "-");
				map.put("grandfatherprivate_brahman", "");
				map.put("grandfatherbfa_brahman", "");
			}
		} else {
			map.put("grandfather_brahman", "-");
			map.put("grandfatherprivate_brahman", "");
			map.put("grandfatherbfa_brahman", "");
		}

		if (pedigree.getPedigreedamid() != null) {
			if (pedigree.getPedigreedamid().getPedigreedamid() != null) {
				map.put("grandma_brahman", pedigree.getPedigreedamid().getPedigreedamid().getCName());
				map.put("grandmaprivate_brahman", pedigree.getPedigreedamid().getPedigreedamid().getPrivateNo());
				map.put("grandmabfa_brahman", pedigree.getPedigreedamid().getPedigreedamid().getBbfaNo());
			} else {
				map.put("grandma_brahman", "-");
				map.put("grandmaprivate_brahman", "");
				map.put("grandmabfa_brahman", "");
			}
		} else {
			map.put("grandma_brahman", "-");
			map.put("grandmaprivate_brahman", "");
			map.put("grandmabfa_brahman", "");
		}

		// ÃØè¹·Ç´ Brahman
		if (pedigree.getPedigreesireid() != null) {
		if (pedigree.getPedigreesireid().getPedigreesireid() != null) {
			if (pedigree.getPedigreesireid().getPedigreesireid().getPedigreesireid() != null) {
				map.put("tgrandpa_brahman", pedigree.getPedigreesireid().getPedigreesireid().getPedigreesireid().getCName());
				map.put("tgrandpaprivate_brahman",
						pedigree.getPedigreesireid().getPedigreesireid().getPedigreesireid().getPrivateNo());
				map.put("tgrandpabfa_brahman",
						pedigree.getPedigreesireid().getPedigreesireid().getPedigreesireid().getBbfaNo());
			} else {
				map.put("tgrandpa_brahman", "-");
				map.put("tgrandpaprivate_brahman", "");
				map.put("tgrandpabfa_brahman", "");
			}
		} else {
			map.put("tgrandpa_brahman", "-");
			map.put("tgrandpaprivate_brahman", "");
			map.put("tgrandpabfa_brahman", "");
		}
		} else {
			map.put("tgrandpa_brahman", "-");
			map.put("tgrandpaprivate_brahman", "");
			map.put("tgrandpabfa_brahman", "");
		}
		
		if (pedigree.getPedigreesireid() != null) {
		if (pedigree.getPedigreesireid().getPedigreesireid() != null) {
			if (pedigree.getPedigreesireid().getPedigreesireid().getPedigreedamid() != null) {
				map.put("tgrandmama_brahman", pedigree.getPedigreesireid().getPedigreesireid().getPedigreedamid().getCName());
				map.put("tgrandmamaprivate_brahman",
						pedigree.getPedigreesireid().getPedigreesireid().getPedigreedamid().getPrivateNo());
				map.put("tgrandmamabfa_brahman",
						pedigree.getPedigreesireid().getPedigreesireid().getPedigreedamid().getBbfaNo());
			} else {
				map.put("tgrandmama_brahman", "-");
				map.put("tgrandmamaprivate_brahman", "");
				map.put("tgrandmamabfa_brahman", "");
			}
		} else {
			map.put("tgrandmama_brahman", "-");
			map.put("tgrandmamaprivate_brahman", "");
			map.put("tgrandmamabfa_brahman", "");
		}
		} else {
			map.put("tgrandmama_brahman", "-");
			map.put("tgrandmamaprivate_brahman", "");
			map.put("tgrandmamabfa_brahman", "");
		}

		if (pedigree.getPedigreesireid() != null) {
		if (pedigree.getPedigreesireid().getPedigreedamid() != null) {
			if (pedigree.getPedigreesireid().getPedigreedamid().getPedigreesireid() != null) {
				map.put("tgrandfather_brahman", pedigree.getPedigreesireid().getPedigreedamid().getPedigreesireid().getCName());
				map.put("tgrandfatherprivate_brahman",
						pedigree.getPedigreesireid().getPedigreedamid().getPedigreesireid().getPrivateNo());
				map.put("tgrandfatherbfa_brahman",
						pedigree.getPedigreesireid().getPedigreedamid().getPedigreesireid().getBbfaNo());
			} else {
				map.put("tgrandfather_brahman", "-");
				map.put("tgrandfatherprivate_brahman", "");
				map.put("tgrandfatherbfa_brahman", "");
			}
		} else {
			map.put("tgrandfather_brahman", "-");
			map.put("tgrandfatherprivate_brahman", "");
			map.put("tgrandfatherbfa_brahman", "");
		}
		} else {
			map.put("tgrandfather_brahman", "-");
			map.put("tgrandfatherprivate_brahman", "");
			map.put("tgrandfatherbfa_brahman", "");
		}
		
		if (pedigree.getPedigreesireid()!= null) {
		if (pedigree.getPedigreesireid().getPedigreedamid() != null) {
			if (pedigree.getPedigreesireid().getPedigreedamid().getPedigreedamid() != null) {
				map.put("tgrandma_brahman", pedigree.getPedigreesireid().getPedigreedamid().getPedigreedamid().getCName());
				map.put("tgrandmaprivate_brahman",
						pedigree.getPedigreesireid().getPedigreedamid().getPedigreedamid().getPrivateNo());
				map.put("tgrandmabfa_brahman", pedigree.getPedigreesireid().getPedigreedamid().getPedigreedamid().getBbfaNo());
			} else {
				map.put("tgrandma_brahman", "-");
				map.put("tgrandmaprivate_brahman", "");
				map.put("tgrandmabfa_brahman", "");
			}
		} else {
			map.put("tgrandma_brahman", "-");
			map.put("tgrandmaprivate_brahman", "");
			map.put("tgrandmabfa_brahman", "");
		}
		} else {
			map.put("tgrandma_brahman", "-");
			map.put("tgrandmaprivate_brahman", "");
			map.put("tgrandmabfa_brahman", "");
		}
		
		if (pedigree.getPedigreedamid() != null) {
		if (pedigree.getPedigreedamid().getPedigreesireid() != null) {
			if (pedigree.getPedigreedamid().getPedigreesireid().getPedigreesireid() != null) {
				map.put("sgrandpa_brahman", pedigree.getPedigreedamid().getPedigreesireid().getPedigreesireid().getCName());
				map.put("sgrandpaprivate_brahman",
						pedigree.getPedigreedamid().getPedigreesireid().getPedigreesireid().getPrivateNo());
				map.put("sgrandpabfa_brahman", pedigree.getPedigreedamid().getPedigreesireid().getPedigreesireid().getBbfaNo());
			} else {
				map.put("sgrandpa_brahman", "-");
				map.put("sgrandpaprivate_brahman", "");
				map.put("sgrandpabfa_brahman", "");
			}
		} else {
			map.put("sgrandpa_brahman", "-");
			map.put("sgrandpaprivate_brahman", "");
			map.put("sgrandpabfa_brahman", "");
		}
		} else {
			map.put("sgrandpa_brahman", "-");
			map.put("sgrandpaprivate_brahman", "");
			map.put("sgrandpabfa_brahman", "");
		}
		
		if (pedigree.getPedigreedamid() != null) {
		if (pedigree.getPedigreedamid().getPedigreesireid() != null) {
			if (pedigree.getPedigreedamid().getPedigreesireid().getPedigreedamid() != null) {
				map.put("sgrandmama_brahman", pedigree.getPedigreedamid().getPedigreesireid().getPedigreedamid().getCName());
				map.put("sgrandmamaprivate_brahman",
						pedigree.getPedigreedamid().getPedigreesireid().getPedigreedamid().getPrivateNo());
				map.put("sgrandmamabfa_brahman",
						pedigree.getPedigreedamid().getPedigreesireid().getPedigreedamid().getBbfaNo());
			} else {
				map.put("sgrandmama_brahman", "-");
				map.put("sgrandmamaprivate_brahman", "");
				map.put("sgrandmamabfa_brahman", "");
			}
		} else {
			map.put("sgrandmama_brahman", "-");
			map.put("sgrandmamaprivate_brahman", "");
			map.put("sgrandmamabfa_brahman", "");
		}
		} else {
			map.put("sgrandmama_brahman", "-");
			map.put("sgrandmamaprivate_brahman", "");
			map.put("sgrandmamabfa_brahman", "");
		}
		
		if (pedigree.getPedigreedamid()!= null) {
		if (pedigree.getPedigreedamid().getPedigreedamid() != null) {
			if (pedigree.getPedigreedamid().getPedigreedamid().getPedigreesireid() != null) {
				map.put("sgrandfathe_brahmanr", pedigree.getPedigreedamid().getPedigreedamid().getPedigreesireid().getCName());
				map.put("sgrandfatherprivate_brahman",
						pedigree.getPedigreedamid().getPedigreedamid().getPedigreesireid().getPrivateNo());
				map.put("sgrandfatherbfa_brahman",
						pedigree.getPedigreedamid().getPedigreedamid().getPedigreesireid().getBbfaNo());
			} else {
				map.put("sgrandfather_brahman", "-");
				map.put("sgrandfatherprivate_brahman", "");
				map.put("sgrandfatherbfa_brahman", "");
			}
		} else {
			map.put("sgrandfather_brahman", "-");
			map.put("sgrandfatherprivate_brahman", "");
			map.put("sgrandfatherbfa_brahman", "");
		}
		} else {
			map.put("sgrandfather_brahman", "-");
			map.put("sgrandfatherprivate_brahman", "");
			map.put("sgrandfatherbfa_brahman", "");
		}
		
		if (pedigree.getPedigreedamid() != null) {
		if (pedigree.getPedigreedamid().getPedigreedamid() != null) {
			if (pedigree.getPedigreedamid().getPedigreedamid().getPedigreedamid() != null) {
				map.put("sgrandma_brahman", pedigree.getPedigreedamid().getPedigreesireid().getPedigreedamid().getCName());
				map.put("sgrandmaprivate_brahman",
						pedigree.getPedigreedamid().getPedigreesireid().getPedigreedamid().getPrivateNo());
				map.put("sgrandmabfa_brahman", pedigree.getPedigreedamid().getPedigreesireid().getPedigreedamid().getBbfaNo());
			} else {
				map.put("sgrandma_brahman", "-");
				map.put("sgrandmaprivate_brahman", "");
				map.put("sgrandmabfa_brahman", "");
			}
		} else {
			map.put("sgrandma_brahman", "-");
			map.put("sgrandmaprivate_brahman", "");
			map.put("sgrandmabfa_brahman", "");
		}
		} else {
			map.put("sgrandma_brahman", "-");
			map.put("sgrandmaprivate_brahman", "");
			map.put("sgrandmabfa_brahman", "");
		}

		return "/pedigreereport/reportbrahman";
	}
	
	
	
	
	//Report Wagyu
	@RequestMapping(value = "ReportWagyuPrinting")
	public String viewwagyu(@RequestParam("id") int id, Map<String, Object> map,HttpSession session,@RequestParam("bank") int bank) {
		Pedigree pedigree = pedigreeService.getPedigree(id);
		int iddata= (int) session.getAttribute("iddata");
		Report report = new Report();
		report.setDate(new Date());
		report.setDataId(dataService.getData(iddata));
		report.setPedigreeId(pedigree);
		report.setBank(bankService.getBank(bank));
		reportService.add(report);
		if (pedigree.getSex() != null) {
			map.put("sex_wagyu", pedigree.getSex());
		} else {
			map.put("sex_wagyu", "-");
		}
		if (pedigree.getCName() != null) {
			map.put("cname_wagyu", pedigree.getCName());
		} else {
			map.put("cname_wagyu", "-");
		}
		if (pedigree.getColor() != null) {
			map.put("color_wagyu", pedigree.getColor().getName());
		} else {
			map.put("color_wagyu", "-");
		}
		if (pedigree.getBbfaNo() != null) {
			map.put("bfa_wagyu", pedigree.getBbfaNo());
		} else {
			map.put("bfa_wagyu", "-");
		}
		if (pedigree.getPrivateNo() != null) {
			map.put("privateNo_wagyu", pedigree.getPrivateNo());
		} else {
			map.put("privateNo_wagyu", "-");
		}
		if (pedigree.getBand() != null) {
			map.put("band_wagyu", pedigree.getBand());
		} else {
			map.put("band_wagyu", "-");
		}
		if (pedigree.getBreeder() != null) {
			map.put("breeder_wagyu", pedigree.getBreeder());
		} else {
			map.put("breeder_wagyu", "-");
		}
		if (pedigree.getOwnerName() != null) {
			map.put("ownerName_wagyu", pedigree.getOwnerName());
		} else {
			map.put("ownerName_wagyu", "-");
		}
		if (pedigree.getDateDelivery() != null) {
			map.put("dateDelivery_wagyu", pedigree.getDateDelivery());
		} else {
			map.put("dateDelivery_wagyu", "-");
		}
		if (pedigree.getCalved() != null) {
			map.put("calved_wagyu", pedigree.getCalved());
		} else {
			map.put("calved_wagyu", "-");
		}
		// ÃØè¹¾èÍáÁè Wagyu
		if (pedigree.getPedigreesireid() != null) {
			map.put("sire_wagyu", pedigree.getPedigreesireid().getCName());
			map.put("sireprivate_wagyu", pedigree.getPedigreesireid().getPrivateNo());
			map.put("sirebfa_wagyu", pedigree.getPedigreesireid().getBbfaNo());
		} else {
			map.put("sire_wagyu", "-");
			map.put("sireprivate_wagyu", "");
			map.put("sirebfa_wagyu", "");
		}
		if (pedigree.getPedigreedamid() != null) {
			map.put("dam_wagyu", pedigree.getPedigreedamid().getCName());
			map.put("damprivate_wagyu", pedigree.getPedigreedamid().getPrivateNo());
			map.put("dambfa_wagyu", pedigree.getPedigreedamid().getBbfaNo());
		} else {
			map.put("dam_wagyu", "-");
			map.put("damprivate_wagyu", "");
			map.put("dambfa_wagyu", "");
		}
		// ÃØè¹»Ùè ÂèÒ µÒ ÂÒÂ Wagyu
		if (pedigree.getPedigreesireid() != null) {
			if (pedigree.getPedigreesireid().getPedigreesireid() != null) {
				map.put("grandpa_wagyu", pedigree.getPedigreesireid().getPedigreesireid().getCName());
				map.put("grandpaprivate_wagyu", pedigree.getPedigreesireid().getPedigreesireid().getPrivateNo());
				map.put("grandpabfa_wagyu", pedigree.getPedigreesireid().getPedigreesireid().getBbfaNo());
			} else {
				map.put("grandpa_wagyu", "-");
				map.put("grandpaprivate_wagyu", "");
				map.put("grandpabfa_wagyu", "");
			}
		} else {
			map.put("grandpa_wagyu", "-");
			map.put("grandpaprivate_wagyu", "");
			map.put("grandpabfa_wagyu", "");
		}
		if (pedigree.getPedigreesireid() != null) {
			if (pedigree.getPedigreesireid().getPedigreedamid() != null) {
				map.put("grandmama_wagyu", pedigree.getPedigreesireid().getPedigreedamid().getCName());
				map.put("grandmamaprivate_wagyu", pedigree.getPedigreesireid().getPedigreedamid().getPrivateNo());
				map.put("grandmamabfa_wagyu", pedigree.getPedigreesireid().getPedigreedamid().getBbfaNo());
			} else {
				map.put("grandmama_wagyu", "-");
				map.put("grandmamaprivate_wagyu", "");
				map.put("grandmamabfa_wagyu", "");
			}
		} else {
			map.put("grandmama_wagyu", "-");
			map.put("grandmamaprivate_wagyu", "");
			map.put("grandmamabfa_wagyu", "");
		}

		if (pedigree.getPedigreedamid() != null) {
			if (pedigree.getPedigreedamid().getPedigreesireid() != null) {
				map.put("grandfather_wagyu", pedigree.getPedigreedamid().getPedigreesireid().getCName());
				map.put("grandfatherprivate_wagyu", pedigree.getPedigreedamid().getPedigreesireid().getPrivateNo());
				map.put("grandfatherbfa_wagyu", pedigree.getPedigreedamid().getPedigreesireid().getBbfaNo());
			} else {
				map.put("grandfather_wagyu", "-");
				map.put("grandfatherprivate_wagyu", "");
				map.put("grandfatherbfa_wagyu", "");
			}
		} else {
			map.put("grandfather_wagyu", "-");
			map.put("grandfatherprivate", "");
			map.put("grandfatherbfa_wagyu", "");
		}

		if (pedigree.getPedigreedamid() != null) {
			if (pedigree.getPedigreedamid().getPedigreedamid() != null) {
				map.put("grandma_wagyu", pedigree.getPedigreedamid().getPedigreedamid().getCName());
				map.put("grandmaprivate_wagyu", pedigree.getPedigreedamid().getPedigreedamid().getPrivateNo());
				map.put("grandmabfa_wagyu", pedigree.getPedigreedamid().getPedigreedamid().getBbfaNo());
			} else {
				map.put("grandma_wagyu", "-");
				map.put("grandmaprivate_wagyu", "");
				map.put("grandmabfa_wagyu", "");
			}
		} else {
			map.put("grandma_wagyu", "-");
			map.put("grandmaprivate_wagyu", "");
			map.put("grandmabfa_wagyu", "");
		}

		// ทวด Wagyu
		if (pedigree.getPedigreesireid() != null) {
		if (pedigree.getPedigreesireid().getPedigreesireid() != null) {
			if (pedigree.getPedigreesireid().getPedigreesireid().getPedigreesireid() != null) {
				map.put("tgrandpa_wagyu", pedigree.getPedigreesireid().getPedigreesireid().getPedigreesireid().getCName());
				map.put("tgrandpaprivate_wagyu",
						pedigree.getPedigreesireid().getPedigreesireid().getPedigreesireid().getPrivateNo());
				map.put("tgrandpabfa_wagyu",
						pedigree.getPedigreesireid().getPedigreesireid().getPedigreesireid().getBbfaNo());
			} else {
				map.put("tgrandpa_wagyu", "-");
				map.put("tgrandpaprivate_wagyu", "");
				map.put("tgrandpabfa_wagyu", "");
			}
		} else {
			map.put("tgrandpa_wagyu", "-");
			map.put("tgrandpaprivate_wagyu", "");
			map.put("tgrandpabfa_wagyu", "");
		}
		} else {
			map.put("tgrandpa_wagyu", "-");
			map.put("tgrandpaprivate_wagyu", "");
			map.put("tgrandpabfa_wagyu", "");
		}
		
		if (pedigree.getPedigreesireid() != null) {
		if (pedigree.getPedigreesireid().getPedigreesireid() != null) {
			if (pedigree.getPedigreesireid().getPedigreesireid().getPedigreedamid() != null) {
				map.put("tgrandmama_wagyu", pedigree.getPedigreesireid().getPedigreesireid().getPedigreedamid().getCName());
				map.put("tgrandmamaprivate_wagyu",
						pedigree.getPedigreesireid().getPedigreesireid().getPedigreedamid().getPrivateNo());
				map.put("tgrandmamabfa_wagyu",
						pedigree.getPedigreesireid().getPedigreesireid().getPedigreedamid().getBbfaNo());
			} else {
				map.put("tgrandmama_wagyu", "-");
				map.put("tgrandmamaprivate_wagyu", "");
				map.put("tgrandmamabfa_wagyu", "");
			}
		} else {
			map.put("tgrandmama_wagyu", "-");
			map.put("tgrandmamaprivate_wagyu", "");
			map.put("tgrandmamabfa_wagyu", "");
		}
		} else {
			map.put("tgrandmama_wagyu", "-");
			map.put("tgrandmamaprivate_wagyu", "");
			map.put("tgrandmamabfa_wagyu", "");
		}

		if (pedigree.getPedigreesireid() != null) {
		if (pedigree.getPedigreesireid().getPedigreedamid() != null) {
			if (pedigree.getPedigreesireid().getPedigreedamid().getPedigreesireid() != null) {
				map.put("tgrandfather_wagyu", pedigree.getPedigreesireid().getPedigreedamid().getPedigreesireid().getCName());
				map.put("tgrandfatherprivate_wagyu",
						pedigree.getPedigreesireid().getPedigreedamid().getPedigreesireid().getPrivateNo());
				map.put("tgrandfatherbfa_wagyu",
						pedigree.getPedigreesireid().getPedigreedamid().getPedigreesireid().getBbfaNo());
			} else {
				map.put("tgrandfather_wagyu", "-");
				map.put("tgrandfatherprivate_wagyu", "");
				map.put("tgrandfatherbfa_wagyu", "");
			}
		} else {
			map.put("tgrandfather_wagyu", "-");
			map.put("tgrandfatherprivate_wagyu", "");
			map.put("tgrandfatherbfa_wagyu", "");
		}
		} else {
			map.put("tgrandfather_wagyu", "-");
			map.put("tgrandfatherprivate_wagyu", "");
			map.put("tgrandfatherbfa_wagyu", "");
		}
		
		if (pedigree.getPedigreesireid()!= null) {
		if (pedigree.getPedigreesireid().getPedigreedamid() != null) {
			if (pedigree.getPedigreesireid().getPedigreedamid().getPedigreedamid() != null) {
				map.put("tgrandma_wagyu", pedigree.getPedigreesireid().getPedigreedamid().getPedigreedamid().getCName());
				map.put("tgrandmaprivate_wagyu",
						pedigree.getPedigreesireid().getPedigreedamid().getPedigreedamid().getPrivateNo());
				map.put("tgrandmabfa_wagyu", pedigree.getPedigreesireid().getPedigreedamid().getPedigreedamid().getBbfaNo());
			} else {
				map.put("tgrandma_wagyu", "-");
				map.put("tgrandmaprivate_wagyu", "");
				map.put("tgrandmabfa_wagyu", "");
			}
		} else {
			map.put("tgrandma_wagyu", "-");
			map.put("tgrandmaprivate_wagyu", "");
			map.put("tgrandmabfa_wagyu", "");
		}
		} else {
			map.put("tgrandma_wagyu", "-");
			map.put("tgrandmaprivate_wagyu", "");
			map.put("tgrandmabfa_wagyu", "");
		}
		
		if (pedigree.getPedigreedamid() != null) {
		if (pedigree.getPedigreedamid().getPedigreesireid() != null) {
			if (pedigree.getPedigreedamid().getPedigreesireid().getPedigreesireid() != null) {
				map.put("sgrandpa_wagyu", pedigree.getPedigreedamid().getPedigreesireid().getPedigreesireid().getCName());
				map.put("sgrandpaprivate_wagyu",
						pedigree.getPedigreedamid().getPedigreesireid().getPedigreesireid().getPrivateNo());
				map.put("sgrandpabfa_wagyu", pedigree.getPedigreedamid().getPedigreesireid().getPedigreesireid().getBbfaNo());
			} else {
				map.put("sgrandpa_wagyu", "-");
				map.put("sgrandpaprivate_wagyu", "");
				map.put("sgrandpabfa_wagyu", "");
			}
		} else {
			map.put("sgrandpa_wagyu", "-");
			map.put("sgrandpaprivate_wagyu", "");
			map.put("sgrandpabfa_wagyu", "");
		}
		} else {
			map.put("sgrandpa_wagyu", "-");
			map.put("sgrandpaprivate_wagyu", "");
			map.put("sgrandpabfa_wagyu", "");
		}
		
		if (pedigree.getPedigreedamid() != null) {
		if (pedigree.getPedigreedamid().getPedigreesireid() != null) {
			if (pedigree.getPedigreedamid().getPedigreesireid().getPedigreedamid() != null) {
				map.put("sgrandmama_wagyu", pedigree.getPedigreedamid().getPedigreesireid().getPedigreedamid().getCName());
				map.put("sgrandmamaprivate_wagyu",
						pedigree.getPedigreedamid().getPedigreesireid().getPedigreedamid().getPrivateNo());
				map.put("sgrandmamabfa_wagyu",
						pedigree.getPedigreedamid().getPedigreesireid().getPedigreedamid().getBbfaNo());
			} else {
				map.put("sgrandmama_wagyu", "-");
				map.put("sgrandmamaprivate_wagyu", "");
				map.put("sgrandmamabfa_wagyu", "");
			}
		} else {
			map.put("sgrandmama_wagyu", "-");
			map.put("sgrandmamaprivate_wagyu", "");
			map.put("sgrandmamabfa_wagyu", "");
		}
		} else {
			map.put("sgrandmama_wagyu", "-");
			map.put("sgrandmamaprivate_wagyu", "");
			map.put("sgrandmamabfa_wagyu", "");
		}
		
		if (pedigree.getPedigreedamid()!= null) {
		if (pedigree.getPedigreedamid().getPedigreedamid() != null) {
			if (pedigree.getPedigreedamid().getPedigreedamid().getPedigreesireid() != null) {
				map.put("sgrandfather_wagyu", pedigree.getPedigreedamid().getPedigreedamid().getPedigreesireid().getCName());
				map.put("sgrandfatherprivate_wagyu",
						pedigree.getPedigreedamid().getPedigreedamid().getPedigreesireid().getPrivateNo());
				map.put("sgrandfatherbfa_wagyu",
						pedigree.getPedigreedamid().getPedigreedamid().getPedigreesireid().getBbfaNo());
			} else {
				map.put("sgrandfather_wagyu", "-");
				map.put("sgrandfatherprivate_wagyu", "");
				map.put("sgrandfatherbfa_wagyu", "");
			}
		} else {
			map.put("sgrandfather_wagyu", "-");
			map.put("sgrandfatherprivate_wagyu", "");
			map.put("sgrandfatherbfa_wagyu", "");
		}
		} else {
			map.put("sgrandfather_wagyu", "-");
			map.put("sgrandfatherprivate_wagyu", "");
			map.put("sgrandfatherbfa_wagyu", "");
		}
		
		if (pedigree.getPedigreedamid() != null) {
		if (pedigree.getPedigreedamid().getPedigreedamid() != null) {
			if (pedigree.getPedigreedamid().getPedigreedamid().getPedigreedamid() != null) {
				map.put("sgrandma_wagyu", pedigree.getPedigreedamid().getPedigreesireid().getPedigreedamid().getCName());
				map.put("sgrandmaprivate_wagyu",
						pedigree.getPedigreedamid().getPedigreesireid().getPedigreedamid().getPrivateNo());
				map.put("sgrandmabfa_wagyu", pedigree.getPedigreedamid().getPedigreesireid().getPedigreedamid().getBbfaNo());
			} else {
				map.put("sgrandma_wagyu", "-");
				map.put("sgrandmaprivate_wagyu", "");
				map.put("sgrandmabfa_wagyu", "");
			}
		} else {
			map.put("sgrandma_wagyu", "-");
			map.put("sgrandmaprivate_wagyu", "");
			map.put("sgrandmabfa_wagyu", "");
		}
		} else {
			map.put("sgrandma_wagyu", "-");
			map.put("sgrandmaprivate_wagyu", "");
			map.put("sgrandmabfa_wagyu_wagyu", "");
		}

		return "/pedigreereport/reportwagyu";
	}
	

	
	
	public List<Map<String, ?>> findALL(ReportService reportService) {
		List<Map<String, ?>> reportslist = new ArrayList<>();
		List<Report> reports = reportService.getAllReport();
		for (Report report : reports) {
			Map<String, Object> r = new HashMap<String, Object>();
			/*r.put("iddetail", report.getId());
		    r.put("datedetail",report.getDate());
			r.put("cnamedetail",report.getPedigreeId().getCName());
			
			r.put("bankdetail",report.getDataId().getFName()); */
			// r.put("dataId",report.getDataId());

			reportslist.add(r);
		}
		return reportslist;
	}
	
/*	@SuppressWarnings("unchecked")
	@RequestMapping(value="pedigreereport/report_detail")
	public String reportdetail(Map<String, Object> map){
		List<Map<String, ?>> list = new ArrayList<Map<String, ?>>();
		
		for (Report report : reports ) {
			Map<String, Object> r = new HashMap<String, Object>();
			r.put("iddetail", report.getId());
		    r.put("datedetail",report.getDate());
			r.put("cnamedetail",report.getPedigreeId().getCName());
			
			r.put("bankdetail",report.getBank().getName()); 
			// r.put("dataId",report.getDataId());

			list.add(r);
		}
		map.put("list",list);
		return "pedigreereport/report_detail";
	}*/
	
	
/*	@RequestMapping(value = "/pedigreereport/report_detail")
	public ModelAndView Report(
			ModelMap modelMap , @RequestParam("id") int id ) {
		PedigreeReport pedigreeReport = new PedigreeReport();
		 Pedigree pedigree = pedigreeService.getPedigree(id); 

		modelMap.put("reportslist", pedigreeReport.findALL(reportService));
		ModelAndView model = new ModelAndView("/pedigreereport/report_detail");
		return model;
	}*/

	@RequestMapping(value = "/pedigreereport/reportangus")
	public ModelAndView ReportAngus(
			ModelMap modelMap/* , @RequestParam("id") int id */) {
		PedigreeReport pedigreeReport = new PedigreeReport();
		/* Pedigree pedigree = pedigreeService.getPedigree(id); */

		modelMap.put("reportslist", pedigreeReport.findALL(reportService));
		ModelAndView model = new ModelAndView("/pedigreereport/reportangus");
		return model;
	}

	@RequestMapping(value = "/pedigreereport/reportbeefmaster")
	public ModelAndView ReportBeefMaster(
			ModelMap modelMap/* , @RequestParam("id") int id */) {
		PedigreeReport pedigreeReport = new PedigreeReport();
		/* Pedigree pedigree = pedigreeService.getPedigree(id); */

		modelMap.put("reportslist", pedigreeReport.findALL(reportService));
		ModelAndView model = new ModelAndView("/pedigreereport/reportbeefmaster");
		return model;
	}

	@RequestMapping(value = "/pedigreereport/reportbrahman")
	public ModelAndView ReportBrahman(
			ModelMap modelMap/* , @RequestParam("id") int id */) {
		PedigreeReport pedigreeReport = new PedigreeReport();
		/* Pedigree pedigree = pedigreeService.getPedigree(id); */

		modelMap.put("reportslist", pedigreeReport.findALL(reportService));
		ModelAndView model = new ModelAndView("/pedigreereport/reportbrahman");
		return model;
	}

	@RequestMapping(value = "/pedigreereport/reportcharolais")
	public ModelAndView ReportCharolais(
			ModelMap modelMap/* , @RequestParam("id") int id */) {
		PedigreeReport pedigreeReport = new PedigreeReport();
		/* Pedigree pedigree = pedigreeService.getPedigree(id); */

		modelMap.put("reportslist", pedigreeReport.findALL(reportService));
		ModelAndView model = new ModelAndView("/pedigreereport/reportcharolais");
		return model;
	}

	@RequestMapping(value = "/pedigreereport/reportwagyu")
	public ModelAndView ReportWagyu(
			ModelMap modelMap/* , @RequestParam("id") int id */) {
		PedigreeReport pedigreeReport = new PedigreeReport();
		/* Pedigree pedigree = pedigreeService.getPedigree(id); */

		modelMap.put("reportslist", pedigreeReport.findALL(reportService));
		ModelAndView model = new ModelAndView("/pedigreereport/reportwagyu");
		return model;
	}

}
