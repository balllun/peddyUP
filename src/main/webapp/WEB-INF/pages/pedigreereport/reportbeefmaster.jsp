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
String jrxmlFile = session.getServletContext().getRealPath("/WEB-INF/pages/report/pedigreebeefmaster.jrxml");
Map<String, Object> parameters = new HashMap<String, Object>();

InputStream input = new FileInputStream(new File(jrxmlFile));
JasperReport jasperReport = JasperCompileManager.compileReport(input);
HashMap parameterMap = new HashMap();
parameterMap.put("sex", request.getAttribute("sex"));
parameterMap.put("cname", request.getAttribute("cname"));
parameterMap.put("color", request.getAttribute("color"));
parameterMap.put("bfa", request.getAttribute("bfa"));
parameterMap.put("privateNo", request.getAttribute("privateNo"));
parameterMap.put("band", request.getAttribute("band"));
parameterMap.put("breeder", request.getAttribute("breeder"));
parameterMap.put("ownerName", request.getAttribute("ownerName"));
parameterMap.put("dateDelivery", request.getAttribute("dateDelivery"));
parameterMap.put("calved", request.getAttribute("calved"));

parameterMap.put("sire", request.getAttribute("sire"));
parameterMap.put("dam", request.getAttribute("dam"));

parameterMap.put("sireprivate", request.getAttribute("sireprivate"));
parameterMap.put("damprivate", request.getAttribute("damprivate"));

parameterMap.put("sirebfa", request.getAttribute("sirebfa"));
parameterMap.put("dambfa", request.getAttribute("dambfa"));

parameterMap.put("grandpa", request.getAttribute("grandpa"));
parameterMap.put("grandmama", request.getAttribute("grandmama"));
parameterMap.put("grandfather", request.getAttribute("grandfather"));
parameterMap.put("grandma", request.getAttribute("grandma"));

parameterMap.put("grandpaprivate", request.getAttribute("grandpaprivate"));
parameterMap.put("grandmamaprivate", request.getAttribute("grandmamaprivate"));
parameterMap.put("grandfatherprivate", request.getAttribute("grandfatherprivate"));
parameterMap.put("grandmaprivate", request.getAttribute("grandmaprivate"));

parameterMap.put("grandpabfa", request.getAttribute("grandpabfa"));
parameterMap.put("grandmamabfa", request.getAttribute("grandmamabfa"));
parameterMap.put("grandfatherbfa", request.getAttribute("grandfatherbfa"));
parameterMap.put("grandmabfa", request.getAttribute("grandmabfa"));


parameterMap.put("tgrandpa", request.getAttribute("tgrandpa"));
parameterMap.put("tgrandmama", request.getAttribute("tgrandmama"));
parameterMap.put("tgrandfather", request.getAttribute("tgrandfather"));
parameterMap.put("tgrandma", request.getAttribute("tgrandma"));

parameterMap.put("sgrandpa", request.getAttribute("sgrandpa"));
parameterMap.put("sgrandmama", request.getAttribute("sgrandmama"));
parameterMap.put("sgrandfather", request.getAttribute("sgrandfather"));
parameterMap.put("sgrandma", request.getAttribute("sgrandma"));


parameterMap.put("tgrandpaprivate", request.getAttribute("tgrandpaprivate"));
parameterMap.put("tgrandmamaprivate", request.getAttribute("tgrandmamaprivate"));
parameterMap.put("tgrandfatherprivate", request.getAttribute("tgrandfatherprivate"));
parameterMap.put("tgrandmaprivate", request.getAttribute("tgrandmaprivate"));

parameterMap.put("sgrandpaprivate", request.getAttribute("sgrandpaprivate"));
parameterMap.put("sgrandmamaprivate", request.getAttribute("sgrandmamaprivate"));
parameterMap.put("sgrandfatherprivate", request.getAttribute("sgrandfatherprivate"));
parameterMap.put("sgrandmaprivate", request.getAttribute("sgrandmaprivate"));


parameterMap.put("tgrandpabfa", request.getAttribute("tgrandpabfa"));
parameterMap.put("tgrandmamabfa", request.getAttribute("tgrandmamabfa"));
parameterMap.put("tgrandfatherbfa", request.getAttribute("tgrandfatherbfa"));
parameterMap.put("tgrandmabfa", request.getAttribute("tgrandmabfa"));

parameterMap.put("sgrandpabfa", request.getAttribute("sgrandpabfa"));
parameterMap.put("sgrandmamabfa", request.getAttribute("sgrandmamabfa"));
parameterMap.put("sgrandfatherbfa", request.getAttribute("sgrandfatherbfa"));
parameterMap.put("sgrandmabfa", request.getAttribute("sgrandmabfa"));
JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport,parameterMap,jrDataSource);
JasperExportManager.exportReportToPdfStream(jasperPrint,response.getOutputStream());
response.getOutputStream().flush();
response.getOutputStream().close();
}catch(IOException e){
e.printStackTrace();
}
%>