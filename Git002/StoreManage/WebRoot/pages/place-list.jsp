<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

		<title>产地管理 - 产地列表</title>

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
				<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
					<h1 class="page-header">产地列表</h1>
					<div class="row placeholders">
						<div>
							<!-- <button type="button" class="btn btn-warning delete-query" data-toggle="modal" data-target="#delete-confirm-dialog">删除所选</button> -->
							<!--  删除所选对话框 -->
							<div class="modal fade " id="delete-confirm-dialog" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
								<div class="modal-dialog modal-sm" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
											<h4 class="modal-title">警告</h4>
										</div>
										<div class="modal-body">
											确认删除所选产地信息吗
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
											<button type="button" class="btn btn-primary delete-selected-confirm">确认</button>
										</div>
									</div>
								</div>
							</div>
							<%-- <c:if test="${fn:contains(sbf, 'role-addRole')}"> --%>
								<button type="button" class="btn btn-default show-add-form" data-toggle="modal" data-target="#role-form-div">添加新产地</button>
							<%-- </c:if> --%>
							<!--添加新产地表单-->
							<div class="modal fade " id="role-form-div" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
								<div class="modal-dialog modal-md" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
											<h4 class="place-form-title"></h4>
										</div>
										<div class="modal-body">
											<form class="place-form">
												<input type="hidden" name="placeId" class="form-control" id="placeIdInput">
												<div class="form-group">
													<label for="nameInput">产地名称</label>
													<input type="text" name="placeName" class="form-control" id="nameInput" placeholder="产地名称">
												</div>
												<div class="form-group">
													<label for="numInput">产地编号</label>
													<input type="text" name="placeNum" class="form-control" id="numInput" placeholder="产地编号">
												</div>
												<div class="form-group">
													<label for="introduceInput">产地描述</label>
													<input type="text" name="introduce" class="form-control" id="introduceInput" placeholder="产地描述">
												</div>
											</form>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
											<button type="button" class="btn btn-primary place-submit">确定</button>
										</div>
									</div>
								</div>
							</div>
							
							<form action="${pageContext.request.contextPath}/place/list.action" style="float: right;">
								<input type="text" placeholder="产地名称" name="placeName" value="${param.placeName}"  style="width: 100px;height: 26px" />
								<input type="text" placeholder="产地编号" name="placeNum" value="${param.placeNum }" style="width: 100px;height: 26px" />
								<input type="submit" class="btn btn-primary" value="确定查询">
							</form>
						</div>
						<div class="space-div"></div>
						<table class="table table-hover table-bordered place-list">
							<tr>
								<td><input type="checkbox" class="select-all-btn" /></td>
								<td>ID</td>
								<td>产地名称</td>
								<td>产地编号</td>
								<td>产地描述</td>
								<td>操作</td>
							</tr>
							<c:forEach items="${placeList}" var="place">
								<tr>
									<td><input type="checkbox" name="roleIds" value="${place.placeId}" /></td>
									<td id="placeIdxxx">${place.placeId}</td>
									<td class="placeName">${place.placeName}</td>
									<td class="placeNum">${place.placeNum}</td>
									<td class="introduce">${place.introduce}</td>
									
									<td>
										<button type="button" class="btn btn-default show-update-form" data-toggle="modal" data-target="#updatePlace">修改产地</button>
										
										<%-- <c:if test="${fn:contains(sbf, 'role-updateState')}"> --%>
											&nbsp;&nbsp;<button type="button" class="btn btn-primary updateState" data-toggle="modal">${(place.isDelete=='1')?'使用':'删除'}</button>
										<%-- </c:if> --%>
										<%-- <c:if test="${(role.roleState)=='1'}">
											<c:if test="${fn:contains(sbf, 'role-updateAuth')}">
												&nbsp;&nbsp;<button type="button" class="btn btn-primary updateAuth" data-toggle="modal">更改权限</button>
											</c:if>
										</c:if> --%>
									</td>
								</tr>
							</c:forEach>
						</table>
						<!-- 修改产地 -->
						<div class="modal fade " id="updatePlace" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
							<div class="modal-dialog modal-sm" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
										<h4 class="modal-title">修改产地信息</h4>
									</div>
									<div class="modal-body">
										<form class="place-update-form">
											<div class="form-group">
												<label for="userNameInput">产地编号</label>
												<input type="text" name="placeNum" class="form-control" id="placeNum" readonly="readonly">
											</div>
											<div class="form-group">
												<label for="userNameInput">产地名称</label>
												<input type="text" name="placeName" class="form-control" id="placeName">
											</div>
											<div class="form-group">
												<label for="userNameInput">产地描述</label>
												<input type="text" name="introduce" class="form-control" id="introduce">
											</div>
											<div class="roles-div">
											</div>
										</form>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
										<button type="button" class="btn btn-primary update-submit">提交 </button>
									</div>
								</div>
							</div>
						</div>
						
						<jsp:include page="standard.jsp"></jsp:include>
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
		<script type="text/javascript">
		
			function getAllPerms(obj) {
				obj.html("");
			/* 	$.ajax({
					url: "listperms.html",
					type: "POST",
					dataType: "json",
					success: function(data) {
						for(var i in data) {
							obj.append('<input type="checkbox" name="permIds" value="' +
								data[i].permissionId + '"/>' + data[i].permissionDesc + ':');
							if(data[i].isNavi === 1) {
								obj.append('<font color="red">导航结点</font>');
							} else {
								obj.append("非导航结点");
							}
							obj.append("<br/>");
						}
					}
				}); */
			}
			//分页
			$(".select-all-btn").change(function() {
				if($(this).is(":checked")) { //$(this).prop("checked")
					$(".place-list input[type='checkbox']:gt(0)").prop("checked", true);
				} else {
					$(".place-list input[type='checkbox']:gt(0)").prop("checked", false);
				}
			});

			//*删除
			$(".place-list").on("click", ".updateState", function() {
				var isDelete = null;
				var is_delete = $(this).parents("tr").find(".isDelete").text();
				var placeId = $(this).parents("tr").find("#placeIdxxx").html();
				if(is_delete == "使用") {
					isDelete = "1";
				} else {
					isDelete = "0";
				}
				$.ajax({
					type: "POST",
					dataType: "json",
					url: "${pageContext.request.contextPath}/place/deletePlace.action",
					data: {
						placeId: placeId,
						isDelete: isDelete
					},
					success: function(json) {
						location.reload();
					}
				});
			});
			
			//*添加产地
			$(".place-submit").click(function() {
					var placeName = $("#nameInput").val();
					var placeNum = $("#numInput").val();
					var introduce = $("#introduceInput").val();
					$.ajax({
						type: "POST",
						dataType: "json",
						url: "${pageContext.request.contextPath}/place/addPlace.action",
						data: {
							placeName: placeName,
							placeNum: placeNum,
							introduce: introduce
						},
						success: function(json) {
							if(json.add==1){
								alert("添加成功");
								location.reload();
							}else{
								alert("添加失败");
							}
							
						}
					});
				});
			//修改产地信息
			$(".place-list").on("click",".show-update-form",function(){
				var placeNum = $(this).parents("tr").find(".placeNum").html();
				$("#placeNum").val(placeNum);
				var placeName = $(this).parents("tr").find(".placeName").html();
				$("#placeName").val(placeName);
				var introduce = $(this).parents("tr").find(".introduce").html();
				$("#introduce").val(introduce);
				var placeId = $(this).parents("tr").find("#placeIdxxx").text();
				$(".update-submit").click(function(){
					var placeName = $("#placeName").val();
					var introduce = $("#introduce").val();
					var placeId = $("#placeIdxxx").text();
					$.ajax({
						type:"POST",
						dataType:"json",
						url:"${pageContext.request.contextPath}/place/update.action",
						data:{
							
							placeId: placeId,
							placeName: placeName,
							introduce: introduce
						},
						success: function(json){
							if(json.num>0){
								alert("修改成功");
								location.reload();
							}else{
								alert("修改失败");
							}
						}
					});
				});
			});
		</script>
		<script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
		
	</body>

</html>