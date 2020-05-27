<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <title>登录页面</title>
    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/static/css/login.css" rel="stylesheet">
   <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.cookie.js"></script>
   
   <script type="text/javascript">	
   	var flag1 = false;
   	var flag2 = false;
   	var flag3 = false;
	$(document).ready(function(){
		$("#userName").hide();
		$("#password").hide();
		$("#Code").hide();
		//用户名校验
		$("#inputEmail").blur(function(){
			 if(!/^\w{4,16}$/.test($("#inputEmail").val())){
				$("#userName").html("用户名格式错误，4-16位，字母，数字，下划线");
			 	$("#userName").show();
				$("#password").hide();
				$("#Code").hide();
				flag1 = false;
			}else{
				$("#userName").hide();
				flag1 = true;
			}
			return false;
		}); 
		//密码校验
		$("#inputPassword").blur(function(){
			var password = $("#inputPassword").val();
				$("#userName").hide();
				$("#Code").hide();
			if(!password){
				$("#password").html("密码不能为空！");
				$("#password").show();
				flag2 = false;
			}else if(!/^\w{4,16}$/.test(password)){
				$("#password").html("密码格式错误");
				$("#password").show();
				flag2 = false;
			}else{
				$("#password").hide();
				flag2 = true;
			};
			return false;
		});
		//验证码校验
		$("#inputCode").blur(function(){
			var vCode = $("#inputCode").val();
			$("#userName").hide();
			$("#password").hide();
			if(!vCode){
				$("#Code").html("验证码不能为空");
				$("#Code").show();
				flag3 = false;
			}else{
				$.ajax({
	  				type:"POST",
	  				dataType:"json",
	  				url:"validCode.action",
	  				data:{
	  					vCode:vCode
	  				},
	  				success:function(json){
	  					if(json.msg == "0"){
	  						$("#Code").html("验证码错误");
							$("#Code").show();
							flag3 = false;
	  					}else if(json.msg == "1"){
	  						$("#Code").hide();
	  						flag3 = true;
	  					}
	  				}
	  			});
			}
			return false;
		});
	});
		
	function validCode(){
	   	var vCode=$("#inputCode").val();
		var user_code = $("#inputEmail").val();
		var user_pwd = $("#inputPassword").val();
	   if(flag1 && flag2 && flag3){
		 //验证密码是否正确
 			$.ajax({
 				type:"POST",
 				dataType:"json",
 				url:"testPwd.action",
 				data:{
 					vCode:vCode,
 					user_code:user_code,
 					user_pwd:user_pwd
 				},
 				success:function(json){
 					if(json.pwd == "1"){
 						window.location.href="${pageContext.request.contextPath}/user/welcome.action";
 					}else if(json.pwd == "0"){
 						alert("用户名或密码错误");
 						return false;
 					}else if(json.pwd == "-1"){
 						alert("用户未审核");
 					}
 				}
 			});
		}
		return false;
	}
</script>
  </head>
  
  <body>
    <div class="container">
      <form class="form-signin" method="post" action="##" >
        <h3 class="form-signin-heading">请登录</h3>
        <label for="inputEmail" class="sr-only">用户名</label>
        <input type="text" id="inputEmail" class="form-control" placeholder="用户名"  name="userName" maxlength="20">
        <label id="userName" style="color:red"></label><br/>
        <label for="inputPassword" class="sr-only">密码</label>
        <input type="password" id="inputPassword" class="form-control" placeholder="密码" name="userPwd" maxlength="10">
        <label id="password" style="color:red"></label><br/>
        <label for="inputEmail" class="sr-only">验证码</label>
        <input type="text" id="inputCode" placeholder="验证码" name="code" tabindex="6" style="width:80px;text-transform:uppercase;ime-mode:disabled" maxlength="4">
        <img id="vdimgck" src="${pageContext.request.contextPath}/pages/image.jsp?d="+new Date()+"" alt="看不清？点击更换" align="absmiddle" width="75" style="cursor:pointer" onclick="this.src=this.src+'?'" />
       	<br/><label id="Code" style="color:red"></label>
       <div class="checkbox">
          <label>
            <input type="checkbox" name="rememberMe"> 记住我
          </label>
        </div>
        <p class="bg-warning">${error}</p>
        <button class="btn btn-lg btn-primary btn-block" type="button" onclick="return validCode()">登录</button>
      </form>
    </div> <!-- /container -->
</body>
</html>
