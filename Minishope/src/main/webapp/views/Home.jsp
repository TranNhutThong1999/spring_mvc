<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file ="include/Taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="include/Header.jsp"></jsp:include>
<link rel="stylesheet" href='<c:url value="/resources/css/Home.css" />'>
<link rel="stylesheet" href='<c:url value="/resources/css/OneSanPham.css" />'>
<link rel="stylesheet" href='<c:url value="/resources/css/Footer.css" />'>
<title>Home</title>
</head>
<body>
<jsp:include page="include/MenuMain.jsp"></jsp:include>
	<div class="container-fluid">
		<div class="row  block_1">
			<img id="poster" alt="" src='<c:url value="/resources/Images/operation/poster.jpg" />'>
		<!-- 	<div class="content wow wobble"data-wow-duration:"2s">
				<span>Ngày 17/2 - 25/2/2017</span>
				<h1>MUA 1 TẶNG 1</h1>
				<button id="khuyenMai">Xem ngay</button>
			</div> -->
		</div>
		<div class="row block_2 ">
			<div class="container">
				<div class="row">
					<div class=" col-md-4 wow slideInLeft" data-wow-duration="1s">
						<div class="icon">
							<i class="fa fa-bandcamp" aria-hidden="true"></i>
						</div>
						<div class="h1">CHẤTLƯỢNG ${token}</div>
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
		</div> <!-- end row -->
		<div class="row row-3">
			<div class="col-md-12 ">
				<div class="row title text-center text-control d-block">
					<div class="row-3-content">
						<h4>Top sản phẩm HOT</h4>
						<h6>Những sản phẩm thời trang mới nhất</h6>
					</div>	
				</div>	
			</div>
		
			<div class="col-md-12  ">
				<div class="row row-3-body oneSanpHam">
						<jsp:include page="include/OneSanPham.jsp"></jsp:include>
				</div>
			</div>
		</div>
		<!-- xong row -->
	</div>
	<jsp:include page="include/Footer.jsp"></jsp:include>
		<jsp:include page="include/Scrip.jsp"></jsp:include>
<script src="<c:url value="/resources/js/Home.js" />"></script>
	<script type="text/javascript">
	function FBlogout(){
			FB.logout(function(response) {
		  // user is now logged out
		});
	}
	</script>
	
	
</body>
</html>