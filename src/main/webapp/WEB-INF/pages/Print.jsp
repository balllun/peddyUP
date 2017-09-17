<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/includes.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="initial-scale=1,maximum-scale=1,user-scalable=no">
<title>Print</title>

<link rel="shortcut icon"
	href="<c:url value="/resources/img/cow-band.png" />">

<link rel="bookmark" href="favicon_16.ico">

<link rel="stylesheet"
	href="<c:url value="/resources/css/site.min.css" />">

<link rel="stylesheet"
	href="<c:url value="/resources/bootflat/css/bootflat.css" />">
<link rel="stylesheet"
	href="<c:url value="/resources/css/datepicker.css" />">
<link
	href="<c:url value="/resources/font-awesome-4.3.0/css/font-awesome.min.css" />"
	rel="stylesheet">

<script type="text/javascript"
	src="<c:url value="/resources/js/site.min.js" />"></script>

<script src="<c:url value="/resources/js/bootstrap-datepicker.js" />"></script>

<link href="<c:url value="/resources/css/sweetalert.css" />"
	rel="stylesheet">
<script src="<c:url value="/resources/js/sweetalert.min.js" />"></script>

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
            background-image:url('resources/img/bg13.jpg');
            padding: 50px 0;
            text-align: center;
            color: white;
            height:auto;
            background-position:center;
            background-attachment: scroll;
            background-repeat: no-repeat;
            background-size: cover;

        }
    </style>

</head>
<header> <nav class="navbar navbar-default navbar-custom"
	role="navigation">
<div class="container" >
	<div class="navbar-header" >
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
				<li><a class="nav-link" href="Detail">รายละเอียดการออกใบพันธุ์ประวัติ</a></li>
			</sec:authorize>
			<sec:authorize access="hasRole('Admin')">
				<li><a class="nav-link" href="AllReport">ออกรายงาน</a></li>
			</sec:authorize> 
			
			<sec:authorize access="hasRole('Admin')">
				<li><a class="nav-link" href="contact">สมาคม</a></li>
			</sec:authorize>
			
			<sec:authorize access="hasRole('Admin')">
				<li><a class="nav-link" href="ped">ออกtegเบอร์หู</a></li>
			</sec:authorize>
			<li class="dropdown active"><a href="#"
				class="dropdown-toggle   current" data-toggle="dropdown">
					การตั้งค่า <b class="caret"></b>
			</a>
				<ul class="dropdown-menu">
					<li><a href="Manage"><i class="fa fa-user-md"></i>&nbsp;จัดการผู้ใช้งาน</a></li>
					<li><a href="Banking"><i class="fa fa-cog"></i>&nbsp;เพิ่มการตั้งค่า</a></li>
				</ul></li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<li data-toggle="modal" data-target=".bs-example-modal-sm"><a
				href="#"><i class="fa fa-times"></i>ออกจากระบบ</a></li>

			<div class="modal fade bs-example-modal-sm" tabindex="-1"
				role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
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
</nav> </header>
<body>
	<div class="container" >
		<div class="row">
			<div class=" col-sm-5">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<p class="panel-title text-center">
							<font size="6">Pedigree+Healthcaredoument</font>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container" style="color:#404040">
		<form class="form-horizontal" role="form">
			<div class="panel panel-default">
				<div class="panel-body">
					<div class="form-group">
						<input value="${pedee}" id="ped" type="hidden"
							class="form-control" disabled="disabled" /> <input value="${id}"
							id="id" type="hidden" class="form-control" disabled="disabled" />
						<br> <label class="control-label col-sm-2" for="pwd">Payment</label>
						<div class="col-sm-3">
							<select class="form-control" id="sel1">
								<option>transfer</option>
								<option>cash</option>
							</select>

						</div>
					</div>



					<div class="form-group">
						<label class="control-label col-sm-2" for="pwd">Select Bank</label>
						<div class="col-sm-3">
							<select class="form-control" id="sel1">
								<option>ธนาคารกรุงไทย</option>
								<option>ธนาคารไทยพาณิชย์</option>
							</select> 
								<form:form commandName="babk" class="form-horizontal" role="form">
							<select class="form-control" id="bank" name="bank">
								<c:forEach items="${bankList}" var="bank">
									<option> value="${bank.id}"
										<c:if test="${bank == bank}">selected="selected"</c:if>>${bank.name}</option>
								</c:forEach>
							</select>
							</form:form>
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

<script type="text/javascript">
	$("#print").click(function() {
		var ped = $("#ped").val();
		var id = $("#id").val();
		var strlow = ped.toLowerCase();
		if (strlow == "angus") {
			$.post("pedigreereport/reportangus", {
				id : id
			}).done(function() {
				window.open("ReportAngusPrinting?id=" + id+"&bank="+$("#bank").val());
			});
		} else if (strlow == "beef master") {
			$.post("pedigreereport/reportbeefmaster", {
				id : id
			}).done(function() {
				window.open("ReportBeefMasterPrinting?id=" + id+"&bank="+$("#bank").val());
			});
		} else if (strlow == "brahman") {
			$.post("pedigreereport/reportbrahman", {
				id : id
			}).done(function() {
				window.open("ReportBrahmanPrinting?id=" + id+"&bank="+$("#bank").val());
			});
		} else if (strlow == "charolais") {
			$.post("pedigreereport/reportcharolais", {
				id : id
			}).done(function() {
				window.open("ReportCharolaisPrinting?id=" + id+"&bank="+$("#bank").val());
			});
		} else if (strlow == "wagyu") {
			$.post("pedigreereport/reportwagyu", {
				id : id
			}).done(function() {
				window.open("ReportWagyuPrinting?id=" + id+"&bank="+$("#bank").val());
			});
		}
	});
</script>

</html>