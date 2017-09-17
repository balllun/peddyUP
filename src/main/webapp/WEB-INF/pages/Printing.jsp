<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/includes.jsp"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="initial-scale=1,maximum-scale=1,user-scalable=no">
<title>Printing</title>
<link href="<c:url value="/resources/img/cow-band.png" />"
	rel="shortcut icon">

<link href="<c:url value="/resources/favicon_16.ico" />" rel="bookmark">

<link href="<c:url value="/resources/css/site.min.css" />"
	rel="stylesheet">

<link href="<c:url value="/resources/bootflat/css/bootflat.css" />"
	rel="stylesheet">

<link
	href="<c:url value="/resources/font-awesome-4.3.0/css/font-awesome.min.css" />"
	rel="stylesheet">

<link href="<c:url value="/resources/css/fileinput.css" />" media="all"
	rel="stylesheet" type="text/css" />

<%-- <script
	src="<c:url value="/http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js" />"></script> --%>


<script src="<c:url value="/resources/js/fileinput.js"  />"></script>

<script src="<c:url value="/resources/js/site.min.js" />"></script>

<script src="<c:url value="/resources/js/jquery-2.1.3.min.js" />"></script>

<link href="<c:url value="/resources/css/sweetalert.css" />"
	rel="stylesheet">
<script src="<c:url value="/resources/js/sweetalert.min.js" />"></script>


</head>
<header>
	<nav class="navbar navbar-default navbar-custom" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand"><img
					src="<c:url value="/resources/img/logo2.png" />" height="40"></a>
			</div>
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav navbar-left">
					<!-- <li><a class="nav-link t" href="index">หน้าแรก</a></li> -->
					<sec:authorize access="hasRole('Admin')">
						<li><a class="nav-link" href="record">บันทึกข้อมูลโค</a></li>
					</sec:authorize>
					<sec:authorize access="hasAnyRole('Admin','User')">
						<li><a class="nav-link" href="Search">ค้นหาข้อมูลโค</a></li>
					</sec:authorize>
					
					<sec:authorize access="hasRole('Admin')">
						<li><a class="nav-link" href="Detail">รายละเอียดการออกใบพันธุ์ประวัติ</a></li>
					</sec:authorize>
					<sec:authorize access="hasRole('Admin')">
				<li ><a class="nav-link" href="AllReport">ออกรายงาน</a></li>
			</sec:authorize> 
					<sec:authorize access="hasRole('Admin')">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown"> การตั้งค่า <b class="caret"></b>
						</a>
							<ul class="dropdown-menu">
								<li><a href="Manage"><i class="fa fa-user-md"></i>&nbsp;จัดการผู้ใช้งาน</a></li>
								<li><a href="Banking"><i class="fa fa-cog"></i>&nbsp;เพิ่มการตั้งค่า</a></li>
							</ul></li>
					</sec:authorize>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li data-toggle="modal" data-target=".bs-example-modal-sm"><a
						href="#"><i class="fa fa-times"></i>ออกจากระบบ</a></li>

					<div class="modal fade bs-example-modal-sm" tabindex="-1"
						role="dialog" aria-labelledby="mySmallModalLabel"
						aria-hidden="true">
						<div class="modal-dialog modal-sm">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>

								</div>
								<div class="modal-body">
									<p>คุณต้องการออกจากระบบหรือไม่</p>
								</div>
								<center>
									<div class="modal-footer">
										<a href="logout">
											<button type="button" class="btn btn-danger">Yes</button>
										</a>
										<button type="button" class="btn btn-primary"
											data-dismiss="modal">No</button>
									</div>
								</center>
							</div>
						</div>
					</div>
				</ul>
			</div>
		</div>
	</nav>
</header>
<body>
<div class="container">
		<div class="row">
			<div class=" col-sm-3">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<p class="panel-title text-center">
							<font size="6">Pedigree and Edit</font>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<form:form commandName="pedigree" class="form-horizontal" role="form">
			<form:hidden path="id" />

			<div class="form-group">
				<label class="control-label col-sm-2" for="pwd">Select Breed</label>
				<div class="col-sm-5">
					<input value="${pedee}" id="ped" type="text" class="form-control"
						disabled="disabled" />
				 <input value="${id}" id="id" type="hidden"
						class="form-control" disabled="disabled" />
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="pwd">Sex</label>
				<div class="col-sm-5">
					<fieldset disabled>
						<form:input path="sex" type="text" class="form-control"
							disabled="disabled" />
					</fieldset>
					<<form:select class="form-control" type="text" path="sex" disabled="disabled"  >
						<option value="Bull">Bull</option>
						<option value="Cow">Cow</option>
					</form:select> 
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="pwd">Color</label>
				<div class="col-sm-5">

					<select class="form-control" id="color" name="color"
						disabled="disabled">
						<c:forEach items="${colorList}" var="color">
							<option> value="${color.id}"
								<c:if test="${color == pedigree.color}">selected="selected"</c:if>>${color.name}</option>
						</c:forEach>
					</select>

				</div>
			</div>



			<div class="form-group">
				<label class="control-label col-sm-2" for="pwd">Breeder</label>
				<div class="col-sm-5">

					<input id="breeder" type="text" class="form-control"
						value="${pedigree.breeder}" disabled="disabled" />

				</div>
			</div>

			<%--  <input  class="form-control"  type="text"  value="${data.FName}" 
				 disabled="disabled" id="FName"> --%>

			<div class="form-group">
				<label class="control-label col-sm-2" for="pwd">Name</label>
				<div class="col-sm-5">

					<input id="CName" type="text" class="form-control"
						value="${pedigree.CName}" disabled="disabled" />

				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="pwd">Private Herd
					No.</label>
				<div class="col-sm-5">

					<input id="privateNo" type="text" class="form-control"
						value="${pedigree.privateNo}" disabled="disabled" />

				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="pwd">BFA No.</label>
				<div class="col-sm-5">

					<input id="bbfaNo" type="text" class="form-control"
						value="${pedigree.bbfaNo}" disabled="disabled" />

				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="pwd">Owner Farm
					Name</label>
				<div class="col-sm-5">

					<input id="owner" type="text" class="form-control"
						value="${pedigree.owner}" disabled="disabled" />

				</div>
			</div>



			<div class="form-group">
				<label class="control-label col-sm-2" for="pwd">Ownership
					Brand</label>
				<div class="col-sm-5">

					<input id="band" type="text" class="form-control"
						value="${pedigree.band}" disabled="disabled" />

				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="pwd">Farm Name</label>
				<div class="col-sm-5">

					<input id="farmName" type="text" class="form-control"
						value="${pedigree.farmName}" disabled="disabled" />

				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="pwd">Present
					Owner</label>
				<div class="col-sm-5">

					<input id="ownerName" type="text" class="form-control"
						value="${pedigree.ownerName}" disabled="disabled" />

				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="pwd">Date of
					Dalivery</label>
				<div class="col-sm-5">

					<input id="dateDelivery" type="date" class="form-control"
						value="${pedigree.dateDelivery}" disabled="disabled" />

				</div>
			</div>


			<div class="form-group">
				<label class="control-label col-sm-2" for="pwd">Calved</label>
				<div class="col-sm-5">

					<input id="calved" type="date" class="form-control"
						value="${pedigree.calved}" disabled="disabled" />

				</div>
			</div>




			<div class="col-md-offset-6 col-md-7">

				<div class="col-md-3">
					<form:input path="pedigreesireid.pedigreesireid.pedigreesireid.id"
						type="hidden" />
					<form:input
						path="pedigreesireid.pedigreesireid.pedigreesireid.CName"
						type="text" disabled="true" />
				</div>
				<div class="col-md-2">
					<form:input
						path="pedigreesireid.pedigreesireid.pedigreesireid.privateNo"
						type="text" disabled="true" />
				</div>
				<div class="col-md-1">
					<fieldset disabled>
						<input type="text" id="disabledTextInput" value="BULL">
					</fieldset>
				</div>
				<div class="col-md-2">
					<form:input
						path="pedigreesireid.pedigreesireid.pedigreesireid.bbfaNo"
						type="text" disabled="true" />
				</div>
				<div class="col-md-1">
					<form:input
						path="pedigreesireid.pedigreesireid.pedigreesireid.pedigreeType.gene"
						type="text" disabled="true" />
					<br>
				</div>
			</div>


			<div class="col-md-offset-3 col-md-7">
				<div class="col-md-3">
					<form:input path="pedigreesireid.pedigreesireid.id" type="hidden" />
					<form:input path="pedigreesireid.pedigreesireid.CName" type="text"
						disabled="true" />
				</div>
				<div class="col-md-2">
					<form:input path="pedigreesireid.pedigreesireid.privateNo"
						type="text" disabled="true" />
				</div>
				<div class="col-md-1">
					<fieldset disabled>
						<input type="text" id="disabledTextInput" value="BULL">
					</fieldset>
				</div>
				<div class="col-md-2">
					<form:input path="pedigreesireid.pedigreesireid.bbfaNo" type="text"
						disabled="true" />
				</div>
				<div class="col-md-1">
					<form:input path="pedigreesireid.pedigreesireid.pedigreeType.gene"
						type="text" disabled="true" />
				</div>
			</div>



			<div class="col-sm-offset-6 col-sm-7">
				<div class="col-md-3">
					<form:input path="pedigreesireid.pedigreesireid.pedigreedamid.id"
						type="hidden" />
					<form:input
						path="pedigreesireid.pedigreesireid.pedigreedamid.CName"
						type="text" disabled="true" />
				</div>
				<div class="col-md-2">
					<form:input
						path="pedigreesireid.pedigreesireid.pedigreedamid.privateNo"
						type="text" disabled="true" />
				</div>
				<div class="col-md-1">
					<fieldset disabled>
						<input type="text" id="disabledTextInput" value="COW">
					</fieldset>
				</div>
				<div class="col-md-2">
					<form:input
						path="pedigreesireid.pedigreesireid.pedigreedamid.bbfaNo"
						type="text" disabled="true" />
				</div>
				<div class="col-md-1">
					<form:input
						path="pedigreesireid.pedigreesireid.pedigreedamid.pedigreeType.gene"
						type="text" disabled="true" />
					<br>
				</div>
			</div>




			<div class="col-md-offset-0 col-md-7">
				<label class="control-label col-sm-1" for="pwd">SIRE</label>
				<div class="col-md-3">
					<form:input path="pedigreesireid.id" type="hidden" />
					<form:input path="pedigreesireid.CName" type="text" disabled="true" />
				</div>
				<div class="col-md-2">
					<form:input path="pedigreesireid.privateNo" type="text"
						disabled="true" />
				</div>
				<div class="col-md-1">
					<fieldset disabled>
						<input type="text" id="disabledTextInput" value="BULL">
					</fieldset>
				</div>
				<div class="col-md-2">
					<form:input path="pedigreesireid.bbfaNo" type="text"
						disabled="true" />
				</div>
				<div class="col-md-1">
					<form:input path="pedigreesireid.pedigreeType.gene" type="text"
						disabled="true" />
					<br>
				</div>
			</div>




			<div class="col-md-offset-6 col-md-7">
				<div class="col-md-3">
					<form:input path="pedigreesireid.pedigreedamid.pedigreesireid.id"
						type="hidden" />
					<form:input
						path="pedigreesireid.pedigreedamid.pedigreesireid.CName"
						type="text" disabled="true" />
				</div>
				<div class="col-md-2">
					<form:input
						path="pedigreesireid.pedigreedamid.pedigreesireid.privateNo"
						type="text" disabled="true" />
				</div>
				<div class="col-md-1">
					<fieldset disabled>
						<input type="text" id="disabledTextInput" value="BULL">
					</fieldset>
				</div>
				<div class="col-md-2">
					<form:input
						path="pedigreesireid.pedigreedamid.pedigreesireid.bbfaNo"
						type="text" disabled="true" />
				</div>
				<div class="col-md-1">
					<form:input
						path="pedigreesireid.pedigreedamid.pedigreesireid.pedigreeType.gene"
						type="text" disabled="true" />
					<br>
				</div>
			</div>


			<div class="col-md-offset-3 col-md-7">
				<div class="col-md-3">
					<form:input path="pedigreesireid.pedigreedamid.id" type="hidden" />
					<form:input path="pedigreesireid.pedigreedamid.CName" type="text"
						disabled="true" />
				</div>
				<div class="col-md-2">
					<form:input path="pedigreesireid.pedigreedamid.privateNo"
						type="text" disabled="true" />
				</div>
				<div class="col-md-1">
					<fieldset disabled>
						<input type="text" id="disabledTextInput" value="COW">
					</fieldset>
				</div>
				<div class="col-md-2">
					<form:input path="pedigreesireid.pedigreedamid.bbfaNo" type="text"
						disabled="true" />
				</div>
				<div class="col-md-1">
					<form:input path="pedigreesireid.pedigreedamid.pedigreeType.gene"
						type="text" disabled="true" />
					<br>
				</div>
			</div>


			<div class="col-md-offset-6 col-md-7">
				<div class="col-md-3">
					<form:input path="pedigreesireid.pedigreedamid.pedigreedamid.id"
						type="hidden" />
					<form:input path="pedigreesireid.pedigreedamid.pedigreedamid.CName"
						type="text" disabled="true" />
				</div>
				<div class="col-md-2">
					<form:input
						path="pedigreesireid.pedigreedamid.pedigreedamid.privateNo"
						type="text" disabled="true" />
				</div>
				<div class="col-md-1">
					<fieldset disabled>
						<input type="text" id="disabledTextInput" value="COW">
					</fieldset>
				</div>
				<div class="col-md-2">
					<form:input
						path="pedigreesireid.pedigreedamid.pedigreedamid.bbfaNo"
						type="text" disabled="true" />
				</div>
				<div class="col-md-1">
					<form:input
						path="pedigreesireid.pedigreedamid.pedigreedamid.pedigreeType.gene"
						type="text" disabled="true" />
					<br>
				</div>
			</div>

			<div class="col-md-offset-6 col-md-7">
				<br>
			</div>


			<div class="col-md-offset-6 col-md-7">
				<div class="col-md-3">
					<form:input path="pedigreedamid.pedigreesireid.pedigreesireid.id"
						type="hidden" />
					<form:input
						path="pedigreedamid.pedigreesireid.pedigreesireid.CName"
						type="text" disabled="true" />
				</div>
				<div class="col-md-2">
					<form:input
						path="pedigreedamid.pedigreesireid.pedigreesireid.privateNo"
						type="text" disabled="true" />
				</div>
				<div class="col-md-1">
					<fieldset disabled>
						<input type="text" id="disabledTextInput" value="BULL">
					</fieldset>
				</div>
				<div class="col-md-2">
					<form:input
						path="pedigreedamid.pedigreesireid.pedigreesireid.bbfaNo"
						type="text" disabled="true" />
				</div>
				<div class="col-md-1">
					<form:input
						path="pedigreedamid.pedigreesireid.pedigreesireid.pedigreeType.gene"
						type="text" disabled="true" />
					<br>
				</div>
			</div>
			<br>

			<div class="col-md-offset-3 col-md-7">
				<div class="col-md-3">
					<form:input path="pedigreedamid.pedigreesireid.id" type="hidden" />
					<form:input path="pedigreedamid.pedigreesireid.CName" type="text"
						disabled="true" />
				</div>
				<div class="col-md-2">
					<form:input path="pedigreedamid.pedigreesireid.privateNo"
						type="text" disabled="true" />
				</div>
				<div class="col-md-1">
					<fieldset disabled>
						<input type="text" id="disabledTextInput" value="BULL">
					</fieldset>
				</div>
				<div class="col-md-2">
					<form:input path="pedigreedamid.pedigreesireid.bbfaNo" type="text"
						disabled="true" />
				</div>
				<div class="col-md-1">
					<form:input path="pedigreedamid.pedigreesireid.pedigreeType.gene"
						type="text" disabled="true" />
					<br>
				</div>
			</div>

			<div class="col-md-offset-6 col-md-7">
				<div class="col-md-3">
					<form:input path="pedigreedamid.pedigreesireid.pedigreedamid.id"
						type="hidden" />
					<form:input path="pedigreedamid.pedigreesireid.pedigreedamid.CName"
						type="text" disabled="true" />
				</div>
				<div class="col-md-2">
					<form:input
						path="pedigreedamid.pedigreesireid.pedigreedamid.privateNo"
						type="text" disabled="true" />
				</div>
				<div class="col-md-1">
					<fieldset disabled>
						<input type="text" id="disabledTextInput" value="COW">
					</fieldset>
				</div>
				<div class="col-md-2">
					<form:input
						path="pedigreedamid.pedigreesireid.pedigreedamid.bbfaNo"
						type="text" disabled="true" />
				</div>
				<div class="col-md-1">
					<form:input
						path="pedigreedamid.pedigreesireid.pedigreedamid.pedigreeType.gene"
						type="text" disabled="true" />
					<br>
				</div>
			</div>



			<div class="col-md-offset-0 col-md-7">
				<label class="control-label col-sm-1" for="pwd">DAM</label>
				<div class="col-md-3">
					<form:input path="pedigreedamid.id" type="hidden" />
					<form:input path="pedigreedamid.CName" type="text" disabled="true" />
				</div>
				<div class="col-md-2">
					<form:input path="pedigreedamid.privateNo" type="text"
						disabled="true" />
				</div>
				<div class="col-md-1">
					<fieldset disabled>
						<input type="text" id="disabledTextInput" value="COW">
					</fieldset>
				</div>
				<div class="col-md-2">
					<form:input path="pedigreedamid.bbfaNo" type="text" disabled="true" />
				</div>
				<div class="col-md-1">
					<form:input path="pedigreedamid.pedigreeType.gene" type="text"
						disabled="true" />
					<br>
				</div>
			</div>




			<div class="col-md-offset-6 col-md-7">
				<div class="col-md-3">
					<form:input path="pedigreedamid.pedigreedamid.pedigreesireid.id"
						type="hidden" />
					<form:input path="pedigreedamid.pedigreedamid.pedigreesireid.CName"
						type="text" disabled="true" />
				</div>
				<div class="col-md-2">
					<form:input
						path="pedigreedamid.pedigreedamid.pedigreesireid.privateNo"
						type="text" disabled="true" />
				</div>
				<div class="col-md-1">
					<fieldset disabled>
						<input type="text" id="disabledTextInput" value="BULL">
					</fieldset>
				</div>
				<div class="col-md-2">
					<form:input
						path="pedigreedamid.pedigreedamid.pedigreesireid.bbfaNo"
						type="text" disabled="true" />
				</div>
				<div class="col-md-1">
					<form:input
						path="pedigreedamid.pedigreedamid.pedigreesireid.pedigreeType.gene"
						type="text" disabled="true" />
					<br>
				</div>
			</div>


			<div class="col-md-offset-3 col-md-7">
				<div class="col-md-3">
					<form:input path="pedigreedamid.pedigreedamid.id" type="hidden" />
					<form:input path="pedigreedamid.pedigreedamid.CName" type="text"
						disabled="true" />
				</div>
				<div class="col-md-2">
					<form:input path="pedigreedamid.pedigreedamid.privateNo"
						type="text" disabled="true" />
				</div>
				<div class="col-md-1">
					<fieldset disabled>
						<input type="text" id="disabledTextInput" value="COW">
					</fieldset>
				</div>
				<div class="col-md-2">
					<form:input path="pedigreedamid.pedigreedamid.bbfaNo" type="text"
						disabled="true" />
				</div>
				<div class="col-md-1">
					<form:input path="pedigreedamid.pedigreedamid.pedigreeType.gene"
						type="text" disabled="true" />
					<br>
				</div>
			</div>


			<div class="col-md-offset-6 col-md-7">
				<div class="col-md-3">
					<form:input path="pedigreedamid.pedigreedamid.pedigreedamid.id"
						type="hidden" />
					<form:input path="pedigreedamid.pedigreedamid.pedigreedamid.CName"
						type="text" disabled="true" />
				</div>
				<div class="col-md-2">
					<form:input
						path="pedigreedamid.pedigreedamid.pedigreedamid.privateNo"
						type="text" disabled="true" />
				</div>
				<div class="col-md-1">
					<fieldset disabled>
						<input type="text" id="disabledTextInput" value="COW">
					</fieldset>
				</div>
				<div class="col-md-2">
					<form:input path="pedigreedamid.pedigreedamid.pedigreedamid.bbfaNo"
						type="text" disabled="true" />
				</div>
				<div class="col-md-1">
					<form:input
						path="pedigreedamid.pedigreedamid.pedigreedamid.pedigreeType.gene"
						type="text" disabled="true" />
					<br>
				</div>
			</div>
		</form:form>
	</div>
	<br>
	<sec:authorize access="hasRole('Admin')">
		<div class="col-md-offset-6">
			<button 
				class="btn btn-success fa fa-floppy-o fa-lg hide" id="btnSave">
				Save Pedigree
			</button>
			<button  class="btn btn-warning fa fa-pencil fa-lg"
				id="btnEdit">
				Edit Pedigree
			</button>
		</div>
	</sec:authorize>



	<!-- <div class="container">
		<form class="form-horizontal" role="form">
			<div class="panel panel-default">
				<div class="panel-body">
					<div class="form-group">
						<br> <label class="control-label col-sm-2" for="pwd">รูปแบบการชำระเงิน</label>
						<div class="col-sm-3">
							<select class="form-control" id="sel1">
								<option>โอนเงิน</option>
								<option>เงินสด</option>
							</select>
						</div>
					</div>



					<div class="form-group">
						<label class="control-label col-sm-2" for="pwd">เลือกธนาคาร</label>
						<div class="col-sm-3">
							<select class="form-control" id="sel1">
								<option>ธนาคารกรุงไทย</option>
								<option>ธนาคารไทยพาณิชย์</option>
							</select>
						</div>
					</div>


					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<a class="btn btn-info btn-md" id="print"> <span
								class="glyphicon glyphicon-print"></span> Print
							</a>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div> -->

	<br>
	<br>
	<br>
	<br>
	<footer class="footer">
		<div class="container">
		<div class="col-md-6" align="left">
				<div class="row form-inline">
						<span style="color: white;font-size: 16px;">Copyright ©2015</span>
						<span style="color: white;font-size: 18px;"> | </span>
						<a href="" target="_blank" style="font-size: 16px;">Development Team</a>	
						<span style="color: white;font-size: 18px;"> | </span>
						<a href="" target="_blank" style="font-size: 16px;">Contact</a>
				</div>
				<div class="row form-inline">
					<span style="color: white;font-size: 16px;">By Computer Engineering 
					<a href="http://www.up.ac.th" target="_blank" class="textright">University Of Phayao &nbsp;</a></span>
					<a href="https://www.facebook.com/ComputerEngineeringUP?fref=ts" target="_blank" class="textright"><i class="fa fa-facebook-official"></i></a>
				</div>
		</div>
		<div class="col-md-6">
			<div align="right">
				<a>
					<a class="textright" href="index">Farm Management System : Pedigree Record and Search System</a>
					<img id="imgfooter" src="<c:url value="/resources/img/logo2.png" /> " height="45" " title="กลับสู่หน้าหลัก">
				</a> 
			</div>
		</div>
	</div>
	</footer>

</body>
<script type="text/javascript">
 


 $(document).on('click', '#btnEdit', function(e) {
		var idx = $('[id=btnEdit]').index(e.target);
		$('[id=btnSave]').eq(idx).removeClass("hide");
		$('[id=btnEdit]').eq(idx).hide();
		$('[id=pedigreeType\\.id]').eq(idx).prop('disabled',false);
		$('[id=sex]').eq(idx).prop('disabled',false);
		$('[id=color]').eq(idx).prop('disabled',false);
		$('[id=breeder]').eq(idx).prop('disabled',false);
		$('[id=CName]').eq(idx).prop('disabled',false);
		$('[id=privateNo]').eq(idx).prop('disabled',false);
		$('[id=bbfaNo]').eq(idx).prop('disabled',false);
		$('[id=owner]').eq(idx).prop('disabled',false);
		$('[id=band]').eq(idx).prop('disabled',false);
		$('[id=farmName]').eq(idx).prop('disabled',false); 
		$('[id=ownerName]').eq(idx).prop('disabled',false); 
		$('[id=dateDelivery]').eq(idx).prop('disabled',false);
		$('[id=calved]').eq(idx).prop('disabled',false); 
		$('[id=pedigreesireid\\.CName]').eq(idx).prop('disabled',false);
		$('[id=pedigreesireid\\.privateNo]').eq(idx).prop('disabled',false);
		$('[id=pedigreesireid\\.bbfaNo]').eq(idx).prop('disabled',false);
		
		$('[id=pedigreedamid\\.CName]').eq(idx).prop('disabled',false);
		$('[id=pedigreedamid\\.privateNo]').eq(idx).prop('disabled',false);
		$('[id=pedigreedamid\\.bbfaNo]').eq(idx).prop('disabled',false);
		
		$('[id=pedigreesireid\\.pedigreesireid\\.CName]').eq(idx).prop('disabled',false);
		$('[id=pedigreesireid\\.pedigreesireid\\.privateNo]').eq(idx).prop('disabled',false);
		$('[id=pedigreesireid\\.pedigreesireid\\.bbfaNo]').eq(idx).prop('disabled',false);
		
		$('[id=pedigreesireid\\.pedigreedamid\\.CName]').eq(idx).prop('disabled',false);
		$('[id=pedigreesireid\\.pedigreedamid\\.privateNo]').eq(idx).prop('disabled',false);
		$('[id=pedigreesireid\\.pedigreedamid\\.bbfaNo]').eq(idx).prop('disabled',false);
		
		$('[id=pedigreedamid\\.pedigreesireid\\.CName]').eq(idx).prop('disabled',false);
		$('[id=pedigreedamid\\.pedigreesireid\\.privateNo]').eq(idx).prop('disabled',false);
		$('[id=pedigreedamid\\.pedigreesireid\\.bbfaNo]').eq(idx).prop('disabled',false);
		
		$('[id=pedigreedamid\\.pedigreedamid\\.CName]').eq(idx).prop('disabled',false);
		$('[id=pedigreedamid\\.pedigreedamid\\.privateNo]').eq(idx).prop('disabled',false);
		$('[id=pedigreedamid\\.pedigreedamid\\.bbfaNo]').eq(idx).prop('disabled',false); 
		
		 $('[id=pedigreesireid\\.pedigreesireid\\.pedigreesireid\\.CName]').eq(idx).prop('disabled',false);
		$('[id=pedigreesireid\\.pedigreesireid\\.pedigreesireid\\.privateNo]').eq(idx).prop('disabled',false);
		$('[id=pedigreesireid\\.pedigreesireid\\.pedigreesireid\\.bbfaNo]').eq(idx).prop('disabled',false);
		
		$('[id=pedigreesireid\\.pedigreesireid\\.pedigreedamid\\.CName]').eq(idx).prop('disabled',false);
		$('[id=pedigreesireid\\.pedigreesireid\\.pedigreedamid\\.privateNo]').eq(idx).prop('disabled',false);
		$('[id=pedigreesireid\\.pedigreesireid\\.pedigreedamid\\.bbfaNo]').eq(idx).prop('disabled',false);
		
		$('[id=pedigreesireid\\.pedigreedamid\\.pedigreesireid\\.CName]').eq(idx).prop('disabled',false);
		$('[id=pedigreesireid\\.pedigreedamid\\.pedigreesireid\\.privateNo]').eq(idx).prop('disabled',false);
		$('[id=pedigreesireid\\.pedigreedamid\\.pedigreesireid\\.bbfaNo]').eq(idx).prop('disabled',false);
		
		$('[id=pedigreesireid\\.pedigreedamid\\.pedigreedamid\\.CName]').eq(idx).prop('disabled',false);
		$('[id=pedigreesireid\\.pedigreedamid\\.pedigreedamid\\.privateNo]').eq(idx).prop('disabled',false);
		$('[id=pedigreesireid\\.pedigreedamid\\.pedigreedamid\\.bbfaNo]').eq(idx).prop('disabled',false);
		
		$('[id=pedigreedamid\\.pedigreesireid\\.pedigreesireid\\.CName]').eq(idx).prop('disabled',false);
		$('[id=pedigreedamid\\.pedigreesireid\\.pedigreesireid\\.privateNo]').eq(idx).prop('disabled',false);
		$('[id=pedigreedamid\\.pedigreesireid\\.pedigreesireid\\.bbfaNo]').eq(idx).prop('disabled',false);
		
		$('[id=pedigreedamid\\.pedigreesireid\\.pedigreedamid\\.CName]').eq(idx).prop('disabled',false);
		$('[id=pedigreedamid\\.pedigreesireid\\.pedigreedamid\\.privateNo]').eq(idx).prop('disabled',false);
		$('[id=pedigreedamid\\.pedigreesireid\\.pedigreedamid\\.bbfaNo]').eq(idx).prop('disabled',false);
		
		$('[id=pedigreedamid\\.pedigreedamid\\.pedigreesireid\\.CName]').eq(idx).prop('disabled',false);
		$('[id=pedigreedamid\\.pedigreedamid\\.pedigreesireid\\.privateNo]').eq(idx).prop('disabled',false);
		$('[id=pedigreedamid\\.pedigreedamid\\.pedigreesireid\\.bbfaNo]').eq(idx).prop('disabled',false);
		
		$('[id=pedigreedamid\\.pedigreedamid\\.pedigreedamid\\.CName]').eq(idx).prop('disabled',false);
		$('[id=pedigreedamid\\.pedigreedamid\\.pedigreedamid\\.privateNo]').eq(idx).prop('disabled',false);
		$('[id=pedigreedamid\\.pedigreedamid\\.pedigreedamid\\.bbfaNo]').eq(idx).prop('disabled',false);
		  
		
});
 $(document).on('click', '#btnSave', function(e) {
	 	var idx = 0;
	 	 $.ajax({
				url : 'update_pedigree',
				method : 'POST',
				data : {
					id : $('[id=id]').eq(idx).val(),
				 	color : $('[id=color]').eq(idx).val(), 
					sex : $('[id=sex]').eq(idx).val(),
					breeder : $('[id=breeder]').eq(idx).val(),
					CName : $('[id=CName]').eq(idx).val(),
					privateNo : $('[id=privateNo]').eq(idx).val(),
					bbfaNo : $('[id=bbfaNo]').eq(idx).val(),
					owner : $('[id=owner]').eq(idx).val(),
					band : $('[id=band]').eq(idx).val(),
					farmName : $('[id=farmName]').eq(idx).val(),
					ownerName : $('[id=ownerName]').eq(idx).val(),
					dateDelivery : $('[id=dateDelivery]').eq(idx).val(),
					calved : $('[id=calved]').eq(idx).val(),
					'pedigreeSireId.id' : $('[id=pedigreesireid\\.id]').eq(idx).val(),
					'pedigreeSireId.CName' : $('[id=pedigreesireid\\.CName]').eq(idx).val(),
					'pedigreeSireId.privateNo' : $('[id=pedigreesireid\\.privateNo]').eq(idx).val(),
					'pedigreeSireId.bbfaNo' : $('[id=pedigreesireid\\.bbfaNo]').eq(idx).val(),
					
					'pedigreeDamId.id' : $('[id=pedigreedamid\\.id]').eq(idx).val(),
					'pedigreeDamId.CName' : $('[id=pedigreedamid\\.CName]').eq(idx).val(),
					'pedigreeDamId.privateNo' : $('[id=pedigreedamid\\.privateNo]').eq(idx).val(),
					'pedigreeDamId.bbfaNo' : $('[id=pedigreedamid\\.bbfaNo]').eq(idx).val(),
					
					 'pedigreeSireId.pedigreeSireId.id' : $('[id=pedigreesireid\\.pedigreesireid\\.id]').eq(idx).val(),
					'pedigreeSireId.pedigreeSireId.CName' : $('[id=pedigreesireid\\.pedigreesireid\\.CName]').eq(idx).val(),
					'pedigreeSireId.pedigreeSireId.privateNo' : $('[id=pedigreesireid\\.pedigreesireid\\.privateNo]').eq(idx).val(),
					'pedigreeSireId.pedigreeSireId.bbfaNo' : $('[id=pedigreesireid\\.pedigreesireid\\.bbfaNo]').eq(idx).val(), 
					
					'pedigreeSireId.pedigreeDamId.id' : $('[id=pedigreesireid\\.pedigreedamid\\.id]').eq(idx).val(),
					'pedigreeSireId.pedigreeDamId.CName' : $('[id=pedigreesireid\\.pedigreedamid\\.CName]').eq(idx).val(),
					'pedigreeSireId.pedigreeDamId.privateNo' : $('[id=pedigreesireid\\.pedigreedamid\\.privateNo]').eq(idx).val(),
					'pedigreeSireId.pedigreeDamId.bbfaNo' : $('[id=pedigreesireid\\.pedigreedamid\\.bbfaNo]').eq(idx).val(), 
					
					'pedigreeDamId.pedigreeSireId.id' : $('[id=pedigreedamid\\.pedigreesireid\\.id]').eq(idx).val(),
					'pedigreeDamId.pedigreeSireId.CName' : $('[id=pedigreedamid\\.pedigreesireid\\.CName]').eq(idx).val(),
					'pedigreeDamId.pedigreeSireId.privateNo' : $('[id=pedigreedamid\\.pedigreesireid\\.privateNo]').eq(idx).val(),
					'pedigreeDamId.pedigreeSireId.bbfaNo' : $('[id=pedigreedamid\\.pedigreesireid\\.bbfaNo]').eq(idx).val(), 
					
					'pedigreeDamId.pedigreeDamId.id' : $('[id=pedigreedamid\\.pedigreedamid\\.id]').eq(idx).val(),
					'pedigreeDamId.pedigreeDamId.CName' : $('[id=pedigreedamid\\.pedigreedamid\\.CName]').eq(idx).val(),
					'pedigreeDamId.pedigreeDamId.privateNo' : $('[id=pedigreedamid\\.pedigreedamid\\.privateNo]').eq(idx).val(),
					'pedigreeDamId.pedigreeDamId.bbfaNo' : $('[id=pedigreedamid\\.pedigreedamid\\.bbfaNo]').eq(idx).val(), 
					 
					 'pedigreeSireId.pedigreeSireId.pedigreeSireId.id' : $('[id=pedigreesireid\\.pedigreesireid\\.pedigreesireid\\.id]').eq(idx).val(),
					'pedigreeSireId.pedigreeSireId.pedigreeSireId.CName' : $('[id=pedigreesireid\\.pedigreesireid\\.pedigreesireid\\.CName]').eq(idx).val(),
					'pedigreeSireId.pedigreeSireId.pedigreeSireId.privateNo' : $('[id=pedigreesireid\\.pedigreesireid\\.pedigreesireid\\.privateNo]').eq(idx).val(),
					'pedigreeSireId.pedigreeSireId.pedigreeSireId.bbfaNo' : $('[id=pedigreesireid\\.pedigreesireid\\.pedigreesireid\\.bbfaNo]').eq(idx).val(), 
					
					'pedigreeSireId.pedigreeSireId.pedigreeDamId.id' : $('[id=pedigreesireid\\.pedigreesireid\\.pedigreedamid\\.id]').eq(idx).val(),
					'pedigreeSireId.pedigreeSireId.pedigreeDamId.CName' : $('[id=pedigreesireid\\.pedigreesireid\\.pedigreedamid\\.CName]').eq(idx).val(),
					'pedigreeSireId.pedigreeSireId.pedigreeDamId.privateNo' : $('[id=pedigreesireid\\.pedigreesireid\\.pedigreedamid\\.privateNo]').eq(idx).val(),
					'pedigreeSireId.pedigreeSireId.pedigreeDamId.bbfaNo' : $('[id=pedigreesireid\\.pedigreesireid\\.pedigreedamid\\.bbfaNo]').eq(idx).val(), 
					
					'pedigreeSireId.pedigreeDamId.pedigreeSireId.id' : $('[id=pedigreesireid\\.pedigreedamid\\.pedigreesireid\\.id]').eq(idx).val(),
					'pedigreeSireId.pedigreeDamId.pedigreeSireId.CName' : $('[id=pedigreesireid\\.pedigreedamid\\.pedigreesireid\\.CName]').eq(idx).val(),
					'pedigreeSireId.pedigreeDamId.pedigreeSireId.privateNo' : $('[id=pedigreesireid\\.pedigreedamid\\.pedigreesireid\\.privateNo]').eq(idx).val(),
					'pedigreeSireId.pedigreeDamId.pedigreeSireId.bbfaNo' : $('[id=pedigreesireid\\.pedigreedamid\\.pedigreesireid\\.bbfaNo]').eq(idx).val(), 
					
					'pedigreeSireId.pedigreeDamId.pedigreeDamId.id' : $('[id=pedigreesireid\\.pedigreedamid\\.pedigreedamid\\.id]').eq(idx).val(),
					'pedigreeSireId.pedigreeDamId.pedigreeDamId.CName' : $('[id=pedigreesireid\\.pedigreedamid\\.pedigreedamid\\.CName]').eq(idx).val(),
					'pedigreeSireId.pedigreeDamId.pedigreeDamId.privateNo' : $('[id=pedigreesireid\\.pedigreedamid\\.pedigreedamid\\.privateNo]').eq(idx).val(),
					'pedigreeSireId.pedigreeDamId.pedigreeDamId.bbfaNo' : $('[id=pedigreesireid\\.pedigreedamid\\.pedigreedamid\\.bbfaNo]').eq(idx).val(), 
					
					'pedigreeDamId.pedigreeSireId.pedigreeSireId.id' : $('[id=pedigreedamid\\.pedigreesireid\\.pedigreesireid\\.id]').eq(idx).val(),
					'pedigreeDamId.pedigreeSireId.pedigreeSireId.CName' : $('[id=pedigreedamid\\.pedigreesireid\\.pedigreesireid\\.CName]').eq(idx).val(),
					'pedigreeDamId.pedigreeSireId.pedigreeSireId.privateNo' : $('[id=pedigreedamid\\.pedigreesireid\\.pedigreesireid\\.privateNo]').eq(idx).val(),
					'pedigreeDamId.pedigreeSireId.pedigreeSireId.bbfaNo' : $('[id=pedigreedamid\\.pedigreesireid\\.pedigreesireid\\.bbfaNo]').eq(idx).val(), 
					
					'pedigreeDamId.pedigreeSireId.pedigreeDamId.id' : $('[id=pedigreedamid\\.pedigreesireid\\.pedigreedamid\\.id]').eq(idx).val(),
					'pedigreeDamId.pedigreeSireId.pedigreeDamId.CName' : $('[id=pedigreedamid\\.pedigreesireid\\.pedigreedamid\\.CName]').eq(idx).val(),
					'pedigreeDamId.pedigreeSireId.pedigreeDamId.privateNo' : $('[id=pedigreedamid\\.pedigreesireid\\.pedigreedamid\\.privateNo]').eq(idx).val(),
					'pedigreeDamId.pedigreeSireId.pedigreeDamId.bbfaNo' : $('[id=pedigreedamid\\.pedigreesireid\\.pedigreedamid\\.bbfaNo]').eq(idx).val(), 
					
					'pedigreeDamId.pedigreeDamId.pedigreeSireId.id' : $('[id=pedigreedamid\\.pedigreedamid\\.pedigreesireid\\.id]').eq(idx).val(),
					'pedigreeDamId.pedigreeDamId.pedigreeSireId.CName' : $('[id=pedigreedamid\\.pedigreedamid\\.pedigreesireid\\.CName]').eq(idx).val(),
					'pedigreeDamId.pedigreeDamId.pedigreeSireId.privateNo' : $('[id=pedigreedamid\\.pedigreedamid\\.pedigreesireid\\.privateNo]').eq(idx).val(),
					'pedigreeDamId.pedigreeDamId.pedigreeSireId.bbfaNo' : $('[id=pedigreedamid\\.pedigreedamid\\.pedigreesireid\\.bbfaNo]').eq(idx).val(), 
					
					'pedigreeDamId.pedigreeDamId.pedigreeDamId.id' : $('[id=pedigreedamid\\.pedigreedamid\\.pedigreedamid\\.id]').eq(idx).val(),
					'pedigreeDamId.pedigreeDamId.pedigreeDamId.CName' : $('[id=pedigreedamid\\.pedigreedamid\\.pedigreedamid\\.CName]').eq(idx).val(),
					'pedigreeDamId.pedigreeDamId.pedigreeDamId.privateNo' : $('[id=pedigreedamid\\.pedigreedamid\\.pedigreedamid\\.privateNo]').eq(idx).val(),
					'pedigreeDamId.pedigreeDamId.pedigreeDamId.bbfaNo' : $('[id=pedigreedamid\\.pedigreedamid\\.pedigreedamid\\.bbfaNo]').eq(idx).val(), 
					   
				},success : function(result) {
				swal("แก้ไขข้อมูลสำเร็จ" , "" , "success") 
				$('[id=btnSave]').eq(idx).addClass("hide");
				$('[id=btnEdit]').eq(idx).hide();
				$('[id=sex]').eq(idx).prop('disabled',true);
				$('[id=color]').eq(idx).prop('disabled',true);
				$('[id=breeder]').eq(idx).prop('disabled',true);
				$('[id=CName]').eq(idx).prop('disabled',true);
				$('[id=privateNo]').eq(idx).prop('disabled',true);
				$('[id=bbfaNo]').eq(idx).prop('disabled',true);
				$('[id=owner]').eq(idx).prop('disabled',true);
				$('[id=band]').eq(idx).prop('disabled',true);
				$('[id=farmName]').eq(idx).prop('disabled',true);
			 	$('[id=ownerName]').eq(idx).prop('disabled',true); 
				$('[id=dateDelivery]').eq(idx).prop('disabled',true);
				$('[id=calved]').eq(idx).prop('disabled',true);
				$('[id=btnEdit]').eq(idx).show();
				$('[id=pedigreesireid\\.CName]').eq(idx).prop('disabled',true);
				$('[id=pedigreesireid\\.privateNo]').eq(idx).prop('disabled',true);
				$('[id=pedigreesireid\\.bbfaNo]').eq(idx).prop('disabled',true);
				
				$('[id=pedigreedamid\\.CName]').eq(idx).prop('disabled',true);
				$('[id=pedigreedamid\\.privateNo]').eq(idx).prop('disabled',true);
				$('[id=pedigreedamid\\.bbfaNo]').eq(idx).prop('disabled',true);
				
			 	 $('[id=pedigreesireid\\.pedigreesireid\\.CName]').eq(idx).prop('disabled',true);
				$('[id=pedigreesireid\\.pedigreesireid\\.privateNo]').eq(idx).prop('disabled',true);
				$('[id=pedigreesireid\\.pedigreesireid\\.bbfaNo]').eq(idx).prop('disabled',true); 
				
				$('[id=pedigreesireid\\.pedigreedamid\\.CName]').eq(idx).prop('disabled',true);
				$('[id=pedigreesireid\\.pedigreedamid\\.privateNo]').eq(idx).prop('disabled',true);
				$('[id=pedigreesireid\\.pedigreedamid\\.bbfaNo]').eq(idx).prop('disabled',true); 
				
				$('[id=pedigreedamid\\.pedigreesireid\\.CName]').eq(idx).prop('disabled',true);
				$('[id=pedigreedamid\\.pedigreesireid\\.privateNo]').eq(idx).prop('disabled',true);
				$('[id=pedigreedamid\\.pedigreesireid\\.bbfaNo]').eq(idx).prop('disabled',true); 
				
				$('[id=pedigreedamid\\.pedigreedamid\\.CName]').eq(idx).prop('disabled',true);
				$('[id=pedigreedamid\\.pedigreedamid\\.privateNo]').eq(idx).prop('disabled',true);
				$('[id=pedigreedamid\\.pedigreedamid\\.bbfaNo]').eq(idx).prop('disabled',true); 
				 
				 $('[id=pedigreesireid\\.pedigreesireid\\.pedigreesireid\\.id]').eq(idx).prop('disabled',true);
				$('[id=pedigreesireid\\.pedigreesireid\\.pedigreesireid\\.CName]').eq(idx).prop('disabled',true);
				$('[id=pedigreesireid\\.pedigreesireid\\.pedigreesireid\\.privateNo]').eq(idx).prop('disabled',true);
				$('[id=pedigreesireid\\.pedigreesireid\\.pedigreesireid\\.bbfaNo]').eq(idx).prop('disabled',true); 
				
				$('[id=pedigreesireid\\.pedigreesireid\\.pedigreedamid\\.id]').eq(idx).prop('disabled',true);
				$('[id=pedigreesireid\\.pedigreesireid\\.pedigreedamid\\.CName]').eq(idx).prop('disabled',true);
				$('[id=pedigreesireid\\.pedigreesireid\\.pedigreedamid\\.privateNo]').eq(idx).prop('disabled',true);
				$('[id=pedigreesireid\\.pedigreesireid\\.pedigreedamid\\.bbfaNo]').eq(idx).prop('disabled',true); 
				
				$('[id=pedigreesireid\\.pedigreedamid\\.pedigreesireid\\.id]').eq(idx).prop('disabled',true);
				$('[id=pedigreesireid\\.pedigreedamid\\.pedigreesireid\\.CName]').eq(idx).prop('disabled',true);
				$('[id=pedigreesireid\\.pedigreedamid\\.pedigreesireid\\.privateNo]').eq(idx).prop('disabled',true);
				$('[id=pedigreesireid\\.pedigreedamid\\.pedigreesireid\\.bbfaNo]').eq(idx).prop('disabled',true); 
				
				$('[id=pedigreesireid\\.pedigreedamid\\.pedigreedamid\\.id]').eq(idx).prop('disabled',true);
				$('[id=pedigreesireid\\.pedigreedamid\\.pedigreedamid\\.CName]').eq(idx).prop('disabled',true);
				$('[id=pedigreesireid\\.pedigreedamid\\.pedigreedamid\\.privateNo]').eq(idx).prop('disabled',true);
				$('[id=pedigreesireid\\.pedigreedamid\\.pedigreedamid\\.bbfaNo]').eq(idx).prop('disabled',true); 
				
				$('[id=pedigreedamid\\.pedigreesireid\\.pedigreesireid\\.id]').eq(idx).prop('disabled',true);
				$('[id=pedigreedamid\\.pedigreesireid\\.pedigreesireid\\.CName]').eq(idx).prop('disabled',true);
				$('[id=pedigreedamid\\.pedigreesireid\\.pedigreesireid\\.privateNo]').eq(idx).prop('disabled',true);
				$('[id=pedigreedamid\\.pedigreesireid\\.pedigreesireid\\.bbfaNo]').eq(idx).prop('disabled',true); 
				
				$('[id=pedigreedamid\\.pedigreesireid\\.pedigreedamid\\.id]').eq(idx).prop('disabled',true);
				$('[id=pedigreedamid\\.pedigreesireid\\.pedigreedamid\\.CName]').eq(idx).prop('disabled',true);
				$('[id=pedigreedamid\\.pedigreesireid\\.pedigreedamid\\.privateNo]').eq(idx).prop('disabled',true);
				$('[id=pedigreedamid\\.pedigreesireid\\.pedigreedamid\\.bbfaNo]').eq(idx).prop('disabled',true); 
				
				$('[id=pedigreedamid\\.pedigreedamid\\.pedigreesireid\\.id]').eq(idx).prop('disabled',true);
				$('[id=pedigreedamid\\.pedigreedamid\\.pedigreesireid\\.CName]').eq(idx).prop('disabled',true);
				$('[id=pedigreedamid\\.pedigreedamid\\.pedigreesireid\\.privateNo]').eq(idx).prop('disabled',true);
				$('[id=pedigreedamid\\.pedigreedamid\\.pedigreesireid\\.bbfaNo]').eq(idx).prop('disabled',true); 
				
				$('[id=pedigreedamid\\.pedigreedamid\\.pedigreedamid\\.id]').eq(idx).prop('disabled',true);
				$('[id=pedigreedamid\\.pedigreedamid\\.pedigreedamid\\.CName]').eq(idx).prop('disabled',true);
				$('[id=pedigreedamid\\.pedigreedamid\\.pedigreedamid\\.privateNo]').eq(idx).prop('disabled',true);
				$('[id=pedigreedamid\\.pedigreedamid\\.pedigreedamid\\.bbfaNo]').eq(idx).prop('disabled',true);  
	 
				},
				error : function(result) {
					swal("แก้ไขข้อมูลไม่สำเร็จ" , "" , "error") 
					$('[id=btnSave]').eq(idx).show();
					$('[id=btnEdit]').eq(idx).hide();
					$('[id=sex]').eq(idx).prop('disabled',false);
					$('[id=color]').eq(idx).prop('disabled',false);
					$('[id=breeder]').eq(idx).prop('disabled',false);
					$('[id=CName]').eq(idx).prop('disabled',false);
					$('[id=privateNo]').eq(idx).prop('disabled',false);
					$('[id=bbfaNo]').eq(idx).prop('disabled',false);
					$('[id=owner]').eq(idx).prop('disabled',false);
					$('[id=band]').eq(idx).prop('disabled',false);
					$('[id=farmName]').eq(idx).prop('disabled',false);
					$('[id=ownerName]').eq(idx).prop('disabled',false);
					$('[id=dateDelivery]').eq(idx).prop('disabled',false);
					$('[id=calved]').eq(idx).prop('disabled',false);
					
			 		$('[id=pedigreesireid\\.CName]').eq(idx).prop('disabled',false);
					$('[id=pedigreesireid\\.privateNo]').eq(idx).prop('disabled',false);
					$('[id=pedigreesireid\\.bbfaNo]').eq(idx).prop('disabled',false); 

					$('[id=pedigreedamid\\.CName]').eq(idx).prop('disabled',false);
					$('[id=pedigreedamid\\.privateNo]').eq(idx).prop('disabled',false);
					$('[id=pedigreedamid\\.bbfaNo]').eq(idx).prop('disabled',false); 
					
					$('[id=pedigreesireid\\.pedigreesireid\\.CName]').eq(idx).prop('disabled',false);
					$('[id=pedigreesireid\\.pedigreesireid\\.privateNo]').eq(idx).prop('disabled',false);
					$('[id=pedigreesireid\\.pedigreesireid\\.bbfaNo]').eq(idx).prop('disabled',false);
					
					$('[id=pedigreesireid\\.pedigreedamid\\.CName]').eq(idx).prop('disabled',false);
					$('[id=pedigreesireid\\.pedigreedamid\\.privateNo]').eq(idx).prop('disabled',false);
					$('[id=pedigreesireid\\.pedigreedamid\\.bbfaNo]').eq(idx).prop('disabled',false);
					
					$('[id=pedigreedamid\\.pedigreesireid\\.CName]').eq(idx).prop('disabled',false);
					$('[id=pedigreedamid\\.pedigreesireid\\.privateNo]').eq(idx).prop('disabled',false);
					$('[id=pedigreedamid\\.pedigreesireid\\.bbfaNo]').eq(idx).prop('disabled',false);
					
					$('[id=pedigreedamid\\.pedigreedamid\\.CName]').eq(idx).prop('disabled',false);
					$('[id=pedigreedamid\\.pedigreedamid\\.privateNo]').eq(idx).prop('disabled',false);
					$('[id=pedigreedamid\\.pedigreedamid\\.bbfaNo]').eq(idx).prop('disabled',false);
					 
					 $('[id=pedigreesireid\\.pedigreesireid\\.pedigreesireid\\.id]').eq(idx).prop('disabled',false);
					$('[id=pedigreesireid\\.pedigreesireid\\.pedigreesireid\\.CName]').eq(idx).prop('disabled',false);
					$('[id=pedigreesireid\\.pedigreesireid\\.pedigreesireid\\.privateNo]').eq(idx).prop('disabled',false);
					$('[id=pedigreesireid\\.pedigreesireid\\.pedigreesireid\\.bbfaNo]').eq(idx).prop('disabled',false); 
					
					 $('[id=pedigreesireid\\.pedigreesireid\\.pedigreedamid\\.id]').eq(idx).prop('disabled',false);
					$('[id=pedigreesireid\\.pedigreesireid\\.pedigreedamid\\.CName]').eq(idx).prop('disabled',false);
					$('[id=pedigreesireid\\.pedigreesireid\\.pedigreedamid\\.privateNo]').eq(idx).prop('disabled',false);
					$('[id=pedigreesireid\\.pedigreesireid\\.pedigreedamid\\.bbfaNo]').eq(idx).prop('disabled',false); 
					
					$('[id=pedigreesireid\\.pedigreedamid\\.pedigreesireid\\.id]').eq(idx).prop('disabled',false);
					$('[id=pedigreesireid\\.pedigreedamid\\.pedigreesireid\\.CName]').eq(idx).prop('disabled',false);
					$('[id=pedigreesireid\\.pedigreedamid\\.pedigreesireid\\.privateNo]').eq(idx).prop('disabled',false);
					$('[id=pedigreesireid\\.pedigreedamid\\.pedigreesireid\\.bbfaNo]').eq(idx).prop('disabled',false); 
					
					$('[id=pedigreesireid\\.pedigreedamid\\.pedigreedamid\\.id]').eq(idx).prop('disabled',false);
					$('[id=pedigreesireid\\.pedigreedamid\\.pedigreedamid\\.CName]').eq(idx).prop('disabled',false);
					$('[id=pedigreesireid\\.pedigreedamid\\.pedigreedamid\\.privateNo]').eq(idx).prop('disabled',false);
					$('[id=pedigreesireid\\.pedigreedamid\\.pedigreedamid\\.bbfaNo]').eq(idx).prop('disabled',false); 
					
					$('[id=pedigreedamid\\.pedigreesireid\\.pedigreesireid\\.id]').eq(idx).prop('disabled',false);
					$('[id=pedigreedamid\\.pedigreesireid\\.pedigreesireid\\.CName]').eq(idx).prop('disabled',false);
					$('[id=pedigreedamid\\.pedigreesireid\\.pedigreesireid\\.privateNo]').eq(idx).prop('disabled',false);
					$('[id=pedigreedamid\\.pedigreesireid\\.pedigreesireid\\.bbfaNo]').eq(idx).prop('disabled',false); 
					
					$('[id=pedigreedamid\\.pedigreesireid\\.pedigreedamid\\.id]').eq(idx).prop('disabled',false);
					$('[id=pedigreedamid\\.pedigreesireid\\.pedigreedamid\\.CName]').eq(idx).prop('disabled',false);
					$('[id=pedigreedamid\\.pedigreesireid\\.pedigreedamid\\.privateNo]').eq(idx).prop('disabled',false);
					$('[id=pedigreedamid\\.pedigreesireid\\.pedigreedamid\\.bbfaNo]').eq(idx).prop('disabled',false); 
					
					$('[id=pedigreedamid\\.pedigreedamid\\.pedigreesireid\\.id]').eq(idx).prop('disabled',false);
					$('[id=pedigreedamid\\.pedigreedamid\\.pedigreesireid\\.CName]').eq(idx).prop('disabled',false);
					$('[id=pedigreedamid\\.pedigreedamid\\.pedigreesireid\\.privateNo]').eq(idx).prop('disabled',false);
					$('[id=pedigreedamid\\.pedigreedamid\\.pedigreesireid\\.bbfaNo]').eq(idx).prop('disabled',false); 
					
					$('[id=pedigreedamid\\.pedigreedamid\\.pedigreedamid\\.id]').eq(idx).prop('disabled',false);
					$('[id=pedigreedamid\\.pedigreedamid\\.pedigreedamid\\.CName]').eq(idx).prop('disabled',false);
					$('[id=pedigreedamid\\.pedigreedamid\\.pedigreedamid\\.privateNo]').eq(idx).prop('disabled',false);
					$('[id=pedigreedamid\\.pedigreedamid\\.pedigreedamid\\.bbfaNo]').eq(idx).prop('disabled',false);  
					 
					$('[id=btnSave]').eq(idx).show();
					$('[id=btnEdit]').eq(idx).hide();
				}
			});  
		
	});	

 </script>


</html>