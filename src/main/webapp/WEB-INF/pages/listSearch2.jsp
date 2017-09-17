<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/includes.jsp"%>
<%int i = 1;%>
<c:forEach items="${pedigreeList}" var="pedigree">
	<tr>
		<td class="text-center"><%=i++%></td>
		<td class="text-center">${pedigree.CName}</td>
		<td class="text-center">${pedigree.privateNo}</td>
		<td class="text-center">${pedigree.bbfaNo}</td>
		
		
		
			<%-- 	<td class="text-center">${pedigree.ownerName}</td>
		<td class="text-center">${pedigree.band}</td>
		<td class="text-center">${pedigree.sex}</td>
		<td class="text-center"><a href="Printing=${pedigree.id}"><button
					class="btn btn-info">
					<i class="fa fa-search"></i>View
				</button></a></td> --%>
		<td class="text-center"><a href="Print=${pedigree.id}" target="_blank"><button
					class="btn btn-success">
					<i class="fa fa-print"></i>&nbsp;Print
				</button></a></td>
	<%-- 	<td class="text-center"><button class="btn btn-danger"
				value="${pedigree.id}" onclick="deleteSearch(this)">
				<i class="fa fa-times"></i>
			</button></td> --%>
	</tr>
</c:forEach>