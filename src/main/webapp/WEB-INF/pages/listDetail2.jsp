<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/includes.jsp"%>
<%int i = 1,count1=0,count2=0,price;%>
<c:forEach items="${reportList}" var="report">
	<tr>
		<td class="text-center"><%=i++%></td>
		<%-- <td class="text-center">${report.pedigreeId.usersByUsersUserId.data.FName}  ${report.pedigreeId.usersByUsersUserId.data.LName}</td> --%>
		<td class="text-center">${report.pedigreeId.CName}</td>
		<td class="text-center">${report.pedigreeId.bbfaNo}</td>
		<td class="text-center">${report.pedigreeId.privateNo}</td>
		<%-- <td class="text-center">${report.pedigreeId.farmName}</td>
		<td class="text-center">${report.pedigreeId.ownerName}</td>
		<td class="text-center">${report.pedigreeId.pedigreeType.type}</td> --%>
		<td class="text-center">${report.pedigreeId.pedigreeType.price}</td>
		<td class="text-center">${report.pedigreeId.pay}</td>
		<td class="text-center">${report.date}</td>
	</tr>
	
</c:forEach>

		


<input type="hidden" id="count1" value="<%=count1%>">
<input type="hidden" id="count2" value="<%=count2%>">
<input type="hidden" id="sum" value="<%=count1+count2%>">
<%-- <input type="hidden" id="count2" value="<%=(i-1)-count%>"> --%>
<input type="hidden" id="sumCount1" value="<%=count1*500%>">
<input type="hidden" id="sumCount2" value="<%=count2*300%>">
<input type="hidden" id="sumCount" value="<%=count1*500+count2*300%>">