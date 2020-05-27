<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
 <!--  <style type="text/css">
  	
      p{
            width: 500px;
            height: 20px;
            line-height: 30px;
            color:black;
            font-size: 20px;
        }
        p >a {
            display: block;
            width: 100%;
            text-overflow: ellipsis;
            overflow: hidden;
            white-space: nowrap;
            margin-left: 100px;
            text-decoration: none;
            text-align: center;
             
        }
         p >a:hover{
            display: block;
            width: 100%;
            overflow: auto;
            white-space: normal;
            text-decoration: none;
        }  
    </style> -->
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

		<title>站内信</title>

		<!-- Bootstrap core CSS -->
		<link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">

		<!-- Custom styles for this template -->
		<link href="${pageContext.request.contextPath}/static/css/layout.css" rel="stylesheet">

	</head>

	<body>

		<!-- 头部 -->
		<jsp:include page="header.jsp" />
		<!-- 站内信详情div -->
		<div class="modal fade "  id="message-context" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
			<div class="modal-dialog modal-sm" role="document">
				<div class="modal-content">
					<h3>站内信详情</h3>
						<div class="modal-footer">
							<font id="font-context" style="width: 300px;height: 200px;"></font><br>
							<button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
						</div>
				</div>
			</div>
		</div>
		
		
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-3 col-md-2 sidebar">
					<jsp:include page="navibar.jsp" />
				</div>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h1 class="page-header">站内信列表</h1>
				<div class="row placeholders">
					<div>
						<button type="button"  id="sendNessage" class="btn btn-primary show-user-form" data-toggle="modal" data-target="#add-user-form">发送站内信</button>
						<!--发送站内信-->
						<div class="modal fade " id="add-user-form" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
							<div class="modal-dialog modal-sm" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
										<h4 class="modal-title">创建站内信</h4>
									</div>
									<div class="modal-body">
										<form class="user-form">
										<div class="roles-div">
												<label for="userInput">收信人</label>
												<a href="${pageContext.request.contextPath}/user/list.action">请先选择联系人</a><br/>
												<c:forEach items="${nameCodeStr}" var="user">
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="userName"  />${user}<br/>
												</c:forEach> 
											</div>
											<div class="form-group">
												<label for="msgTitleInput">名称</label>
												<input type="text" name="msgTitle" class="form-control" id="msgTitleInput" placeholder="名称">
												<label id="msgTitleError" style="color:red"></label>
											</div>
											<div class="form-group">
												<label for="msgContextInput">内容</label>
												<!-- <input type="text" name="msgContext" class="form-control" id="msgContextInput" placeholder="内容"> -->
												<textarea rows="10" cols="5" name="msgContext" class="form-control" id="msgContextInput" placeholder="内容"></textarea>
												<label id="msgContextError" style="color:red"></label>
											</div>
											
										</form>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
										<button type="button" id="addmessage" class="btn btn-primary add-user-submit">发送 </button>
									</div>
								</div>
							</div>
						</div>
						<form action="${pageContext.request.contextPath}/message/selectMessage.action" style="float: right;right: 100px">
							<input type="date"  id="createTime" name="createTime" value="${param.createTime}"/>
							<input type="text" placeholder="站内信标题" id="msgTitle" name="msgTitle" value="${param.msgTitle}" style="width: 100px;height: 26px" />
							<input type="submit" class="btn btn-primary show-user-form" data-toggle="modal" id="searchUser" value="查询">
						</form>
					</div>
					<div class="space-div"></div>
					<table class="table table-hover table-bordered user-list" style="text-align: center;">
						<tr>
							<td><input type="checkbox" class="select-all-btn" /></td>
							<td>ID</td>
							<td>标题</td>
							<td style="width: 400px;height: 30px;">内容</td>
							<td>创建时间</td>
						</tr>
						<c:forEach items="${messageList}" var="message">
							<tr>
								<td><input type="checkbox" name="Id" value="${message.msgId }" /></td>
								<td class="id">${message.msgId}</td> 
								<td class="msgtitle">${message.msgTitle}</td>
								<td class="msgcontext" style="text-align: center;">
									<input class="context" type="text" value="${message.msgContext}" style="display: none;">
									<input class="allContext" type="button" style="width: 400px;height:30px;border: 0;background-color: white;" data-target="#message-context" data-toggle="modal" value="${message.msgContext}"></input>
								</td>
								<td>${message.createTime}</td>
								</td>
							</tr>
						</c:forEach>
					</table>
					<jsp:include page="standard.jsp"></jsp:include>
				</div>
			</div>
		</div>
		<!-- 提示框 -->
		<div class="modal fade" id="op-tips-dialog" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
			<div class="modal-dialog modal-sm" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title">提示信息</h4>
					</div>
					<div class="modal-body" id="op-tips-content">
					</div>
				</div>
			</div>
		</div>
		<!-- Bootstrap core JavaScript
    ================================================== -->
		<!-- Placed at the end of the document so the pages load faster -->
		<script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
		<script>
$(document).ready(function(){
$(".allContext").css("color","blue");

		var flag1 = false;
		var flag2 = false;
		$("#msgTitleError").hide();
		$("#msgContextError").hide();
		//对标题进行非空校验，失去焦点事件
		$("#msgTitleInput").blur(function(){
			var name = $("#msgTitleInput").val();
			 if(!name){
				$("#msgTitleError").show();
				$("#msgTitleError").html("标题不能为空");
				flag1=false;
			 }else{
			 	flag1=true;
			 	$("#msgTitleError").hide();
			 }
		});
		//对内容进行非空校验，失去焦点事件
		$("#msgContextInput").blur(function(){
			var password = $("#msgContextInput").val();
			 if(!password){
				$("#msgContextError").show();
				$("#msgContextError").html("内容不能为空");
				flag2=false;
			 }else{
			 	flag2=true;
			 	$("#msgContextError").hide();
			 }
		});
		$("#addmessage").click(function(){
			if(flag1 && flag2){
				//获取值
				var msgTitle = $("#msgTitleInput").val();
				var msgContext = $("#msgContextInput").val();
				$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/message/addMessage.action",
				dataType:"json",
				data:{
					msgTitle:msgTitle,
					msgContext:msgContext
				},
				success:function(data){
					if(data.num==1){
						alert("添加成功");
						window.location.href="${pageContext.request.contextPath}/message/selectMessage.action";
					};
				},
			});
			};
		});
			
			
			$(".allContext").click(function(){
				var mycontext = $(this).parents("tr").find(".context").val();
				//alert(mycontext);
				$("#font-context").html(mycontext);
				
			});
});

			$.cookie("idstr",null);
			$.cookie("namestr",null);
			/* $("#sendNessage").click(function(){
				$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/message/selectMessage.action",
				dataType:"json",
			});	
			}); */
		</script>
	</body>

</html>