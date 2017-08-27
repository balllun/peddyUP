<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/includes.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Data</title>

<link
	href="<c:url value="/resources/css/bootstrap/bootstrap.min.css" />"
	rel="stylesheet">
<script src="<c:url value="/resources/js/jquery-1.7.2.js" />"></script>

</head>
<body>
	<h1>Data</h1>
	<form:form action="Data.do" method="POST" commandName="data">
		<table>
			<tr>
				<td>ชื่อ</td>
				<td><form:input path="id" /></td>
			</tr>
			<tr>
				<td>Username</td>
				<td><form:input path="users.username" /></td>
			</tr>
			<tr>
				<td>Pass</td>
				<td><form:input type="password" path="users.password" /></td>
			</tr>
			<tr>
				<td>ชื่อ</td>
				<td><form:input path="FName" /></td>
			</tr>
			<tr>
				<td>นามสกุล</td>
				<td><form:input path="LName" /></td>
			</tr>
			<tr>
				<td>เลขประจำตัวประชาชน</td>
				<td><form:input path="idNo" /></td>
			</tr>
			<tr>
				<td>ที่อยู่</td>
				<td><form:input path="address" /></td>
			</tr>
			<tr>
				<td>โทรศัพท์</td>
				<td><form:input path="mobile" /></td>
			</tr>
			<tr>
				<td>เบอร์บ้าน</td>
				<td><form:input path="phone" /></td>
			</tr>
			<tr>
				<td>E-mail</td>
				<td><form:input path="otherMail" /></td>
			</tr>
			<tr>
				<td>แฟกซ์</td>
				<td><form:input path="fax" /></td>
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
		<th>User</th>
		<th>Pass</th>
		<th>ชื่อ</th>
		<th>นามสกุล</th>
		<th>เลขประจำตัวประชาชน</th>
		<th>ที่อยู่</th>
		<th>โทรศัพท์</th>
		<th>เบอร์บ้าน</th>
		<th>E-mail</th>
		<th>แฟกซ์</th>
		<c:forEach items="${dataList}" var="data">
			<tr>
				<td>${data.id}</td>
				<td>${data.users.username}</td>
				<td>${data.users.password}</td>
				<td>${data.FName}</td>
				<td>${data.LName}</td>
				<td>${data.idNo}</td>
				<td>${data.address}</td>
				<td>${data.mobile}</td>
				<td>${data.phone}</td>
				<td>${data.otherMail}</td>
				<td>${data.fax}</td>

			</tr>
		</c:forEach>
	</table>
</body>
</html>