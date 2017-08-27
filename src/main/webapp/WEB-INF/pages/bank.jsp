<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/includes.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bank</title>

<link href="<c:url value="/resources/css/bootstrap/bootstrap.min.css" />" rel="stylesheet">
<script src="<c:url value="/resources/js/jquery-1.7.2.js" />"></script>

</head>
<body>
	<h1>Bank</h1>
	<form:form action="Bank.do" method="POST" commandName="bank">
		<table>
			<tr>
				<td>ID</td>
				<td><form:input path="id" /></td>
			</tr>
			<tr>
				<td>Name</td>
				<td><form:input path="name" /></td>
			</tr>
			<tr>
				<td>Def_Name</td>
				<td><form:input path="defName" /></td>
			</tr>
			
			<tr>
				<td colspan="2"><input type="submit" name="action" value="Add" />
					<input type="submit" name="action" value="Edit" /> <input
					type="submit" name="action" value="Delete" /> <input type="submit"
					name="action" value="Search" /></td>
			</tr>
		</table>
	</form:form>
	<br>
	<table border="1">
		<th>ID</th>
		<th>Name</th>
		<th>Def_Name</th>
		<c:forEach items="${bankList}" var="bank">
		<tr>
			<td>${bank.id}</td>
			<td>${bank.name}</td>
			<td>${bank.defName}</td>
		
		</tr>
	</c:forEach>
	</table>
</body>
</html>