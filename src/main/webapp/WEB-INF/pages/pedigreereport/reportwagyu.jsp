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
try{
List<Map<String, ?>> dataSource = (List<Map<String, ?>>) request.getAttribute("reportslist");

JRDataSource jrDataSource = new JRBeanCollectionDataSource(dataSource);
String jrxmlFile = session.getServletContext().getRealPath("/WEB-INF/pages/report/pedigreewagyu.jrxml");
Map<String, Object> parameters = new HashMap<String, Object>();

InputStream input = new FileInputStream(new File(jrxmlFile));
JasperReport jasperReport = JasperCompileManager.compileReport(input);
HashMap parameterMap = new HashMap();
parameterMap.put("sex_wagyu", request.getAttribute("sex_wagyu"));
parameterMap.put("cname_wagyu", request.getAttribute("cname_wagyu"));
parameterMap.put("color_wagyu", request.getAttribute("color_wagyu"));
parameterMap.put("bfa_wagyu", request.getAttribute("bfa_wagyu"));
parameterMap.put("privateNo_wagyu", request.getAttribute("privateNo_wagyu"));
parameterMap.put("band_wagyu", request.getAttribute("band_wagyu"));
parameterMap.put("breeder_wagyu", request.getAttribute("breeder_wagyu"));
parameterMap.put("ownerName_wagyu", request.getAttribute("ownerName_wagyu"));
parameterMap.put("dateDelivery_wagyu", request.getAttribute("dateDelivery_wagyu"));
parameterMap.put("calved_wagyu", request.getAttribute("calved_wagyu"));

parameterMap.put("sire_wagyu", request.getAttribute("sire_wagyu"));
parameterMap.put("dam_wagyu", request.getAttribute("dam_wagyu"));

parameterMap.put("sireprivate_wagyu", request.getAttribute("sireprivate_wagyu"));
parameterMap.put("damprivate_wagyu", request.getAttribute("damprivate_wagyu"));

parameterMap.put("sirebfa_wagyu", request.getAttribute("sirebfa_wagyu"));
parameterMap.put("dambfa_wagyu", request.getAttribute("dambfa_wagyu"));

parameterMap.put("grandpa_wagyu", request.getAttribute("grandpa_wagyu"));
parameterMap.put("grandmama_wagyu", request.getAttribute("grandmama_wagyu"));
parameterMap.put("grandfather_wagyu", request.getAttribute("grandfather_wagyu"));
parameterMap.put("grandma_wagyu", request.getAttribute("grandma_wagyu"));

parameterMap.put("grandpaprivate_wagyu", request.getAttribute("grandpaprivate_wagyu"));
parameterMap.put("grandmamaprivate_wagyu", request.getAttribute("grandmamaprivate_wagyu"));
parameterMap.put("grandfatherprivate_wagyu", request.getAttribute("grandfatherprivate_wagyu"));
parameterMap.put("grandmaprivate_wagyu", request.getAttribute("grandmaprivate_wagyu"));

parameterMap.put("grandpabfa_wagyu", request.getAttribute("grandpabfa_wagyu"));
parameterMap.put("grandmamabfa_wagyu", request.getAttribute("grandmamabfa_wagyu"));
parameterMap.put("grandfatherbfa_wagyu", request.getAttribute("grandfatherbfa_wagyu"));
parameterMap.put("grandmabfa_wagyu", request.getAttribute("grandmabfa_wagyu"));


parameterMap.put("tgrandpa_wagyu", request.getAttribute("tgrandpa_wagyu"));
parameterMap.put("tgrandmama_wagyu", request.getAttribute("tgrandmama_wagyu"));
parameterMap.put("tgrandfather_wagyu", request.getAttribute("tgrandfather_wagyu"));
parameterMap.put("tgrandma_wagyu", request.getAttribute("tgrandma_wagyu"));

parameterMap.put("sgrandpa_wagyu", request.getAttribute("sgrandpa_wagyu"));
parameterMap.put("sgrandmama_wagyu", request.getAttribute("sgrandmama_wagyu"));
parameterMap.put("sgrandfather_wagyu", request.getAttribute("sgrandfather_wagyu"));
parameterMap.put("sgrandma_wagyu", request.getAttribute("sgrandma_wagyu"));


parameterMap.put("tgrandpaprivate_wagyu", request.getAttribute("tgrandpaprivate_wagyu"));
parameterMap.put("tgrandmamaprivate_wagyu", request.getAttribute("tgrandmamaprivate_wagyu"));
parameterMap.put("tgrandfatherprivate_wagyu", request.getAttribute("tgrandfatherprivate_wagyu"));
parameterMap.put("tgrandmaprivate_wagyu", request.getAttribute("tgrandmaprivate_wagyu"));

parameterMap.put("sgrandpaprivate_wagyu", request.getAttribute("sgrandpaprivate_wagyu"));
parameterMap.put("sgrandmamaprivate_wagyu", request.getAttribute("sgrandmamaprivate_wagyu"));
parameterMap.put("sgrandfatherprivate_wagyu", request.getAttribute("sgrandfatherprivate_wagyu"));
parameterMap.put("sgrandmaprivate_wagyu", request.getAttribute("sgrandmaprivate_wagyu"));


parameterMap.put("tgrandpabfa_wagyu", request.getAttribute("tgrandpabfa_wagyu"));
parameterMap.put("tgrandmamabfa_wagyu", request.getAttribute("tgrandmamabfa_wagyu"));
parameterMap.put("tgrandfatherbfa_wagyu", request.getAttribute("tgrandfatherbfa_wagyu"));
parameterMap.put("tgrandmabfa_wagyu", request.getAttribute("tgrandmabfa_wagyu"));

parameterMap.put("sgrandpabfa_wagyu", request.getAttribute("sgrandpabfa_wagyu"));
parameterMap.put("sgrandmamabfa_wagyu", request.getAttribute("sgrandmamabfa_wagyu"));
parameterMap.put("sgrandfatherbfa_wagyu", request.getAttribute("sgrandfatherbfa_wagyu"));
parameterMap.put("sgrandmabfa_wagyu", request.getAttribute("sgrandmabfa_wagyu"));
JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport,parameterMap,jrDataSource);
JasperExportManager.exportReportToPdfStream(jasperPrint,response.getOutputStream());
response.getOutputStream().flush();
response.getOutputStream().close();
}catch(IOException e){
e.printStackTrace();
}
%>