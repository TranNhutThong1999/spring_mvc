<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Pooled Admin Panel Category Flat Bootstrap Responsive Web
	Template | Home :: w3layouts</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Pooled Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript">
	
	
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 


	
</script>
<link rel="stylesheet"
	href='<c:url value="/resources/sweetalert/sweetalert2.min.css" />'>
 <link rel="stylesheet" href='<c:url value="/resources/admin/css/Admin_User.css" />'>
<!-- Bootstrap Core CSS -->
<link rel="stylesheet"
	href='<c:url value="/resources/bootstrap4.0/css/bootstrap.min.css" />'>
<!-- Custom CSS -->
<link rel="stylesheet"
	href='<c:url value="/resources/admin/css/style.css" />'>
<link rel="stylesheet"
	href='<c:url value="/resources/admin/css/morris.css" />'>
<!-- Graph CSS -->
<link rel="stylesheet"
	href='<c:url value="/resources/fontawesome/css/fontawesome.min.css" />'>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- jQuery -->
<script
	src='<c:url value="/resources/jquery_321/jquery-3.2.1.min.js" />'
	type="text/javascript"></script>
<!-- //jQuery -->
<link
	href='//fonts.googleapis.com/css?family=Roboto:700,500,300,100italic,100,400'
	rel='stylesheet' type='text/css' />
<link href='//fonts.googleapis.com/css?family=Montserrat:400,700'
	rel='stylesheet' type='text/css'>
<!-- lined-icons -->
<link rel="stylesheet"
	href='<c:url value="/resources/admin/css/icon-font.min.css" />'>
<!-- //lined-icons -->
</head>
<body>
<div class="main-User" data-soLuongSP="${soLuongSP}">
	<div class="ProccessUser">
		<div class="tile"> Manager User</div>
		<div class="require"> Các trường có dấu (*) không được để trống</div>
		<form id="form-User">
			 <div class="form-group">
			    <label for="tenDangNhap">Tên đăng nhập(*)</label>
			    <input type="text" name="tenDangNhap" class="form-control"  placeholder="">
			  </div>
			  <label id="labeltenDangNhap" class="la" ></label>
			  <div class="form-group">
			    <label for="matKhau">Mật khẩu(*)</label>
			    <input type="password" name="matKhau" class="form-control"  placeholder="">
			  </div>
			   <label id="labelmatKhau" class="la" ></label>
			   
			  <div class="form-group">
			    <label for="email">Email(*)</label>
			    <input type="text" name="email" class="form-control"  placeholder="">
			  </div>
			   <label id="labelemail" class="la" ></label>
			   
			   <div class="form-group">
							  <label for="exampleFormControlSelect1">Role(*)</label>
							    <select  name ="idChucVu"class="custom-select">
							    <c:forEach var="role" items="${roles}">
							      <option value="${role.getIdChucVu()}">${role.getTenChucVu()}</option>
							        </c:forEach>
							    </select>
			  </div>
			  <button id="submitUser" class="btn btn-primary mt-2" type="button"> Đăng ký</button>
			   <button id="thoat"class="btn btn-warning mt-2" type="button"> Thoát</button>
		</form>
	
	</div>
	<div class="content action" style="margin: 0px auto; width: 90%">
			<h2>Contextual Classes</h2>
			<p>Contextual classes can be used to color table rows or table
				cells. The classes that can be used are: .active, .success, .info,
				.warning, and .danger.</p>
				<!-- Search form -->
				<c:if test="${message != null}">
					<div class="alert alert-${alert}" style="text-align:center; color:#2a950f" role="alert">
			 			 <h3>${message}</h3>
					</div>
				</c:if>
			 <form id="form-search" class="form-inline my-2 my-lg-0" method="get" action='<c:url value="/Admin-User/Search/" />'>
			      <input id="keyWords" name="keyWords" class="form-control mr-sm-2" data-Search="${keyWords}" type="search" placeholder="${keyWords }"
			       aria-label="Search">
			      <button id="nut-search" class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			   </form>
				<button id="delete" class="btn btn-danger float-right ml-1"> Delete </button>
				<button id="btn-themSP"class="btn btn-primary float-right" >Add</button>
			<table class="table">
				<thead >
					<tr>
						<th><div class="custom-control custom-checkbox mb-3">
								    <input type="checkbox" class="custom-control-input" value="${user.getIdNhanVien()}" id="checkAll" >
								    <label class="custom-control-label" for="checkAll">Check ALL</label>
								  </div>	
							</th>
						<th class="sort-title" data-sort="" sortBy="idNhanVien">Mã Nhân viên</th>
						<th class="sort-title" data-sort="" sortBy="tenDangNhap">Tên Dăng Nhập</a></th>
						<th class="sort-title" data-sort="" sortBy="idChucVu">Chức Vụ</th>
						<th class="sort-title" data-sort="" sortBy="email">Gmail</th>
						<th ></th>
					</tr>
				</thead>
				<div class="max">
					<tbody id="content-listSP">
					<c:forEach var="user" items="${ListUser}">
						<tr>
							<td>
								<div class="custom-control custom-checkbox mb-3">
								    <input type="checkbox" class="custom-control-input" value="${user.getIdNhanVien()}" id="id${user.getIdNhanVien()}" required>
								    <label class="custom-control-label" for="id${user.getIdNhanVien()}"></label>
								  </div>	
									
								</td>
							<td id="id">${user.getIdNhanVien()}</td>
							<td id="tenDN">${user.getTenDangNhap()}</td>
							<td id="role">${user.getChucVu().getTenChucVu()}</td>
							<td>${user.getEmail()}</td>
							<td>
								<c:if test="${user.isEnabled()==true}">
									<button class="btn btn-warning ban" data-enabled="true"> Ban</button></c:if>
								<c:if test="${user.isEnabled()==false}">
									<button class="btn btn-warning ban" data-enabled="false"> unBan</button></c:if>
							</td>
							
						</tr>
						</c:forEach>
					</tbody>
				</div>
			</table>
			<div class="row phan-trang">
					<nav aria-label="Page navigation example">
						<ul class="pagination">
							<li class="page-item"><a class="page-link" href="#">Previous</a></li>
							<li id="paging" class="page-item active"><a class="page-link" href="#">1</a></li>
							<c:forEach var="i" begin="2" end="${numberPagination}">
								<li id="paging" class="page-item "><a class="page-link" href="#">${i}</a></li>
							</c:forEach>
							<li class="page-item"><a class="page-link" href="#">Next</a></li>
						</ul>
					</nav>
				</div>
		</div>
	</div>
	<script src='<c:url value="/resources/sweetalert/sweetalert2.min.js" />'
		type="text/javascript"></script>
	<script src='<c:url value="/resources/js/AdminManagerUser.js" />'  type="text/javascript" ></script>

	<!-- end -->
	<div class="sidebar-menu">
		<header class="logo1">
			<a href="#" class="sidebar-icon"> <span class="fa fa-bars"></span>
			</a>
		</header>
		<div style="border-top: 1px ridge rgba(255, 255, 255, 0.15)"></div>
		<div class="menu">
			<ul id="menu">
				<li><a href='<c:url value="/Admin-SanPham/" />'><i class="fa fa-tachometer"></i> <span>Product</span>
						<div class="clearfix"></div></a></li>


				<li id="menu-academico"><a href="<c:url value="/Admin-User/" />"><i
						class="fa fa-envelope nav_icon"></i><span>User</span>
						<div class="clearfix"></div></a></li>
				<li><a href="gallery.html"><i class="fa fa-picture-o"
						aria-hidden="true"></i><span>Gallery</span>
						<div class="clearfix"></div></a></li>
		
				<li><a href='<c:url value="/Home/" />'><i class="fa fa-check-square-o nav_icon"></i><span>Home</span>
						<span class="fa fa-angle-right" style="float: right"></span>
						<div class="clearfix"></div></a>
					<ul>
						<li><a href="input.html"> Input</a></li>
						<li><a href="validation.html">Validation</a></li>
					</ul></li>
			</ul>
		</div>
	</div>
</div>
	</div>
	<script>
		var toggle = true;

		$(".sidebar-icon").click(
				function() {
					if (toggle) {
						$(".page-container").addClass("sidebar-collapsed")
								.removeClass("sidebar-collapsed-back");
						$("#menu span").css({
							"position" : "absolute"
						});
					} else {
						$(".page-container").removeClass("sidebar-collapsed")
								.addClass("sidebar-collapsed-back");
						setTimeout(function() {
							$("#menu span").css({
								"position" : "relative"
							});
						}, 400);
					}

					toggle = !toggle;
				});
	</script>
	<!--js -->
	<script
		src='<c:url value="/resources/admin/js/jquery.nicescroll.js" />'
		type="text/javascript"></script>
	<script src='<c:url value="/resources/admin/js/scripts.js" />'
		type="text/javascript"></script>
	<!-- Bootstrap Core JavaScript -->
	<script
		src='<c:url value="/resources/bootstrap4.0/js/bootstrap.min.js" />'
		type="text/javascript"></script>
	<!-- /Bootstrap Core JavaScript -->
	<!-- morris JavaScript -->
	<script src='<c:url value="/resources/admin/js/raphael-min.js" />'
		type="text/javascript"></script>
	<script src='<c:url value="/resources/admin/js/morris.js" />'
		type="text/javascript"></script>

	<script>
		$(document).ready(
				function() {
					//BOX BUTTON SHOW AND CLOSE
					jQuery('.small-graph-box').hover(function() {
						jQuery(this).find('.box-button').fadeIn('fast');
					}, function() {
						jQuery(this).find('.box-button').fadeOut('fast');
					});
					jQuery('.small-graph-box .box-close').click(function() {
						jQuery(this).closest('.small-graph-box').fadeOut(200);
						return false;
					});

					//CHARTS
					function gd(year, day, month) {
						return new Date(year, month - 1, day).getTime();
					}

					graphArea2 = Morris.Area({
						element : 'hero-area',
						padding : 10,
						behaveLikeLine : true,
						gridEnabled : false,
						gridLineColor : '#dddddd',
						axes : true,
						resize : true,
						smooth : true,
						pointSize : 0,
						lineWidth : 0,
						fillOpacity : 0.85,
						data : [ {
							period : '2014 Q1',
							iphone : 2668,
							ipad : null,
							itouch : 2649
						}, {
							period : '2014 Q2',
							iphone : 15780,
							ipad : 13799,
							itouch : 12051
						}, {
							period : '2014 Q3',
							iphone : 12920,
							ipad : 10975,
							itouch : 9910
						}, {
							period : '2014 Q4',
							iphone : 8770,
							ipad : 6600,
							itouch : 6695
						}, {
							period : '2015 Q1',
							iphone : 10820,
							ipad : 10924,
							itouch : 12300
						}, {
							period : '2015 Q2',
							iphone : 9680,
							ipad : 9010,
							itouch : 7891
						}, {
							period : '2015 Q3',
							iphone : 4830,
							ipad : 3805,
							itouch : 1598
						}, {
							period : '2015 Q4',
							iphone : 15083,
							ipad : 8977,
							itouch : 5185
						}, {
							period : '2016 Q1',
							iphone : 10697,
							ipad : 4470,
							itouch : 2038
						}, {
							period : '2016 Q2',
							iphone : 8442,
							ipad : 5723,
							itouch : 1801
						} ],
						lineColors : [ '#ff4a43', '#a2d200', '#22beef' ],
						xkey : 'period',
						redraw : true,
						ykeys : [ 'iphone', 'ipad', 'itouch' ],
						labels : [ 'All Visitors', 'Returning Visitors',
								'Unique Visitors' ],
						pointSize : 2,
						hideHover : 'auto',
						resize : true
					});

				});
	</script>
</body>

</html>