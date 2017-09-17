<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./includes.jsp"%>
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
					<li class="active"><a class="nav-link current" href="record">บันทึกข้อมูลโค </a></li>
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