
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="include/Header.jsp"></jsp:include>
<link rel="stylesheet" href='<c:url value="/resources/css/Home.css" />'>
<title>Home</title>
</head>
<body>


	<div class="container-fluid">
		<jsp:include page="include/MenuMain.jsp"></jsp:include>
		<c:if test="${messenger_Search_Error!=null}">
			<div class="mes">${messenger_Search_Error}</div>
		</c:if>
		<div class="row block-small block_1">
			<div class="content wow wobble"data-wow-duration:"2s">
				<span>Ngày 17/2 - 25/2/2017</span>
				<h1>MUA 1 TẶNG 1</h1>
				<button id="khuyenMai">Xem ngay</button>
			</div>
		</div>
		<div class="row block_2 ">
			<div class="container">
				<div class="row">
					<div class=" col-md-4 wow slideInLeft" data-wow-duration="1s">
						<div class="icon">
							<i class="fa fa-bandcamp" aria-hidden="true"></i>
						</div>
						<div class="h1">CHẤTLƯỢNG</div>
						<p>Chúng tôi cam kết sẻ đem đến cho các bạn chất lượng sản
							phẩm tốt nhất</p>
					</div>
					<div class="col-md-4 wow slideInDown" data-wow-duration="1s"
						data-wow-delay="1s">
						<div class="icon">
							<i class="fa fa-bandcamp" aria-hidden="true"></i>
						</div>
						<div class="h1">TIẾT KIỆM CHI PHÍ</div>
						<p>Cam kết giá rẻ nhất Việt Nam giúp các bạn tiết kiệm hơn 20%
							cho từng sản phẩm</p>
					</div>
					<div class="col-md-4 wow slideInRight" data-wow-duration="1s"
						data-wow-duration="2s">
						<div class="icon">
							<i class="fa fa-bandcamp" aria-hidden="true"></i>
						</div>
						<div class="h1">GIAO HÀNG</div>
						<p>Cam kết giao hàng tận nơi trong ngày. Để mang sản phẩm đến
							cho khách hàng nhanh nhất</p>
					</div>
				</div>
			</div>
		</div>
		<div class="container block_3">
			<div class="row tieude">
				<h1>SẢN PHẨM HOT</h1>
			</div>
			<div class="row">
				<c:forEach var="sanPham" items="${danhSachSanPham}" end="8">
					<div class="col-md-4 wow flipInY" data-wow-duration="1s">
						<a href="<c:url value="/ChiTiet/${sanPham.getIdSanPham()}" />">
							<div class="card" style="width: 18rem;">
								<img class="card-img-top"
									src='<c:url value="/resources/Images/${sanPham.getHinhSanPham()}" />'
									alt="Card image cap">
								<div class="card-body">
									<h5 class="card-title">${sanPham.getTenSanPham()}</h5>
									<p class="card-text"> <fmt:formatNumber value="${sanPham.getGiaTien()}" type="currency" maxFractionDigits="0" /> </p>
								</div>
							</div>
						</a>
					</div>

				</c:forEach>
			</div>
		</div>
		<!-- xong row -->

		<div class="row block_4">
			<div class="col-md-4">
				<h2>THÔNG TIN SHOP</h2>
				<span>Yame là trung tâm uy tính hàng đầu Việt Nam</span>
			</div>

			<div class="col-md-4">
				<h2>THÔNG TIN SHOP</h2>
				<span>Yame là trung tâm uy tính hàng đầu Việt Nam</span>
			</div>

			<div class="col-md-4">
				<h2>GÓP Ý</h2>
				<form action="">
					<input type="text" name="" placeholder="Email">
					<textarea rows="2" cols="23" placeholder="Nội dung"></textarea>
					<div class="btn btn-primary">Submit</div>
				</form>
			</div>

		</div>
	</div>

	<jsp:include page="include/Footer.jsp"></jsp:include>
<script src="<c:url value="/resources/js/Home.js" />"></script>
	<script type="text/javascript">
	
	</script>
	
	<script>
		new WOW().init();
	</script>
</body>
</html>