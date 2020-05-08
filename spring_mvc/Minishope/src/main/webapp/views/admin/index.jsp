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
	
 <link rel="stylesheet" href='<c:url value="/resources/admin/css/Admin_Product.css" />'>
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

	<div class="main-admin float-right" >
		
	<div class="themSanPham hide">
	<h2>THÊM SẢN PHẨM</h2>
	<form id="form-themSP">
		<div class="required"> Các trường có đấu  <b>*</b>  không được bỏ trống</div>
		<div id="tenSP" class="form-group">
			<label for="tenSanPham" class="col-form-label"> Tên Sản phẩm <span>*</span></label>
			<input  id="content-tenSanPham" class="form-control" data-idSP="0" type="text" name ="tenSanPham">
		</div>
		<div id="giaTien">
			<label for="giaTien" > Giá Tiền(VND) <span>*</span></label>
			<input id="content-giaTien"  class="form-control" type="text" name ="giaTien" >
		</div>
		<div id="danhMuc">
		  <label for="exampleFormControlSelect1">Danh Muc <span>*</span></label>
			    <select id="content-idDanhMuc" name ="idDanhMuc"class="custom-select" id="select">
			    <c:forEach var="danhMuc" items="${ListDanhMucSanPham}">
			      <option value="${danhMuc.getIdDanhMuc()}">${danhMuc.getTenDanhMuc() }</option>
			      </c:forEach>
			    </select>
		</div>
		<div id="danhCho">
			<label for="danhCho" >Giới Tính</label>
			
	     	 <div class="custom-control custom-radio mr-sm-2">
			    <input type="radio" class="custom-control-input" id="customControlValidation2" name ="danhCho" value="Nam"  checked>
			    <label class="custom-control-label" for="customControlValidation2">Nam</label>
			  </div>
	     	 
	     	  <div class="custom-control custom-radio mr-sm-2">
		        <input type="radio" class="custom-control-input" name ="danhCho" value="Nu" id="customControlAutosizing">
		        <label class="custom-control-label" for="customControlAutosizing">Nữ</label>
      		</div>
		</div>
		<div id="hinhSanPham" class="mt-2">
			<label for="hinhSanPham" >Hình Sản Phẩm</label>
			<div class="custom-file" >
			    <input type="file" class="custom-file-input" id="fileName" name ="hinhSanPham">
			    <label class="custom-file-label" for="fileName">Choose file...</label>
			    <div class="invalid-feedback">Example invalid custom file feedback</div>
			 </div>
		</div>
		<div id="moTa">
			<label for="moTa" > Mô tả</label>
			<textarea name="moTa" class="form-control" id="editor" rows="10" cols="62"></textarea>
		</div>
	</form>	
	<h4 class="title-ctsp">Chi Tiết Sản Phẩm</h4>
		<div id="chiTietSanPham">
			<div  class="CTSP-content">
				<div class="boder">
					<div  class="remove-ctsp"><i class="fa fa-trash-o" aria-hidden="true"></i></div>
						<div id="MauSanPham">
							  <label for="exampleFormControlSelect1">Màu Sản Phẩm</label>
							    <select  name ="mauSanPham"class="form-control">
							    <c:forEach var="item" items="${mauSanPham}">
							      <option value="${item.getIdMauSanPham()}">${item.getMauSanPham() }</option>
							      </c:forEach>
							    </select>
						</div>	
						<div id="SizeSanPham">
							  <label for="exampleFormControlSelect1"> Size</label>
							    <select  name ="sizeSanPham"class="form-control">
							    <c:forEach var="item" items="${sizeSanPham}">
							      <option value="${item.getIdSize()}">${item.getTenKichThuoc()}</option>
							      </c:forEach>
							    </select>
						</div>
						<div id="SoLuong">
							<label for="soLuongSP" > Số Lượng</label>
							<input type="number" class="form-control" value="1" min="1" name ="soLuongSP">
						</div>
						
					</div>
			</div>
		
		</div>
	<button class="btn btn-warning addCTSP" > Thêm Chi Tiết Sản Phẩm </button>
	<button id="btn-themSanPham"  class="btn btn-primary nut" > Thêm Sản Phẩm </button>
	<button id="btn-SuaSanPham" class="btn btn-primary nut" > Cập Nhật Sản Phẩm </button>
	<button id="btn-thoat" class="btn btn-success nut" > Thoát </button>
	<div id="clone" class="CTSP-content">
		<div class="boder">
					<div class="remove-ctsp"><i class="fa fa-trash-o" aria-hidden="true"></i></div>
					<div id="MauSanPham" >
						  <label for="exampleFormControlSelect1">Màu Sản Phẩm</label>
						    <select id="content-MauSanPham" class="form-control"  name ="mauSanPham"class="form-control">
						    <c:forEach var="item" items="${mauSanPham}">
						      <option value="${item.getIdMauSanPham()}">${item.getMauSanPham() }</option>
						      </c:forEach>
						    </select>
					</div>	
					<div id="SizeSanPham">
						  <label for="exampleFormControlSelect1"> Size</label>
						    <select id="content-Size"class="form-control"  name ="sizeSanPham"class="form-control">
						    <c:forEach var="item" items="${sizeSanPham}">
						      <option value="${item.getIdSize()}">${item.getTenKichThuoc()}</option>
						      </c:forEach>
						    </select>
					</div>
					<div id="SoLuong">
						<label for="soLuongSP" > Số Lượng</label>
						<input id="content-soLuongSP" class="form-control"  type="number" value="1" min="1" name ="soLuongSP">
					</div>
				
				</div>
				
		</div>
		
</div>

		<div class="content " style="margin: 0px auto; width: 70%">
			<h2>Manger Product</h2>
			<p>Contextual classes can be used to color table rows or table
				cells. The classes that can be used are: .active, .success, .info,
				.warning, and .danger.</p>
				<!-- Search form -->
				<c:if test="${message != null}">
			<div class="alert alert-${alert}" style="text-align:center; color:#2a950f" role="alert">
	 			 <h3>${message}</h3>
			</div>
		</c:if>
			 <form id="form-search" class="form-inline my-2 my-lg-0" method="get" action='<c:url value="/Admin-SanPham/Search/" />'>
			      <input id="keyWords" name="keyWords" class="form-control mr-sm-2" type="search" placeholder="${keyWords }"
			       aria-label="Search">
			      <button id="nut-search" class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			   </form>
				<button id="delete" class="btn btn-danger ml-1"  style="float:right"> Delete </button>
				<button id="btn-themSP" type="button" class="btn btn-primary btn-rounded float-right">add</button>
			<table class="table">
				<thead id="title-paging" idDanhMuc="${idDanhMuc}">
					<tr>
						<th>
							<div class="custom-control custom-checkbox mb-3">
								    <input type="checkbox" class="custom-control-input" value="${sanPham.getIdSanPham()}" id="checkAll" >
								    <label class="custom-control-label" for="checkAll">Check ALL</label>
								  </div>	
							</th>
						<th class="sort-title" data-sort="" sortBy="idSanPham">Mã sản phẩm</th>
						<th class="sort-title" data-sort="" sortBy="tenSanPham">Tên sản phẩm</a></th>
						<th class="sort-title" data-sort="" sortBy="giaTien">Giá tiền</th>
						<th id="loai">Danh Mục</th>
						<th></th>
						
					</tr>
				</thead>
				<div class="max">
					<tbody id="content-listSP">
					<c:forEach var="sanPham" items="${listSanPham}">
						<tr>
							<td>
								<div class="custom-control custom-checkbox mb-3">
								    <input type="checkbox" class="custom-control-input" value="${sanPham.getIdSanPham()}" id="id${sanPham.getIdSanPham()}" required>
								    <label class="custom-control-label" for="id${sanPham.getIdSanPham()}"></label>
								  </div>	
							</td>
							
							<td>${sanPham.getIdSanPham()}</td>
							<td>${sanPham.getTenSanPham()}</td>
							<td>${sanPham.getGiaTien()}</td>
							<td id="DanhMuc" data-idDanhMuc="${sanPham.getIdDanhMuc()}">${sanPham.getTenDanhMuc()}</td>
							<td> <button class="btn btn-warning edit">edit</button></td>
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
	<div id="ck" class="d-none"></div>
	<script src='<c:url value="/resources/sweetalert/sweetalert2.min.js" />'
		type="text/javascript"></script>
	<script src='<c:url value="/resources/js/AdminManagerProduct.js" />'  type="text/javascript" ></script>

	<!-- end -->
	<div class="sidebar-menu">
		<header class="logo1">
			<a href="#" class="sidebar-icon"> <span class="fa fa-bars"></span>
			</a>
		</header>
		<div style="border-top: 1px ridge rgba(255, 255, 255, 0.15)"></div>
		<div class="menu">
			<ul id="menu">
				<li><a href="<c:url value="/Admin-SanPham/"/>"><i class="fa fa-tachometer"></i> <span>Product</span>
						<div class="clearfix"></div></a></li>


				<li id="menu-academico"><a href='<c:url value="/Admin-User/"/>'><i
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
	<div class="clearfix"></div>
	</div>
	  <script src='<c:url value="/resources/tinymce/jquery.tinymce.min.js" />' ></script>  
	  <script src='<c:url value="/resources/tinymce/tinymce.min.js" />' ></script>  
	<!-- <script src="https://ckeditor.com/apps/ckfinder/3.5.0/ckfinder.js"></script>   -->
	<script>
	$(document).ready(function(){
		
	
	 tinymce.init({
	        selector: 'textarea',
	        height: 300,
	      //  theme: 'modern',
	        plugins: [
	            'advlist autolink lists link image charmap print preview hr anchor pagebreak',
	            'searchreplace wordcount visualblocks visualchars code fullscreen',
	            'insertdatetime media nonbreaking save table contextmenu directionality',
	            'emoticons template paste textcolor colorpicker textpattern imagetools codesample toc'
	        ],
	        toolbar1: 'undo redo |  styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image',
	        toolbar2: 'print preview media | forecolor backcolor emoticons | codesample | imageupload',
	        image_advtab: true,
	        setup: function(editor) {
	             uploadImageToServer(editor);
	      },
	        content_css: [
	            '//fonts.googleapis.com/css?family=Lato:300,300i,400,400i',
	            '//www.tinymce.com/css/codepen.min.css'
	        ],
	 })
	      function uploadImageToServer(editor){
	            // create input and insert in the DOM
	            var inp = $('<input id="tinymce-uploader" type="file" name="pic" accept="image/*" style="display:none">');
	            $(editor.getElement()).parent().append(inp);
	            // add the image upload button to the editor toolbar
	            editor.ui.registry.addButton('imageupload', {
	              text: 'Local',
	              icon: 'image',
	              onAction: function(e) { // when toolbar button is clicked, open file select modal
	                inp.trigger('click');
	              }
	            });
	            // when a file is selected, upload it to the server
	            inp.on("change", function(e){
	            uploadFile(this, editor);
	            });
	        }//end uploadImagetoServer
	    // 
	        function uploadFile(inp, editor) {
	              var file_data = $(inp).prop('files')[0];   
	               var data = new FormData();                  
	               data.append('file', file_data);
	                
	                $.ajax({
	                  url: '/Minishope/Api/upLoadFile',
	                  type: 'POST',
	                  data: data,
	                  processData: false, // Don't process the files
	                  contentType: false, // Set content type to false as jQuery will tell the server its a query string request
	                  success: function(data, textStatus, jqXHR) {
	                  data = JSON.parse(data);
	                  console.log(data)
	                    editor.insertContent('<img class="content-img" src="' + data.url + '"/>');
	                  },
	                  error: function(jqXHR, textStatus, errorThrown) {
	                    if(jqXHR.responseText) {
	                      errors = JSON.parse(jqXHR.responseText).errors
	                      alert('Error uploading image: ' + errors.join(", ") + '. Make sure the file is an image and has extension jpg/jpeg/png.');
	                    }
	                  }
	                });
	              }
	
	 
	 
	 
	})
	 </script>
	

	 
        

<script src='<c:url value="/resources/js/AdminManagerProduct.js" />'  type="text/javascript" ></script>
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