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

		<title>用户管理 - 用户列表</title>

		<!-- Bootstrap core CSS -->
		<link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">

		<!-- Custom styles for this template -->
		<link href="${pageContext.request.contextPath}/static/css/layout.css" rel="stylesheet">

	</head>

	<body>

		<!-- 头部 -->
		<jsp:include page="header.jsp" />

		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-3 col-md-2 sidebar">
					<jsp:include page="navibar.jsp" />
				</div>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h1 class="page-header">用户列表</h1>
				<div class="row placeholders">
					<div>
						<button type="button" class="btn btn-warning delete-query" id="exportData">数据导出</button>
						<!--  删除所选对话框 -->
						<div class="modal fade " id="delete-confirm-dialog" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
							<div class="modal-dialog modal-sm" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
										<h4 class="modal-title">警告</h4>
									</div>
									<div class="modal-body">
										确认删除所选用户吗
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
										<button type="button" class="btn btn-primary delete-selected-confirm">确认</button>
									</div>
								</div>
							</div>
						</div>
						
						<c:if test="${fn:contains(sbf, 'user-addUser')}">
							<button type="button" class="btn btn-primary show-user-form" data-toggle="modal" data-target="#add-user-form">添加新用户</button>
						</c:if>
							<button type="button" id="okAdd" class="btn btn-primary show-user-form" data-toggle="modal">保存收信人</button>
						<!--添加新用户表单-->
						<div class="modal fade " id="add-user-form" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
							<div class="modal-dialog modal-sm" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
										<h4 class="modal-title">添加新用户</h4>
									</div>
									<div class="modal-body">
										<form class="user-form">
											<div class="form-group">
												<label for="userNameInput">用户名</label>
												<input type="text" name="userName" class="form-control" id="userNameInput" placeholder="用户名">
												<label id="userNameError" style="color:red"></label>
											</div>
											<div class="form-group">
												<label for="passwordInput">密码</label>
												<input type="password" name="password" class="form-control" id="passwordInput" placeholder="密码">
												<label id="pwdError" style="color:red"></label>
											</div>
											<label>用户类型</label>
											<select id="user_type">
												<option value="1">超级管理员</option>
												<option value="2">管理员</option>
												<option value="3">普通用户</option>
											</select>
											<div class="roles-div">
											</div>
										</form>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
										<button type="button" class="btn btn-primary add-user-submit">添加 </button>
									</div>
								</div>
							</div>
						</div>
						<form action="${pageContext.request.contextPath}/user/list.action" style="float: right;">
							<input type="text" placeholder="用户名" id="userByCode" name="userCode" value="${param.userCode}" style="width: 100px;height: 26px" />
							<select id="userByType" name="userType" style="width: 100px;height: 26px;margin-left: 10px">
								<option value="">用户类型</option>
								<option value="1" ${(param.userType=='1' )? "selected='selected'": "" }>超级管理员</option>
								<option value="2" ${(param.userType=='2' )? "selected='selected'": "" }>管理员</option>
								<option value="3" ${(param.userType=='3' )? "selected='selected'": "" }>普通用户</option>
							</select>
							<select id="userByState" name="userState" style="width: 100px;height: 26px;margin-left: 10px;margin-right: 10px">
								<option value="">用户状态</option>
								<option value="0" ${(param.userState=='0' )? "selected='selected'": "" }>禁用</option>
								<option value="1" ${(param.userState=='1' )? "selected='selected'": "" }>启用</option>
							</select>
							<input type="submit" class="btn btn-primary show-user-form" data-toggle="modal" id="searchUser" value="确定查询">
						</form>
					</div>
					<div class="space-div"></div>
					<table class="table table-hover table-bordered user-list" >
						<tr>
							<td><input type="checkbox" class="select-all-btn" /></td>
							<td>ID</td>
							<td>用户名</td>
							<td>用户昵称</td>
							<td>用户类型</td>
							<td>用户状态</td>
							<td>创建人</td>
							<td>创建时间</td>

							<td>操作</td>
						</tr>
						<!--  <tr>
                	<td><input type="checkbox" name="userIds" value="11"/></td>
                    <td class="userid">1</td>
                    <td class="username">sisu</td>
                    <td><a href="javascript:void(0);" class="show-user-roles" >查看所有角色</a></td>
                    <td>
                    	<a class="glyphicon glyphicon-wrench show-userrole-form" aria-hidden="true" title="修改所有角色" href="javascript:void(0);" data-toggle="modal" data-target="#update-userrole-dialog"></a>
                    	<a class="glyphicon glyphicon-remove delete-this-user" aria-hidden="true" title="删除用户" href="javascript:void(0);"></a>
                    </td>
                </tr>-->
						<c:forEach items="${users}" var="user">
							<tr>
								<td class="userChangeId"><input class="userIds" type="checkbox" name="userIds" value="${user.userId }" /></td>
								<td class="userid">${user.userId}</td>
								<td class="usercode">${user.userCode}</td>
								<td class="username">${user.userName}</td>
								<td class="usertype">${(user.userType=='1')?'超级管理员':(user.userType=='2')?'管理员':'普通用户'}</td>
								<td class="userstate">${(user.userState=='0')?'<font style="color:red">禁用</font>':'<font style="color:green">启用</font>'}</td>
								<td class="createBy">${user.getCode}</td>
								<td class="createtime">
									<fmt:formatDate value="${user.createTime}" pattern="yyyy-MM-dd" />
								</td>
								<td>
									<c:if test="${fn:contains(sbf, 'user-updateUser')}">
										<a class="glyphicon glyphicon-wrench show-userrole-form" aria-hidden="true" title="修改用户" href="javascript:void(0);" data-toggle="modal" data-target="#update-userrole-dialog"></a>
									</c:if>
									
									<c:if test="${fn:contains(sbf, 'user-deleteUser')}">
										<a class="glyphicon glyphicon-remove delete-this-user" aria-hidden="true" title="删除用户" href="javascript:void(0);"></a>
									</c:if>
									
									<c:if test="${fn:contains(sbf, 'user-updateState')}">
										<button type="button" class="btn btn-warning delete-query" data-toggle="modal" id="updateUserState">${(user.userState=='0')?'启用':'禁用'}</button>
             					  	</c:if>
									
									<c:if test="${fn:contains(sbf, 'user-resetPwd')}">
										<button type="button" class="btn btn-primary show-user-form" data-toggle="modal" id="updateUserPwd">重置密码</button>
									</c:if>
									
									<c:if test="${fn:contains(sbf, 'user-assignRole')}">
										<button type="button" class="btn btn-primary show-user-form" data-toggle="modal" id="assignRoles" data-target="#assign-roles">分配角色</button>
									</c:if>
									<c:if test="${(user.userState)=='1'}">
										<c:if test="${fn:contains(sbf, 'user-updateAuth')}">
											<button type="button" class="btn btn-primary show-user-form" data-toggle="modal" id="updateAuth" >更改权限</button>
										</c:if>
									</c:if>
								</td>
							</tr>
						</c:forEach>
					</table>
					<jsp:include page="standard.jsp"></jsp:include>
					<!--修改用户-->
					<div class="modal fade " id="update-userrole-dialog" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
						<div class="modal-dialog modal-sm" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									<h4 class="modal-title">修改用户角色</h4>
								</div>
								<div class="modal-body">
									<form class="update-userrole-form">
										<div class="form-group">
											<label for="userNameInput">用户名</label>
											<input type="text" name="userName" class="form-control" id="updateCode" readonly="readonly">
										</div>
										<div class="form-group">
											<label for="userNameInput">更改昵称</label>
											<input type="text" name="userName" class="form-control" id="updateName">
										</div>
										<label>用户类型</label>
										<select id="update_type">
											<option value="1">超级管理员</option>
											<option value="2">管理员</option>
											<option value="3">普通用户</option>
										</select>
										<div class="roles-div">
										</div>
									</form>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
									<button type="button" class="btn btn-primary update-userrole-submit">提交 </button>
								</div>
							</div>
						</div>
					</div>
					<!-- 分配角色 -->
					<div class="modal fade " id="assign-roles" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
						<div class="modal-dialog modal-sm" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									<h4 class="modal-title">分配角色</h4>
								</div>
								<div class="modal-body">
									<form class="user-form">
										<div class="form-group">
											<label for="userNameInput">用户名</label>
											<input type="text" name="userName" class="form-control" id="User_Code" placeholder="用户名" readonly="readonly">
											<label id="userNameError" style="color:red"></label>
										</div>
										<div class="form-group">
											<label for="passwordInput">角色：</label><br>
											<c:forEach items="${roleList}" var="role">

												<input type="checkbox" name="roleName" value="${role.roleId}" />${role.roleName}&nbsp;&nbsp;

											</c:forEach>
										</div>

										<div class="roles-div">
										</div>
									</form>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
									<button type="button" class="btn btn-primary confirm-assign">确定分配 </button>
								</div>
							</div>
						</div>
					</div>
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
		<script src="${pageContext.request.contextPath}/static/js/jquery.cookie.js"></script>
		<script>
			function getAllRoles(obj) {
				obj.html("");
				$.ajax({
					url: "listRoles.html",
					type: "POST",
					dataType: "json",
					success: function(data) {
						for(var i in data) {
							obj.append("<input type='checkbox' name='roleIds' value='" +
								data[i].roleId + "'/>" + data[i].roleName + ":" + data[i].roleDesc);
							obj.append("<br/>");
						}
					}
				});
			}

			function showTips(content) {
				$("#op-tips-content").html(content);
				$("#op-tips-dialog").modal("show");
			}
			$(".select-all-btn").change(function() {
				if($(this).is(":checked")) { //$(this).prop("checked")
					$(".user-list input[type='checkbox']:gt(0)").prop("checked", true);
				} else {
					$(".user-list input[type='checkbox']:gt(0)").prop("checked", false);
				}
			});

			$(".show-user-form").click(function() {
				getAllRoles($(".user-form .roles-div"));
			});
			//更改权限
			$(".user-list").on("click", "#updateAuth", function() {
				var userId = $(this).parents("tr").find(".userid").html();
				var userCode = $(this).parents("tr").find(".usercode").html();
				window.location.href="${pageContext.request.contextPath}/user/updateAuth.action?userId="+userId+"&userCode="+userCode+"";
					
			});
			//分配角色
			$(".user-list").on("click", "#assignRoles", function() {
				var userId = $(this).parents("tr").find(".userid").html();
				var userName = $(this).parents("tr").find(".username").html();
				$("#User_Code").val(userName);
				$("input[name='roleName']").each(function() {
					$(this).prop("checked", false);
				});
				if(!!userId) {
					$.ajax({
						url: "${pageContext.request.contextPath}/user/findRole.action",
						data: { userId: userId },
						type: "POST",
						dataType: "json",
						success: function(data) {
							var check = data.RoleID;
							var checkArr = check.split(",");
							$("input[name='roleName']").each(function() {
								for(var i = 0; i < checkArr.length; i++) {
									if(checkArr[i] == $(this).val()) {
										$(this).prop("checked", true);
									}
								}
							});
						}
					});
				}
				$(".confirm-assign").click(function() {
					var roleId = "";
					var length = $("input[name='roleName']:checked").length;
					$("input[name='roleName']:checked").each(function(i) {
						if(length == 1 || length == i + 1) {
							roleId += $(this).val();
						} else {
							roleId += $(this).val() + ",";
						}
					});
					$.ajax({
						type: "POST",
						dataType: "json",
						url: "${pageContext.request.contextPath}/user/assignRole.action",
						data: {
							userId: userId,
							roleId: roleId
						},
						success: function(json) {
							if(json.assign == '1') {
								alert("分配成功");
								location.reload();
							} else if(json.assign == '0') {
								alert("分配失败");
							}
						}
					});
				});
			});
			//数据导出
			$("#exportData").click(function(){
				var userCode = $("#userByCode").val();
				var userType = $("#userByType").val();
				var userState = $("#userByState").val();
				var pageNum = ${Page.pageNum}
				var currNo = ${Page.currNo}
				var pageIndex = (currNo-1)*pageNum;
				window.location.href = "${pageContext.request.contextPath}/user/exportTable.action?userCode="+userCode+"&userType="+userType+"&userState="+userState+"&pageNum="+pageNum+"&pageIndex="+pageIndex+"";
			});
			//添加用户
			$(document).ready(function() {
				$("#userNameError").hide();
				$("#pwdError").hide();
				//用户名验证
				$("#userNameInput").blur(function() {
					if(!/^\w{4,16}$/.test($("#userNameInput").val())) {
						$("#userNameError").html("用户名格式错误，4-16位，字母，数字，下划线");
						$("#userNameError").show();
						$("#pwdError").hide();
					} else {
						$("#userNameError").hide();
					}
				});
				//密码校验
				$("#passwordInput").blur(function() {
					var password = $("#passwordInput").val();
					$("#userNameError").hide();
					if(!password) {
						$("#pwdError").html("密码不能为空！");
						$("#pwdError").show();
					} else if(!/^\w{4,16}$/.test(password)) {
						$("#pwdError").html("密码格式错误");
						$("#pwdError").show();
					} else {
						$("#pwdError").hide();
					}
				});

				$(".add-user-submit").click(function() {
					$("#add-user-form").modal("hide");
					var username = $("#userNameInput").val();
					var password = $("#passwordInput").val();
					var user_type = $("#user_type").val();
					var createBy = $(".userid").html();
					//请求添加新用户
					$.ajax({
						url: "${pageContext.request.contextPath}/user/addUser.action",
						data: {
							userName: username,
							userCode: username,
							userPwd: password,
							userType: user_type,
							createBy: createBy
						},
						type: "POST",
						dataType: "json",
						success: function(json) {
							if(json.insert == 1) {
								$("#add-user-form").hide();
								location.reload();
							} else if(json.insert == 0) {
								showTips("用户名已存在");
							}
						}
					});
				});
			});
			//删除用户
			$(".user-list").on("click", ".delete-this-user", function() {
				var userTr = $(this).parents("tr");
				var userCode = userTr.find(".usercode").html();
				
				
				var userid = userTr.find(".userid").html();
				if(confirm('确认删除用户名为"' + userCode + '"的用户吗？')) {
					//请求删除该用户
					$.ajax({
						url: "${pageContext.request.contextPath}/user/deleteUser.action",
						data: { userId: userid },
						type: "POST",
						success: function() {
							userTr.remove();
							alert("删除成功！");
							location.reload();
						}
					});
				}
			});
			//修改用户信息
			$(".user-list").on("click", ".show-userrole-form", function() {
				var userCode = $(this).parents("tr").find(".usercode").html();
				$("#updateCode").val(userCode);
				var userName = $(this).parents("tr").find(".username").html();
				$("#updateName").val(userName);
				var userid = $(this).parents("tr").find(".userid").html();
				$(".update-userrole-submit").click(function() {
					var user_name = $("#updateName").val();
					var user_type = $("#update_type").val();
					$.ajax({
						type: "POST",
						dataType: "json",
						url: "${pageContext.request.contextPath}/user/updateUser.action",
						data: {
							userName: user_name,
							userType: user_type,
							userId: userid,
						},
						success: function(json) {
							if(json.updateUser > 0) {
								location.reload();
							}
						}
					});
				});
			});
			//修改用户状态
			$(".user-list").on("click", "#updateUserState", function() {
				var userState = null;
				var user_state = $(this).parents("tr").find(".userstate").text();
				var userid = $(this).parents("tr").find(".userid").html();
				if(user_state == "禁用") {
					userState = "1";
				} else {
					userState = "0";
				}
				$.ajax({
					type: "POST",
					data: {
						userId: userid,
						userState: userState
					},
					url: "${pageContext.request.contextPath}/user/updateState.action",
					dataType: "json",
					success: function(json) {
						if(json.updateState == 1) {
							location.reload();
						}
					}
				});

			});
			//重置密码
			$(".user-list").on("click", "#updateUserPwd", function() {
				var userid = $(this).parents("tr").find(".userid").html();
				$.ajax({
					type: "POST",
					data: {
						userId: userid
					},
					url: "${pageContext.request.contextPath}/user/updatePwd.action",
					dataType: "json",
					success: function(json) {
						if(json.updatePwd == 1) {
							showTips("密码重置成功！");
						}
					}
				});

			});

			function getRolesByUserName(username, doSuccess) {
				$.ajax({
					url: "showroles.html",
					data: { userName: username },
					type: "POST",
					dataType: "json",
					success: function(data) {
						doSuccess(data);
					}
				});
			}
			$(".user-list").on("click", ".show-user-roles", function() {
				var username = $(this).parents("tr").find(".username").html();
				var urTd = $(this).parent();
				//请求查看用户角色
				/*$.ajax({
					url:"showroles.html",
					data:{userName:username},
					type:"POST",
					dataType:"json",
					success:function(data){
						for(var i in data){
							var role=data[i].roleName+":"+data[i].roleDesc+"<br/>";
							urObj.append(role);
						}
					}
				});*/
				getRolesByUserName(username, function(data) {
					urTd.html("");
					for(var i in data) {
						var role = data[i].roleName + ":" + data[i].roleDesc + "<br/>";
						urTd.append(role);
					}
				});
			});
			$(".user-list").on("click", ".show-userrole-form", function() {
				var userid = $(this).parents("tr").find(".userid").html();
				var username = $(this).parents("tr").find(".username").html();
				$(".update-userrole-form input[name='userId']").val(userid);
				//获取当前用户当前角色
				getAllRoles($(".update-userrole-form .roles-div"));
				getRolesByUserName(username, function(data) {
					for(var i in data) {
						$('.update-userrole-form input[name="roleIds"][value="' + data[i].roleId + '"]').prop("checked", true);
					}
				});
			});
			//确认修改用户角色
			$(".update-userrole-submit").click(function() {
				$.ajax({
					url: "corelationRole.html",
					data: $(".update-userrole-form").serialize(),
					type: "POST",
					success: function() {
						$("#update-userrole-dialog").modal("hide");
						showTips("更新成功！");
					}
				});
			});
			
			
			$.cookie("idstr",null);
			$.cookie("namestr",null);
			//$.cookie("idstr",null);
			//$.cookie("namestr",null);
			$(".userIds").change(function(){
				var idstr = $(this).parents("tr").find(".userIds").val();
				var namestr = $(this).parents("tr").find(".usercode").html();
				$.cookie("idstr",$.cookie("idstr")+","+idstr);
				$.cookie("namestr",$.cookie("namestr")+","+namestr);
				//alert($.cookie("idstr"));
				//alert($.cookie("namestr"));
					$("#okAdd").click(function(){
						var ids = $.cookie("idstr");
						var names = $.cookie("namestr");
						//$.cookie("idstr",null);
						//$.cookie("namestr",null);
						window.location.href = "${pageContext.request.contextPath}/message/idandnamecode.action?ids="+ids+"&names="+names+"";
					});
			});
			
			$("#okAdd").click(function(){
			/* var a = "";
				for(var i= 0;i<5;i++){
					a+=$.cookie("idstr")+",";
				}
				*/
				//alert($.cookie("idstr"));
			});
		/* 	$("#okAdd").click(function(){
				var uidstr = "";
				var namestr = "";
				for(var i = 0;i<5000;i++){
					if($.cookie(""+i) != null ){
					uidstr+=","+$.cookie(""+i);
					namestr+=","+$.cookie("name"+i);
					}
				}
				uidstr=uidstr+",";
				alert(uidstr);
				alert(namestr);
				
				for(var j = 0;j<5000;j++){
					$.cookie(""+j,null);
					$.cookie("namestr"+j,null);
				}
				window.location.href = "${pageContext.request.contextPath}/message/selectMessage.action?uidstr="+uidstr+"&namestr="+namestr+"";
			}); */
		</script>
	</body>

</html>