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
String jrxmlFile = session.getServletContext().getRealPath("/WEB-INF/pages/report/pedigreecharolais.jrxml");
Map<String, Object> parameters = new HashMap<String, Object>();

InputStream input = new FileInputStream(new File(jrxmlFile));
JasperReport jasperReport = JasperCompileManager.compileReport(input);
HashMap parameterMap = new HashMap();
parameterMap.put("sex_charolais", request.getAttribute("sex_charolais"));
parameterMap.put("cname_charolais", request.getAttribute("cname_charolais"));
parameterMap.put("color_charolais", request.getAttribute("color_charolais"));
parameterMap.put("bfa_charolais", request.getAttribute("bfa_charolais"));
parameterMap.put("privateNo_charolais", request.getAttribute("privateNo_charolais"));
parameterMap.put("band_charolais", request.getAttribute("band_charolais"));
parameterMap.put("breeder_charolais", request.getAttribute("breeder_charolais"));
parameterMap.put("ownerName_charolais", request.getAttribute("ownerName_charolais"));
parameterMap.put("dateDelivery_charolais", request.getAttribute("dateDelivery_charolais"));
parameterMap.put("calved_charolais", request.getAttribute("calved_charolais"));

parameterMap.put("sire_charolais", request.getAttribute("sire_charolais"));
parameterMap.put("dam_charolais", request.getAttribute("dam_charolais"));

parameterMap.put("sireprivate_charolais", request.getAttribute("sireprivate_charolais"));
parameterMap.put("damprivate_charolais", request.getAttribute("damprivate_charolais"));

parameterMap.put("sirebfa_charolais", request.getAttribute("sirebfa_charolais"));
parameterMap.put("dambfa_charolais", request.getAttribute("dambfa_charolais"));

parameterMap.put("grandpa_charolais", request.getAttribute("grandpa_charolais"));
parameterMap.put("grandmama_charolais", request.getAttribute("grandmama_charolais"));
parameterMap.put("grandfather_charolais", request.getAttribute("grandfather_charolais"));
parameterMap.put("grandma_charolais", request.getAttribute("grandma_charolais"));

parameterMap.put("grandpaprivate_charolais", request.getAttribute("grandpaprivate_charolais"));
parameterMap.put("grandmamaprivate_charolais", request.getAttribute("grandmamaprivate_charolais"));
parameterMap.put("grandfatherprivate_charolais", request.getAttribute("grandfatherprivate_charolais"));
parameterMap.put("grandmaprivate_charolais", request.getAttribute("grandmaprivate_charolais"));

parameterMap.put("grandpabfa_charolais", request.getAttribute("grandpabfa_charolais"));
parameterMap.put("grandmamabfa_charolais", request.getAttribute("grandmamabfa_charolais"));
parameterMap.put("grandfatherbfa_charolais", request.getAttribute("grandfatherbfa_charolais"));
parameterMap.put("grandmabfa_charolais", request.getAttribute("grandmabfa_charolais"));


parameterMap.put("tgrandpa_charolais", request.getAttribute("tgrandpa_charolais"));
parameterMap.put("tgrandmama_charolais", request.getAttribute("tgrandmama_charolais"));
parameterMap.put("tgrandfather_charolais", request.getAttribute("tgrandfather_charolais"));
parameterMap.put("tgrandma_charolais", request.getAttribute("tgrandma_charolais"));

parameterMap.put("sgrandpa_charolais", request.getAttribute("sgrandpa_charolais"));
parameterMap.put("sgrandmama_charolais", request.getAttribute("sgrandmama_charolais"));
parameterMap.put("sgrandfather_charolais", request.getAttribute("sgrandfather_charolais"));
parameterMap.put("sgrandma_charolais", request.getAttribute("sgrandma_charolais"));


parameterMap.put("tgrandpaprivate_charolais", request.getAttribute("tgrandpaprivate_charolais"));
parameterMap.put("tgrandmamaprivate_charolais", request.getAttribute("tgrandmamaprivate_charolais"));
parameterMap.put("tgrandfatherprivate_charolais", request.getAttribute("tgrandfatherprivate_charolais"));
parameterMap.put("tgrandmaprivate_charolais", request.getAttribute("tgrandmaprivate_charolais"));

parameterMap.put("sgrandpaprivate_charolais", request.getAttribute("sgrandpaprivate_charolais"));
parameterMap.put("sgrandmamaprivate_charolais", request.getAttribute("sgrandmamaprivate_charolais"));
parameterMap.put("sgrandfatherprivate_charolais", request.getAttribute("sgrandfatherprivate_charolais"));
parameterMap.put("sgrandmaprivate_charolais", request.getAttribute("sgrandmaprivate_charolais"));


parameterMap.put("tgrandpabfa_charolais", request.getAttribute("tgrandpabfa_charolais"));
parameterMap.put("tgrandmamabfa_charolais", request.getAttribute("tgrandmamabfa_charolais"));
parameterMap.put("tgrandfatherbfa_charolais", request.getAttribute("tgrandfatherbfa_charolais"));
parameterMap.put("tgrandmabfa_charolais", request.getAttribute("tgrandmabfa_charolais"));

parameterMap.put("sgrandpabfa_charolais", request.getAttribute("sgrandpabfa_charolais"));
parameterMap.put("sgrandmamabfa_charolais", request.getAttribute("sgrandmamabfa_charolais"));
parameterMap.put("sgrandfatherbfa_charolais", request.getAttribute("sgrandfatherbfa_charolais"));
parameterMap.put("sgrandmabfa_charolais", request.getAttribute("sgrandmabfa_charolais"));
JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport,parameterMap,jrDataSource);
JasperExportManager.exportReportToPdfStream(jasperPrint,response.getOutputStream());
response.getOutputStream().flush();
response.getOutputStream().close();
}catch(IOException e){
e.printStackTrace();
}
%>