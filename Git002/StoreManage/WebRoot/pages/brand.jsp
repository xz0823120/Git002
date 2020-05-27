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
				<h1 class="page-header">品牌列表</h1>
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
										确认删除所选品牌吗
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
										<button type="button" class="btn btn-primary delete-selected-confirm">确认</button>
									</div>
								</div>
							</div>
						</div>
						
						<%-- <c:if test="${fn:contains(sbf, 'user-addUser')}">--%>
							<button type="button" class="btn btn-primary show-user-form" data-toggle="modal" data-target="#add-user-form">添加新用户</button>
						<%--</c:if> --%>
						
						<!--添加新用户表单-->
						<div class="modal fade " id="add-user-form" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
							<div class="modal-dialog modal-sm" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
										<h4 class="modal-title">添加新品牌</h4>
									</div>
									<div class="modal-body">
										<form class="user-form">
											<div class="form-group">
												<label for="userNameInput">品牌名</label>
												<input type="text" name="brandName" class="form-control" id="brandNameInput" placeholder="品牌名">
												<label id="userNameError" style="color:red"></label>
											</div>
											<div class="form-group">
												<label for="passwordInput">品牌描述</label>
												<input type="text" name="brandDesc" class="form-control" id="brandDescInput" placeholder="品牌描述">
												<label id="brandDescError" style="color:red"></label>
											</div>
											
											<div class="roles-div">
											</div>
										</form>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
										<button type="button" id="addbrand" class="btn btn-primary add-user-submit">添加 </button>
									</div>
								</div>
							</div>
						</div>
						<form action="${pageContext.request.contextPath}/brand/selectBrand.action" style="float: right;">
							<input type="text" placeholder="品牌名" id="brandName" name="brandName" value="${param.brandName}" style="width: 100px;height: 26px" />
							<input type="text" placeholder="品牌名首字母" id="brandLeter" name="brandLeter" value="${param.brandLeter}" style="width: 100px;height: 26px" />
							<input type="submit" class="btn btn-primary show-user-form" data-toggle="modal" id="searchUser" value="确定查询">
						</form>
					</div>
					<div class="space-div"></div>
					<table class="table table-hover table-bordered user-list" style="text-align: center;">
						<tr>
							<td><input type="checkbox" class="select-all-btn" /></td>
							<td>ID</td>
							<td>品牌</td>
							<td>品牌名首字母</td>
							<td>品牌描述</td>
							<td>操作</td>
						</tr>
						<c:forEach items="${brandList}" var="brand">
							<tr>
								<td><input type="checkbox" name="userIds" value="${brand.brandId }" /></td>
								<td class="brandid">${brand.brandId}</td>
								<td class="brandname">${brand.brandName}</td>
								<td class="brandleter">${brand.brandLeter}</td>
								<td class="branddesc">${brand.brandDesc}</td>
								<td>
									<a class="glyphicon glyphicon-remove delete-this-user" aria-hidden="true" title="删除用户" href="javascript:void(0);"></a>
									<input type="button" class="updatebrand" value="修改信息" data-toggle="modal" data-target="#update-userrole-dialog"/>
								</td>
								<%-- <td>
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
								</td> --%>
							</tr>
						</c:forEach>
					</table>
					<jsp:include page="standard.jsp"></jsp:include>
					<!--修改用户-->
				<div class="modal fade " id="update-userrole-dialog" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
						<div class="modal-dialog modal-sm" role="document">
							<div class="modal-content">
								<div class="modal-header">
								<input type="text" id="bid" style="display: none"/>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									<h4 class="modal-title">修改品牌内容</h4>
								</div>
								<div class="modal-body">
									<form class="update-userrole-form">
										<div class="form-group">
											<label for="brandNameInput">品牌名</label>
											<input type="text" name="brandName" class="form-control" id="updateName" >
										</div>
										<div class="form-group">
											<label for="brandDescInput">品牌描述</label>
											<input type="text" name="brandDesc" class="form-control" id="updateDesc">
										</div>
										<div class="roles-div">
										</div>
									</form>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
									<button id="updatebrand" type="button" class="btn btn-primary update-userrole-submit">提交 </button>
								</div>
							</div>
						</div>
					</div> 
					<!-- 分配角色 -->
				<%-- 	<div class="modal fade " id="assign-roles" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
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
					</div> --%>
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
			$("#addbrand").click(function(){
				//获取两个添加的值
				var brandName = $("#brandNameInput").val();
				var brandDesc = $("#brandDescInput").val();
				$.ajax({
					url:"${pageContext.request.contextPath}/brand/insertBrand.action",
					type:"POST",
					dataType:"json",
					data:{
						brandName:brandName,
						brandDesc:brandDesc
					},
					success:function(data){
						if(data.addNum==1){
							alert("添加成功");
							window.location.href="${pageContext.request.contextPath}/brand/selectBrand.action";
						}
						if(data.addNum==2){
							alert("品牌名重复");
						}
					},
					error:function(){
					alert(111);
					}
				});
			});
			
			
			
			$(".user-list").on("click",".delete-this-user",function(){
			var userTr=$(this).parents("tr");
			var brandId=userTr.find(".brandid").html();
			if(confirm('确认删除ID为"'+brandId+'"的品牌吗？')){
				//请求删除该用户
				$.ajax({
					url:"${pageContext.request.contextPath}/brand/deleteBrand.action",
					data:{brandId:brandId},
					type:"POST",
					dataType:"json",
					success:function(data){
						if(data.num==1){
						userTr.remove();
						alert("删除成功！");
						}
					}
				});
			}
		});
		
		
		//修改用户信息
			
		$(".updatebrand").click(function(){
				var brandname = $(this).parents("tr").find(".brandname").html();
				$("#updateName").val(brandname);
				var branddesc = $(this).parents("tr").find(".branddesc").html();
				$("#updateDesc").val(branddesc);
				var brandid = $(this).parents("tr").find(".brandid").html();
				$("#bid").val(brandid);
			$("#updatebrand").click(function(){
					var brandName = $("#updateName").val();
					var brandDesc = $("#updateDesc").val();
					var brandId = $("#bid").val();
					alert(brandId);
					$.ajax({
						type: "POST",
						dataType: "json",
						url: "${pageContext.request.contextPath}/brand/updateBrand.action",
						data: {
							brandName: brandName,
							brandDesc: brandDesc,
							brandId:brandId
						},
						success: function(data) {
							if(data.anum==1) {
								alert("修改成功");
								window.location.href="${pageContext.request.contextPath}/brand/selectBrand.action";
							}
						}
					});
				});
			});
			 	
			
		</script>
	</body>

</html>