<%@ page contentType="application/pdf"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ page import="net.sf.jasperreports.engine.JRDataSource"%>
<%@ page import="net.sf.jasperreports.engine.JasperReport"%>
<%@ page import="net.sf.jasperreports.engine.JasperCompileManager"%>
<%@ page import="net.sf.jasperreports.engine.JasperFillManager"%>
<%@ page import="net.sf.jasperreports.engine.JasperExportManager"%>
<%@ page import="net.sf.jasperreports.engine.JasperPrint"%>
<%@ page import="net.sf.jasperreports.engine.data.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>


<%
	try {
		List<Map<String, ?>> dataSource = (List<Map<String, ?>>) request.getAttribute("reportslist");

		JRDataSource jrDataSource = new JRBeanCollectionDataSource(dataSource);
		String jrxmlFile = session.getServletContext().getRealPath("/WEB-INF/pages/report/pedigreeangus.jrxml");
		Map<String, Object> parameters = new HashMap<String, Object>();

		InputStream input = new FileInputStream(new File(jrxmlFile));
		JasperReport jasperReport = JasperCompileManager.compileReport(input);
		HashMap parameterMap = new HashMap();
		parameterMap.put("sex_angus", request.getAttribute("sex_angus"));
		parameterMap.put("cname_angus", request.getAttribute("cname_angus"));
		parameterMap.put("color_angus", request.getAttribute("color_angus"));
		parameterMap.put("bfa_angus", request.getAttribute("bfa_angus"));
		parameterMap.put("privateNo_angus", request.getAttribute("privateNo_angus"));
		parameterMap.put("band_angus", request.getAttribute("band_angus"));
		parameterMap.put("breeder_angus", request.getAttribute("breeder_angus"));
		parameterMap.put("ownerName_angus", request.getAttribute("ownerName_angus"));
		parameterMap.put("dateDelivery_angus", request.getAttribute("dateDelivery_angus"));
		parameterMap.put("calved_angus", request.getAttribute("calved_angus"));

		parameterMap.put("sire_angus", request.getAttribute("sire_angus"));
		parameterMap.put("dam_angus", request.getAttribute("dam_angus"));

		parameterMap.put("sireprivate_angus", request.getAttribute("sireprivate_angus"));
		parameterMap.put("damprivate_angus", request.getAttribute("damprivate_angus"));

		parameterMap.put("sirebfa_angus", request.getAttribute("sirebfa_angus"));
		parameterMap.put("dambfa_angus", request.getAttribute("dambfa_angus"));

		parameterMap.put("grandpa_angus", request.getAttribute("grandpa_angus"));
		parameterMap.put("grandmama_angus", request.getAttribute("grandmama_angus"));
		parameterMap.put("grandfather_angus", request.getAttribute("grandfather_angus"));
		parameterMap.put("grandma_angus", request.getAttribute("grandma_angus"));

		parameterMap.put("grandpaprivate_angus", request.getAttribute("grandpaprivate_angus"));
		parameterMap.put("grandmamaprivate_angus", request.getAttribute("grandmamaprivate_angus"));
		parameterMap.put("grandfatherprivate_angus", request.getAttribute("grandfatherprivate_angus"));
		parameterMap.put("grandmaprivate_angus", request.getAttribute("grandmaprivate_angus"));

		parameterMap.put("grandpabfa_angus", request.getAttribute("grandpabfa_angus"));
		parameterMap.put("grandmamabfa_angus", request.getAttribute("grandmamabfa_angus"));
		parameterMap.put("grandfatherbfa_angus", request.getAttribute("grandfatherbfa_angus"));
		parameterMap.put("grandmabfa_angus", request.getAttribute("grandmabfa_angus"));


		parameterMap.put("tgrandpa_angus", request.getAttribute("tgrandpa_angus"));
		parameterMap.put("tgrandmama_angus", request.getAttribute("tgrandmama_angus"));
		parameterMap.put("tgrandfather_angus", request.getAttribute("tgrandfather_angus"));
		parameterMap.put("tgrandma_angus", request.getAttribute("tgrandma"));

		parameterMap.put("sgrandpa_angus", request.getAttribute("sgrandpa_angus"));
		parameterMap.put("sgrandmama_angus", request.getAttribute("sgrandmama_angus"));
		parameterMap.put("sgrandfather_angus", request.getAttribute("sgrandfather_angus"));
		parameterMap.put("sgrandma_angus", request.getAttribute("sgrandma_angus"));


		parameterMap.put("tgrandpaprivate_angus", request.getAttribute("tgrandpaprivate_angus"));
		parameterMap.put("tgrandmamaprivate_angus", request.getAttribute("tgrandmamaprivate_angus"));
		parameterMap.put("tgrandfatherprivate_angus", request.getAttribute("tgrandfatherprivate_angus"));
		parameterMap.put("tgrandmaprivate_angus", request.getAttribute("tgrandmaprivate_angus"));

		parameterMap.put("sgrandpaprivate_angus", request.getAttribute("sgrandpaprivate_angus"));
		parameterMap.put("sgrandmamaprivate_angus", request.getAttribute("sgrandmamaprivate_angus"));
		parameterMap.put("sgrandfatherprivate_angus", request.getAttribute("sgrandfatherprivate_angus"));
		parameterMap.put("sgrandmaprivate_angus", request.getAttribute("sgrandmaprivate_angus"));


		parameterMap.put("tgrandpabfa_angus", request.getAttribute("tgrandpabfa_angus"));
		parameterMap.put("tgrandmamabfa_angus", request.getAttribute("tgrandmamabfa_angus"));
		parameterMap.put("tgrandfatherbfa_angus", request.getAttribute("tgrandfatherbfa_angus"));
		parameterMap.put("tgrandmabfa_angus", request.getAttribute("tgrandmabfa_angus"));

		parameterMap.put("sgrandpabfa_angus", request.getAttribute("sgrandpabfa_angus"));
		parameterMap.put("sgrandmamabfa_angus", request.getAttribute("sgrandmamabfa_angus"));
		parameterMap.put("sgrandfatherbfa_angus", request.getAttribute("sgrandfatherbfa_angus"));
		parameterMap.put("sgrandmabfa_angus", request.getAttribute("sgrandmabfa_angus"));
		JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport,parameterMap,jrDataSource);
		JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());
		response.getOutputStream().flush();
		response.getOutputStream().close();
	} catch (IOException e) {
		e.printStackTrace();
	}
%>