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

<link href="<c:url value="/resources/img/cow-band.png" />"
	rel="shortcut icon">

<link href="<c:url value="/resources/favicon_16.ico" />" rel="bookmark">

<link href="<c:url value="/resources/css/site.min.css" />"
	rel="stylesheet">

<link href="<c:url value="/resources/bootflat/css/bootflat.css" />"
	rel="stylesheet">

<link href="<c:url value="/resources/css/fileinput.css" />" media="all"
	rel="stylesheet" type="text/css">

<link
	href="<c:url value="/resources/font-awesome-4.3.0/css/font-awesome.min.css" />"
	rel="stylesheet">
	<script language="JavaScript" type="text/javascript" src="<c:url value="/resources/js/bootstrap.js" />"  ></script>
	<script language="JavaScript" type="text/javascript" src="<c:url value="/resources/js/bootstrap.min.js" />" ></script>
<%-- <script
	src="<c:url value="/http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js" />"></script> --%>

<%-- <script src="<c:url value="/resources/js/fileinput.js"  />"></script> --%>


<script src="<c:url value="/resources/js/site.min.js" />"></script>
<script src="<c:url value="/resources/js/jquery-2.1.3.min.js" />"></script>

<link href="<c:url value="/resources/css/sweetalert.css" />" rel="stylesheet">
<script src="<c:url value="/resources/js/sweetalert.min.js" />"></script>
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
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="index"><img
			src="<c:url value="/resources/img/Logo1.png" />" height="40"></a>
	</div>
	<div class="collapse navbar-collapse">
		<ul class="nav navbar-nav navbar-left">
		<!-- 	<li><a class="nav-link" href="index">หน้าแรก</a></li> -->
			<sec:authorize access="hasRole('Admin')"><li><a class="nav-link" href="record">บันทึกข้อมูลโค</a></li></sec:authorize>
			<sec:authorize access="hasAnyRole('Admin','User')"><li><a class="nav-link" href="Search">ค้นหาข้อมูลโค</a></li></sec:authorize>
		
			<sec:authorize access="hasRole('Admin')"><li><a class="nav-link" href="Detail">รายละเอียดการออกใบพันธุ์ประวัติ</a></li></sec:authorize>
				<sec:authorize access="hasRole('Admin')">
				<li><a class="nav-link" href="AllReport">ออกรายงาน</a></li>
			</sec:authorize> 
			
			<sec:authorize access="hasRole('Admin')">
				<li><a class="nav-link" href="contact">สมาคม</a></li>
			</sec:authorize>
			
			<sec:authorize access="hasRole('Admin')">
				<li><a class="nav-link" href="ped">ออกtagเบอร์หู</a></li>
			</sec:authorize>
			<li class="dropdown"><a href="#"
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
								<button type="button" class="btn btn-primary" data-dismiss="modal">No</button>
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
							<font size="6">Setting</font>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<div class="container" style="color:#404040">
		<div class="row">
			<div class=" col-sm-12">
				<div class="panel">
					<ul id="myTab1" class="nav nav-tabs nav-justified">
						<li class="active"><a href="#addbreed" data-toggle="tab"><i
								class="fa fa-file-text-o"></i>&nbsp;
							Add Pedigree</a></li>
						<li class=""><a href="#addbank" data-toggle="tab"><i
								class="fa fa-university"></i>&nbsp; Add Bank</a></li>
						<li class=""><a href="#ChangeColor" data-toggle="tab"><i
								class="fa fa-paint-brush"></i>&nbsp; Add Color Cattle</a></li>
						<!-- <li class=""><a href="#editlogo" data-toggle="tab"><i
								class="fa fa-file-image-o"></i>&nbsp;เปลี่ยนโลโก้</a></li> -->
					</ul>
					<div id="myTabContent" class="tab-content">
						<div class="tab-pane fade active in" id="addbreed">

							<div class="container">
								<div class="row">
									<div class=" col-sm-12">
										<br>
										<div class="col-sm-offset-1 col-sm-4">
											<div class="panel panel-primary">
												<div class="panel-heading">
													<h3 class="panel-title"><i class="fa fa-plus"></i>&nbsp;Add Pedigree</h3>
												</div>
												<div class="panel-body" >
													<div class="container" align="left" >
														<div class="row">
															<div class="col-sm-6"  >
																Gene &nbsp;&nbsp; 
																
																<input type="text"id="nameGene" size="25">

															</div>
														</div>
													</div>
													<br>
													<div class="container" align="left">
														<div class="row">
															<div class="col-sm-6">
																Def. Gene &nbsp;&nbsp; <input type="text"
																	id="defnameGene" size="22">

															</div>
														</div>
													</div>
													<br>
													<div class="container" align="left">
														<div class="row">
															<div class="col-sm-6">
																Pedigree Type &nbsp;&nbsp; <input type="text"
																	id="typeGene" size="18">

															</div>
														</div>
													</div>
													<br>

													<div class="container">
														<div class="row">
															<div class="col-sm-6" align="left">
																Price &nbsp;&nbsp; <input type="text" id="priceGene" size="20">
																&nbsp;&nbsp; Baht &nbsp;&nbsp; <br><br>
																<div class="col-sm-offset-4 col-sm-2">
																<button class="btn btn-info" value="add" onclick="setGene()" >Save</button>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>

										<!-- <div class="col-sm-offset-1 col-sm-4">
											<div class="panel panel-primary">
												<div class="panel-heading">
													<h3 class="panel-title"><i class="fa fa-pencil"></i>&nbsp;แก้ไขประเภทใบพันธุ์ประวัติ</h3>
												</div>
												<div class="panel-body">
												<div class="container">
														<div class="row">
															<div class="col-sm-6">
																สายพันธุ์ &nbsp;&nbsp; <input type="text"
																	id="name" size="24">

															</div>
														</div>
													</div>
													<br>
													<div class="container">
														<div class="row">
															<div class="col-sm-6">
																แก้ไขประเภทใบพันธุ์ประวัติ &nbsp;&nbsp; <input type="text"
																	id="name" size="12">

															</div>
														</div>
													</div>
													<br>

													<div class="container">
														<div class="row">
															<div class="col-sm-6">
																ราคา &nbsp;&nbsp; <input type="text" id="name" size="12">
																&nbsp;&nbsp; บาท &nbsp;&nbsp;
																<button class="btn btn-warning">แก้ไข</button>

															</div>
														</div>
													</div>
												</div>
											</div>
										</div> -->
										<!-- Table -->
										<div class="container">
											<div class="row">
												<div class=" col-sm-offset-1 col-sm-9">
													<table class="table table-bordered">

														<thead>
															<tr class="success">
																<th class="text-center">No.</th>
																<th class="text-center">Gene</th>
																<th class="text-center">Def. Gene</th>
																<th class="text-center">Pedigree Type</th>
																<th class="text-center">Price</th>
																<th class="text-center">Edit</th>
																<th class="text-center">Delete</th>
															</tr>
														</thead>
														<tbody id="listGene">
															
														</tbody>
													</table>
													<!-- End Table -->
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>


						<div class="tab-pane fade" id="addbank">
							<div class="container">
								<div class="row">
									<div class=" col-sm-12">
										<br>
										<div class="col-sm-offset-1 col-sm-4">
											<div class="panel panel-primary">
												<div class="panel-heading">
													<h3 class="panel-title"><i class="fa fa-plus"></i>&nbsp;Add Bank</h3>
												</div>
												<div class="panel-body">
													<div class="container">
														<div class="row">
															<div class="col-sm-6" align="left">
															Name Bank&nbsp;&nbsp; <input type="text" id="nameBank"
																	size="16">

															</div>
														</div>
													</div>
													<br>

													<div class="container">
														<div class="row">
															<div class="col-sm-6" align="left">
															Def. Bank  &nbsp;&nbsp;&nbsp; <input type="text"
																	id="defNameBank" size="16"> <br> <br>
																<div class="col-sm-offset-4 col-sm-2">
																	<button class="btn btn-info" value="add" onclick="setBank()">&nbsp;&nbsp;Save&nbsp;&nbsp;</button>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>

										<!-- <div class="col-sm-offset-1 col-sm-4">
											<div class="panel panel-primary">
												<div class="panel-heading">
													<h3 class="panel-title"><i class="fa fa-pencil"></i>&nbsp;แก้ไขชื่อธนาคาร</h3>
												</div>
												<div class="panel-body">
													<div class="container">
														<div class="row">
															<div class="col-sm-6">
																แก้ไขชื่อธนาคาร &nbsp; <input type="text" id="name"
																	size="16">

															</div>
														</div>
													</div>
													<br>

													<div class="container">
														<div class="row">
															<div class="col-sm-6">
																ชื่อย่อธนาคาร &nbsp;&nbsp;&nbsp; <input type="text"
																	id="name" size="16"> <br> <br>
																<div class="col-sm-offset-4 col-sm-2">
																	<button class="btn btn-warning" >&nbsp;&nbsp;แก้ไข&nbsp;&nbsp;</button>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div> -->
										<!-- Table -->
										<div class="container">
											<div class="row">
												<div class=" col-sm-offset-1 col-sm-9">
													<table class="table table-bordered">

														<thead>
															<tr class="success">
																<th class="text-center">No.</th>
																<th class="text-center">Bank</th>
																<th class="text-center">Def. Bank</th>
																<th class="text-center">Edit</th>
																<th class="text-center">Delete</th>
															</tr>
														</thead>
														<tbody id ="listBank">
														
														</tbody>
													</table>
													<!-- End Table -->
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Change color -->

						<div class="tab-pane fade" id="ChangeColor">
								<div class="container">
									<div class="row">
										<div class=" col-sm-12">
											<br>
											<div class="col-sm-offset-1 col-sm-4">
												<div class="panel panel-primary">
													<div class="panel-heading">
														<h3 class="panel-title"><i class="fa fa-plus"></i>&nbsp;Add Color Cattle</h3>
													</div>
													<div class="panel-body">

														<div class="container">
															<div class="row">
																<div class=" col-sm-6" align="left">
																 Color&nbsp;&nbsp;
																	<input  type="text" id="nameColor" size="23" />

																</div>
															</div>
														</div>
														<br>

														<div class="container">
															<div class="row">
																<div class="col-sm-6">
																	<div class="col-sm-offset-4 col-sm-2">
																		<button class="btn btn-info" value="add" onclick="setColor()">&nbsp;Save&nbsp;</button>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>

										<!-- 	<div class="col-sm-offset-1 col-sm-4">
												<div class="panel panel-primary">
													<div class="panel-heading">
														<h3 class="panel-title"><i class="fa fa-pencil"></i>&nbsp;แก้ไขสีโค</h3>
													</div>
													<div class="panel-body">
														<div class="container">
															<div class="row">
																<div class=" col-sm-6">
																	แก้ไขสีโค &nbsp;&nbsp; <input type="text" id="name"
																		size="21">

																</div>
															</div>
														</div>
														<br>

														<div class="container">
															<div class="row">
																<div class="col-sm-6">
																	<div class="col-sm-offset-4 col-sm-2">
																		<button class="btn btn-warning">&nbsp;แก้ไข&nbsp;&nbsp;</button>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div> -->
											<!-- Table -->
											<div class="container">
												<div class="row">
													<div class=" col-sm-offset-1 col-sm-9">
														<table class="table table-bordered">

															<thead>
																<tr class="success">
																	<th class="text-center">No.</th>
																	<th class="text-center">Color</th>
																<th class="text-center">Edit</th>
																	<th class="text-center">Delete</th>
																</tr>
															</thead>
															<tbody id ="listColor">
																
															</tbody>
														</table>
														<!-- End Table -->
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							
						</div>

						<!-- End Change color -->


						<!-- Change Logo -->
					<!-- 	<div class="tab-pane fade" id="editlogo">
							<br>
							<p class="text-center">รูปภาพที่เหมาะสมคือขนาด 250x250 พิกเซล</p>
							<br>
							<div class="container">
								<div class="row">
									<div class="col-sm-offset-2 col-sm-9">
										<div class="col-sm-2">โลโก้</div>
										<div class="col-sm-7">
											<input id="file-0" class="file input-sm" type="file"
												multiple=true>
										</div>
									</div>
								</div>
							</div>
							<br>

							<div class="container">
								<div class="row">
									<div class="col-sm-offset-2 col-sm-9">
										<div class="col-sm-2">ชื่อสมาคม</div>
										<div class="col-sm-7">
											<input type="text" class="form-control" id="usr">
										</div>
									</div>
								</div>
							</div>
							<br>

							<div class="container">
								<div class="row">
									<div class="col-sm-offset-2 col-sm-9">
										<div class="col-sm-2">ชื่อภาษาอังกฤษ</div>
										<div class="col-sm-7">
											<input type="text" class="form-control" id="usr"> <br>
											<button style="float: right;" class="btn btn-success">บันทึก</button>
										</div>
									</div>
								</div>
							</div>
							<br>
						</div> -->
						<!-- End Change Logo -->
					</div>
				</div>
			</div>
		</div>
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
$("#listColor").load('listColor');
function setColor(){
	$.ajax({
		url : "Banking.do",
		method : 'post',
		cache : false,
		data:{
			name : $("#nameColor").val(),
			action :'add'
		},success :function(result){
			$("#listColor").load('listColor');
			 swal("Success" , "เพิ่มข้อมูลสำเร็จ" , "success")
		}
	});
}

function deleteColor(id){
		 $.post( "cancel", { id: id.value } )
		 .done(function(data){
			 $("#listColor").load('listColor');
			 swal("ลบข้อมูลสำเร็จ" , "" , "error") 
		 });
	} 
	
</script>


<script type="text/javascript">
$("#listBank").load('listBank');
function setBank(){
	$.ajax({
		url : "Bank.do",
		method : 'post',
		cache : false,
		data:{
			name : $("#nameBank").val(),
			defName : $("#defNameBank").val(),
			action :'add'
		},success :function(result){
			$("#listBank").load('listBank');
			swal("Success" , "เพิ่มข้อมูลสำเร็จ" , "success")
		}
	});
}

function deleteBank(id){
		 $.post( "cancelbank", { id: id.value } )
		 .done(function(data){
			 $("#listBank").load('listBank');
			 swal("ลบข้อมูลสำเร็จ" , "" , "error") 
		 });
	} 
	
</script>


<script type="text/javascript">
$("#listGene").load('listGene');
function setGene(){
	$.ajax({
		url : "PedigreeType.do",
		method : 'post',
		cache : false,
		data:{
			gene : $("#nameGene").val(),
			def : $("#defnameGene").val(),
			type : $("#typeGene").val(),
			price : $("#priceGene").val(),
			action :'add'
		},success :function(result){
			swal("Success" , "เพิ่มข้อมูลสำเร็จ" , "success")
			window.location="http://localhost:8080/CH4_005_MVC/Banking";
			$("#listGene").load('listGene');
			
		}
	});
}

function deleteGene(id){
		 $.post( "cancelgene", { id: id.value } )
		 .done(function(data){
			 $("#listGene").load('listGene');
			 swal("ลบข้อมูลสำเร็จ" , "" , "error") 
		 });
	} 
	
</script>

<script type="text/javascript">

$("#listGene").load('listGene');
 
$( document ).ready(function() {
 	$(".btn-success").hide();
 });

 $(document).on('click', '#btnEdit1', function(e) {
		var idx = $('[id=btnEdit1]').index(e.target);
		$('[id=btnSave1]').eq(idx).removeClass("hide");
		$('[id=btnEdit1]').eq(idx).hide();
		$('[id=gene]').eq(idx).prop('disabled',false);
		$('[id=def]').eq(idx).prop('disabled',false);
		$('[id=type]').eq(idx).prop('disabled',false);
		$('[id=price]').eq(idx).prop('disabled',false);

 });
 
 $(document).on('click', '#btnSave1', function(e) {
	 	var idx = $('[id=btnSave1]').index(e.target); 
	/* 	var idx = 0; */
			$.ajax({
				url : 'update_pedigreeType',
				method : 'POST',
				data : {
						id : $('[id=id]').eq(idx).val(),
						gene : $('[id=gene]').eq(idx).val(),
						def : $('[id=def]').eq(idx).val(),
						type : $('[id=type]').eq(idx).val(),
						price : $('[id=price]').eq(idx).val(),
				},
				success : function(result) {
					swal("แก้ไขข้อมูลสำเร็จ" , "" , "success") 
				$('[id=btnSave1]').eq(idx).addClass("hide");
				$('[id=btnEdit1]').eq(idx).hide();
				$('[id=gene]').eq(idx).prop('disabled',true);
				$('[id=def]').eq(idx).prop('disabled',true);
				$('[id=type]').eq(idx).prop('disabled',true);
				$('[id=price]').eq(idx).prop('disabled',true);
				$('[id=btnEdit1]').eq(idx).show();
				},
				error : function(result) {
					/* alert("แก้ไขข้อมูลไม่สำเร็จ"); */
					swal("แก้ไขข้อมูลไม่สำเร็จ" , "" , "error") 
					$('[id=btnSave1]').eq(idx).show();
					$('[id=btnEdit1]').eq(idx).hide();
					$('[id=gene]').eq(idx).prop('disabled',false);
					$('[id=def]').eq(idx).prop('disabled',false);
					$('[id=type]').eq(idx).prop('disabled',false);
					$('[id=price]').eq(idx).prop('disabled',false);
					$('[id=btnSave1]').eq(idx).show();
					$('[id=btnEdit1]').eq(idx).hide();
				}
			});
	});	
</script>

<script type="text/javascript">
$("#listBank").load('listBank');

$( document ).ready(function() {
 	$(".btn-success").hide();
 });

 $(document).on('click', '#btnEdit2', function(e) {
		var idx = $('[id=btnEdit2]').index(e.target);
		$('[id=btnSave2]').eq(idx).removeClass("hide");
		$('[id=btnEdit2]').eq(idx).hide();
		$('[id=name]').eq(idx).prop('disabled',false);
		$('[id=defName]').eq(idx).prop('disabled',false);

 });
 
 $(document).on('click', '#btnSave2', function(e) {
		var idx = $('[id=btnSave2]').index(e.target);
			$.ajax({
				method : 'POST',
				url : 'update_bank',
				data : {
						id : $('[id=id2]').eq(idx).val(),
						name : $('[id=name]').eq(idx).val(),
						defName : $('[id=defName]').eq(idx).val(),
				},
				success : function(result) {
					swal("แก้ไขข้อมูลสำเร็จ" , "" , "success") 
				$('[id=btnSave2]').eq(idx).addClass("hide");
				$('[id=btnEdit2]').eq(idx).hide();
				$('[id=name]').eq(idx).prop('disabled',true);
				$('[id=defName]').eq(idx).prop('disabled',true);
				$('[id=btnEdit2]').eq(idx).show();
				},
				error : function(result) {
					/* alert("แก้ไขข้อมูลไม่สำเร็จ"); */
					swal("แก้ไขข้อมูลไม่สำเร็จ" , "" , "error") 
					$('[id=btnSave2]').eq(idx).show ();
					$('[id=btnEdit2]').eq(idx).hide();
					$('[id=name]').eq(idx).prop('disabled',false);
					$('[id=defName]').eq(idx).prop('disabled',false);
					$('[id=btnSave2]').eq(idx).show();
					$('[id=btnEdit2]').eq(idx).hide();
				}
			});
	});	
 
 </script>
 
 <script type="text/javascript">
 $("#listColor").load('listColor');
 
 $( document ).ready(function() {
	 	$(".btn-success").hide();
	 });

  $(document).on('click', '#btnEdit3', function(e) {
 		var idx = $('[id=btnEdit3]').index(e.target);
 		$('[id=btnSave3]').eq(idx).removeClass("hide");
 		$('[id=btnEdit3]').eq(idx).hide();
 		$('[id=name3]').eq(idx).prop('disabled',false);

  });
  
  $(document).on('click', '#btnSave3', function(e) {
 		var idx = $('[id=btnSave3]').index(e.target);
 			$.ajax({
 				method : 'POST',
 				url : 'update_color',
 				data : {
 						id : $('[id=id3]').eq(idx).val(),
 						name : $('[id=name3]').eq(idx).val(),
 						
 				},
 				success : function(result) {
 					swal("แก้ไขข้อมูลสำเร็จ" , "" , "success") 
 				$('[id=btnSave3]').eq(idx).addClass("hide");
 				$('[id=btnEdit3]').eq(idx).hide();
 				$('[id=name3]').eq(idx).prop('disabled',true);
 				$('[id=btnEdit3]').eq(idx).show();
 				},
 				error : function(result) {
 					/* alert("แก้ไขข้อมูลไม่สำเร็จ"); */
 					swal("แก้ไขข้อมูลไม่สำเร็จ" , "" , "error") 
 					$('[id=btnSave3]').eq(idx).show ();
 					$('[id=btnEdit3]').eq(idx).hide();
 					$('[id=name3]').eq(idx).prop('disabled',false);
 					$('[id=btnSave3]').eq(idx).show();
 					$('[id=btnEdit3]').eq(idx).hide();
 				}
 			});
 	});	
</script>

</html>