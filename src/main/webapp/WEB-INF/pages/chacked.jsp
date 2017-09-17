<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/includes.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>chackde</title>
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

<link href="<c:url value="/resources/bootflat/css/bootflat.css" />"
	rel="stylesheet">


<link
	href="<c:url value="/resources/font-awesome-4.3.0/css/font-awesome.min.css" />"
	rel="stylesheet">

<script src="<c:url value="/resources/js/site.min.js" />"></script>


<style type="text/css">

/* Reset body padding and margins */
/* body {
	margin: 0;
	padding: 0;
}
 */
/* Make Header Sticky */
#header_container {
/* 	background: #eee;
	border: 1px solid #666; */
	height: 70px;
	left: 0;
	position: fixed;
	width: 100%;
	top: 0;
}

#header {
	line-height: 70px;
	margin: 0 auto;
	width: 940px;
	text-align: center;
}

/* CSS for the content of page. I am giving top and bottom padding of 80px to make sure the header and footer do not overlap the content.*/
#container {
	margin: 0 auto;
	overflow: auto;
	padding: 80px 0;
	width: 940px;
}

#content {
	
}

/* Make Footer Sticky */
#footer_container {
	background: #eee;
	border: 1px solid #666;
	bottom: 0;
	height: 80px;
	left: 0;
	position: fixed;
	width: 100%;
}

#footer {
	line-height: 60px;
	margin: 0 auto;
	width: 940px;
	text-align: center;
}
</style>


 <style>
        body,html{
            background-image:url('resources/img/bg-10.jpg');
            padding: 50px 0;
            text-align: center;
            color: white;
            height:700px;
            background-position:center;
            background-attachment: scroll;
            background-repeat: no-repeat;
            background-size: cover;

        }
    </style>

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
			src="<c:url value="/resources/img/Logo1.png" />" height="40"></a>
	</div>
	<div class="collapse navbar-collapse">
		<ul class="nav navbar-nav navbar-left">
			<%-- <li> <a class="active" href="#">หน้าแรก</a></li> --%>
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
				<li><a class="nav-link" href="AllReport">ออกรายงาน</a></li>
			</sec:authorize>
			
				<sec:authorize access="hasRole('Admin')">
				<li><a class="nav-link" href="Detail">สมาคม</a></li>
			</sec:authorize>
			
			<sec:authorize access="hasRole('Admin')">
				<li><a class="nav-link" href="ped">ออกtagเบอร์หู</a></li>
			</sec:authorize>
			
			<sec:authorize access="hasRole('Admin')">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"> การตั้งค่า <b class="caret"></b>
				</a>
					<ul class="dropdown-menu">
						<li><a href="Manage">จัดการผู้ใช้งาน</a></li>
						<li><a href="Banking">เพิ่มการตั้งค่า</a></li>
					</ul></li>
			</sec:authorize>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="register"><i class="fa fa-sign-in"></i>&nbsp;สมัครสมาชิก</a></li>
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
						<form action='j_spring_security_check' method='POST'>
							<div class="modal-body">


								<div class="form-group">
									<label for="exampleInputEmail1">Username</label> <input
										type="text" class="form-control" id="exampleInputEmail1"
										name="j_username" placeholder="Enter Username">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Password</label> <input
										type="password" class="form-control"
										id="exampleInputPassword1" placeholder="Enter Password"
										name="j_password">
								</div>

							</div>
							<center>
								<div class="modal-footer">
									<button type="s" class="btn btn-danger btn-lg">ยืนยัน</button>

								</div>
							</center>
						</form>
					</div>
				</div>
			</div>
		</ul>
	</div>
</div>
</nav> </header>
<body>
	

	
	
	sfggdfhgdfhdgjdfhfshsf
	
	
	
	
	
	
	<div id="footer_container">
	<footer class="footer">
	<div class="container">
		<div class="col-md-6" align="left">
				<div class="row form-inline">
						<span style="color: white;font-size: 16px;">Copyright ©2017</span>
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
					<a class="textright" href="index">Pedigree Record and Search System</a>
					<img id="imgfooter" src="<c:url value="/resources/img/Logo1.png" /> " height="45" " title="กลับสู่หน้าหลัก">
				</a> 
			</div>
		</div>
	</div>
	</footer>
</div>


</body>
</html>