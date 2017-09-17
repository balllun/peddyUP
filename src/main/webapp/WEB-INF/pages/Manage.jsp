<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/includes.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="initial-scale=1,maximum-scale=1,user-scalable=no">
<title>Manage</title>

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
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index"><img
				src="<c:url value="/resources/img/Logo1.png" />" height="40"></a>
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
					<li ><a class="nav-link"
						href="AllReport">ออกรายงาน</a></li>
				</sec:authorize>
				
				<sec:authorize access="hasRole('Admin')">
				<li><a class="nav-link" href="contact">สมาคม</a></li>
			</sec:authorize>
			
				<sec:authorize access="hasRole('Admin')">
				<li><a class="nav-link" href="ped">ออกtagเบอร์หู</a></li>
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
	</nav> </header>



<body>


	<div class="container">
		<div class="row">
			<div class=" col-sm-3">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<p class="panel-title text-center">
							<font size="6">Manage</font>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>


<div class="row form-group">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4 class="panel-title" align="left">
                            <span class="fa fa-list-alt fa-lg"></span>&nbsp;จัดการผู้ใช้งาน</a>
                        </h4>
                    </div>

                    <div class="panel-body" >
            
                        <div class="row form-group ">
                            
   
        <div class="container" style="color:#404040">
		<div class="row">
			<div class=" col-sm-12"></div>
		</div>

		<br>

		<div class="row form-group">
			<table class="table table-striped table-hover table-bordered">
				<thead>
					<tr>
						<th style="width: 55px;" class="text-center">No.</th>
						<th style="width: 120px;" class="text-center">Frist Name</th>
						<th style="width: 120px;" class="text-center">Last Name</th>
						<th class="text-center">Username</th>
						<th style="width: 160px;" class="text-center">ID Number</th>
						<th style="width: 150px;" class="text-center">Address</th>
						<th style="width: 140px;" class="text-center">Tel.</th>
						<th style="width: 200px;" class="text-center">E-mail</th>
						<th style="width: 120px;" class="text-center">Privilege</th>
						<th style="width: 100px;" class="text-center">Edit</th>
						<th style="width: 100px;" class="text-center">Delete</th>
					</tr>
				</thead>
				<tbody align="center">
					<%
						int i = 1;
					%>
					<c:forEach items="${dataList}" var="data">
						<tr>
							<td><%=i++%> <input type="hidden" class="form control"
								value="${data.id}" id="id" disabled="disabled"></td>
							<td><input class="form-control" type="text"
								value="${data.FName}" disabled="disabled" id="FName"></td>
							<td><input class="form-control" type="text"
								value="${data.LName}" disabled="disabled" id="LName"></td>
							<td>${data.users.username}</td>
							<td><input class="form-control" type="text"
								value="${data.idNo}" disabled="disabled" id="idNo"
								maxlength="13"></td>
							<td><input class="form-control" type="text"
								value="${data.address}" disabled="disabled" id="address"></td>
							<td><input class="form-control" type="text"
								value="${data.phone}" disabled="disabled" id="phone"></td>
							<td><input class="form-control" type="text"
								value="${data.mail}" disabled="disabled" id="mail"></td>
								
							<td><input class="form-control" type="hidden"
								value="${data.users.id}" disabled="disabled" id="user">
							
							<form:form commandName="data" class="form-horizontal" role="form">
							<select class="form-control" id=privilege name="privilege" disabled="disabled">
								<c:forEach items="${privilegeList}" var="privilege">
									<option> value="${privilege.id}"
										<c:if test="${privilege == data.users.privilege}">selected="selected"</c:if>>${privilege.status}</option>
								</c:forEach>
							</select>
							</form:form>
							
								
							</td>
								
							<td align="center">
								<button type="button"
									class="btn btn-success fa fa-floppy-o fa-lg" id="btnSave"></button>
								<button type="button" class="btn btn-warning fa fa-pencil fa-lg"
									id="btnEdit"></button>
							</td>
							<td align="center">
								<button class="btn btn-danger" value="${data.id}"
									onclick="deleteUser(this)">
									<i class="fa fa-times"></i>
								</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

		</div>
	</div>
  
            
            
                            
                            

                        </div>

        
                              
                        </div>

                    </div><!-- จบ body -->

                </div>
    
    





	



	
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
				<div class="row form-inline">
					<span target="_blank" class="textright" style="color: white;font-size: 12px;">19 Moo.2 Maega Mung Phayao Thailand 56000 
				
				</div>
		</div>
		<div class="col-md-6">
			<div align="right">
				<a>
					<a class="textright" href="index"> Pedigree Record and Search System</a>
					<img id="imgfooter" src="<c:url value="/resources/img/Logo1.png" /> " height="45" " title="กลับสู่หน้าหลัก">
				</a> 
			</div>
		</div>
	</div>
	</footer>

</body>
<script type="text/javascript">
	function deleteUser(id) {
		$.post("canceluser", {
			id : id.value
		}).done(function(data) {
			window.location = "Manage";
		});
	}
</script>

<script type="text/javascript">
	$(document).ready(function() {
		$(".btn-success").hide();
	});

	$(document).on('click', '#btnEdit', function(e) {
		var idx = $('[id=btnEdit]').index(e.target);
		$('[id=btnSave]').eq(idx).show();
		$('[id=btnEdit]').eq(idx).hide();
		$('[id=FName]').eq(idx).prop('disabled', false);
		$('[id=LName]').eq(idx).prop('disabled', false);
		$('[id=idNo]').eq(idx).prop('disabled', false);
		$('[id=address]').eq(idx).prop('disabled', false);
		$('[id=phone]').eq(idx).prop('disabled', false);
		$('[id=mail]').eq(idx).prop('disabled', false);
		$('[id=privilege]').eq(idx).prop('disabled', false);
	});

	$(document).on('click', '#btnSave', function(e) {
		var idx = $('[id=btnSave]').index(e.target);
		var m = $('[id=idNo]').eq(idx).val()
		var max = m.length;
		if (max == 13) {

			$.ajax({
				method : 'POST',
				url : 'update_mem',
				data : {
					id : $('[id=id]').eq(idx).val(),
					FName : $('[id=FName]').eq(idx).val(),
					LName : $('[id=LName]').eq(idx).val(),
					idNo : $('[id=idNo]').eq(idx).val(),
					address : $('[id=address]').eq(idx).val(),
					phone : $('[id=phone]').eq(idx).val(),
					mail : $('[id=mail]').eq(idx).val(),
					user : $('[id=user]').eq(idx).val(),
					privilege : $('[id=privilege]').eq(idx).val(),
				},
				success : function(result) {
					swal("แก้ไขข้อมูลสำเร็จ", "", "success")
					$('[id=btnSave]').eq(idx).show();
					$('[id=btnEdit]').eq(idx).hide();
					$('[id=FName]').eq(idx).prop('disabled', true);
					$('[id=LName]').eq(idx).prop('disabled', true);
					$('[id=idNo]').eq(idx).prop('disabled', true);
					$('[id=address]').eq(idx).prop('disabled', true);
					$('[id=phone]').eq(idx).prop('disabled', true);
					$('[id=mail]').eq(idx).prop('disabled', true);
					$('[id=privilege]').eq(idx).prop('disabled', true);
					$('[id=btnSave]').eq(idx).hide();
					$('[id=btnEdit]').eq(idx).show();
				},
				error : function(result) {
					/* alert("แก้ไขข้อมูลไม่สำเร็จ"); */
					swal("แก้ไขข้อมูลไม่สำเร็จ", "", "error")
					$('[id=btnSave]').eq(idx).show();
					$('[id=btnEdit]').eq(idx).hide();
					$('[id=FName]').eq(idx).prop('disabled', false);
					$('[id=LName]').eq(idx).prop('disabled', false);
					$('[id=idNo]').eq(idx).prop('disabled', false);
					$('[id=address]').eq(idx).prop('disabled', false);
					$('[id=phone]').eq(idx).prop('disabled', false);
					$('[id=mail]').eq(idx).prop('disabled', false);
					$('[id=privilege]').eq(idx).prop('disabled', false);
					$('[id=btnSave]').eq(idx).show();
					$('[id=btnEdit]').eq(idx).hide();
				}
			});
		} else {
			/* alert("กรอกข้อมูลไม่ถูกต้อง"); */
			swal("กรอกข้อมูลไม่ถูกต้อง", "กรุณาตรวจสอบการกรอกข้อมูล", "error")
		}
	});
</script>
</html>