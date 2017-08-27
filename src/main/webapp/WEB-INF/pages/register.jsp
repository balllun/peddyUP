<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/includes.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Home</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="initial-scale=1,maximum-scale=1,user-scalable=no">
<link href="<c:url value="/resources/img/cow-band.png" />"
	rel="shortcut icon">

<link rel="bookmark" href="favicon_16.ico">
<link
	href="<c:url value="/resources/css/bootstrap/bootstrap.min.css" />"
	rel="stylesheet">

<link href="<c:url value="/resources/css/site.min.css" />"
	rel="stylesheet">

<link href="<c:url value="/resources/css/sweetalert.css" />"
	rel="stylesheet">

<link href="<c:url value="/resources/bootflat/css/bootflat.css" />"
	rel="stylesheet">


<link
	href="<c:url value="/resources/font-awesome-4.3.0/css/font-awesome.min.css" />"
	rel="stylesheet">

<script src="<c:url value="/resources/js/site.min.js" />"></script>

<script src="<c:url value="/resources/js/sweetalert.min.js" />"></script>

<link href="<c:url value="/resources/css/sweetalert.css" />"
	rel="stylesheet">
<script src="<c:url value="/resources/js/sweetalert.min.js" />"></script>
</head>
<header> <nav class="navbar navbar-default navbar-custom"
	role="navigation">
<div class="container">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target=".navbar-collapse">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="index"><img
			src="<c:url value="/resources/img/logo2.png" />" height="40"></a>
	</div>
	<div class="collapse navbar-collapse">
		<ul class="nav navbar-nav navbar-left">
			<!-- <li><a class="nav-link" href="index">หน้าแรก</a></li> -->
			<sec:authorize access="hasRole('Admin')">
				<li><a class="nav-link" href="record">บันทึกข้อมูลโค</a></li>
			</sec:authorize>
			<sec:authorize access="hasAnyRole('Admin','User')">
				<li><a class="nav-link" href="Search">ค้นหาข้อมูลโค</a></li>
			</sec:authorize>
			<sec:authorize access="hasRole('Admin')">
				<li><a class="nav-link" href="AllReport">ออกรายงาน</a></li>
			</sec:authorize> 
			<sec:authorize access="hasRole('Admin')">
				<li><a class="nav-link" href="Detail">รายละเอียดการออกใบพันธุ์ประวัติ</a></li>
			</sec:authorize>
			<sec:authorize access="hasRole('Admin')">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"> การตั้งค่า <b class="caret"></b>
				</a>
					<ul class="dropdown-menu">
						<li><a href="Manage">จัดการผู้ใช้งาน</a></li>
						<li><a href="Banking">เพิ่มธนาคาร</a></li>
					</ul></li>
			</sec:authorize>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<li class="active"><a class="nav-link current" href="#"><i
					class="fa fa-sign-in"></i>&nbsp;สมัครสมาชิก</a></li>
			<li data-toggle="modal" data-target=".bs-example-modal-sm"><a
				href="#"><i class="fa fa-sign-in"></i>&nbsp;เข้าสู่ระบบ</a></li>

			<div class="modal fade bs-example-modal-sm" tabindex="-1"
				role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-md">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>

						</div>
						<div class="modal-header">
							<h3>
								<i class="fa fa-cog fa-spin"></i>&nbsp;เข้าสู่ระบบ
							</h3>
						</div>
						<div class="modal-body">

							<form>
								<div class="form-group">
									<label for="exampleInputEmail1">Email or Username</label> <input
										type="email" class="form-control" id="exampleInputEmail1"
										placeholder="Enter email">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Password</label> <input
										type="password" class="form-control"
										id="exampleInputPassword1" placeholder="Password">
								</div>
							</form>
						</div>
						<center>
							<div class="modal-footer">
								<button type="button" class="btn btn-danger btn-lg"
									data-dismiss="modal">ยืนยัน</button>

							</div>
						</center>
					</div>
				</div>
			</div>
		</ul>
	</div>
</div>
</nav> </header>
<body>

	<div class="container">
		<div class="row">
			<div class="col-sm-offset-2 col-sm-6">
				<form:form action="register.do" method="POST" commandName="data">
					<div class="panel panel-success">
						<div class="panel-heading">
							<h3 class="panel-title">สมัครสมาชิก</h3>
						</div>
						<div class="panel-body">
							<div class="form-group  col-lg-12">
								<label>Username</label>
								<form:input class="form-control" path="users.username" />
							</div>

							<div class="form-group col-lg-12">
								<label>Password</label>
								<form:input class="form-control" type="password"
									path="users.password" />
							</div>

							<%-- <div class="form-group col-lg-12">
								<label>Privilege</label>
								<form:select class="form-control" path="users.privilege.id"
									items="${privilegeList}" />
							</div> --%>

							<div class="form-group col-lg-12">
								<label>First Name</label>
								<form:input class="form-control" id="isEmpty" path="FName" />
							</div>

							<div class="form-group col-lg-12">
								<label>Last Name</label>
								<form:input class="form-control" path="LName" />
							</div>

							<div class="form-group col-lg-12">
								<label>ID Number</label>
								<form:input class="form-control" path="idNo"
									onKeyUp="if(isNaN(this.value)){ alert('กรุณากรอกตัวเลข'); this.value='';}" />
							</div>

							<div class="form-group col-lg-12">
								<label>Address</label>
								<form:input class="form-control" path="address" />
							</div>

							<div class="form-group col-lg-12">
								<label>Mobile</label>
								<form:input class="form-control" path="mobile"
									onKeyUp="if(isNaN(this.value)){ alert('กรุณากรอกตัวเลข'); this.value='';}" />
							</div>

							<div class="form-group col-lg-12">
								<label>Telephone</label>
								<form:input class="form-control" path="phone" />
							</div>

							<div class="form-group col-lg-12">
								<label>E-mail</label>
								<form:input class="form-control" path="mail" />
							</div>

							<div class="form-group col-lg-12">
								<label>Fax</label>
								<form:input class="form-control" path="fax" />
							</div>


							<div class="form-group col-lg-12">
								<button onclick="confirm()" type="submit"
									class="btn btn-primary btn-right" name="action" value="Add">ยืนยัน</button>
							</div>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>


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

<script>
function isEmpty(str) {
    return (!str || 0 === str.length);
    alert("...")
}

function confirm() {
	alert("สมัครสมาชิกเรียบร้อย")
}
</script>
</html>