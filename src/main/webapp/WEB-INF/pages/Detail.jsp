

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/includes.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="initial-scale=1,maximum-scale=1,user-scalable=no">
<title>Detail</title>

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
					<li class="active"><a class="nav-link current" href="Detail">รายละเอียดการออกใบพันธุ์ประวัติ</a></li>
				</sec:authorize>
				<sec:authorize access="hasRole('Admin')">
					<li><a class="nav-link"
						href="AllReport">ออกรายงาน</a></li>
				</sec:authorize>
				
				<sec:authorize access="hasRole('Admin')">
				<li><a class="nav-link" href="contact">สมาคม</a></li>
			</sec:authorize>
			
				<sec:authorize access="hasRole('Admin')">
				<li><a class="nav-link" href="ped">ออกtagเบอร์หู</a></li>
			</sec:authorize>
				<li class="dropdown"><a href="#"
					class="dropdown-toggle  " data-toggle="dropdown">
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
							<font size="6">TimeSearch</font>
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
                            <span class="fa fa-list-alt fa-lg"></span>&nbsp;รายละเอียดการออกใบพันธุ์ประวัติ</a>
                        </h4>
                    </div>

                    <div class="panel-body" >
            
                        <div class="row form-group ">
                            
                          
	
	<div class="container">
		<div class="row">
					<div class="col-sm-2">
						<h3 style="color:#404040">
							<i class="fa fa-calendar" ></i>&nbsp;Select Date
						</h3>
						<label class="col-sm-1" for="pwd" style="margin-left: 100px; color:#404040 " >Date</label>
				</div>
				
					<div class="col-sm-7" style="color:#404040">
						<br> <br> <br> <input  id="search1" type="date"  onkeypress="searchKeyPress(event);"> &nbsp;&nbsp; To Date &nbsp;&nbsp;<input  id="search2" type="date" onkeypress="searchKeyPress(event);" >
						&nbsp;&nbsp;
						<button id="btnSearch" onclick="search()" class="btn btn-info"><i class="fa fa-search"></i>Search</button>
						<br> <br>
					</div>
				</div>
		<br>
		<div class="table-responsive">	
		<div class="container" >
			<div class="row">
				<div class="col-sm-12">
					<table class="table table-bordered" style="color:#404040" >

						<thead>
							<tr class="success">
							<th class="text-center">No.</th>
							<th class="text-center">Registrar</th>
							<th class="text-center">Cattle Name</th>
							<th class="text-center">BFA No.</th>
							<th class="text-center">Private No.</th>
							<th class="text-center">Farm Name</th>
							<th class="text-center">Present Owner</th>
							<th class="text-center">Gene</th>
							<th class="text-center">Pedigree Type</th>
							<th class="text-center">price</th>
							<th class="text-center">Paying</th>
							<th class="text-center">Date of Delivery</th>
							</tr>
						</thead>
						<tbody id="listDetail">

						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-sm-6">
				<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="panel-title">
							<i class="fa fa-file-text-o"></i>&nbsp;Report Pure Cattle
						</h3>
					</div>
					<div class="panel-body">
						<div class="container">
							<div class="row">
								<div class="col-sm-6" style="color:#000000">
									Pedigree Number &nbsp;&nbsp; <input type="text"
										id="geneTrue" > &nbsp;&nbsp;
									Document
								</div>
							</div>
						</div>
						<br>
					
						<div class="container">
							<div class="row">
								<div class="col-sm-6" style="color:#000000">
									Total Price &nbsp;&nbsp; <input type="text"
										id="sumC1" >
									&nbsp;&nbsp; Baht
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div align="center">
			<div class="col-sm-6">
				<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="panel-title">
							<i class="fa fa-file-text-o"></i>&nbsp;Reports Mixed Cattle
						</h3>
					</div>
					<div class="panel-body">
						<div class="container">
							<div class="row">
								<div class="col-sm-6" style="color:#000000">
									Pedigree Number &nbsp;&nbsp; <input type="text"
										id="geneFalse" > &nbsp;&nbsp;Document
								</div>
							</div>
						</div>
						

						<br>
						<div class="container">
							<div class="row">
								<div class="col-sm-6" style="color:#000000">
									Total Price&nbsp;&nbsp; <input type="text"
										id="sumC2" >
									&nbsp;&nbsp; Baht
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			
			</div>
			

		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-sm-6">
				<div class="panel panel-success">
					<div class="panel-heading">
						<h3 class="panel-title">
							<i class="fa fa-file-text-o"></i>&nbsp;Results
						</h3>
					</div>
					<div class="panel-body">
						<div class="container">
							<div class="row">
								<div class="col-sm-6" style="color:#000000">
									Pedigree Number &nbsp;&nbsp;&nbsp;&nbsp; <input
										type="text" id="geneSum" >
									&nbsp;&nbsp; Document
								</div>
							</div>
						</div>
						<br>
						<div class="container">
							<div class="row">
								<div class="col-sm-6" style="color:#000000">
									Total Price &nbsp;&nbsp;&nbsp;&nbsp; <input type="text"
										id="sumC">
									&nbsp;&nbsp; Baht
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Graph -->
		
		
			
			
			
			
			
			
                            
                            

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
				<div class="row form-inline">
					<span target="_blank" class="textright" style="color: white;font-size: 12px;">19 Moo.2 Maega Mung Phayao Thailand 56000 
				
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

</body>

<script type="text/javascript">

$("#listDetail").load('ldetail',{ id : 0, value : $("#search").val() });

function search(){
	$("#listDetail").load('ldetail',{ value1 : $("#search1").val(),
	value2 : $("#search2").val(),
	
		},function(){
			$("#geneTrue").val($("#count1").val());
			$("#geneFalse").val($("#count2").val());
			$("#geneSum").val($("#sum").val());
			$("#sumC1").val($("#sumCount1").val());
			$("#sumC2").val($("#sumCount2").val());
			$("#sumC").val($("#sumCount").val());
			
		});
}

</script>

<script>
    function searchKeyPress(e)
    {
        // look for window.event in case event isn't passed in
        e = e || window.event;
        if (e.keyCode == 13)
        {
            document.getElementById('btnSearch').click();
        }
    }
    </script>
    

</html>