<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/includes.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link
	href="<c:url value="/resources/css/bootstrap/bootstrap.min.css" />"
	rel="stylesheet">
<script src="<c:url value="/resources/js/jquery-1.7.2.js" />"></script>
</head>
<body>
	<h1>-ข้อมูลภาค</h1>
	<form:form action="Report.do" method="POST" commandName="report">
		<table>
			<tr>
				<td>ID</td>
				<td><form:input path="id" /></td>
			</tr>
			<tr>
				<td>Date</td>
				<td><form:input path="date" /></td>
			</tr>
			<tr>
				<td>Pedigree_id</td>
				<td><form:input path="pedigreeId" /></td>
			</tr>
			<tr>
				<td>Bank_id</td>
				<td><form:select path="bank.id" items="${bankList}" /></td>
			</tr>
			<tr>
				<td>Data_id</td>
				<td>
				<td><form:input path="dataId" /></td>
				</td>
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
		<th>Date</th>
		<th>Pedigree_id</th>
		<th>Bank_id</th>
		<th>Data_id</th>
		<c:forEach items="${reportList}" var="report">
			<tr>
				<td>${report.id}</td>
				<td>${report.date}</td>
				<td>${report.pedigreeId.CName}</td>
				<td>${report.bank.name}</td>
				<td>${report.dataId.FName}</td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>