<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

		<title>采购管理 - 采购列表</title>

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
					<h1 class="page-header">采购单列表</h1>
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
											确认删除所选角色吗
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
											<button type="button" class="btn btn-primary delete-selected-confirm">确认</button>
										</div>
									</div>
								</div>
							</div>
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
													<label for="codeInput">角色名</label>
													<input type="text" name="roleCode" class="form-control" id="codeInput" placeholder="角色名">
												</div>
												<div class="form-group">
													<label for="roleNameInput">昵称</label>
													<input type="text" name="roleName" class="form-control" id="roleNameInput" placeholder="角色昵称">
												</div>
												<div class="form-group">
													<label for="descInput">描述</label>
													<input type="text" name="roleDesc" class="form-control" id="descInput" placeholder="角色描述">
												</div>
											</form>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
											<button type="button" class="btn btn-primary role-submit">确定</button>
										</div>
									</div>
								</div>
							</div>
							<form action="${pageContext.request.contextPath}/purchase/list.action" style="float: left; ">
								<select  name="storeId" style="width: 120px;height: 26px;margin-left: 10px;margin-right: 10px" id="storeSelect">
									<c:forEach items="${storeList}" var="store" varStatus="status">
										<option value="${store.storeId}" ${(param.storeId==store.storeId )? "selected='selected'": "" }>${store.storeName}</option>
									</c:forEach>
								</select>
								<label for="startTime">开始时间:</label>
								<input type="date" name="startTime" id="startTime" value="${param.startTime}"/>
								<label for="endTime">结束时间:</label>
								<input type="date" name="endTime" id="endTime" value="${param.endTime}"/>
								<input type="text" placeholder="商品名称" name="productName" value="${param.productName}" style="width: 100px;height: 26px" />
								<input type="text" placeholder="采购人" name="buyUser" value="${param.buyUser}" style="width: 100px;height: 26px" />
								<select name="isIn" style="width: 100px;height: 26px;margin-left: 10px;margin-right: 10px">
									<option value="">生成入库单</option>
									<option value="1" ${(param.isIn=='1' )? "selected='selected'": "" }>是</option>
									<option value="0" ${(param.isIn=='0' )? "selected='selected'": "" }>否</option>
								</select>
								<input type="submit" class="btn btn-primary show-user-form" data-toggle="modal" value="确定查询">
							</form>
						</div>
						<div class="space-div"></div>
						<table class="table table-hover table-bordered purchase-list">
							<tr>
								<td><input type="checkbox" class="select-all-btn" /></td>
								<td>仓库名</td>
								<td>商品名</td>
								<td>预计采购数量</td>
								<td>实际采购数量</td>
								<td>采购人</td>
								<td style="display:none">产品ID</td>
								<td style="display:none">仓库ID</td>
								<td style="display:none">采购单ID</td>
								<td>采购时间</td>
								<td>采购人电话</td>
								<td>入库状态</td>
								<td>操作</td>
							</tr>
							<c:forEach items="${purchases}" var="purchase">
								<tr>
									<td class="buyId"><input type="checkbox" name="buyId" class="buyIdInput" value="${purchase.buyId}"/></td>
									<td class="storeName">${purchase.storeName }</td>
									<td class="productName">${purchase.productName }</td>
									<td class="buyNum">${purchase.buyNum }</td>
									<td class="factBuyNum">${purchase.factBuyNum }</td>
									<td class="buyUser">${purchase.buyUser }</td>
									<td class="productId" style="display:none">${purchase.productId }</td>
									<td class="storeId" style="display:none">${purchase.storeId }</td>
									<td class="buyId" style="display:none">${purchase.buyId }</td>
									<td class="buyTime">
										<fmt:formatDate value="${purchase.buyTime }" pattern="yyyy-MM-dd hh:mm:ss" />
									</td>
									<td class="phone">${purchase.phone }</td>
									<td class="isIn">${(purchase.isIn=='1')?'<font style="color:green">是</font>':'<font style="color:red">否</font>'}</td>
									<td>
										<c:if test="${purchase.factBuyNum==null || purchase.factBuyNum<=0}">
											<a class="glyphicon glyphicon-pencil show-purchaseinfo-form" aria-hidden="true" title="修改采购单" href="javascript:void(0);" data-toggle="modal" data-target="#updateRole"></a>
										</c:if>
										<c:if test="${purchase.factBuyNum>0 && purchase.isIn=='0'}">
											<button type="button" class="btn btn-primary insert-inStore-form">入库</button>
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</table>
						<div class="modal fade " id="updateRole" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
							<div class="modal-dialog modal-sm" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
										<h4 class="modal-title">修改采购单</h4>
									</div>
									<div class="modal-body">
										<form class="update-userrole-form">
											<div class="form-group">
												<label for="update-buyIdInput">采购单号</label>
												<input type="text" id="update-buyIdInput" class="form-control" readonly="readonly" value="" />
												<input type="hidden" id="update-storeIdInput" value="" />
												<label for="update-storeNameInput">仓库名称</label>
												<input type="text" name="RoleCode" class="form-control" id="update-storeNameInput" readonly="readonly"/>
											</div>
											<div class="form-group">
												<input type="hidden" id="update-productIdInput" value="" />
												<label for="update-productNameInput">商品名称</label>
												<input type="text" name="RoleCode" class="form-control" id="update-productNameInput" readonly="readonly"/>
											</div>
											<div class="form-group">
												<label for="update-buyNumInput">预计采购数量</label>
												<input type="text" name="RoleCode" class="form-control" id="update-buyNumInput"/>
												<span id="update-buyNumInputError" style="color: red"></span>
											</div>
											<div class="form-group">
												<label for="update-factBuyNumInput">实际采购数量</label>
												<input type="text" name="roleName" class="form-control" id="update-factBuyNumInput"/>
												<span id="update-factBuyNumInputError" style="color: red"></span>
											</div>
											<div class="roles-div">
											</div>
										</form>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
										<button type="button" class="btn btn-primary update-purchase-submit">提交 </button>
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
				$(".role-submit").html(button);
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
			//延迟加载
			$(function(){
				//仓库下拉框的onchange事件
				$("#storeSelect").change(function(){
					var storeId = $(this).val();
					//alert("storeId="+storeId);
					window.location.href = "${pageContext.request.contextPath}/purchase/list.action?storeId="+ storeId +"";
				});
				 var flag1 = true;
				//预计采购数量失去焦点（正则表达式）
				$("#update-buyNumInput").blur(function(){
					//只能为数字，有效数字为8个，小数点后面两位小数
					if(!/^\d{1,6}\.\d{2}$/.test($("#update-buyNumInput").val())){
						$("#update-buyNumInputError").html("格式错误，保留到小数点后两位，最多8位有效数字！！！");
						//显示错误提示框
						$("#update-buyNumInputError").show();
						flag1 = false;
					}else{
						//隐藏错误提示框
						$("#update-buyNumInputError").hide();
						flag1 = true;
					}
				});
				var flag2 = false;
				//实际采购数量失去焦点（正则表达式）
				$("#update-factBuyNumInput").blur(function(){
					//只能为数字，有效数字为8个，小数点后面两位小数
					if(!/^\d{1,6}\.\d{2}$/.test($("#update-factBuyNumInput").val())){
						$("#update-factBuyNumInputError").html("格式错误，保留到小数点后两位，最多8位有效数字！！！");
						//显示错误提示框
						$("#update-factBuyNumInputError").show();
						flag2 = false;
					}else{
						//隐藏错误提示框
						$("#update-factBuyNumInputError").hide();
						flag2 = true;
					}
				});
				//更新采购单的数据回显
				$(".show-purchaseinfo-form").click(function(){
					//隐藏错误提示框
					$("#update-buyNumInputError").hide();
					//隐藏错误提示框
					$("#update-factBuyNumInputError").hide();
					//得到采购单id
					var buyId = $(this).parents("tr").find(".buyIdInput").val();
					//alert("buyId="+buyId);
					$("#update-buyIdInput").val(buyId);
					//仓库名称
					var storeName = $(this).parents("tr").find(".storeName").html();
					//alert("storeName="+storeName);
					$("#update-storeNameInput").val(storeName);
					//商品名称
					var productName = $(this).parents("tr").find(".productName").html();
					//alert("productName="+productName);
					$("#update-productNameInput").val(productName);
					//预计采购量
					var buyNum = $(this).parents("tr").find(".buyNum").html();
					//alert("buyNum="+buyNum);
					$("#update-buyNumInput").val(buyNum);
					//实际采购量
					var factBuyNum = $(this).parents("tr").find(".factBuyNum").html();
					//alert("factBuyNum="+factBuyNum); 
					$("#update-factBuyNumInput").val(factBuyNum);
					var isIn = $(this).parents("tr").find(".isIn").html();
					//如果采购单已经生成入库单
					if(isIn=="1"){
						$("#update-buyNumInput").prop("readonly",true);
						$("#update-factBuyNumInput").prop("readonly",true);
					}else{
						if(!factBuyNum || factBuyNum==0.00){
							$("#update-buyNumInput").prop("readonly",false);
							$("#update-factBuyNumInput").prop("readonly",false);
						}else {
							$("#update-buyNumInput").prop("readonly",true);
							$("#update-factBuyNumInput").prop("readonly",true);
							var buyNum = $("#update-buyNumInput").val();
							var factBuyNum = $("#update-factBuyNumInput").val();
							//alert("buyNum="+buyNum);
							//alert("factBuyNum="+factBuyNum);
						}
					}
				});
				//提交修改采购单
				$(".update-purchase-submit").click(function(){
					//采购单id
					var buyId = $("#update-buyIdInput").val();
					//预计采购量
					var buyNum = $("#update-buyNumInput").val();
					//实际采购量
					var factBuyNum = $("#update-factBuyNumInput").val();
					//alert("buyId="+buyId);
					//alert("buyNum="+buyNum);
					//alert("factBuyNum="+factBuyNum);
					//预计和实际数量格式正确,并且要求预计采购量不能为0
					//alert("flag1="+flag1);
					//alert("flag2="+flag2);
					//alert("buyNum="+buyNum);
					if(flag1 && flag2 && buyNum>0){
						$.ajax({
							type: "POST",
							dataType: "json",
							url: "${pageContext.request.contextPath}/purchase/update.action",
							data: {
								buyId: buyId,
								buyNum: buyNum,
								factBuyNum: factBuyNum
							},
							success: function(data) {
								if(data.mark != -1){
									alert("更新成功！！");
									setTimeout(function(){
										window.location.reload();
									}, 1000);
								}else{
									alert("更新失败！！");
								}
						}
						
						
						});
					
					}
				
				
				});				
				
				
				
			});
			$(".select-all-btn").change(function() {
				if($(this).is(":checked")) { //$(this).prop("checked")
					$(".role-list input[type='checkbox']:gt(0)").prop("checked", true);
				} else {
					$(".role-list input[type='checkbox']:gt(0)").prop("checked", false);
				}
			});
			//添加角色
			$(".show-add-form").click(function() {
				$(".role-submit").click(function() {
					$("#add-user-form").modal("hide");
					var roleCode = $("#codeInput").val();
					var roleName = $("#roleNameInput").val();
					var roleDesc = $("#descInput").val();
					$.ajax({
						type: "POST",
						dataType: "json",
						url: "${pageContext.request.contextPath}/role/addRole.action",
						data: {
							roleCode: roleCode,
							roleName: roleName,
							roleDesc: roleDesc
						},
						success: function(json) {
							if(json.addrole == 1) {
								$("#role-form-div").hide();
								location.reload();
							} else if(json.addrole == 0) {
								showTips("用户名已存在");
							}
						}
					});
				});
			});

			function getPermsByRoleId(roleId, doSuccess) {
				$.ajax({
					url: "showroleperms.html",
					data: { roleId: roleId },
					type: "POST",
					dataType: "json",
					success: function(data) {
						doSuccess(data);
					}
				});
			}
			$(".role-list").on("click", ".show-role-perms", function() {
				var roleId = $(this).parents("tr").find(".roleid").html();
				var rlTd = $(this).parent();
				//请求查看用户角色
				getPermsByRoleId(roleId, function(data) {
					rlTd.html("");
					for(var i in data) {
						var role = data[i].permissionDesc + "<br/>";
						rlTd.append(role);
					}
				});
			});
			$(".role-list").on("click", ".show-roleinfo-form", function() {
				getAllPerms($(".perm-inputs"));
				resetRoleForm("更新角色信息", "更新");
				var roleId = $(this).parents("tr").find(".roleid").html();
				$("input[name='roleId']").val(roleId);
				$.ajax({
					url: "getrole.html",
					data: { roleId: roleId },
					type: "POST",
					dataType: "json",
					success: function(data) {
						$("input[name='roleName']").val(data.roleName);
						$("input[name='roleDesc']").val(data.roleDesc);
						$("input[name='roleCode']").val(data.roleCode);
					}
				});
				getPermsByRoleId(roleId, function(data) {
					for(var i in data) {
						$('.role-form input[name="permIds"][value="' + data[i].permissionId + '"]').prop("checked", true);
					}
				});
			});

			$(".role-list").on("click", ".delete-this-role", function() {
				var roleTr = $(this).parents("tr");
				var roleId = roleTr.find(".roleid").html();
				if(confirm('确认删除ID为"' + roleId + '"的角色吗？')) {
					//请求删除该用户
					$.ajax({
						url: "delete.html",
						data: { roleId: roleId },
						type: "POST",
						success: function() {
							roleTr.remove();
							showTips("删除成功！");
						}
					});
				}
			});
			//入库单
			$(".purchase-list").on("click", ".insert-inStore-form", function() {
				var userTr = $(this).parents("tr");
				var inNum = userTr.find(".factBuyNum").html();
				var storeId = userTr.find(".storeId").html();
				var productId = userTr.find(".productId").html();
				var buyId = userTr.find(".buyId").find(".buyIdInput").val();
				var userId=${user.userId};
				alert("inNum="+inNum);
				if(inNum!=null && inNum!=""){
					if(confirm('确认入库订单号为"' + buyId + '"订单吗？')) {
					//请求删除该用户
					$.ajax({
						url: "${pageContext.request.contextPath}/instore/InsertInStore.action",
						data: { inNum: inNum,
						 storeId:storeId,
						 productId:productId,
						 userId:userId,
						 buyId:buyId},
						type: "POST",
						success: function() {
							userTr.remove();
							alert("入库成功！");
							location.reload();
							
						}
					});
				}
				}			
			});
		</script>
	</body>

</html>