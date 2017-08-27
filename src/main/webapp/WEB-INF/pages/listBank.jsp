<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/includes.jsp"%>
<%
	int i = 1;
%>
<c:forEach items="${bankList}" var="bank">
	<tr>
		<td class="text-center"><%=i++%><input type="hidden" class="form control text-center"
			value="${bank.id}" id="id2" disabled="disabled"></td>
		<td class="text-center"><input class="form-control text-center" type="text" disabled="disabled"
			value="${bank.name}" id="name"></td>
		<td class="text-center"><input class="form-control text-center" type="text" disabled="disabled"
			value="${bank.defName}" id="defName"></td>
		<td align="center">
			<button type="button" class="btn btn-success fa fa-floppy-o fa-lg hide"
				id="btnSave2"></button>
			<button type="button" class="btn btn-warning fa fa-pencil fa-lg"
				id="btnEdit2"></button>
		</td>
		<td class="text-center">
			<button class="btn btn-danger" value="${bank.id}"
				onclick="deleteBank(this)">
				<i class="fa fa-times"></i>
			</button>
		</td>
	</tr>
</c:forEach>