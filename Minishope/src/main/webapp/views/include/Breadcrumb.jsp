<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file ="Taglib.jsp" %>
<nav aria-label="breadcrumb">
  <ol id="breadcrumb" class="breadcrumb">
    <li class="breadcrumb-item active"><a href='<c:url value="/Home/"/>'>Home</a></li>
    
    <c:choose>
    	<c:when test="${not empty sanpham }">
    		 <li class='breadcrumb-item  active ' aria-current="page">${sanpham}</li>
    	</c:when>
    	<c:when test="${not empty danhmuc }">
    		 <li class='breadcrumb-item  active '>${danhmuc}</li>
    	</c:when>
    	<c:when test="${not empty chitiet }">
    	 <li class='breadcrumb-item  active '> <a href='/Minishope/SanPham/DanhMuc/${ChiTietSanPham.getIdDanhMuc()}'>${ChiTietSanPham.getTenDanhMuc()} </a> </li>
    	 <li class='breadcrumb-item active' aria-current='page'>${ChiTietSanPham.getTenSanPham()}</li> 
    	</c:when>
    </c:choose>
   <%--   <li class='breadcrumb-item  active '><a href='/Minishope/SanPham/'>Library</a></li>
	 <li class='breadcrumb-item active' aria-current='page'><a href='/Minishope/SanPham/'>${ChiTietSanPham.getTenDanhMuc()}</a></li> --%>
  </ol>
</nav>