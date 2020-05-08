<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<nav id="menu" class="navbar navbar-expand-sm navbar-dark bg-primary ">
	<a class="navbar-brand" href='<c:url value="/Home/"></c:url>'><img
		src='<c:url value="/resources/Images/yame-logo.png"></c:url>' alt=""></a>
	<button class="navbar-toggler d-lg-none" type="button"
		data-toggle="collapse" data-target="#collapsibleNavId"
		aria-controls="collapsibleNavId" aria-expanded="false"
		aria-label="Toggle navigation"></button>
	<div class="collapse navbar-collapse" id="collapsibleNavId">
		<ul class="navbar-nav mr-auto mt-2 mt-lg-0 center">
			<li class="nav-item active"><a class="nav-link" href='<c:url value="/Admin-SanPham/"></c:url>'>HÀNG
					THIẾT KẾ <span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item"><a class="nav-link" href='<c:url value="/SanPham/" />'>SẢN PHẨM</a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="dropdownId"
				 aria-haspopup="true" aria-expanded="false">DANH MỤC</a>
				
				<div class="tooltip-z ">
					<c:forEach var="danhMuc" items="${ListDanhMucSanPham}">
					<a class="dropdown-item" href='<c:url value="/SanPham/DanhMuc/${danhMuc.getIdDanhMuc()}" />'>${danhMuc.getTenDanhMuc()}</a> 
					</c:forEach>
				</div>
				</li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="dropdownId"
				data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">KHUYẾN
					MÃI</a>
				<div class="dropdown-menu" aria-labelledby="dropdownId">
					<a class="dropdown-item" href="#">Khuyến mãi 1</a> <a
						class="dropdown-item" href="#">Khuyên mãi 2</a>
				</div></li>
			 <form class="form-inline my-2 my-lg-0" method="get" action='<c:url value="/Search/SanPham" />'>
			      <input name="keyWords" class="form-control mr-sm-2" type="search" placeholder="<c:if test="${keyWords==null}">Tìm kiếm sản phẩm</c:if> <c:if test="${keyWords!=null}">${keyWords}</c:if>
			      " aria-label="Search">
			      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			   </form>
		</ul>
		<ul class="nav justify-content-center right">
			<security:authorize access="isAnonymous()">
			<li class="nav-item">
					<a class="nav-link active"
						href='<c:url value="/login"></c:url>'> Đăng Nhập </a>
			</li>
			</security:authorize>
			
			<security:authorize access="isAuthenticated()">
			<li class="nav-item">
					<a class="nav-link active"
						href=''> <security:authentication property="principal.username"/> </a>	
					<a class="nav-link active logout"
						href='<c:url value="/logout"></c:url>'> thoat </a>
			</li>
			</security:authorize>
			
			<li class="nav-item"><a class="nav-link"
				href='<c:url value="/views/GioHang.jsp"></c:url>'> <i
					class="fa fa-car"></i>
					<c:if test="${gioHang==null}">
					<div id="so-gioHang" class="icon active-gioHang ">0
					</div>
                    </c:if>
						<c:if test="${gioHang!=null}">
						<div id="active-vohang" class="icon active-gioHang ">   ${tongSoLuongGioHang}
					</div>
                 
                    </c:if>
				
			</a></li>

		</ul>
	</div>

</nav>

<!-- xong menu -->
