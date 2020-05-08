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
	href='<c:url value="/resources/css/GioHang.css" />'>
<title>Giỏ Hàng</title>
</head>
<body>

	<div class="container-fluid giohang background">
		<jsp:include page="include/MenuMain.jsp"></jsp:include>
		<div class="container gioHang">
		<form method="post" action='<c:url value="/HoaDon/ThemHoaDon/"></c:url>'>
			<div class="row">
			
				<div class="left col-md-6">
					<div class="title">
						<h2>Thông tin người mua/người nhận</h2>
					</div>
				
						<div class="form-group">
							<label for="exampleInputEmail1">Tên</label> <input type="text" name="tenKhachHang"
								class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" placeholder="Tên người nhận">
						</div>
						<div class="form-group">
							<label  for="exampleInputPassword1">Số điện thoại liên lạc</label>
							<input id="soDT" type="phone" class="form-control" name="soDT" require pattern="^0+[0-9]{8}"
								id="exampleInputPassword1" placeholder="Số điện thoại">
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="hinhThucGiaoHang"
								id="exampleRadios1" value="Nhận hàng
								tại nhà/công ty/bưu điện" checked> <label
								class="form-check-label" for="exampleRadios1"> Nhận hàng
								tại nhà/công ty/bưu điện </label>
								</div>
						<div class="form-check">		
								<input class="form-check-input" type="radio" name="hinhThucGiaoHang"
								id="exampleRadios2" value="Nhận hàng tại cửa hàng Yame gần nhất"> <label
								class="form-check-label" for="exampleRadios2"> Nhận hàng
								tại cửa hàng Yame gần nhất </label>
						</div>
					
						<div class="form-group">
							<input type="text" class="form-control" id="address" name="diaChiGiaoHang"
								aria-describedby="emailHelp" placeholder="Đia chỉ nhận hàng">
						</div>
						<div class="form-group">
							<label for="note">Ghi chú</label> <input type="text" name="ghiChu"
								class="form-control" id="note" aria-describedby="emailHelp"
								placeholder="">
						</div>
					
				</div>
				<div class="right col-md-6">
					<div class="tilte">Chi tiết sản phẩm trong gio hàng</div>
					<div class="chitiet">
					<c:forEach var="giohang" items="${gioHang}">
						<div class="row">
							<div class="col-md-2">
								<img src='<c:url value="/resources/Images/${giohang.getHinhSanPham() }"></c:url>'
									alt="">
							</div>
							<div class="col-md-4">
								<div data-idSanPham="${giohang.getIdSanPham()}" class="tensp">${giohang.getTenSanPham()}</div>
								<div data-idSize="${giohang.getIdSizeSanPham()}" data-idMauSP="${giohang.getIdMauSanPham()}" class="infor">${giohang.getTenMauSanPham()}, ${giohang.getTenSizeSanPham() }</div>
							</div>
							<div class="col-md-6 onelock">
								<div class="giatiensp"><fmt:formatNumber value="${giohang.getGiaTien()}" type="currency" maxFractionDigits="0" /></div>
								<div class="soluong">
									<input class="soLuongMua" type="number" min="1" value="${giohang.getSoLuong()}"  >
									<button class="updateSoLuong" type="button" class="btn btn-outline-primary">Update</button>
									<button class="deleteSanPham"type="button" class="btn btn-outline-primary">Delete</button>
								</div>
								<div id="sumOneMoney" class="giaTien"> <fmt:formatNumber value="${giohang.getGiaTien()*giohang.getSoLuong()}" type="currency" maxFractionDigits="0" /></div>
							</div>
						</div>
						</c:forEach>
					</div>
					<div class="tongTien">tổng cộng: <span id="sumMoney"><fmt:formatNumber value="${SumMoney}" type="currency" maxFractionDigits="0" /></span></div>
					<hr>
					<button type="submit" class="btn btn-primary btn-lg">Đặt hàng</button>
				</div>
			
			</div>
				</form>
		</div>
	</div>
	<jsp:include page="include/Footer.jsp"></jsp:include>
	<script type="text/javascript">
		$(document).ready(function(){
			$(".updateSoLuong").click(function(){
				var tien= $(this).parent().parent().find(".giatiensp").text();
				var formatMoney=tien.replace(/[$,]+/g,"");
				var sl= $(this).parent().parent().find(".soLuongMua").val();
				var tong1sanpham = parseInt(sl,10) * parseInt(formatMoney,10) +"";
				var f = "$"+tong1sanpham.split( /(?=(?:\d{3})+(?:\.|$))/g ).join( "," );
				 $(this).parent().parent().find(".giaTien").text(f);
				var soLuongSessionOld=$("#active-vohang").text();
				var idSanPham= $(this).parent().parent().parent().find(".tensp").attr("data-idSanPham");
				var idSizeSP= $(this).parent().parent().parent().find(".infor").attr("data-idSize");
				var idMauSP= $(this).parent().parent().parent().find(".infor").attr("data-idMauSP");
	/* 			alert(sl+" "+idSanPham+" "+ idSizeSP+" "+idMauSP) */
				var dataPut={
						soLuong:sl,
						 idSanPham:idSanPham,
						 idSizeSanPham:idSizeSP,
						 idMauSanPham:idMauSP,
				};
				 $.ajax({
					 url:"/Minishope/Api/CapNhatGioHang/",
					 type:"put",
					 contentType:"Application/json",
					 data: JSON.stringify(dataPut),
					 success:function(value){
						
						 var object = value.split(" ",2);
						 $("#active-vohang").text(object[0]);
						 f = "$"+object[1].split( /(?=(?:\d{3})+(?:\.|$))/g ).join( "," );
						 $("#sumMoney").text(f); 
					 },
					 error:function(value){
						 alert("eror")
					 }
				 }); 
				
			});
			$(".deleteSanPham").click(function(){
				var tien= $(this).parent().parent().find(".giatiensp").text();
				var sl= $(this).parent().parent().find(".soLuongMua").val();
			//	var tong1sanpham = parseInt(sl,10) * parseInt(tien,10);
				// $(this).parent().parent().find(".giaTien").text(tong1sanpham);
				var soLuongSessionOld=$("#active-vohang").text();
				var idSanPham= $(this).parent().parent().parent().find(".tensp").attr("data-idSanPham");
				var idSizeSP= $(this).parent().parent().parent().find(".infor").attr("data-idSize");
				var idMauSP= $(this).parent().parent().parent().find(".infor").attr("data-idMauSP");
				
				 $(this).parent().parent().parent().text("");
				 var dataDelete={
						 idSanPham:idSanPham,
						 idSizeSanPham:idSizeSP,
						 idMauSanPham:idMauSP,
				 };
				$.ajax({
					url:"/Minishope/Api/XoaSanPham/",
					 contentType:"Application/json",
					type:"delete",
					data:JSON.stringify(dataDelete),
					success:function(value){
						var object = value.split(" ",2);
						 $("#active-vohang").text(object[0]);
						 f = "$"+object[1].split( /(?=(?:\d{3})+(?:\.|$))/g ).join( "," );
						 $("#sumMoney").text(f);
					}
				})
			});
			
		})
		</script>
</body>
</html>