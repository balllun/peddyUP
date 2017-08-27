<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/includes.jsp"%>
<%
	int i = 1;
%>
<c:forEach items="${pedigreeTypeList}" var="pedigreeType">
	<tr>
		<td class="text-center"><%=i++%> <input type="hidden"
			class="form control" value="${pedigreeType.id}" id="id"
			disabled="disabled"></td>
		<td class="text-center"><input class="form-control text-center" type="text" disabled="disabled"
			value="${pedigreeType.gene}" id="gene"></td>
		<td class="text-center"><input class="form-control text-center" type="text" disabled="disabled"
			value="${pedigreeType.def}" id="def"></td>
		<td class="text-center"><input class="form-control text-center" type="text" disabled="disabled"
			value="${pedigreeType.type}" id="type"></td>
		<td class="text-center"><input class="form-control text-center" type="text" disabled="disabled"
			value="${pedigreeType.price}" id="price"></td>
		<td align="center">
			<button type="button" class="btn btn-success fa fa-floppy-o fa-lg hide"
				id="btnSave1"></button>
			<button type="button" class="btn btn-warning fa fa-pencil fa-lg"
				id="btnEdit1"></button>
		</td>

		<td class="text-center">
			<button class="btn btn-danger" value="${pedigreeType.id}"
				onclick="deleteGene(this)">
				<i class="fa fa-times"></i>
			</button>
		</td>
	</tr>
</c:forEach>

