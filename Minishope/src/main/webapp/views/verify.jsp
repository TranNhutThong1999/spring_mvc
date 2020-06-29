<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="include/Header.jsp"></jsp:include>
<link rel="stylesheet" href='<c:url value="/resources/css/Verify.css" />'>
<title>Đăng Nhập</title>
</head>
<body>
<div id="pwdModal" class="model"  style="background-color: white;" >
	  <div id="inputEmail" class="modal-dialog modal-dialog-centered">
		  <div class="modal-content">
		      <div class="modal-header">
		       <h1 class="text-center">Verify Password</h1>
		          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		      </div>
		      <div class="modal-body">
		          <div class="col-md-12">
		                <div class="panel panel-default">
		                    <div class="panel-body">
		                        <div class="text-center">
									<div class="alert alert-${alert} messenger" style="text-align:center; color:#2a950f" role="alert">
							 			 <h3 id="mes">${message} ${SignUp}</h3>
									</div>
		                            <div class="panel-body">
		                                <fieldset>
		                                <form  id="idsignin" method="post" action='<c:url value="/SignUp/confirm-account" />'>
		                                    <div class="form-group">
		                                        <input id="userNameSendToken" class="form-control input-lg" placeholder="code" name="token" type="text">
		                                        <button id="resend" type="reset" class="btn btn-primary "style="display:none;"> Re Send </button>
		                                    </div>
		                                   <div class="resend" >
												<h5  class="ml-4 mr-3">After <span style="color:red;" id="dem"></span> you can resent code to your mail </h5>
											</div>
										
		                                    <input id="nutSigIn" class="btn btn-lg btn-primary btn-block" value="Submit" type="submit">
		                                </form>
		                                </fieldset>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		            </div>
		      </div>
		      <div class="modal-footer">
		          <div class="col-md-12">
		          <button id="cancel" class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
				  </div>	
		      </div>
		  </div>
	  </div>
  </div>

	<jsp:include page="include/Scrip.jsp"></jsp:include>
	<script type="text/javascript">
		$(document).ready(function(){
			var dem = 30;
			var a;
			window.onload=decrement;
			
			$("body").on("click","#resend",function(){
				dem=30
				$("#resend").css("display","none");
				$("#dem").html(dem+"s");
				$(".resend").css("display","block");
				$("#mes").html("Re Send thành công")
				$("#userNameSendToken").css("width:80%;")
				decrement();
				
				$.ajax({
					url:"/Minishope/Api/sendToken",
					type:"get",
					success:function(value){
						
					},
					error:function(){
						alert("err")
					}
				})
			})
			function decrement(){
				 a=setInterval(timer, 1000);
			}
			function timer(){
					dem--;
					$("#dem").html(dem+"s");
					if(dem===1){
						clearInterval(a)
						$("#userNameSendToken").css("width:100%;")
						$(".resend").css("display","none");
						$("#resend").css("display","inline-block");
						
					}
			}
			$("#cancel").click(function(){
				window.location.href="/Minishope/login"
			})
		});
	</script>
</body>
</html>