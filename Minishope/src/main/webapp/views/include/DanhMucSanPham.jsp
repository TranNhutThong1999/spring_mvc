<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="trai col-md-3">
	<h4>Danh mục sản phẩm</h4>
	<ul>
		<c:forEach var="danhMuc" items="${ListDanhMucSanPham}">
			<li class="item"><a href='<c:url value="/SanPham/DanhMuc/${danhMuc.getIdDanhMuc()}" />' >${danhMuc.getTenDanhMuc()}</a>
				<ul>
					<li>Ao khoác dày</li>
					<li>Ao khoác xịn</li>
					<li>Ao khoác vai</li>
				</ul></li>
		</c:forEach>
	</ul>
	 <div class="search-container">
    <form action="">
      <input type="text" placeholder="Search.." name="search">
      <button type="button" class="btn btn-primary">Search</button>
    </form>
  </div>
</div>
