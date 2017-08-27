<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/includes.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Users</title>

<link
	href="<c:url value="/resources/css/bootstrap/bootstrap.min.css" />"
	rel="stylesheet">
<script src="<c:url value="/resources/js/jquery-1.7.2.js" />"></script>

</head>
<body>
	<h1>Users</h1>
	<form:form action="Users.do" method="POST" commandName="users">
		<table>
			<tr>
				<td>ID</td>
				<td><form:input path="id" /></td>
			</tr>
			<tr>
				<td>User</td>
				<td><form:input path="username" /></td>
			</tr>
			<tr>
				<td>Pass</td>
				<td><form:input path="password" /></td>
			</tr>
			<tr>
				<td>Data</td>
				<td><form:select path="data.id" items="${dataList }"></form:select>
				</td>
			</tr>
			<tr>
				<td>Data</td>
				<td><form:select path="privilege.id" items="${privilegeList }"></form:select>
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
		<th>User</th>
		<th>Pass</th>
		<th>Data</th>
		<c:forEach items="${usersList}" var="users">
			<tr>
				<td>${users.id}</td>
				<td>${users.username}</td>
				<td>${users.password}</td>
				<td>${users.data.FName}</td>

			</tr>
		</c:forEach>
	</table>
</body>
</html>