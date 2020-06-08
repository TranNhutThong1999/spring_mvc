<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="include/Header.jsp"></jsp:include>
<link rel="stylesheet"
	href='<c:url value="/resources/css/ChiTietSp.css" />'>
<link rel="stylesheet"
	href='<c:url value="/resources/css/DanhMuc.css" />'>
	<link rel="stylesheet" href='<c:url value="/resources/css/Footer.css" />'>
<title>Chi tiết hóa đơn</title>
</head>
<body>
	<div class="container-fluid background">

		<jsp:include page="include/MenuMain.jsp"></jsp:include>
			<jsp:include page="include/Breadcrumb.jsp"></jsp:include>
			<div class="mes-box"></div>
		<div id="message-box" class="box alert alert-success" role="alert">
		    <h6 class="alert-heading">Cập nhật giỏ hàng!</h6>
 				 <p>Sản phẩm đã được thêm vào giỏ hàng</p>
		</div>
		<div class="CTSP">
			<div class="container">
				<div class="row">
					<div class="giua col-md-12">
						<div class="row">
							<div class="hinh col-md-4">
								<img id="image" class="hinhSanPham"
									data-hinhSanPham="${ChiTietSanPham.getHinhSanPham().get(0).getLocation()}"
									src='<c:url value="/resources/Images/${ChiTietSanPham.getHinhSanPham().get(0).getLocation()}" ></c:url>'
									alt="">
									<c:forEach var="img" items="${ChiTietSanPham.getHinhSanPham()}" >
										<img class="image-item" src='<c:url value="/resources/Images/${img.getLocation()}" ></c:url>'>
									</c:forEach>
							</div>
							<div class="conten col-md-8">

								<div class="tenhinh"
									data-idSanPham="${ChiTietSanPham.getIdSanPham()}">${ChiTietSanPham.getTenSanPham()}</div>
								<div class="giatien"><fmt:formatNumber value="${ChiTietSanPham.getGiaTien()}" type="currency" maxFractionDigits="0" /></div>
								<table class="table table-striped">
									<thead>
										<tr>
											<th>Màu sản phẩm</th>
											<th>Size</th>
											<th>Tình trạng</th>
											<th></th>
										</tr>
									</thead>
									<c:forEach var="Content"
										items="${ChiTietSanPham.getDanhSachCTSPham()}">
										<tbody>
											<tr>
												<td class="mau" data-idMau="${Content.getIdMauSanPham()}">${Content.getMauSanPham()}</td>
												<td class="size" data-idSize="${Content.getIdSize() }">${Content.getTenKichThuoc() }</td>
												<td data-idChiTiet="${Content.getIdChiTietSanPham() }"
													class="soLuong"><c:if test="${Content.getSoLuong()>0}">Còn hàng</c:if>
																	<c:if test="${Content.getSoLuong()==0}"><span>hết hàng</span> </c:if>
													 </td>
												<th><a name="" id=""
													class="btn btn-primary btn-gioHang" href="#" role="button">Thêm
												</a></th>
											</tr>
										</tbody>
									</c:forEach>
								</table>
								<hr>
								<div class="mota">${ChiTietSanPham.getMoTa()}
								Mo ta</div>
							</div>

						</div>
					</div>
				</div>
				
			</div>
		</div>
		
		<jsp:include page="include/Footer.jsp"></jsp:include>
<jsp:include page="include/Scrip.jsp"></jsp:include>
	</div>
	<script type="text/javascript">
	function FBlogout(){
			FB.logout(function(response) {
		  // user is now logged out
		});
	}
	</script>
	<script type="text/javascript">
		$(document).ready(
				function() {
					$(".btn-gioHang").click(
							function() {
								messageBox()
								var tenSize = $(this).parent().parent().find(
										".size").text();
								var idSize = $(this).parent().parent().find(
										".size").attr("data-idSize");
								var tenMau = $(this).closest("tr").find(".mau")
										.text();
								var idMau = $(this).closest("tr").find(".mau")
										.attr("data-idMau")
								var idChiTiet = $(this).parent().parent().find(
										".soLuong").attr("data-idChiTiet");
								var idSanPham = $(".tenhinh").attr(
										"data-idSanPham");
								var tenSanPham = $(".tenhinh").text();
								var giaTien = $(".giatien").text();
								var formatMoney=giaTien.replace(/[$,]+/g,"");
								var hinhSanPham = $(".hinhSanPham").attr(
										"data-hinhSanPham");

								var browserData = {
									idSanPham : idSanPham,
									idChiTietSanPham : idChiTiet,
									tenSanPham : tenSanPham,
									giaTien : formatMoney,
									idMauSanPham : idMau,
									idSizeSanPham : idSize,
									tenMauSanPham : tenMau,
									tenSizeSanPham : tenSize,
									hinhSanPham : hinhSanPham,
								};
								$.ajax({
									url : "/Minishope/Api/ThemGioHang/",
									type : "Post",
									contentType : "Application/json",
									data : JSON.stringify(browserData),
									success : function(value) {
										console.log(value)
										$("#so-gioHang").text(value);
										$("#active-vohang").text(value);

									},
									error : function(value) {
										alert(value + "orrrrrr")
									}
								});
							});
					$("body").on("click",".image-item",function(){
						let url =$(this).attr("src");
						$("#image").attr("src",url)
					});
					
					function messageBox(){
						let dataClone = $("#message-box").clone().removeAttr("id");
						//$(".mes-box").append(dataClone)
						dataClone.prependTo(".mes-box")
						setTimeout(function(){
							$(".box").get(0).remove();
						},4000)
					}
				})
	</script>
</body>
</html>