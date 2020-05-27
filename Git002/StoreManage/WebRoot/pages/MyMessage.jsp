<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
  
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
				<h1 class="page-header">我的站内信</h1>
				<div class="row placeholders">
					<div>
						<form action="${pageContext.request.contextPath}/message/selectUserMessage.action" >
							<input type="date" id="createTime" name="createTime" value="${param.createTime}"/>
							<input type="text" placeholder="发信人" id="userName" name="userName" value="${param.fromUser}" style="width: 150px;height: 26px" />
							<input type="text" placeholder="状态" id="state" name="state" value="${param.state}" style="width: 100px;height: 26px" />
							<input type="text" placeholder="站内信标题" id="msgTitle" name="msgTitle" value="${param.msgTitle}" style="width: 100px;height: 26px" />
							<input type="submit" class="btn btn-primary show-user-form" data-toggle="modal" id="searchUser" value="查询">
						</form>
					</div>
					<div class="space-div"></div>
					<table class="table table-hover table-bordered user-list" style="text-align: center;">
						<tr>
							<td style="width: 20px;"><input type="checkbox" class="select-all-btn" /></td>
							<td style="width: 20px;">ID</td>
							<td style="width: 100px;">标题</td>
							<td style="width: 20px;">内容</td>
							<td style="width: 20px;">发信人</td> 
							<td style="width: 50px;">状态</td>
							<td style="width: 200px;">发送时间</td>
							<td style="width: 50px;">操作</td>
						</tr>
						<c:forEach items="${userMessageList}" var="message">
							<tr>
								<td><input type="checkbox" name="Id" value="${message.msgId }" /></td>
								<td class="msgId">${message.userMsgId}</td> 
								<td class="msgTitle" style="width: 220px;">${message.msgTitle}</td>
								<td class="msgContext" style="text-align: center;width: 300px;">
									<input class="context" type="text" value="${message.msgContext}" style="display: none;">
									<input class="allContext" type="button" style="width: 300px;height:30px;background: none;border: 0;background-color: white;" data-target="#message-context" data-toggle="modal" value="${message.msgContext}"></input>
								</td>
								<td class="userName">${message.userName}</td> 
								<td class="state" style="color:${message.state="0"?"red":""} ">${message.state=="0"?"未读":"已读"}</td>
								<td>${message.createTime}</td>
								<td>
									<button type="button" class="btn btn-warning update"  data-toggle="modal" id="updateMyMessageState">${(message.state=='0')?'标记为已读':'已读'}</button>
									
								</td>
							</tr>
						</c:forEach>
					</table>
					<%-- <table>
						<tr><td>发信人</td></tr>
						<c:forEach items="${userNameList}" var="messages">
							<tr><td>${messages.userName}</td></tr>
						</c:forEach>
					</table> --%>
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
			//$.cookie("idstr",null);
			//$.cookie("namestr",null);
			$("#sendNessage").click(function(){
				$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/message/selectMessage.action",
				dataType:"json",
			});	
			});
			
			
	//修改站内信状态
	$(".update").click(function(){
		var userMessageId = $(this).parents("tr").find(".msgId").html();
		//alert(userMessageId);
		$.ajax({
			url:"${pageContext.request.contextPath}/message/updateState.action",
			type:"POST",
			dataType:"json",
			data:{userMsgId:userMessageId},
			success:function(data){
			if(data.num==1){
				window.location.href="${pageContext.request.contextPath}/message/selectUserMessage.action";
			}
			},
		});
	});
	});
	
	$(".allContext").click(function(){
				var mycontext = $(this).parents("tr").find(".context").val();
				//alert(mycontext);
				$("#font-context").html(mycontext);
			});
		</script>
	</body>

</html>