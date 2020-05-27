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

		<title>供货商管理 - 供货商列表</title>

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
					<h1 class="page-header">供货商列表</h1>
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
											确认删除所选供货商信息吗
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
											<button type="button" class="btn btn-primary delete-selected-confirm">确认</button>
										</div>
									</div>
								</div>
							</div>
							<%-- <c:if test="${fn:contains(sbf, 'role-addRole')}"> --%>
								<button type="button" class="btn btn-default show-add-form" data-toggle="modal" data-target="#role-form-div">添加新供货商</button>
							<%-- </c:if> --%>
							<!--添加新供货商表单-->
							<div class="modal fade " id="role-form-div" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
								<div class="modal-dialog modal-md" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
											<h4 class="supply-form-title"></h4>
										</div>
										<div class="modal-body">
											<form class="supply-form">
												<input type="hidden" name="supplyId" class="form-control" id="supplyIdInput">
												<div class="form-group">
													<label for="numInput">供货商编号</label>
													<input type="text" name="supplyNum" class="form-control" id="numInput" placeholder="供货商编号">
												</div>
												<div class="form-group">
													<label for="nameInput">供货商名称</label>
													<input type="text" name="supplyName" class="form-control" id="nameInput" placeholder="供货商名称">
												</div>
												<div class="form-group">
													<label for="introduceInput">供货商描述</label>
													<input type="text" name="supplyIntroduce" class="form-control" id="introduceInput" placeholder="供货商描述">
												</div>
												<div class="form-group">
													<label for="concatInput">联系人</label>
													<input type="text" name="concat" class="form-control" id="concatInput" placeholder="联系人">
												</div>
												<div class="form-group">
													<label for="phoneInput">联系电话</label>
													<input type="text" name="phone" class="form-control" id="phoneInput" placeholder="联系电话">
												</div>
												<div class="form-group">
													<label for="addressInput">地址</label>
													<input type="text" name="address" class="form-control" id="addressInput" placeholder="地址">
												</div>
											</form>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
											<button type="button" class="btn btn-primary supply-submit">确定</button>
										</div>
									</div>
								</div>
							</div>
							
							<form action="${pageContext.request.contextPath}/supply/list.action" style="float: right;">
								<input type="text" placeholder="供货商名称" name="supplyName" value="${param.supplyName}"  style="width: 100px;height: 26px" />
								<input type="text" placeholder="供货商编号" name="supplyNum" value="${param.supplyNum }" style="width: 100px;height: 26px" />
								<input type="text" placeholder="联系人" name="concat" value="${param.concat }" style="width: 100px;height: 26px" />
								<input type="submit" class="btn btn-primary" value="确定查询">
							</form>
						</div>
						<div class="space-div"></div>
						<table class="table table-hover table-bordered supply-list">
							<tr>
								<td><input type="checkbox" class="select-all-btn" /></td>
								<td>ID</td>
								<td>供货商名称</td>
								<td>供货商编号</td>
								<td>供货商描述</td>
								<td>联系人</td>
								<td>联系电话</td>
								<td>地址</td>
								<td>操作</td>
							</tr>
							<c:forEach items="${supplyList}" var="supply">
								<tr>
									<td><input type="checkbox" name="supplyIds" value="${supply.supplyId}" /></td>
									<td id="supplyId1">${supply.supplyId}</td>
									<td class="supplyName1">${supply.supplyName}</td>
									<td class="supplyNum1">${supply.supplyNum}</td>
									<td class="supplyIntroduce1"><a title="${supply.supplyIntroduce}">...</a></td>
									<td class="concat1">${supply.concat}</td>
									<td class="phone1">${supply.phone }</td>
									<td class="address1">${supply.address }</td>
									<td>
										<button type="button" class="btn btn-default show-update-form" data-toggle="modal" data-target="#updateSupply">修改供货商</button>
										
										<%-- <c:if test="${fn:contains(sbf, 'role-updateState')}"> --%>
											&nbsp;&nbsp;<button type="button" class="btn btn-primary updateState" data-toggle="modal">${(supply.isDelete=='1')?'使用':'删除'}</button>
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
						<!-- 修改供货商 -->
						<div class="modal fade " id="updateSupply" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
							<div class="modal-dialog modal-sm" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
										<h4 class="modal-title">修改供货商信息</h4>
									</div>
									<div class="modal-body">
										<form class="supply-update-form">
											<div class="form-group">
												<label for="userNameInput">供货商编号</label>
												<input type="text" name="supplyNum" class="form-control" id="supplyNum" readonly="readonly">
											</div>
											<div class="form-group">
												<label for="userNameInput">供货商名称</label>
												<input type="text" name="supplyName" class="form-control" id="supplyName">
											</div>
											<div class="form-group">
												<label for="userNameInput">联系人</label>
												<input type="text" name="concat" class="form-control" id="concat">
											</div>
											<div class="form-group">
												<label for="userNameInput">联系电话</label>
												<input type="text" name="phone" class="form-control" id="phone">
											</div>
											<div class="form-group">
												<label for="userNameInput">地址</label>
												<input type="text" name="address" class="form-control" id="address">
											</div>
											<div class="roles-div">
											</div>
										</form>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
										<button type="button" class="btn btn-primary supply-update-submit">提交 </button>
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
					$(".supply-list input[type='checkbox']:gt(0)").prop("checked", true);
				} else {
					$(".supply-list input[type='checkbox']:gt(0)").prop("checked", false);
				}
			});

			//*删除
			$(".supply-list").on("click", ".updateState", function() {
				var isDelete = null;
				var is_delete = $(this).parents("tr").find(".isDelete").text();
				var supplyId = $(this).parents("tr").find("#supplyId1").html();
				if(is_delete == "使用") {
					isDelete = "1";
				} else {
					isDelete = "0";
				}
				$.ajax({
					type: "POST",
					dataType: "json",
					url: "${pageContext.request.contextPath}/supply/delete.action",
					data: {
						supplyId: supplyId,
						isDelete: isDelete
					},
					success: function(json) {
						location.reload();
					}
				});
			});
			
			//*添加供货商
			$(".supply-submit").click(function() {
				var supplyNum = $("#numInput").val();
				var supplyName = $("#nameInput").val();
				var supplyIntroduce = $("#introduceInput").val();
				var concat = $("#concatInput").val();
				var phone = $("#phoneInput").val();
				var address = $("#addressInput").val();
				$.ajax({
					type: "POST",
					dataType: "json",
					url: "${pageContext.request.contextPath}/supply/add.action",
					data: {
						supplyNum: supplyNum,
						supplyName: supplyName,
						supplyIntroduce: supplyIntroduce,
						concat: concat,
						phone: phone,
						address: address
					},
					error: function () {
						alert("465468");
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

			//修改供货商信息
			$(".supply-list").on("click",".show-update-form",function(){
				var supplyNum = $(this).parents("tr").find(".supplyNum1").html();
				$("#supplyNum").val(supplyNum);
				var supplyName = $(this).parents("tr").find(".supplyName1").html();
				$("#supplyName").val(supplyName);
				var concat = $(this).parents("tr").find(".concat1").html();
				$("#concat").val(concat);
				var phone = $(this).parents("tr").find(".phone1").html();
				$("#phone").val(phone);
				var address = $(this).parents("tr").find(".address1").html();
				$("#address").val(address);
				var supplyId = $(this).parents("tr").find("#supplyId1").text();
				$(".supply-update-submit").click(function(){
					var supplyId = $("#supplyId1").text();
					var supplyName = $("#supplyName").val();
					var concat = $("#concat").val();
					var phone = $("#phone").val();
					var address = $("#address").val();
					$.ajax({
						type:"POST",
						dataType:"json",
						url:"${pageContext.request.contextPath}/supply/update.action",
						data:{
							
							supplyId: supplyId,
							supplyName: supplyName,
							concat: concat,
							phone: phone,
							address: address
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