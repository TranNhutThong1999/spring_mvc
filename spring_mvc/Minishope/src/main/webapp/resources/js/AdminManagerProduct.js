$(document).ready(function(){
		var soLuongSP =5;
		var trangBatDau=0;
		var typeSort="";
		var sortBy="";
		var idDanhMuc=$("#title-paging").attr("idDanhMuc");
		var content;
		var keyWords =$("#keyWords").attr("placeholder");
		var nameImage;
// paging		
		$("body").on("click",".page-item",function(){
			var soTrangReal = $(this).text();
				trangBatDau = (soTrangReal - 1) * soLuongSP
			$(this).parent().find(".page-item").removeClass("active");
			$(this).addClass("active");
			if(idDanhMuc===""){
				if(keyWords==""){
					if(typeSort==="" & sortBy===""){
						 content ={
								 trangBatDau:trangBatDau,
								 soLuongSP:soLuongSP,
						 	}
						}else{
							 content ={
									trangBatDau:trangBatDau,
									soLuongSP:soLuongSP,
									typeSort:typeSort,
									sortBy:sortBy,
							 }
						}
				}else{
				if(typeSort==="" & sortBy===""){
				 content ={
						 trangBatDau:trangBatDau,
						 soLuongSP:soLuongSP,
						 keyWords:keyWords
				 	}
				}else{
					 content ={
							trangBatDau:trangBatDau,
							soLuongSP:soLuongSP,
							typeSort:typeSort,
							sortBy:sortBy,
							keyWords:keyWords
					 }
					}
				}
			}else{
				if(typeSort==="" & sortBy===""){
				 content ={
						 trangBatDau:trangBatDau,
						 soLuongSP:soLuongSP,
						 idDanhMuc:idDanhMuc
					}
				}else{
					 content ={
							 	idDanhMuc:idDanhMuc,
								trangBatDau:trangBatDau,
								soLuongSP:soLuongSP,
								typeSort:typeSort,
								sortBy:sortBy 
					 }
				}
			}
		
			$.ajax({
				url:"/Minishope/Api/SanPham",
				type:"get",
				dataType:"json",
				data:content,
				success:function(value){
					var title="<label><input id='checkAll' type='checkbox' >Check ALL</label>";
					$("#content-checkAll").html(title);
					var add =$("#content-listSP");
					var result= value.map(function(x){
						return "<tr> <td><div class='custom-control custom-checkbox mb-3'><input type='checkbox' class='custom-control-input'  value='"+x.idSanPham+"' id='id"+x.idSanPham+"' ><label class='custom-control-label' for='id"+x.idSanPham+"'></label> </div> </td> <td>"+x.idSanPham+"</td><td>"+x.tenSanPham+"</td><td>"+x.giaTien+"</td><td id='DanhMuc' data-idDanhMuc='"+x.idDanhMuc+"'>"+x.tenDanhMuc+"</td> <td> <button class='btn btn-warning edit'>edit</button></td></tr>";
					})
					
								  
					add.html(result);
					
				},
				error:function(value){
					alert("orrr")
				},
			})
				
		})//end paging
// redirect product/idDanhMuc
		$("body").on("click","#DanhMuc",function(){
					idDanhMuc =$(this).attr("data-idDanhMuc");
					window.location.href="/Minishope/Admin-SanPham/DanhMuc/"+idDanhMuc;
				})

		$("body").on("click",".sort-title",function(){
			//data-sort="asc" sortBy="tenSanPham"
			typeSort =$(this).attr("data-sort");
			sortBy= $(this).attr("sortBy");
			//set attribute typeSort = null
			$(".sort-title").each(function(){
				$(this).attr("data-sort","");
			})
			
				if(typeSort===""){
					$(this).attr("data-sort","desc");
					typeSort ="desc";
				}else{
					if(typeSort==="asc"){
						$(this).attr("data-sort","desc");
						typeSort ="desc";
					}else{
						$(this).attr("data-sort","asc");
						typeSort ="asc";
					}
				}
			if(idDanhMuc===""){
				if(keyWords==""){
					 content ={
								
								trangBatDau:trangBatDau,
								soLuongSP:soLuongSP,
								typeSort:typeSort,
								sortBy:sortBy
					 	}
				}else{
					 content ={
								trangBatDau:trangBatDau,
								soLuongSP:soLuongSP,
								typeSort:typeSort,
								sortBy:sortBy,
								keyWords:keyWords
					 	}	
					 
				}
			
			}else{
				 content ={
						 	idDanhMuc:idDanhMuc,
							trangBatDau:trangBatDau,
							soLuongSP:soLuongSP,
							typeSort:typeSort,
							sortBy:sortBy
					}
			}
				$.ajax({
					url:"/Minishope/Api/SanPham",
					type:"get",
					dataType:"json",
					data:content,
					success:function(value){
						var title="<label><input id='checkAll' type='checkbox' >Check ALL</label>";
						$("#content-checkAll").html(title);
						var add =$("#content-listSP");
						var result= value.map(function(x){
							return "<tr> <td><div class='custom-control custom-checkbox mb-3'><input type='checkbox' class='custom-control-input'  value='"+x.idSanPham+"' id='id"+x.idSanPham+"' ><label class='custom-control-label' for='id"+x.idSanPham+"'></label> </div> </td><td>"+x.idSanPham+"</td><td>"+x.tenSanPham+"</td><td>"+x.giaTien+"</td><td id='DanhMuc' data-idDanhMuc='"+x.idDanhMuc+"'>"+x.tenDanhMuc+"</td><td> <button class='btn btn-warning edit'>dit</button></td></tr>";
						})
						add.html(result);
					},
					error:function(value){
						alert("orrr")
					},
				})
	
		})// end sorting
		
		$("body").on("change","#checkAll",function(){
			if(this.checked){
				$(".table input").each(function(){
					$(this).attr("checked",true);
				})
			}else{
				$(".table input").each(function(){
					$(this).attr("checked",false);
				})
			}
			checkedCSS()
		})
//function click one checked
		$("body").on("change",".table input",function(){
			if(this.checked){
				$(this).parent().parent().parent().addClass("active");
			}else{
				$(this).parent().parent().parent().removeClass("active");
			}

		})
//function remove class tr.active
		function checkedCSS(){
			$(".table input").each(function(){
				if(this.checked){
					$(this).parent().parent().parent().addClass("active");
				}else{
					$(this).parent().parent().parent().removeClass("active");
				}
			})
		}
//Xóa sản phẩm	
		$("#delete").click(function(){
			var temp = $("#content-listSP input:checked").length;
			if(temp===0){
				swal({
					  text: "Vui lòng chọn sản phẩm cần xóa!",
					  type: "warning",
					  confirmButtonClass: "btn-warning",
					  confirmButtonText: "ok!",
					  closeOnConfirm: false
					})
			}else{
				swal({
					  title: "Are you sure?",
					  text: "Your will not be able to recover this imaginary file!",
					  type: "warning",
					  showCancelButton: true,
					  confirmButtonClass: "btn-danger",
					  confirmButtonText: "Yes, delete it!",
					  closeOnConfirm: false
					}).then(function(result) {
						console.log(result)
							if (result.value){
								console.log(result.value +"ok")
							swal("Deleted!", "loading", "success");
							DeleteProduct()
							}
					})
			  }			
		})
//function xóa sản phẩm
		function DeleteProduct(){
			var id=[];
			 $("#content-listSP input:checked").each(function(){
				 id.push($(this).val())
			 })
					var content=$(this).closest("tr");
				 $.ajax({
					 url:"/Minishope/Api/Delete_Product/",
					 type:"delete",
					 contentType:"Application/json",
					 data:JSON.stringify(id),
					 success: function(value){
						window.location.href="/Minishope/Admin-SanPham/?message=delete_OK";
					 },
					 error:function(value){
						 window.location.href="/Minishope/Admin-SanPham/?message=error_system";
					 }
				 
				 })
			
		}
// thêm chi tiet san phâm		
		$("body").on("click",".addCTSP",function(even){
			var CTSPclone =$("#clone").clone().removeAttr("id")
			$("#chiTietSanPham").append(CTSPclone);
		})
// click button show views addProduct	
		$("#btn-themSP").click(function(){
			$(".themSanPham").removeClass("hide");
			$(".content").addClass("show");
			$("#btn-SuaSanPham").css("display","none");
			$("#btn-themSanPham").css("display","inline-block");
			//set value
			$("#content-tenSanPham").val("");
			$("#content-tenSanPham").removeAttr("data-idSP")
			$("#content-giaTien").val("");
			$("#content-moTa").val("");
			$("#content-idDanhMuc").val("1");
			$("#chiTietSanPham .CTSP-content").remove();
			var CTSPclone =$("#clone").clone().removeAttr("id")
			$("#chiTietSanPham").append(CTSPclone);
		})
///click button edit		
		$("body").on("click",".edit",function(){
			$(".themSanPham").removeClass("hide");
			$(".content").addClass("show");
			$("#btn-themSanPham").css("display","none");
			$("#btn-SuaSanPham").css("display","inline-block");
			var idSP = $(this).closest("tr").find("input").val();
			
			$.ajax({
				url:"/Minishope/Api/OneSanPham/",
				type:"get",
				data:{
					idSanPham:idSP
				},
				success:function(value){
					console.log(value)
					$("#content-tenSanPham").val(value.tenSanPham);
					$("#content-tenSanPham").attr("data-idSP",value.idSanPham)
					$("#content-giaTien").val(value.giaTien);
					tinymce.activeEditor.setContent(value.moTa);
					$("#content-idDanhMuc").val(value.idDanhMuc);
					nameImage=value.hinhSanPham;
					if(value.danhCho==="Nam"){
						$("#Nam").attr("checked",true);
						$("#Nu").attr("checked",false);
					}else{
						$("#Nu").attr("checked",true);
						$("#Nam").attr("checked",false);
					}
					$("#chiTietSanPham .CTSP-content").remove();
					var chiTietSanPham;
					var listCTSP =value.danhSachCTSPham;
					console.log(listCTSP.length)
					for(var i=0;i<listCTSP.length;i++){
						chiTietSanPham =$("#clone").clone().removeAttr("id");
						chiTietSanPham.find("#MauSanPham").attr("data-idCTSP",listCTSP[i].idChiTietSanPham)
						chiTietSanPham.find("#content-MauSanPham").val(listCTSP[i].idMauSanPham);
						chiTietSanPham.find("#content-Size").val(listCTSP[i].idSize);
						chiTietSanPham.find("#content-soLuongSP").val(listCTSP[i].soLuong);
						$("#chiTietSanPham").append(chiTietSanPham);
						
					}
				
				},
				error:function(value){
					alert("errrr")
				}
			})
		})
//add product		
	
		$("#btn-themSanPham").click(function(){
					if(checkSubmit()!==""){
					//	alert(checkSubmit())
						swal({
							  text: checkSubmit()+"!",
							  type: "warning",
							  confirmButtonClass: "btn-warning",
							  confirmButtonText: "ok!",
							  closeOnConfirm: false
							})
					}else{
						swal({
							  title: "Are you sure?",
							  text: "Your will not be able to recover this imaginary file!",
							  type: "warning",
							  showCancelButton: true,
							  confirmButtonClass: "btn-warning",
							  confirmButtonText: "Yes, add it!",
							  closeOnConfirm: false
							}).then(function(result) {
									if (result.value) {
										swal("add!", "loading", "success");
									addProduct()
									}
							})
				
				}
		})// end add product
//function them  sản phẩm
				function addProduct (){
					var dataform = $("#form-themSP").serializeArray();
					var dataSanPham={};
					 $.each(dataform, function(i, field){
						 dataSanPham[field.name]= field.value;
					  });
					 var arr=[];
					 dataSanPham["hinhSanPham"]=nameImage ;
					 dataSanPham["idSanPham"]=$("#content-tenSanPham").attr("data-idSP");
					$("#chiTietSanPham .CTSP-content").each(function(){
						 var object={};
						object["idMauSanPham"]=$(this).find("select[name ='mauSanPham']").val();
						object["idSize"] =$(this).find("select[name ='sizeSanPham']").val();
						object["soLuong"]=$(this).find("input[name='soLuongSP']").val()
					  var check =false;
						for(var i in arr){
							if(arr[i].idMauSanPham===object.idMauSanPham & arr[i].idSize===object.idSize){
								var temp = parseInt(arr[i].soLuong) + parseInt(object.soLuong);
								arr[i].soLuong=temp;
								check=true;
							}
						}
						if(check===false){
							arr.push(object);
						}
					})
					dataSanPham["moTa"]=tinymce.activeEditor.getContent();
					dataSanPham["danhSachCTSPham"]=arr;
						
						console.log(dataSanPham)
					$.ajax({
						url:"/Minishope/Api/create_Post",
						type:"post",
						contentType:"application/json",
						data:JSON.stringify(dataSanPham),
						success:function(value){
									window.location.href="/Minishope/Admin-SanPham/?message=add_OK";
						},
						error:function(value){
							window.location.href="/Minishope/Admin-SanPham/?message=error_system";
						},
					})
					if(file.length!==0){
						uploadFile();
					}
				
		}// end function thêm san phẩm
// uploadFile		
				function uploadFile(){
					var form = new FormData();
					form.append("file",file[0]);
					$.ajax({
						url:"/Minishope/Api/upLoadFile",
						type:"post",
						data:form,
						processData: false,
				        contentType: false,
				        error:function(value){
				        	alert("rrrrr")}
					})
				}
						
//change file image
			var file=[];
				$("#fileName").change(function(e){
					file= e.target.files;
					nameImage=e.target.files[0].name;
				})// end change file image
				
// remove one detail product
				$("body").on("click",".remove-ctsp",function(){
					$(this).parent().parent().remove();
				})
				
//update product		
		$("#btn-SuaSanPham").click(function(){
				if(checkSubmit()!==""){
					swal({
						  text: checkSubmit()+"!",
						  type: "warning",
						  confirmButtonClass: "btn-warning",
						  confirmButtonText: "ok!",
						  closeOnConfirm: false
						})
				}else{
					swal({
						  title: "Are you sure?",
						  text: "Your will not be able to recover this imaginary file!",
						  type: "warning",
						  showCancelButton: true,
						  confirmButtonClass: "btn-warning",
						  confirmButtonText: "Yes, update it!",
						  closeOnConfirm: false
						}).then(function(result) {
								if (result.value) {
								swal("Updated!", "loading", "success");
								updateProduct()
								}
						})
				}
		})
//function update product 
		function updateProduct(){
				var dataform = $("#form-themSP").serializeArray();
				var dataSanPham={};
				 $.each(dataform, function(i, field){
					 dataSanPham[field.name]= field.value;
				  });
				 console.log(dataSanPham)
				 var arr=[];
				 dataSanPham["hinhSanPham"]=nameImage;
				 console.log("update "+dataSanPham["hinhSanPham"])
				dataSanPham["idSanPham"]=$("#content-tenSanPham").attr("data-idSP");
					
				$("#chiTietSanPham .CTSP-content").each(function(){
					 var object={};
					object["idMauSanPham"]=$(this).find("select[name ='mauSanPham']").val();
					object["idSize"] =$(this).find("select[name ='sizeSanPham']").val();
					object["soLuong"]=$(this).find("input[name='soLuongSP']").val()
					object["idChiTietSanPham"]=$(this).find("#MauSanPham").attr("data-idCTSP")
					var check =false;
					for(var i in arr){
						if(arr[i].idMauSanPham===object.idMauSanPham & arr[i].idSize===object.idSize){
							var temp = parseInt(arr[i].soLuong) + parseInt(object.soLuong);
							arr[i].soLuong=temp;
							check=true;
							
						}
					}
				
					if(check===false){
						arr.push(object);
						
					}
				})
				dataSanPham["danhSachCTSPham"]=arr;
				dataSanPham["moTa"]=tinymce.activeEditor.getContent();
				console.log(dataSanPham)
				$.ajax({
					url:"/Minishope/Api/update_Post",
					type:"put",
					contentType:"application/json",
					data:JSON.stringify(dataSanPham),
					success:function(value){
						window.location.href="/Minishope/Admin-SanPham/?message=update_OK";
					},
					error:function(value){
						window.location.href="/Minishope/Admin-SanPham/?message=error_system";
					},
				})
		
				if(file.length!==0){
					uploadFile();
				}
		}// end function updataProduct

//button thoat
		$("#btn-thoat").click(function(){
				$(".themSanPham").addClass("hide");
			$(".content").removeClass("show");
		})
//valided
		function checkSubmit(){
			var data=$("#content-giaTien").val();
			var pattern =new RegExp("[0-9]"); 
			var boolean = pattern.test(data);
			console.log(data +" |" +boolean)
			if($("#content-tenSanPham").val()==="" | $("#content-giaTien").val()===""){
				return "Các trường có dấu * không được để trống";
			}
			if(boolean===false){
				return "Giá tiền phải là chữ số";
			}
			return "";
		}
// function change url onto ckeditor4
		 function changeUrlImage(){
			 let dataOld =CKEDITOR.instances.editor.getData();
			 $("#ck").html(dataOld)
			 $("#ck .easyimage  img").attr("src", "/Minishope/resources/Images/gai1.png");
				var data = $("#ck").html();
			 CKEDITOR.instances.editor.setData(data)
//			 for( i = 0; i < objImages.length; i++ )
//			 {
//			     objImages.src = '/resources/Images/gai1.png';
//			 }
		 }
// function url upload file ckeditor4
		 function url(){
			 localStorage.setItem('myCat', 'Tom');
			 return '/Minishope/Api/upLoadFile?command=QuickUpload&type=Images'
		 }
	
})//end