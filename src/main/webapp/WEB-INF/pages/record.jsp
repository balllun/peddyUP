<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/includes.jsp"%>
<!DOCTYPE html >
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
    
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="initial-scale=1,maximum-scale=1,user-scalable=no">

<title>Record</title>

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

<script src="<c:url value="/resources/js/jquery.min.js" />"></script>

<script src="<c:url value="/resources/js/site.min.js" />"></script>


<link href="<c:url value="/resources/css/jquery-ui.css" />"
	rel="stylesheet">
<script src="<c:url value="/resources/js/jquery-2.1.3.min.js" />"></script>
<script charset="utf-8"
	src="<c:url value="/resources/js/jquery-ui.js" />"></script>
<%-- <script
	src="<c:url value="/resources/js/jquery.select-to-autocomplete.js" />"></script> --%>

<link href="<c:url value="/resources/css/sweetalert.css" />"
	rel="stylesheet">
<script src="<c:url value="/resources/js/sweetalert.min.js" />"></script>

<script>
	(function($) {
		$(function() {
			$('select').selectToAutocomplete();
			$('form').submit(function() {
				alert($(this).serialize());
				return false;
			});
		});
	})(jQuery);
</script>

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
/* body {
	font-family: Arial, Verdana, sans-serif;
	font-size: 16px;
} */
.ui-autocomplete {
	padding: 0;
	list-style: none;
	background-color: #fff;
	width: 218px;
	border: 1px solid #B0BECA;
	max-height: 350px;
	overflow-x: hidden;
}

.ui-autocomplete .ui-menu-item {
	border-top: 1px solid #B0BECA;
	display: block;
	padding: 4px 6px;
	color: #353D44;
	cursor: pointer;
}

.ui-autocomplete .ui-menu-item:first-child {
	border-top: none;
}

.ui-autocomplete .ui-menu-item.ui-state-focus {
	background-color: #D5E5F4;
	color: #161A1C;
}

.read1[readonly] {
	background-color: #FBD3E9;
	border: 1px inset;
}

.read2[readonly] {
	background-color: #C9FFBF;
	border: 1px inset;
}

.read3[readonly] {
	background-color: #ddd6f3;
	border: 1px inset;
}

.bg1{
	background-color: #FBD3E9;
  border: 1px inset;
}


.bg2{
	background-color:   #C9FFBF;
  border: 1px inset;
}


.bg3{
	background-color:  #ddd6f3;
  border: 1px inset;
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
<script type="text/javascript">
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#img1').attr('src', e.target.result);
                }

                reader.readAsDataURL(input.files[0]);
            }
        }

        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader2 = new FileReader();

                reader2.onload = function (e) {
                    $('#img2').attr('src', e.target.result);
                }

                reader2.readAsDataURL(input.files[0]);
            }
        }
</script>
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
				<a class="navbar-brand" href="index"><img
					src="<c:url value="/resources/img/Logo1.png" />" height="40"></a>
			</div>
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav navbar-left">
					<!-- <li><a class="nav-link " href="index">หน้าแรก</a></li> -->
					<li class="active"><a class="nav-link current" href="record">บันทึกข้อมูลโค</a></li>
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
				<li><a class="nav-link" href="contact">สมาคม</a></li>
			</sec:authorize>
			
			<sec:authorize access="hasRole('Admin')">
				<li><a class="nav-link" href="ped">ออกtagเบอร์หู</a></li>
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
							<font size="6">Record</font>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	

<div class="row form-group" >
                <div class="panel panel-primary">
                    <div class="panel-heading" >
                        <h4 class="panel-title" align="left">
                            <span class="fa fa-list-alt fa-lg" ></span>&nbsp;บันทึกข้อมูลโค</a>
                        </h4>
                    </div>

                    <div class="panel-body" >
                        <input  value="0" type="hidden"></input>
                        <input  value="0" type="hidden"></input>
                        <div class="row form-group ">
                            <div class="col-md-6 ">
                                <fieldset><br>
                                



                                    
<div class="container">
		<form:form class="form-horizontal" role="form" action="record.do"
			id="pedigree" method="POST" commandName="pedigree"
			modelAttribute="pedigree" style="color:#404040"   >
			<div class="form-group" >
				<br> <label class="control-label col-sm-2" for="pwd" >Select
					Breed</label>
				<div class="col-sm-5">

					<form:select id="sel1" onchange="selectis(this)"
						class="form-control" path="pedigreeType.id"
						items="${pedigreeTypeList}" />
				</div>
			</div>
			
			


			<div class="form-group">
				<label class="control-label col-sm-2" for="pwd">Sex</label>
				<div class="col-sm-5">
					<form:select class="form-control" path="sex">
						<option value="BULL">Bull</option>
						<option value="COW">Cow</option>
					</form:select>
				</div>
			</div>


			<div class="form-group">
				<label class="control-label col-sm-2" for="pwd">Color</label>
				<div class="col-sm-5">
					<form:select class="form-control" path="color.id"
						items="${colorList}" />
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="pwd">Breeder</label>
				<div class="col-sm-5">
					<form:input class="form-control" path="breeder"
						placeholder="ผู้ปรับปรุงพันธุ์โค" />
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="pwd">Name</label>
				<div class="col-sm-5">
					<form:input class="form-control" path="CName" placeholder="ชื่อโค" />
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="pwd">.Private Herd
					No.</font></label>
				<div class="col-sm-5">
					<form:input class="form-control" path="privateNo"
						placeholder="หมายเลขประจำฝูง" />
				</div>
			</div>

			<div class="form-group">
				<div class="control-label col-sm-2">
					<label for="pwd" id="testone"></label> <label> No.</label>
				</div>
				<div class="col-sm-5">
					<form:input class="form-control" path="bbfaNo"
						placeholder="หมายเลขทะเบียนของโคที่ออกให้โดยสมาคม" />
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="pwd">Owner Farm
					Name</label>
				<div class="col-sm-5">
					<form:input class="form-control" path="owner"
						placeholder="ชื่อเจ้าของฟาร์ม" />
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="pwd" > Ownership
					Brand</label>
				<div class="col-sm-5">
					<form:input class="form-control" path="band"
						placeholder="สัญลักษณ์หรือเครื่องหมายประจำฟำร์ม" />
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="pwd"> Farm Name</label>
				<div class="col-sm-5">
					<form:input class="form-control" path="farmName"
						placeholder="ชื่อฟาร์ม" />
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="pwd"> Present
					Owner</label>
				<div class="col-sm-5">
					<form:input class="form-control" path="ownerName"
						placeholder="เจ้าของปัจจุบัน" />
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="pwd"> Date of
					Delivery</label>
				<div class="col-sm-5">
					<form:input class="form-control" type="date" path="dateDelivery" />
				</div>
			</div>


			<div class="form-group">
				<label class="control-label col-sm-2" for="pwd">Calved</label>
				<div class="col-sm-5">
					<form:input class="form-control" type="date" path="calved" />
				</div>
			</div>
			







      

		</form:form>
		<div class="panel panel-default" style="color:#0000FF">
			<div class="panel-body">
				<!-- End Set Panel -->

				<div class="container">
					<div class="row">
						<form:form modelAttribute="tgrandpa" id="tgrandpa" method="POST"
							commandName="tgrandpa">
							<div class="col-md-offset-6 col-md-7">

								<div class="col-md-3">
									<input name="CName" class="bg3" type="text" id="user"
										placeholder="ชื่อพ่อโค">
								</div>
								<div class="col-md-2">
									<input name="privateNo" class="bg3" type="text" id="user"
										placeholder="หมายเลขประจำฝูง">
								</div>
								<div class="col-md-1">
										<input type="text" class="read3" id="disabledTextInput" name="sex" value="BULL" readonly="readonly" >
								</div>
								<div class="col-md-2">
									<input name="bbfaNo" class="bg3" type="text" id="user"
										placeholder="หมายเลขทะเบียนของสมาคม" >
								</div>
								<div class="col-md-1">
								<select name="pedigreeType.id" class="bg3" style="height: 33px; width: 135px; margin-left: 70px;">
								
									<c:forEach items="${pedigreeTypeList1}" var="pediType">
									<option value="${pediType.id}">${pediType.gene} : ${pediType.type}</option>
									</c:forEach>
								</select>
									<!-- <input  type="text" id="user"
										placeholder="บราห์มัน"> --> <br>
								</div>
							</div>
						</form:form>
						<br>

						<form:form modelAttribute="grandpa" id="grandpa" method="POST"
							commandName="grandpa">
							<div class="col-md-offset-3 col-md-7">
								<div class="col-md-3">
									<input name="CName" class="bg2" type="text" id="user"
										placeholder="ชื่อพ่อโค">
								</div>
								<div class="col-md-2">
									<input name="privateNo" class="bg2" type="text" id="user"
										placeholder="หมายเลขประจำฝูง">
								</div>
								<div class="col-md-1">
									<input type="text" class="read2" id="disabledTextInput" name="sex" value="BULL" readonly="readonly" >
								</div>
								<div class="col-md-2">
									<input name="bbfaNo" class="bg2" type="text" id="user"
										placeholder="หมายเลขทะเบียนของสมาคม">
								</div>
								<div class="col-md-1">
									<select name="pedigreeType.id" class="bg2" style="height: 33px; width: 135px; margin-left: 70px;">
									
									<c:forEach items="${pedigreeTypeList1}" var="pediType">
									<option value="${pediType.id}">${pediType.gene} : ${pediType.type}</option>
									</c:forEach>
								</select> <br>
								</div>
							</div>
						</form:form>



						<form:form modelAttribute="tgrandmama" id="tgrandmama"
							method="POST" commandName="tgrandmama">
							<div class="col-sm-offset-6 col-sm-7">
								<div class="col-md-3">
									<input name="CName" class="bg3" type="text" id="user"
										placeholder="ชื่อแม่โค">
								</div>
								<div class="col-md-2">
									<input name="privateNo" class="bg3" type="text" id="user"
										placeholder="หมายเลขประจำฝูง">
								</div>
								<div class="col-md-1">
									<input type="text" class="read3" id="disabledTextInput" name="sex" value="COW" readonly="readonly" >
								</div>
								<div class="col-md-2">
									<input name="bbfaNo" class="bg3" type="text" id="user"
										placeholder="หมายเลขทะเบียนของสมาคม">
								</div>
								<div class="col-md-1">
									<select name="pedigreeType.id" class="bg3" style="height: 33px; width: 135px; margin-left: 70px;">
									
									<c:forEach items="${pedigreeTypeList1}" var="pediType">
									<option value="${pediType.id}">${pediType.gene} : ${pediType.type}</option>
									</c:forEach>
								</select> <br>
								</div>
							</div>
						</form:form>



						<form:form modelAttribute="sire" id="sire" method="POST"
							commandName="sire">
							<div class="col-md-offset-0 col-md-7">
								<label class="control-label col-sm-1" for="pwd">SIRE</label>
								<div class="col-md-3">
									<input name="CName" class="bg1" type="text" id="user" placeholder="SIRE">
								</div>
								<div class="col-md-2">
									<input name="privateNo" class="bg1" type="text" id="user"
										placeholder="หมายเลขประจำฝูง">
								</div>
								<div class="col-md-1">
									<input type="text" class="read1" id="disabledTextInput" name="sex" value="BULL" readonly="readonly" >
								</div>
								<div class="col-md-2">
									<input name="bbfaNo" class="bg1" type="text" id="user"
										placeholder="หมายเลขทะเบียนของสมาคม">
								</div>
								<div class="col-md-1">
									<select name="pedigreeType.id" class="bg1" style="height: 33px; width: 135px; margin-left: 70px;">
									
									<c:forEach items="${pedigreeTypeList1}" var="pediType">
									<option value="${pediType.id}">${pediType.gene} : ${pediType.type}</option>
									</c:forEach>
								</select> <br>
								</div>
							</div>
						</form:form>

						<form:form modelAttribute="tgrandfather" id="tgrandfather"
							method="POST" commandName="tgrandfather">
							<div class="col-md-offset-6 col-md-7">
								<div class="col-md-3">
									<input name="CName" class="bg3" type="text" id="user"
										placeholder="ชื่อพ่อโค">
								</div>
								<div class="col-md-2">
									<input name="privateNo" class="bg3" type="text" id="user"
										placeholder="หมายเลขประจำฝูง">
								</div>
								<div class="col-md-1">
									<input type="text" class="read3" id="disabledTextInput" name="sex" value="BULL" readonly="readonly" >
								</div>
								<div class="col-md-2">
									<input name="bbfaNo" class="bg3" type="text" id="user"
										placeholder="หมายเลขทะเบียนของสมาคม">
								</div>
								<div class="col-md-1">
									<select name="pedigreeType.id" class="bg3" style="height: 33px; width: 135px; margin-left: 70px;">
									
									<c:forEach items="${pedigreeTypeList1}" var="pediType">
									<option value="${pediType.id}">${pediType.gene} : ${pediType.type}</option>
									</c:forEach>
								</select><br>
								</div>
							</div>
						</form:form>

						<form:form modelAttribute="grandmama" id="grandmama" method="POST"
							commandName="grandmama">
							<div class="col-md-offset-3 col-md-7">
								<div class="col-md-3">
									<input name="CName"  class="bg2" type="text" id="user"
										placeholder="ชื่อแม่โค">
								</div>
								<div class="col-md-2">
									<input name="privateNo" class="bg2" type="text" id="user"
										placeholder="หมายเลขประจำฝูง">
								</div>
								<div class="col-md-1">
									<input type="text" class="read2" id="disabledTextInput" name="sex" value="COW" readonly="readonly" >
								</div>
								<div class="col-md-2">
									<input name="bbfaNo" class="bg2" type="text" id="user"
										placeholder="หมายเลขทะเบียนของสมาคม">
								</div>
								<div class="col-md-1">
									<select name="pedigreeType.id" class="bg2" style="height: 33px; width: 135px; margin-left: 70px;">
									
									<c:forEach items="${pedigreeTypeList1}" var="pediType">
									<option value="${pediType.id}">${pediType.gene} : ${pediType.type}</option>
									</c:forEach>
								</select><br>
								</div>
							</div>
						</form:form>

						<form:form modelAttribute="tgrandma" id="tgrandma" method="POST"
							commandName="tgrandma">
							<div class="col-md-offset-6 col-md-7">
								<div class="col-md-3">
									<input name="CName" class="bg3" type="text" id="user"
										placeholder="ชื่อแม่โค">
								</div>
								<div class="col-md-2">
									<input name="privateNo" class="bg3" type="text" id="user"
										placeholder="หมายเลขประจำฝูง">
								</div>
								<div class="col-md-1">
									<input type="text" class="read3" id="disabledTextInput" name="sex" value="COW" readonly="readonly" >
								</div>
								<div class="col-md-2">
									<input name="bbfaNo" class="bg3" type="text" id="user"
										placeholder="หมายเลขทะเบียนของสมาคม"> <br>
								</div>
								<div class="col-md-1">
									<select name="pedigreeType.id" class="bg3" style="height: 33px; width: 135px; margin-left: 70px;">
									
									<c:forEach items="${pedigreeTypeList1}" var="pediType">
									<option value="${pediType.id}">${pediType.gene} : ${pediType.type}</option>
									</c:forEach>
								</select><br><br>
								</div>
							</div>
						</form:form>



						<form:form modelAttribute="sgrandpa" id="sgrandpa" method="POST"
							commandName="sgrandpa">
							<div class="col-md-offset-6 col-md-7">
								<div class="col-md-3">
									<input name="CName"  class="bg3" type="text" id="user"
										placeholder="ชื่อพ่อโค">
								</div>
								<div class="col-md-2">
									<input name="privateNo"  class="bg3" type="text" id="user"
										placeholder="หมายเลขประจำฝูง">
								</div>
								<div class="col-md-1">
									<input type="text" class="read3" id="disabledTextInput" name="sex" value="BULL" readonly="readonly" >
								</div>
								<div class="col-md-2">
									<input name="bbfaNo"  class="bg3" type="text" id="user"
										placeholder="หมายเลขทะเบียนของสมาคม">
								</div>
								<div class="col-md-1">
									<select name="pedigreeType.id"  class="bg3" style="height: 33px; width: 135px; margin-left: 70px;">
									
									<c:forEach items="${pedigreeTypeList1}" var="pediType">
									<option value="${pediType.id}">${pediType.gene} : ${pediType.type}</option>
									</c:forEach>
								</select> <br>
								</div>
							</div>
						</form:form>
						<br>

						<form:form modelAttribute="grandfather" id="grandfather"
							method="POST" commandName="grandfather">
							<div class="col-md-offset-3 col-md-7">
								<div class="col-md-3">
									<input name="CName"  class="bg2" type="text" id="user"
										placeholder="ชื่อพ่อโค">
								</div>
								<div class="col-md-2">
									<input name="privateNo"  class="bg2" type="text" id="user"
										placeholder="หมายเลขประจำฝูง">
								</div>
								<div class="col-md-1">
									<input type="text" class="read2" id="disabledTextInput" name="sex" value="BULL" readonly="readonly" >
								</div>
								<div class="col-md-2">
									<input name="bbfaNo"   class="bg2" type="text" id="user"
										placeholder="หมายเลขทะเบียนของสมาคม">
								</div>
								<div class="col-md-1">
									<select name="pedigreeType.id"  class="bg2" style="height: 33px; width: 135px; margin-left: 70px;">
									
									<c:forEach items="${pedigreeTypeList1}" var="pediType">
									<option value="${pediType.id}">${pediType.gene} : ${pediType.type}</option>
									</c:forEach>
								</select> <br>
								</div>
							</div>
						</form:form>

						<form:form modelAttribute="sgrandmama" id="sgrandmama"
							method="POST" commandName="sgrandmama">
							<div class="col-md-offset-6 col-md-7">
								<div class="col-md-3">
									<input name="CName"  class="bg3" type="text" id="user"
										placeholder="ชื่อแม่โค">
								</div>
								<div class="col-md-2">
									<input name="privateNo"  class="bg3" type="text" id="user"
										placeholder="หมายเลขประจำฝูง">
								</div>
								<div class="col-md-1">
									<input type="text" class="read3" id="disabledTextInput" name="sex" value="COW" readonly="readonly" >
								</div>
								<div class="col-md-2">
									<input name="bbfaNo"  class="bg3" type="text" id="user"
										placeholder="หมายเลขทะเบียนของสมาคม">
								</div>
								<div class="col-md-1">
									<select name="pedigreeType.id"  class="bg3" style="height: 33px; width: 135px; margin-left: 70px;">
									
									<c:forEach items="${pedigreeTypeList1}" var="pediType">
									<option value="${pediType.id}">${pediType.gene} : ${pediType.type}</option>
									</c:forEach>
								</select> <br>
								</div>
							</div>
						</form:form>


						<form:form modelAttribute="dam" id="dam" method="POST"
							commandName="dam">
							<div class="col-md-offset-0 col-md-7">
								<label class="control-label col-sm-1">DAM</label>
								<div class="col-md-3">
									<input name="CName"  class="bg1" type="text" placeholder="DAM">
								</div>
								<div class="col-md-2">

									<input name="privateNo"  class="bg1" type="text" id="tags"
										placeholder="เลขประจำฝูง">
								</div>
								<div class="col-md-1">
								<input type="text" class="read1" id="disabledTextInput" name="sex" value="COW" readonly="readonly" >
								</div>
								<div class="col-md-2">
									<input name="bbfaNo"  class="bg1" type="text" id="tags"
										placeholder="เลขทะเบียนของสมาคม">
								</div>
								<div class="col-md-1">
									<select name="pedigreeType.id"  class="bg1" style="height: 33px; width: 135px; margin-left: 70px;">
									
									<c:forEach items="${pedigreeTypeList1}" var="pediType">
									<option value="${pediType.id}">${pediType.gene} : ${pediType.type}</option>
									</c:forEach>
								</select> <br>
								</div>
							</div>
						</form:form>

						<form:form modelAttribute="sgrandfather" id="sgrandfather"
							method="POST" commandName="sgrandfather">
							<div class="col-md-offset-6 col-md-7">
								<div class="col-md-3">
									<input name="CName"  class="bg3" type="text" id="user"
										placeholder="ชื่อพ่อโค">
								</div>
								<div class="col-md-2">
									<input name="privateNo"  class="bg3" type="text" id="user"
										placeholder="หมายเลขประจำฝูง">
								</div>
								<div class="col-md-1">
									<input type="text" class="read3" id="disabledTextInput" name="sex" value="BULL" readonly="readonly" >
								</div>
								<div class="col-md-2">
									<input name="bbfaNo"  class="bg3" type="text" id="user"
										placeholder="หมายเลขทะเบียนของสมาคม">
								</div>
								<div class="col-md-1">
									<select name="pedigreeType.id"  class="bg3" style="height: 33px; width: 135px; margin-left: 70px;">
									
									<c:forEach items="${pedigreeTypeList1}" var="pediType">
									<option value="${pediType.id}">${pediType.gene} : ${pediType.type}</option>
									</c:forEach>
								</select> <br>
								</div>
							</div>
						</form:form>


						<form:form modelAttribute="grandma" id="grandma" method="POST"
							commandName="grandma">
							<div class="col-md-offset-3 col-md-7">
								<div class="col-md-3">
									<input name="CName"  class="bg2" type="text" id="user"
										placeholder="ชื่อแม่โค">
								</div>
								<div class="col-md-2">
									<input name="privateNo"  class="bg2" type="text" id="user"
										placeholder="หมายเลขประจำฝูง">
								</div>
								<div class="col-md-1">
									<input type="text" class="read2" id="disabledTextInput" name="sex" value="COW" readonly="readonly" >
								</div>
								<div class="col-md-2">
									<input name="bbfaNo"  class="bg2" type="text" id="user"
										placeholder="หมายเลขทะเบียนของสมาคม">
								</div>
								<div class="col-md-1">
									<select name="pedigreeType.id"  class="bg2"style="height: 33px; width: 135px; margin-left: 70px;">
									
									<c:forEach items="${pedigreeTypeList1}" var="pediType">
									<option value="${pediType.id}">${pediType.gene} : ${pediType.type}</option>
									</c:forEach>
								</select> <br>
								</div>
							</div>
						</form:form>

						<form:form modelAttribute="sgrandma" id="sgrandma" method="POST"
							commandName="sgrandma">
							<div class="col-md-offset-6 col-md-7">
								<div class="col-md-3">
									<input name="CName"  class="bg3" type="text" id="user"
										placeholder="ชื่อแม่โค">
								</div>
								<div class="col-md-2">
									<input name="privateNo"  class="bg3" type="text" id="user"
										placeholder="หมายเลขประจำฝูง">
								</div>
								<div class="col-md-1">
										<input type="text" class="read3" id="disabledTextInput" name="sex" value="COW" readonly="readonly" >
								</div>
								<div class="col-md-2">
									<input name="bbfaNo"  class="bg3" type="text" id="user"
										placeholder="หมายเลขทะเบียนของสมาคม">
								</div>
								<div class="col-md-1">
									<select name="pedigreeType.id"  class="bg3" style="height: 33px; width: 135px; margin-left: 70px;">
									
									<c:forEach items="${pedigreeTypeList1}" var="pediType">
									<option value="${pediType.id}">${pediType.gene} : ${pediType.type}</option>
									</c:forEach>
								</select> <br>
								</div>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>









		<div class="container">
			<div class="row form-groups">
				<center>
					<button class="btn btn-success btn-lg" value="add" name="action"
						onclick="save()">
						<span class="glyphicon glyphicon-save"></span> Save
					</button>
					<!-- 				<button class="btn btn-warning btn-lg" value="Edit" name="action">
						<span class="glyphicon glyphicon-pencil"></span> แก้ไข
					</button>
					<button class="btn btn-danger btn-lg" value="Delete" name="action">
						<span class="glyphicon glyphicon-trash"></span>&nbsp;&nbsp; ลบ
						&nbsp;&nbsp;
					</button> -->
					
					<a href="Search" target="_blank">
					<label class="btn btn-info btn-lg" ><i
						class="glyphicon glyphicon-search"></i> Search</label> </a>
					
					<label class="btn btn-default btn-lg" onClick="window.location.reload()"><i
						class="glyphicon glyphicon-refresh"></i> Reset</label>

				</center>
			</div>
		</div>


	</div>










                            </div>
                            
                            
                            
                            
<div  align="right">
<div class="col-md-3" >
	<div class="row from-group">
		<div >
			<a>
				<form id="form1" runat="server">
					<img id="img1" src="#"  style="height: 100px"alt="your image" />
						<input type='file' onchange="readURL( this);" />
				</form>
			</a>
		</div>
	</div>
	<br>
	<br>
	<br>
	<div class="row from-group">
		<div >
			<a>
				<form id="form2" runat="server">
					<img id="img2" src="#" width="300" alt="your image" />
					
						<input type='file' onchange="readURL(this);"  />
					
				</form>
			</a>
		</div>
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
					<span  class="textright" style="color: white;font-size: 12px;">19 Moo.2 Maega Mung Phayao Thailand 56000 
				
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

	function save() {
		/* ฝ่ายพ่อ */
		 $.getJSON(
						'addCow',
						$('#tgrandpa').serialize(),
						function(result) {
							var tgrandpaId = result;
							$.getJSON(
											'addCow',
											$('#tgrandmama').serialize(),
											function(result) {
												var tgrandmamaId = result;
												$
														.getJSON(
																'addCow',
																$('#grandpa')
																		.serialize()
																		+ "&pedigreesireid.id="
																		+ tgrandpaId
																		+ "&pedigreedamid.id="
																		+ tgrandmamaId,
																function(result) {
																	var grandpaId = result;

																	$
																			.getJSON(
																					'addCow',
																					$(
																							'#tgrandfather')
																							.serialize(),
																					function(
																							result) {
																						var tgrandfatherId = result;
																						$
																								.getJSON(
																										'addCow',
																										$(
																												'#tgrandma')
																												.serialize(),
																										function(
																												result) {
																											var tgrandmaId = result;
																											$
																													.getJSON(
																															'addCow',
																															$(
																																	'#grandmama')
																																	.serialize()
																																	+ "&pedigreesireid.id="
																																	+ tgrandfatherId
																																	+ "&pedigreedamid.id="
																																	+ tgrandmaId,
																															function(
																																	result) {
																																var grandmamaId = result;

																																$
																																		.getJSON(
																																				'addCow',
																																				$(
																																						'#sire')
																																						.serialize()
																																						+ "&pedigreesireid.id="
																																						+ grandpaId
																																						+ "&pedigreedamid.id="
																																						+ grandmamaId,
																																				function(
																																						result) {
																																					var sireId = result;

																																					// ฝ่ายแม่ 
																																					$
																																							.getJSON(
																																									'addCow',
																																									$(
																																											'#sgrandpa')
																																											.serialize(),
																																									function(
																																											result) {
																																										var sgrandpaId = result;
																																										$
																																												.getJSON(
																																														'addCow',
																																														$(
																																																'#sgrandmama')
																																																.serialize(),
																																														function(
																																																result) {
																																															var sgrandmamaId = result;
																																															$
																																																	.getJSON(
																																																			'addCow',
																																																			$(
																																																					'#grandfather')
																																																					.serialize()
																																																					+ "&pedigreesireid.id="
																																																					+ sgrandpaId
																																																					+ "&pedigreedamid.id="
																																																					+ sgrandmamaId,
																																																			function(
																																																					result) {
																																																				var grandfatherId = result;

																																																				$
																																																						.getJSON(
																																																								'addCow',
																																																								$(
																																																										'#sgrandfather')
																																																										.serialize(),
																																																								function(
																																																										result) {
																																																									var sgrandfatherId = result;
																																																									$
																																																											.getJSON(
																																																													'addCow',
																																																													$(
																																																															'#sgrandma')
																																																															.serialize(),
																																																													function(
																																																															result) {
																																																														var sgrandmaId = result;
																																																														$
																																																																.getJSON(
																																																																		'addCow',
																																																																		$(
																																																																				'#grandma')
																																																																				.serialize()
																																																																				+ "&pedigreesireid.id="
																																																																				+ sgrandfatherId
																																																																				+ "&pedigreedamid.id="
																																																																				+ sgrandmaId,
																																																																		function(
																																																																				result) {
																																																																			var grandmaId = result;

																																																																			$
																																																																					.getJSON(
																																																																							'addCow',
																																																																							$(
																																																																									'#dam')
																																																																									.serialize()
																																																																									+ "&pedigreesireid.id="
																																																																									+ grandfatherId
																																																																									+ "&pedigreedamid.id="
																																																																									+ grandmaId,
																																																																							function(
																																																																									result) {
																																																																								var damId = result;

																																																																								// ฝ่ายลูก 
																																																																								$
																																																																										.getJSON(
																																																																												'addCow',
																																																																												$(
																																																																														'#pedigree')
																																																																														.serialize()
																																																																														+ "&pedigreesireid.id="
																																																																														+ sireId
																																																																														+ "&pedigreedamid.id="
																																																																														+ damId,
																																																																												function(
																																																																														result) { swal("Success" , "บันทึกข้อมูลสำเร็จ" , "success");

																																																																												});
																																																																							});

																																																																		});
																																																													});
																																																								});

																																																			});
																																														});
																																									});

																																				});

																															});
																										});
																					});

																});
											});
						}); 

	}

	$("#testone").load('name', {
		id : 1
	});
	function selectis(i) {
		$("#testone").load('name', {
			id : i.value
		});

	}
</script>




</html>