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

		<title>仓库列表</title>

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
					<h1 class="page-header">仓库列表</h1>
					<div class="row placeholders">
						<div>
							<!-- <button type="button" class="btn btn-warning delete-query" data-toggle="modal" data-target="#delete-confirm-dialog">删除所选</button> -->
								<button type="button" class="btn btn-default show-add-form" data-toggle="modal" data-target="#role-form-div">添加仓库</button>
							<!--添加新角色表单-->
							<div class="modal fade " id="role-form-div" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
								<div class="modal-dialog modal-md" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
											<h4 class="role-form-title"></h4>
										</div>
										<div class="modal-body">
											<form class="role-form">
												<input type="hidden" name="roleId" class="form-control" id="roleIdInput">
												<div class="form-group">
													<label for="storeInput">仓库名称</label>
													<input type="text" name="storeInput" class="form-control" id="storeInput" placeholder="仓库名称">
												</div>
												<div class="form-group">
													<label for="storeNumInput">仓库编号</label>
													<input type="text" name="storeNumInput" class="form-control" id="storeNumInput" placeholder="仓库编号">
												</div>
												<div class="form-group">
													<label for="addressInput">仓库地址</label>
													<input type="text" name="addressInput" class="form-control" id="addressInput" placeholder="仓库地址">
												</div>
												<div class="form-group">
													<label for="concatInput">联系人</label>
													<input type="text" name="concatInput" class="form-control" id="concatInput" placeholder="联系人">
												</div>
												<div class="form-group">
													<label for="phoneInput">联系电话</label>
													<input type="text" name="roleDesc" class="form-control" id="phoneInput" placeholder="联系电话">
												</div>
											</form>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
											<button type="button" class="btn btn-primary store-submit">确定</button>
										</div>
									</div>
								</div>
							</div>
							<form action="${pageContext.request.contextPath}/store/queryStore.action" style="float:right;">
								<input type="text" placeholder="仓库名称" name="storeName" value="${param.storeName}" style="width: 100px;height: 26px" />
								<input type="text" placeholder="仓库地址" name="storeAddress" value="${param.storeAddress}" style="width: 100px;height: 26px" />
								<input type="text" placeholder="联系人" name="concat" value="${param.concat}" style="width: 100px;height: 26px" />
								<input type="text" placeholder="联系电话" name="phone" value="${param.phone}" style="width: 100px;height: 26px" />
								<input type="submit" class="btn btn-primary show-user-form" data-toggle="modal" value="确定查询">
							</form>
						</div>
						<div class="space-div"></div>
						<table class="table table-hover table-bordered store-list">
							<tr>
								<td><input type="checkbox" class="select-all-btn" /></td>
								<td>仓库ID</td>
								<td>仓库名称</td>
								<td>仓库编号</td>
								<td>仓库地址</td>
								<td>联系人</td>
								<td>联系电话</td>
								<td>修改</td>
							</tr>
				
							<c:forEach items="${storeList}" var="store">
								<tr>
									<td><input type="checkbox" name="storeIds" value="${store.storeId}" /></td>
									<td class="storeid">${store.storeId}</td>
									<td class="storename">${store.storeName}</td>
									<td class="storenum">${store.storeNum}</td>
									<td class="storeaddress">${store.storeAddress}</td>
									<td class="concat">${store.concat}</td>
									<td class="phone">${store.phone}</td>
									<td><a class="glyphicon glyphicon-pencil show-storeinfo-form" aria-hidden="true" title="修改仓库信息" href="javascript:void(0);" data-toggle="modal" data-target="#updateStore"></a></td>
								</tr>
							</c:forEach>
						</table>
						<div class="modal fade " id="updateStore" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" >
							<div class="modal-dialog modal-sm" role="document" style="width:350px">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
										<h4 class="modal-title">修改仓库信息</h4>
									</div>
									<div class="modal-body">
										<form class="update-userrole-form">
											<div class="form-group">
												<label for="updateStoreName">仓库名称</label>
												<input type="text" name="updateStoreName" class="form-control" id="updateStoreName">
											</div>
											<div class="form-group">
												<label for="updateStoreAddress">仓库地址</label>
												<input type="text" name="updateStoreAddress" class="form-control" id="updateStoreAddress">
											</div>
											<div class="form-group">
												<label for="updateConcat">联系人</label>
												<input type="text" name="updateConcat" class="form-control" id="updateConcat">
											</div>
											<div class="form-group">
												<label for="updatePhone">联系电话</label>
												<input type="text" name="updatePhone" class="form-control" id="updatePhone">
											</div>
											<div class="roles-div">
											</div>
										</form>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
										<button type="button" class="btn btn-primary update-store-submit">提交 </button>
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
		<script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
		<script>
			function showTips(contents) {
				$("#op-tips-content").html(contents);
				$("#op-tips-dialog").modal("show");
			}

			function resetRoleForm(title, button) {
				$(".role-form input[type='text']").val("");
				$(".role-form input[type='checkbox']").prop("checked", false);
				$(".role-form-title").html(title);
				$(".store-submit").html(button);
			}

			function getAllPerms(obj) {
				obj.html("");
				$.ajax({
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
				});
			}
			$(".select-all-btn").change(function() {
				if($(this).is(":checked")) { //$(this).prop("checked")
					$(".role-list input[type='checkbox']:gt(0)").prop("checked", true);
				} else {
					$(".role-list input[type='checkbox']:gt(0)").prop("checked", false);
				}
			});
			//更改权限
			$(".role-list").on("click", ".updateAuth", function() {
				var roleId = $(this).parents("tr").find(".roleid").html();
				var roleCode = $(this).parents("tr").find(".roleCode").html();
				window.location.href="${pageContext.request.contextPath}/role/selectAuth.action?roleId="+roleId+"&roleCode="+roleCode+"";
			});
			
			//修改回显
		var updatestoreid = null;
		 $(".store-list").on("click",".show-storeinfo-form",function(){
			updatestoreid = $(this).parents("tr").find(".storeid").html();
			$.ajax({
				url:"${pageContext.request.contextPath}/store/updateReturnStore.action",
				data:{
					storeId:updatestoreid,
       			},  
				type:"POST",
				dataType:"json",
				success:function(data){
					var storename = data.storename;
					var storeaddress = data.storeaddress;
					var concat = data.concat;
					var phone = data.phone;
					$("#updateStoreName").val(storename);
					$("#updateStoreAddress").val(storeaddress);
					$("#updateConcat").val(concat);
					$("#updatePhone").val(phone);
				}
		});
		
	}); 
		
				//获取修改后的值
				
				$(".update-store-submit").click(function() {
					var updateStoreName = $("input[name='updateStoreName']").val();
					var updateStoreAddress = $("input[name='updateStoreAddress']").val();
					var updateConcat = $("input[name='updateConcat']").val();
					var updatePhone = $("input[name='updatePhone']").val();
					$.ajax({
						type: "POST",
						dataType: "json",
						url: "${pageContext.request.contextPath}/store/updateStore.action",
						data: {
							storeId:updatestoreid,
							storeName:updateStoreName,
							storeAddress:updateStoreAddress,
							concat:updateConcat,
							phone:updatePhone
						},
						success: function(json){
							if(json.updateStore == 1){
								alert("修改成功");
								window.location.href="${pageContext.request.contextPath}/store/queryStore.action";
							} else{
								showTips("修改失败");
							}
						},error:function(){ 
							showTips("抱歉！出现了一个未知的错误！");
							window.location.href="${pageContext.request.contextPath}/store/queryStore.action"; 
                		},
					});

				});
			
			
			//添加仓库
			$(".show-add-form").click(function() {
			//添加-提交按钮
				$(".store-submit").click(function() {
					var storeName = $("#storeInput").val();
					var storeNum = $("#storeNumInput").val();
					var storeAddress = $("#addressInput").val();
					var concat = $("#concatInput").val();
					var phone = $("#phoneInput").val();
					$.ajax({
						type: "POST",
						dataType: "json",
						url: "${pageContext.request.contextPath}/store/addStore.action",
						data: {
							storeName:storeName,
							storeNum:storeNum,
							storeAddress:storeAddress,
							concat:concat,
							phone:phone
						},
						success: function(json){
							if(json.addStore == 1){
								$("#role-form-div").hide();
								window.location.href="${pageContext.request.contextPath}/store/queryStore.action"; 
							}else if(json.addStore == 0){
								showTips("仓库编码重复");
								return false;
							}
						},error:function(){ 
							showTips("抱歉！出现了一个未知的错误！");
							window.location.href="${pageContext.request.contextPath}/store/queryStore.action"; 
                		},
					});
					});
				});

			
	

			
		</script>
	</body>

</html>