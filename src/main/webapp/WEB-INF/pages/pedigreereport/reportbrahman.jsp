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
String jrxmlFile = session.getServletContext().getRealPath("/WEB-INF/pages/report/pedigreebrahman.jrxml");
Map<String, Object> parameters = new HashMap<String, Object>();

InputStream input = new FileInputStream(new File(jrxmlFile));
JasperReport jasperReport = JasperCompileManager.compileReport(input);
HashMap parameterMap = new HashMap();
parameterMap.put("sex_brahman", request.getAttribute("sex_brahman"));
parameterMap.put("cname_brahman", request.getAttribute("cname_brahman"));
parameterMap.put("color_brahman", request.getAttribute("color_brahman"));
parameterMap.put("bfa_brahman", request.getAttribute("bfa_brahman"));
parameterMap.put("privateNo_brahman", request.getAttribute("privateNo_brahman"));
parameterMap.put("band_brahman", request.getAttribute("band_brahman"));
parameterMap.put("breeder_brahman", request.getAttribute("breeder_brahman"));
parameterMap.put("ownerName_brahman", request.getAttribute("ownerName_brahman"));
parameterMap.put("dateDelivery_brahman", request.getAttribute("dateDelivery_brahman"));
parameterMap.put("calved_brahman", request.getAttribute("calved_brahman"));

parameterMap.put("sire_brahman", request.getAttribute("sire_brahman"));
parameterMap.put("dam_brahman", request.getAttribute("dam_brahman"));

parameterMap.put("sireprivate_brahman", request.getAttribute("sireprivate_brahman"));
parameterMap.put("damprivate_brahman", request.getAttribute("damprivate_brahman"));

parameterMap.put("sirebfa_brahman", request.getAttribute("sirebfa_brahman"));
parameterMap.put("dambfa_brahman", request.getAttribute("dambfa_brahman"));

parameterMap.put("grandpa_brahman", request.getAttribute("grandpa_brahman"));
parameterMap.put("grandmama_brahman", request.getAttribute("grandmama_brahman"));
parameterMap.put("grandfather_brahman", request.getAttribute("grandfather_brahman"));
parameterMap.put("grandma_brahman", request.getAttribute("grandma_brahman"));

parameterMap.put("grandpaprivate_brahman", request.getAttribute("grandpaprivate_brahman"));
parameterMap.put("grandmamaprivate_brahman", request.getAttribute("grandmamaprivate_brahman"));
parameterMap.put("grandfatherprivate_brahman", request.getAttribute("grandfatherprivate_brahman"));
parameterMap.put("grandmaprivate_brahman", request.getAttribute("grandmaprivate_brahman"));

parameterMap.put("grandpabfa_brahman", request.getAttribute("grandpabfa_brahman"));
parameterMap.put("grandmamabfa_brahman", request.getAttribute("grandmamabfa_brahman"));
parameterMap.put("grandfatherbfa_brahman", request.getAttribute("grandfatherbfa_brahman"));
parameterMap.put("grandmabfa_brahman", request.getAttribute("grandmabfa_brahman"));


parameterMap.put("tgrandpa_brahman", request.getAttribute("tgrandpa_brahman"));
parameterMap.put("tgrandmama_brahman", request.getAttribute("tgrandmama_brahman"));
parameterMap.put("tgrandfather_brahman", request.getAttribute("tgrandfather_brahman"));
parameterMap.put("tgrandma_brahman", request.getAttribute("tgrandma_brahman"));

parameterMap.put("sgrandpa_brahman", request.getAttribute("sgrandpa_brahman"));
parameterMap.put("sgrandmama_brahman", request.getAttribute("sgrandmama_brahman"));
parameterMap.put("sgrandfather_brahman", request.getAttribute("sgrandfather_brahman"));
parameterMap.put("sgrandma_brahman", request.getAttribute("sgrandma_brahman"));


parameterMap.put("tgrandpaprivate_brahman", request.getAttribute("tgrandpaprivate_brahman"));
parameterMap.put("tgrandmamaprivate_brahman", request.getAttribute("tgrandmamaprivate_brahman"));
parameterMap.put("tgrandfatherprivate_brahman", request.getAttribute("tgrandfatherprivate_brahman"));
parameterMap.put("tgrandmaprivate_brahman", request.getAttribute("tgrandmaprivate_brahman"));

parameterMap.put("sgrandpaprivate_brahman", request.getAttribute("sgrandpaprivate_brahman"));
parameterMap.put("sgrandmamaprivate_brahman", request.getAttribute("sgrandmamaprivate_brahman"));
parameterMap.put("sgrandfatherprivate_brahman", request.getAttribute("sgrandfatherprivate_brahman"));
parameterMap.put("sgrandmaprivate_brahman", request.getAttribute("sgrandmaprivate_brahman"));


parameterMap.put("tgrandpabfa_brahman", request.getAttribute("tgrandpabfa_brahman"));
parameterMap.put("tgrandmamabfa_brahman", request.getAttribute("tgrandmamabfa_brahman"));
parameterMap.put("tgrandfatherbfa_brahman", request.getAttribute("tgrandfatherbfa_brahman"));
parameterMap.put("tgrandmabfa_brahman", request.getAttribute("tgrandmabfa_brahman"));

parameterMap.put("sgrandpabfa_brahman", request.getAttribute("sgrandpabfa_brahman"));
parameterMap.put("sgrandmamabfa_brahman", request.getAttribute("sgrandmamabfa_brahman"));
parameterMap.put("sgrandfatherbfa_brahman", request.getAttribute("sgrandfatherbfa_brahman"));
parameterMap.put("sgrandmabfa_brahman", request.getAttribute("sgrandmabfa_brahman"));
JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport,parameterMap,jrDataSource);
JasperExportManager.exportReportToPdfStream(jasperPrint,response.getOutputStream());
response.getOutputStream().flush();
response.getOutputStream().close();
}catch(IOException e){
e.printStackTrace();
}
%>