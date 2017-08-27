<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/includes.jsp"%>
<%
	int i = 1;
%>
<c:forEach items="${colorList}" var="color">
	<tr>
		<td class="text-center"><%=i++%><input type="hidden"
			class="form control" value="${color.id}" id="id3"
			disabled="disabled"></td>
		<td class="text-center"><input class="form-control text-center" type="text" disabled="disabled"
			value="${color.name}" id="name3"></td>
		<td align="center">
			<button type="button" class="btn btn-success fa fa-floppy-o fa-lg hide"
				id="btnSave3"></button>
			<button type="button" class="btn btn-warning fa fa-pencil fa-lg"
				id="btnEdit3"></button>
		</td>
		<td class="text-center">
			<button class="btn btn-danger" value="${color.id}"
				onclick="deleteColor(this)">
				<i class="fa fa-times"></i>
			</button>
		</td>
	</tr>
</c:forEach>