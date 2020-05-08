<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="include/Header.jsp"></jsp:include>
<link rel="stylesheet" href='<c:url value="/resources/css/LogIn.css" />'>
<title>Đăng Nhập</title>
</head>
<body>
<!--modal-->
<div id="pwdModal" class="modal fade"  tabindex="-1" role="dialog" aria-hidden="true" style="background-color: rgba(17, 17, 17, 0.5);" data-keyboard="true" data-backdrop="static">
  <div id="inputEmail" class="modal-dialog modal-dialog-centered">
	  <div class="modal-content">
	      <div class="modal-header">
	       <h1 class="text-center">What's My Password?</h1>
	          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	      </div>
	      <div class="modal-body">
	          <div class="col-md-12">
	                <div class="panel panel-default">
	                    <div class="panel-body">
	                        <div class="text-center">
	                          <p id="message-mail">If you have forgotten your password you can reset it here.</p>
	                            <div class="panel-body">
	                                <fieldset>
	                                <form>
	                                    <div class="form-group">
	                                        <input id="userNameSendToken" class="form-control input-lg" placeholder="User Name" name="username" type="text">
	                                    </div>
	                                     <div class="form-group">
	                                        <input id="mailSendToken" class="form-control input-lg" placeholder="E-mail Address" name="email" type="email">
	                                    </div>
	                                    <div id="timer"> After <span id="dem"></span> you can resend code to your mail</div>
	                                    <input id="btn-mailSendToken" class="btn btn-lg btn-primary btn-block" value="Send code to your Email" type="button">
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
	          <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
	           <button id="back-changePassword"class="btn" >Change Password</button>
			  </div>	
	      </div>
	  </div>
  </div>
  <div id="inputPassword" class="modal-dialog modal-dialog-centered">
	  <div class="modal-content">
	      <div class="modal-header">
	       <h1 class="text-center">Change Password</h1>
	          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	      </div>
	      <div class="modal-body">
	          <div class="col-md-12">
	                <div class="panel panel-default">
	                    <div class="panel-body">
	                        <div class="text-center">
	                          <p id="message-password">You can change new password on 15 minutes.</p>
	                            <div class="panel-body">
	                                <fieldset>
	                                <form>
	                              	  <div class="form-group">
	                                        <input id="token" class="form-control input-lg code" placeholder="code" name="token" type="text">
	                                   		<label for="code" style="color:black;">Code send to your mail</label>
	                                    </div>
	                                    <div class="form-group">
	                                        <input id="forgot-newPassword" class="form-control input-lg" placeholder="New Password" name="password" type="password">
	                                    </div>
	                                     <div class="form-group">
	                                        <input id="forgot-prePassword" class="form-control input-lg" placeholder="Confirm" name="prePassword" type="password">
	                                    </div>
	                                    <input id="btn-changePassword"class="btn btn-lg btn-primary btn-block" value="Change My Password" type="button">
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
	          <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
	           <button id="back-sendToken"class="btn" >Send Code</button>
			  </div>	
	      </div>
	  </div>
  </div>
</div>
	<div id="login" class="container-fluid background">
		<div class="card" style="width: 18rem;">		
			<form  id="idsignin" method="post" action='<c:url value="/j_spring_security_check" />'>
			<security:csrfInput />
				<div class="card-body sigin" >
					<h5 class="card-title">Sign in</h5>
						<div class="alert alert-${alert} messenger" style="text-align:center; color:#2a950f" role="alert">
			 			 <h3>${message} ${SignUp}</h3>
					</div>
					<div class="card-subtitle mb-2 text-muted">
						<a href=""><i class="fa fa-facebook-square" aria-hidden="true"></i></a>
						<a href=""><i class="fa fa-google-plus-square"
							aria-hidden="true"></i></a> <a href=""> <i
							class="fa fa-twitter-square" aria-hidden="true"></i></a>
					</div>
					<div class="input-group flex-nowrap one">
						<div class="input-group-prepend">
							<span class="input-group-text" id="addon-wrapping"><i
								class="fa fa-user" aria-hidden="true"></i></span>
						</div>
						<input id="userName" name="username" type="text" required
							class="form-control" placeholder="Username" aria-label="Username"
							aria-describedby="addon-wrapping">
					</div>
					<div class="input-group flex-nowrap">
						<div class="input-group-prepend">
							<span class="input-group-text" id="addon-wrapping"><i
								class="fa fa-key" aria-hidden="true"></i></span>
						</div>
						<input id="password" name="password" type="password" required
							class="form-control" placeholder="Password" aria-label="Username"
							aria-describedby="addon-wrapping">
					</div>
					<div class="check">
							<div class="custom-control custom-checkbox mb-2 mt-1 rememberme">
								    <input type="checkbox" class="custom-control-input" name="remember-me" id="remeberme" >
								    <label class="custom-control-label" for="remeberme">Remember me</label>
								  </div>	
					<button id="nutSigIn" type="submit" class="btn btn-warning">Login</button>
					<!--  <button id="nutAjax" type=button class="btn btn-warning">ajax</button> -->
					
				</div>
				<div class="bottom">
				<div class="content1">
					<h3>If you haven't account?</h3> <a id="redirectsignup" href='<c:url value="/SignUp/" />' >Create account?</a>
				</div>
				<div class="content2"> <a id="clickForget" href="#" data-target="#pwdModal" data-toggle="modal">Forgot my password?</a></div>
				</div>
				</div>
			</form>

		</div>

	</div>

	<jsp:include page="include/Footer.jsp"></jsp:include>
	<script src='<c:url value="/resources/js/1.js" />'  type="text/javascript" ></script>
	<script type="text/javascript">

		$(window).ready(function(){
			$("#pwdModal").hide();
			$("#inputPassword").hide();
			$("#clickForget").click(function(){
				//$("#login").hide();
				$("#pwdModal").show();
			})
			$("#back-sendToken").click(function(){
				$("#pwdModal").show();
				$("#inputPassword").hide();
				$("#inputEmail").show();
			})
			$("#back-changePassword").click(function(){
				$("#pwdModal").show();
				$("#inputPassword").show();
				$("#inputEmail").hide();
			})
// submit send token
				$("#timer").hide();	
			$("#btn-mailSendToken").click(function(){
				var mailSendToken =$("#mailSendToken").val();
				var userNameSendToken=$("#userNameSendToken").val();
				console.log(mailSendToken +" "+userNameSendToken)
				if(mailSendToken==="" | userNameSendToken===""){
					$("#message-mail").html("Không được để trống thông tin")
				}else{
					$.ajax({
						url:"/Minishope/Api/sendTokenPassword",
						type:"Post",
						data:{
							mail:mailSendToken,
							userName:userNameSendToken
						},
						success:function(value){
							if(value==="ok"){
								$("#inputPassword").show();
								$("#inputEmail").hide();
								$("#btn-mailSendToken").hide()
								$("#message-mail").html("")
								$("#message-mail").removeClass("red")
								decrement()
							}else{
								$("#message-mail").html(value)
								$("#message-mail").addClass("red")
							}
						}
					})
			}
		})
// time down
			var dem=30;
			function decrement(){
			
		
				 a=setInterval(timer, 1000);
			}
			function timer(){
					dem--;
					$("#timer").show();
					$("#dem").html(dem+"s");
					if(dem===0){
						clearInterval(a)
						$("#timer").hide();
						$("#btn-mailSendToken").show()
						
					}
			}
//validate token
				
			$("#btn-changePassword").click(function(){
				var newPW=$("#forgot-newPassword").val();
				var preNewPS=$("#forgot-prePassword").val();
				var token=$("#token").val();
				console.log(newPW +" "+preNewPS)
				if(newPW==="" | preNewPS==="" | token===""){
					$("#message-password").html("Không được bỏ trống")
					return null;
				}else{
					if(newPW===preNewPS){
						$.ajax({
							url:"/Minishope/Api/changePW",
							type:"post",
							data:{
								password:newPW,
								token:token
							},
							success:function(value){
								
								var ob= JSON.parse(value)
								console.log(ob)
								$.each(ob,function(index,value){
									if(index==="token"){
										$("#message-password").html(value)
									}else if(index==="matKhau"){
										$("#message-password").html(value)
									}else if(index==="DangKy"){
										window.location.href="/Minishope/login?message=changePW_OK"
									}else{
										$("#message-password").html(value)
									}
								})
							}
						})
					}else{
						$("#message-password").html("Confirm không trùng với Password");
					}
				}
			
			})
		})//end
	</script>
</body>
</html>