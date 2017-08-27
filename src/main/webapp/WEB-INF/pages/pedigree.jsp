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
	<form:form action="Pedigree.do" method="POST" commandName="pedigree">
		<table>
			<tr>
				<td>pedigree_id</td>
				<td><form:input path="id" /></td>
			</tr>
			<tr>
				<td>c_name</td>
				<td><form:input path="CName" /></td>
			</tr>
			<tr>
				<td>sex</td>
				<td><form:input path="sex" /></td>
			</tr>
			<tr>
				<td>calved</td>
				<td><form:input type="date" path="calved" /></td>
			</tr>
			<tr>
				<td>bbfa_no</td>
				<td><form:input path="bbfaNo" /></td>
			</tr>
			<tr>
				<td>bbfa_f</td>
				<td><form:input path="bbfaF" /></td>
			</tr>
			<tr>
				<td>private_no</td>
				<td><form:input path="privateNo" /></td>
			</tr>
			<tr>
				<td>band</td>
				<td><form:input path="band" /></td>
			</tr>
			<tr>
				<td>breeder</td>
				<td><form:input path="breeder" /></td>
			</tr>
			<td>owner</td>
			<td><form:input path="owner" /></td>
			</tr>
			<tr>
				<td>date_delivery</td>
				<td><form:input type="date" path="dateDelivery" /></td>
			</tr>
			<tr>
				<td>breed</td>
				<td><form:input path="breed" /></td>
			</tr>
			<td>farm_name</td>
			<td><form:input path="farmName" /></td>
			</tr>
			<tr>
				<td>owner_name</td>
				<td><form:input path="ownerName" /></td>
			</tr>
			<tr>
				<td>pay</td>
				<td><form:input path="pay" /></td>
			</tr>
			<td>color</td>
			<td><form:select path="color.id" items="${colorList}" /></td>
			</tr>
			<tr>
				<td>gene</td>
				<td><form:select path="pedigreeType.id"
						items="${pedigreeTypeList}" /></td>
			</tr>
			<tr>
				<td>type_type</td>
				<td><form:select path="pedigreeType.id"
						items="${pedigreeTypeList}" /></td>
			</tr>
			<tr>
				<td>users_user</td>
				<td><form:select path="usersByUsersUserId.id"
						items="${usersList}" /></td>
			</tr>
			<tr>
				<td>Sir</td>
				<td><form:select path="pedigreesireid.id"
						items="${pedigree1List}" /></td>
			</tr>
			<tr>
				<td>Dam</td>
				<td><form:select path="pedigreedamid.id"
						items="${pedigree1List}" /></td>
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
		<th>pedigree_id</th>
		<th>c_name</th>
		<th>sex</th>
		<th>calved</th>
		<th>bbfa_no</th>
		<th>bbfa_f</th>
		<th>private_no</th>
		<th>band</th>
		<th>breeder</th>
		<th>owner</th>
		<th>date_delivery</th>
		<th>breed</th>
		<th>farm_name</th>
		<th>owner_name</th>
		<th>pay</th>
		<th>color</th>
		<th>gene</th>
		<th>type_type</th>
		<th>users_user</th>
		<th>Sire</th>
		<th>Dam</th>
		<c:forEach items="${pedigreeList}" var="pedigree">
			<tr>
				<td>${pedigree.id}</td>
				<td>${pedigree.CName}</td>
				<td>${pedigree.sex}</td>
				<td>${pedigree.calved}</td>
				<td>${pedigree.bbfaNo}</td>
				<td>${pedigree.bbfaF}</td>
				<td>${pedigree.privateNo}</td>
				<td>${pedigree.band}</td>
				<td>${pedigree.breeder}</td>
				<td>${pedigree.owner}</td>
				<td>${pedigree.dateDelivery}</td>
				<td>${pedigree.breed}</td>
				<td>${pedigree.farmName}</td>
				<td>${pedigree.ownerName}</td>
				<td>${pedigree.pay}</td>
				<td>${pedigree.color.name}</td>
				<td>${pedigree.pedigreeType.gene}</td>
				<td>${pedigree.pedigreeType.type}</td>
				<td>${pedigree.usersByUsersUserId.username}</td>
				<td>${pedigree.pedigreesireid.CName}</td>
				<td>${pedigree.pedigreedamid.CName}</td>

			</tr>
		</c:forEach>
	</table>

</body>
</html>