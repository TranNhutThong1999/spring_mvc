$(document).ready(function(){
	var trangBatDau=0;
	var soLuongSP =$(".main-User").attr("data-soLuongSP");
	var typeSort;
	var sortBy;
	var input;
	var keyWords;
	$(".page-item").off("click").click(function(){
		var trangReal =$(this).text();
		 trangBatDau = (trangReal -1)*soLuongSP;
		 keyWords =$("#keyWords").attr("data-Search");
	if(keyWords === ""){
		if(typeSort==="" & sortBy==="" ){
			input ={
					trangBatDau:trangBatDau,
					soLuongSP:soLuongSP
				}
		}else{
			input ={
					trangBatDau:trangBatDau,
					soLuongSP:soLuongSP,
					typeSort:typeSort,
					sortBy:sortBy
				}
		}
	}else{
		if(typeSort==="" & sortBy==="" ){
			input ={
					keyWords:keyWords,
					trangBatDau:trangBatDau,
					soLuongSP:soLuongSP
				}
		}else{
			input ={
					keyWords:keyWords,
					trangBatDau:trangBatDau,
					soLuongSP:soLuongSP,
					typeSort:typeSort,
					sortBy:sortBy
				}
		}
	}
		
		$(this).parent().find(".page-item").removeClass("active");
		$(this).addClass("active");
		$.ajax({
			url:"/Minishope/Api/NhanVien/",
			type:"get",
			dataType:"json",
			data:input,
			success:function(value){
				console.log(value)
				var title="<label><input id='checkAll' type='checkbox' >Check ALL</label>";
				$("#content-checkAll").html(title);
				var a = value.map(function(x){
					let enabled ="";
					let active;
					if(x.enabled===true){
						enabled="Ban";
						active="";
					}else{
						enabled="unBan";
						active=" class='active-ban' ";
					}
					return "<tr"+active+"><td><div class='custom-control custom-checkbox mb-3'><input type='checkbox' class='custom-control-input'  value='"+x.idNhanVien+"' id='id"+x.idNhanVien+"' ><label class='custom-control-label' for='id"+x.idNhanVien+"'></label> </div> </td><td id='id'>"+x.idNhanVien+"</td><td id='tenDN'>"+x.tenDangNhap+"</td><td id='role'>"+x.chucVu.tenChucVu+"</td><td>"+x.email+"</td><td><button class='btn btn-warning ban' data-enabled='"+x.enabled+"'> "+enabled+"</button></td> "
				})
				$("#content-listSP").html(a)
			},
			error:function(value){
				alert("errrrr");
			}
			
		})
	})
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
		$("body").on("change",".table input",function(){
			if(this.checked){
				$(this).parent().parent().parent().addClass("active");
			}else{
				$(this).parent().parent().parent().removeClass("active");
			}

		})
function checkedCSS(){
		$(".table input").each(function(){
			if(this.checked){
				$(this).parent().parent().parent().addClass("active");
			}else{
				$(this).parent().parent().parent().removeClass("active");
			}
		})
	}
	
		$("body").off("click").on("click",".sort-title",function(){
			
			typeSort =$(this).attr("data-sort");
			sortBy =$(this).attr("sortBy");
				$(".sort-title").each(function(){
					$(this).attr("data-sort","");
				})
			if(typeSort===""){
				typeSort = "desc";
				$(this).attr("data-sort",typeSort);
			}else{
				if(typeSort==="desc"){
					typeSort ="asc";
					$(this).attr("data-sort",typeSort);
				}else if(typeSort ==="asc"){
					typeSort ="desc";
					$(this).attr("data-sort",typeSort);
				}
			}
				if(keyWords===""){
					input={
							typeSort:typeSort,
							sortBy:sortBy,
							trangBatDau:trangBatDau,
							soLuongSP:soLuongSP
						}
				}else{
					input={
							keyWords:keyWords,
							typeSort:typeSort,
							sortBy:sortBy,
							trangBatDau:trangBatDau,
							soLuongSP:soLuongSP
						}
				}
				
			$.ajax({
				url:"/Minishope/Api/NhanVien/",
				type:"get",
				data:input,
				success:function(value){
					console.log(value)
					var title="<label><input id='checkAll' type='checkbox' >Check ALL</label>";
					$("#content-checkAll").html(title);
					var a = value.map(function(x){
						let enabled ="";
						let active="";
						if(x.enabled===true){
							enabled="Ban";
						}else{
							enabled="unBan";
							active=" class='active-ban' ";
						}
						return "<tr"+active+"><td><div class='custom-control custom-checkbox mb-3'><input type='checkbox' class='custom-control-input'  value='"+x.idNhanVien+"' id='id"+x.idNhanVien+"' ><label class='custom-control-label' for='id"+x.idNhanVien+"'></label> </div> </td><td  id='id'>"+x.idNhanVien+"</td><td id='tenDN'>"+x.tenDangNhap+"</td><td id='role'>"+x.chucVu.tenChucVu+"</td><td>"+x.email+"</td><td><button class='btn btn-warning ban' data-enabled='"+x.enabled+"'> "+enabled+"</button></td> "
					})
					$("#content-listSP").html(a)
				},
				error:function(Value){
					alert("erro")
				},
			})
		})
		
		$("#delete").click(function(){
			var checked = $(".table input:checked").length;
			if(checked===0){
				swal({
					  text: "Vui lòng chọn User cần xóa!",
					  type: "warning",
					  confirmButtonClass: "btn-warning",
					  confirmButtonText: "ok!",
					  closeOnConfirm: false
					})
			}else if($("#role").html()==="ROLE_admin"){
				swal({
					  text: "Không thể xóa admin!",
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
							if (result.value) {
							swal("Deleted!", "Your imaginary file has been deleted.", "success");
							deleteProduct()
							}
					})
			}
		})
			function deleteProduct(){
				var id=[];
				$("#content-listSP input:checked").each(function(){
					id.push($(this).val());
					$(this).closest("tr").remove();
				})
					var data=id;
				console.log(JSON.stringify(data))
					$.ajax({
						url:"/Minishope/Api/Delete_User/",
						type:"delete",
						contentType:"Application/json",
						data:JSON.stringify(data),
						 headers:{
							 'Authorization':sessionStorage.getItem("token")
						 },
						success:function(value){
							window.location.href="/Minishope/Admin-User/?message=delete_OK";
						},
						error:function(value){
							window.location.href="/Minishope/Admin-User/?message=error_system";
						}
					})
				
			}
			
		$("#btn-themSP").click(function(){
			$(".content").hide();
			$(".ProccessUser").show();
		})
		$("#thoat").click(function(){
			$(".content").show();
			$(".ProccessUser").hide();
		})
// submit user
		$("#submitUser").click(function(){
			swal({
				  title: "Are you sure?",
				  text: "Your will not be able to recover this imaginary file!",
				  type: "warning",
				  showCancelButton: true,
				  confirmButtonClass: "btn-danger",
				  confirmButtonText: "Yes, add it!",
				  closeOnConfirm: false
				}).then(function(result) {
						if (result.value) {
							swal({type:"success",});
							addUser();
						}
				})
		})
//function
				function addUser(){
					var dataForm =$("#form-User").serializeArray();
					var dataSanPham={};
					 $.each(dataForm, function(i, field){
						 dataSanPham[field.name]= field.value;
					  });
					 console.log(dataSanPham)
					$.ajax({
						url:"/Minishope/Api/addUser/",
						type:"post",
						contentType:"Application/json",
						data:JSON.stringify(dataSanPham),
						 headers:{
							 'Authorization':sessionStorage.getItem("token")
						 },
						success:function(value){
							console.log(value)
							if(value["DangKy"]==="true"){
								window.location.href="/Minishope/Admin-User/?message=add_OK";
							}else{
								for(var i in value){
									if(i ==="tenDangNhap"){
										$("#labeltenDangNhap").html(value[i]);
									}
									if(i==="email"){
										$("#labelemail").html(value[i]);
									}
									if(i==="matKhau"){
										$("#labelmatKhau").html(value[i]);
									}
								}
							}
						},
						error:function(value){
							window.location.href="/Minishope/Admin-User/?message=error_system";
						}
					})
			}
// ban/unban user
		$("body").on("click",".ban",function(){
			let  role= $(this).parent().parent().find("#role").html()
			 if(role==="ROLE_admin"){
					swal({
						  text: "Không thể ban admin!",
						  type: "warning",
						  confirmButtonClass: "btn-warning",
						  confirmButtonText: "ok!",
						  closeOnConfirm: false
						})
				}else{
			let data;
			let value;
			let idNhanVien = $(this).parent().parent().find("#id").html();
			let enabled = $(this);
			if(enabled.attr("data-enabled")==="true"){
				data="false";
				value="unBan";
				$(this).attr("data-enabled",data)
			}else{
				data="true";
				value="Ban";
				$(this).attr("data-enabled",data)
			}
			let ob={
					isNonBanned:data,
					idNhanVien:idNhanVien
			}
			enabled.html(value)
			activeBanned()
			$.ajax({
				url:"/Minishope/Api/HandleBan",
				type:"put",
				contentType:"application/json",
				 headers:{
					 'Authorization':sessionStorage.getItem("token")
				 },
				data:JSON.stringify(ob),
				success:function(v){
					
				}
			})
				}
		})
		
		activeBanned()
		function activeBanned(){
			let content = $(".ban");
				$.each(content,function(x){
					if($(this).attr("data-enabled")==="false"){
						$(this).parent().parent().addClass("active-ban")
					}else{
						$(this).parent().parent().removeClass("active-ban")
					}
				})
			}
})