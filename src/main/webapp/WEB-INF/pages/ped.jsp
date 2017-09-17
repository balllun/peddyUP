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
            height:100vs;
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
					<!-- <li><a class="nav-link " href="index">หน้าแรก</a></li> -->
					<li ><a class="nav-link " href="record">บันทึกข้อมูลโค</a></li>
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
				<li><a class="nav-link" href="Detail">สมาคม</a></li>
			</sec:authorize>
			
			<sec:authorize access="hasRole('Admin')">
				<li class="active"><a class="nav-link current" href="ped">ออกtagเบอร์หู</a></li>
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
</nav> </header>
<body>
	

	
<div id="wrapper">
    <div id="content">
        <div class="container">
            <div class="container">
		<div class="row">
			<div class=" col-sm-3">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<p class="panel-title text-center">
							<font size="5">ทำTagเบอร์หู</font>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
            <div class="row">

            </div>
            <br>
            <div class="row form-group">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4 class="panel-title" align="left">
                            <span class="fa fa-list-alt fa-lg"  ></span>&nbsp;สั้งทำteg</a>
                        </h4>
                        
                    </div>
								
                    <div class="panel-body">
                   
                    
                        <input  value="0" type="hidden"></input>
                        <input  value="0" type="hidden"></input>
                        <div class="row form-group ">
                           
                            <div class="col-md-6 ">
                                <fieldset><br>
									
									  <div class="row form-group">
                                        <label class="col-md-offset-0 col-md-3 control-label"><font color="red">รายชื่อโค</font></label>
                                        <div class="col-md-6">
                                            <div class="input-group">
                                                <input type="text" class="form-control"/>
                                                <span class="input-group-addon" style="border-radius: 0px 10px 10px 0px;">ค้นหา</span>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    
                                     <div class="row form-group">
                                        <label class="col-md-offset-0 col-md-3 control-label" ><font color="red">ชื่อโค</font></label>
                                        <div class="col-md-6">
                                            <input type="text" class="form-control" />
                                            <input  type="hidden" class="form-control" />
                                        </div>
                                    </div>
                                    
                                    
									
									<div class="row form-group">

                                        <label class="col-md-offset-0 col-md-3 control-label"><font color="red">ประเทศ</font></label>
                                        <div class="col-md-4">

                                    <select id="pagelist" class="form-control" style="width: 150px">
                                        <option value="" class="btn btn-default dropdown-toggle" type="button" id="pagelist1" data-toggle="dropdown">กรุณาเลือก</option>
                                        <option value="firstOption" role="presentation"><a role="menuitem" tabindex="-1" href="#">1</a></option>
                                        <option value="firstOption" role="presentation"><a role="menuitem" tabindex="-1" href="#">2</a></option>
                                        <option value="firstOption" role="presentation"><a role="menuitem" tabindex="-1" href="#">3</a></option>
                                        <option value="firstOption" role="presentation"><a role="menuitem" tabindex="-1" href="#">4</a></option>
                                        <option value="firstOption" role="presentation"><a role="menuitem" tabindex="-1" href="#">5</a></option>
                                        <option value="secondOption" role="presentation"><a role="menuitem" tabindex="-1" href="#">6</a></option>
                                        <option value="secondOption" role="presentation"><a role="menuitem" tabindex="-1" href="#">7</a></option>
                                    </select>

                                        </div>
                                    </div>
									
									 <div class="row form-group">

                                        <label class="col-md-offset-0 col-md-3 control-label"><font color="red">จังหวัด</font></label>
                                        <div class="col-md-4">

                                    <select id="pagelist" class="form-control" style="width: 150px">
                                        <option value="" class="btn btn-default dropdown-toggle" type="button" id="pagelist1" data-toggle="dropdown">กรุณาเลือก</option>
                                        <option value="firstOption" role="presentation"><a role="menuitem" tabindex="-1" href="#">เชียงราย</a></option>
                                        <option value="firstOption" role="presentation"><a role="menuitem" tabindex="-1" href="#">พะเยา</a></option>
                                        
                                    </select>

                                        </div>
                                    </div>
									
									
									
									
										 <div class="row form-group">

                                        <label class="col-md-offset-0 col-md-3 control-label"><font color="red">อำเภอ</font></label>
                                        <div class="col-md-4">

                                    <select id="pagelist" class="form-control" style="width: 150px">
                                        <option value="" class="btn btn-default dropdown-toggle" type="button" id="pagelist1" data-toggle="dropdown">กรุณาเลือก</option>
                                        <option value="firstOption" role="presentation"><a role="menuitem" tabindex="-1" href="#">เชียงแสน</a></option>
                                        <option value="firstOption" role="presentation"><a role="menuitem" tabindex="-1" href="#">เชียงของ</a></option>
                                        <option value="firstOption" role="presentation"><a role="menuitem" tabindex="-1" href="#">เทิง</a></option>
                                        <option value="firstOption" role="presentation"><a role="menuitem" tabindex="-1" href="#">เมืองเชียงราย</a></option>
                                        <option value="firstOption" role="presentation"><a role="menuitem" tabindex="-1" href="#">เวียงเชียงรุ้ง</a></option>
                                        <option value="secondOption" role="presentation"><a role="menuitem" tabindex="-1" href="#">เวียงแก่น</a></option>
                                        <option value="secondOption" role="presentation"><a role="menuitem" tabindex="-1" href="#">เวียงชัย</a></option>
                                        <option value="secondOption" role="presentation"><a role="menuitem" tabindex="-1" href="#">เวียงป่าเป้า</a></option>
                                        <option value="secondOption" role="presentation"><a role="menuitem" tabindex="-1" href="#">แม่จัน</a></option>
                                        <option value="secondOption" role="presentation"><a role="menuitem" tabindex="-1" href="#">แม่ฟ้าหลวง</a></option>
                                        <option value="secondOption" role="presentation"><a role="menuitem" tabindex="-1" href="#">แม่ลาว</a></option>
                                        <option value="secondOption" role="presentation"><a role="menuitem" tabindex="-1" href="#">แม่สรวย</a></option>
                                        <option value="secondOption" role="presentation"><a role="menuitem" tabindex="-1" href="#">แม่สาย</a></option>
                                        <option value="secondOption" role="presentation"><a role="menuitem" tabindex="-1" href="#">ขุนตาล</a></option>
                                        <option value="secondOption" role="presentation"><a role="menuitem" tabindex="-1" href="#">ดอยหลวง</a></option>
                                        <option value="secondOption" role="presentation"><a role="menuitem" tabindex="-1" href="#">ป่าแดด</a></option>
                                        <option value="secondOption" role="presentation"><a role="menuitem" tabindex="-1" href="#">พญาเม็งราย</a></option>
                                        <option value="secondOption" role="presentation"><a role="menuitem" tabindex="-1" href="#">พาน</a></option>
                                        
                                        
                                    </select>

                                        </div>
                                    </div>
                                    
                                     <div class="row form-group">

                                        <label class="col-md-offset-0 col-md-3 control-label"><font color="red">ตำบล</font></label>
                                        <div class="col-md-4">

                                    <select id="pagelist" class="form-control" style="width: 150px">
                                        <option value="" class="btn btn-default dropdown-toggle" type="button" id="pagelist1" data-toggle="dropdown">กรุณาเลือก</option>
                                        <option value="firstOption" role="presentation"><a role="menuitem" tabindex="-1" href="#">ตำบลปงน้อย</a></option>
                                        <option value="firstOption" role="presentation"><a role="menuitem" tabindex="-1" href="#">ตำบลหนองป่าก่อ</a></option>
                                        <option value="firstOption" role="presentation"><a role="menuitem" tabindex="-1" href="#">ตำบลโชคชัย</a></option>
                                        <option value="firstOption" role="presentation"><a role="menuitem" tabindex="-1" href="#">ตำบลดงมหาวัน</a></option>
                                        <option value="firstOption" role="presentation"><a role="menuitem" tabindex="-1" href="#">ตำบลทุ่งก่อ</a></option>
                                        <option value="secondOption" role="presentation"><a role="menuitem" tabindex="-1" href="#">ตำบลป่าซาง</a></option>
                                        <option value="secondOption" role="presentation"><a role="menuitem" tabindex="-1" href="#">ตำบลต้า</a></option>
                                        <option value="secondOption" role="presentation"><a role="menuitem" tabindex="-1" href="#">ตำบลต้า</a></option>
                                        <option value="secondOption" role="presentation"><a role="menuitem" tabindex="-1" href="#">ตำบลต้า</a></option>
                                        v<option value="secondOption" role="presentation"><a role="menuitem" tabindex="-1" href="#">ตำบลต้า</a></option>
                                        <option value="secondOption" role="presentation"><a role="menuitem" tabindex="-1" href="#">ตำบลต้า</a></option>
                                        <option value="secondOption" role="presentation"><a role="menuitem" tabindex="-1" href="#">ตำบลต้า</a></option>
                                    </select>

                                        </div>
                                    </div>
                                    
                                    
                                    
                                    <div class="row form-group">

                                        <label class="col-md-offset-0 col-md-3 control-label"><font color="red">ประเภทโค</font></label>
                                        <div class="col-md-4">

                                    <select id="pagelist" class="form-control" style="width: 150px">
                                        <option value="" class="btn btn-default dropdown-toggle" type="button" id="pagelist1" data-toggle="dropdown">กรุณาเลือก</option>
                                        <option value="firstOption" role="presentation"><a role="menuitem" tabindex="-1" href="#">C-โคเนื้อ</a></option>
                                        <option value="firstOption" role="presentation"><a role="menuitem" tabindex="-1" href="#">D-โคนม</a></option>
                                      
                             
                                    </select>

                                        </div>
                                    </div>
                                    
                                    
                                    
                                     <div class="row form-group">

                                        <label class="col-md-offset-0 col-md-3 control-label"><font color="red">รหัสเฉพาะ</font></label>
                                        <div class="col-md-4">

                                    <select id="pagelist" class="form-control" style="width: 150px">
                                        <option value="" class="btn btn-default dropdown-toggle" type="button" id="pagelist1" data-toggle="dropdown">กรุณาเลือก</option>
                                        <option value="firstOption" role="presentation"><a role="menuitem" tabindex="-1" href="#">N-สัตว์ทั่วไป</a></option>
                                        <option value="firstOption" role="presentation"><a role="menuitem" tabindex="-1" href="#">B-ธนาคารโค-กระบือ</a></option>
                                        <option value="firstOption" role="presentation"><a role="menuitem" tabindex="-1" href="#">I-สัตว์นำเข้า</a></option>
                                      
                                    </select>

                                        </div>
                                    </div>
                               
									
						
			<div class="row form-groups">
				<center>
					<button class="btn btn-success btn-lg" value="add" name="action"
						onclick="save()">
						<span class="glyphicon glyphicon-save"></span> Save
					</button>
					
					<a href="Search" target="_blank">
					<label class="btn btn-danger btn-lg" ><i
						class="fa fa-times fa-lg"></i> Cancel</label> </a>
					
					<label class="btn btn-default btn-lg" onClick="window.location.reload()"><i
						class="glyphicon glyphicon-refresh"></i> Reset</label>

				</center>
			</div>
			
		</div>
		 <div class="col-md-6">
			<div >
				<a>
					<img id="imgfooter" width="100%" style="height: auto" align="right" src="<c:url value="/resources/img/00.png" /> "  height="600" >
				</a> 
			</div>
		</div>
		
    </div>								
 </div>                                      
</div>


	
	
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
</html>