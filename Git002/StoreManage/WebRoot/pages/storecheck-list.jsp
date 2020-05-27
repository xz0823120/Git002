<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<title>仓库管理--盘点列表</title>

<!-- Bootstrap core CSS -->
<link
	href="${pageContext.request.contextPath}/static/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath}/static/css/layout.css"
	rel="stylesheet">
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
				<h1 class="page-header">盘点列表</h1>
				<div class="row placeholders">
					<div>
						<!-- <button type="button" class="btn btn-warning delete-query" data-toggle="modal" data-target="#delete-confirm-dialog">删除所选</button> -->
						<!--  删除所选对话框 -->
						<div class="modal fade " id="delete-confirm-dialog" tabindex="-1"
							role="dialog" aria-labelledby="mySmallModalLabel">
							<div class="modal-dialog modal-sm" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
										<h4 class="modal-title">警告</h4>
									</div>
									<div class="modal-body">确认删除所选盘点表吗</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">取消</button>
										<button type="button"
											class="btn btn-primary delete-selected-confirm">确认</button>
									</div>
								</div>
							</div>
						</div>
						 
						<c:if test="${fn:contains(sbf, 'role-addRole')}">
							
						</c:if>
						
						<!--添加新角色表单-->
						<div class="modal fade " id="role-form-div" tabindex="-1"
							role="dialog" aria-labelledby="mySmallModalLabel">
							<div class="modal-dialog modal-md" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
										<h4 class="role-form-title"></h4>
									</div>
									<form class="role-form" action="${pageContext.request.contextPath}/store/updatestocktakingstate.action">
									<div class="modal-body">
										
											<input type="hidden" name="roleId" class="form-control" 
												id="roleIdInput">
											<div class="form-group">
												<label for="codeInput">盘点</label> <input type="text"
													name="checkNum" class = "checkNumText"  id="checkNumText"
													placeholder="盘点">
											</div>
											<div class="form-group">
												<label for="roleNameInput">损耗</label> <input type="text"
													name="lossNum"  class = "lossNumText" id="lossNumText"
													placeholder="损耗">
											</div>
											<div class="form-group">
												<label for="descInput">原因</label> <textarea type="text"
													name="reson" class = "resonText" id="resonText"
													placeholder="原因"></textarea>
											</div>
											<div class="form-group" style = "display:none">
												<label for="descInput">recordId</label> 
												<input name="recordId" type = "text" class = "resonText" id="roleDescrecordId">
											</div>
										
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">取消</button>
										<button  type="submit" class="btn btn-defaultsbmit" onclick="return test()">确定</button>
									</div>
									</form>
								</div>
							</div>
						</div>
						
						
						<label>选择仓库</label> 
							<select id="chooseStore" name="chooseStore">
								<c:forEach items="${store}" var="store" varStatus="status">
									<option value="${store.storeId}">${store.storeName}</option>
								</c:forEach>
							</select> 
						<form action="${pageContext.request.contextPath}/store/stocktakingSearch.action"
							style="float: right;">
							<input type = "date" id = "timeToBegin" name = "timeToBegin" value = "">起始时间</input>
							<input type = "date" id = "timeToEnd" name = "timeToEnd" value = "">截止时间</input>
							
							<input type="text" placeholder="商品名称" name="productName"
								value="${param.productName}" style="width: 100px;height: 26px" />
							<select name="checkState"
								style="width: 100px;height: 26px;margin-left: 10px;margin-right: 10px">
								<option value="">状态</option>
								<option value="1"
									${(param.roleState=='0' )? "selected='selected'": "" }>已提交</option>
								<option value="0"
									${(param.roleState=='1' )? "selected='selected'": "" }>未提交</option>
							</select> 
							
							<input type="submit" class="btn btn-primary show-user-form"
								data-toggle="modal" value="确定查询">
						</form>
					</div>
					<div class="space-div"></div>
					<table class="table table-hover table-bordered role-list">
						<tr>

							<td>仓库名称</td>
							<td>状态</td>
							<td>商品名称</td>
							<td>盘点批次</td>
							<td>盘点数量</td>
							<td>盘点时间</td>
							<td>损耗</td>
							<td>损耗原因</td>
							<td>修改</td>
							<td>提交</td>
						</tr>
						<!--  <tr>
                	<td><input type="checkbox" name="roleIds"/></td>
                    <td class="roleid">11</td>
                    <td>用户管理员</td>
                    <td>用户管理</td>
                    <td>user_admin</td>
                    <td><a href="javascript:void(0);" class="show-role-perms" >查看所有权限</a></td>
                    <td><a class="glyphicon glyphicon-pencil show-roleinfo-form" aria-hidden="true" title="修改角色信息" href="javascript:void(0);" data-toggle="modal" data-target="#role-form"></a>
                    	<a class="glyphicon glyphicon-remove delete-this-role" aria-hidden="true" title="删除角色" href="javascript:void(0);"></a></td>
                </tr>-->
						<c:forEach items="${Page.resultList}" var="storecheck">
							<tr>
								<td class="storeId">${storecheck.storeName}</td>
								<td class="storeIdrecordId" style = "display:none">${storecheck.recordId}</td>
								<td class="recordId">${(storecheck.checkState =='1')?'<font style="color:green">已提交</font>':'<font style="color:red">未提交</font>'}</td>
								<td class="productId">${storecheck.productName}</td>
								<td class="batchId">${storecheck.batchNum}</td>
								<td class="checkNum">${storecheck.checkNum}
								</td>
								<td class="checkTime"><fmt:formatDate
										value="${storecheck.checkTime}" pattern="yyyy-MM-dd" /></td>
								<td class="lossNum">${storecheck.lossNum}
								
								</td>
								<td class="reson">${storecheck.reson}
								<c:if test="${storecheck.checkState == '0'}">
								<td><button type="button" class="btn btn-default show-add-form"
								data-toggle="modal" data-target="#role-form-div" id = "btn-defaultshow-add-form">修改</button></td>
							
								
								<td class ="btn btn-default show-add-form"><button class ="btn btn-default show-add-formtijiao" type="button" value="提交">提交</button></td>
									</c:if>
							</tr>
						</c:forEach>
					</table>
					<div class="modal fade " id="updateRole" tabindex="-1"
						role="dialog" aria-labelledby="mySmallModalLabel">
						<div class="modal-dialog modal-sm" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title">修改角色信息</h4>
								</div>
								<div class="modal-body">
									<form class="update-userrole-form">
										<div class="form-group">
											<label for="userNameInput">角色名</label> <input type="text"
												name="RoleCode" class="form-control" id="roleCode"
												readonly="readonly">
										</div>
										<div class="form-group">
											<label for="userNameInput">更改昵称</label> <input type="text"
												name="roleName" class="form-control" id="roleName">
										</div>
										<div class="form-group">
											<label for="userNameInput">更改描述</label> <input type="text"
												name="roleDesc" class="form-control" id="roleDesc">
										</div>
										<div class="roles-div"></div>
									</form>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">取消</button>
									<button type="button"
										class="btn btn-primary update-role-submit">提交</button>
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
	<div class="modal fade" id="op-tips-dialog" tabindex="-1" role="dialog"
		aria-labelledby="mySmallModalLabel">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">提示信息</h4>
				</div>
				<div class="modal-body" id="op-tips-content"></div>
			</div>
		</div>
	</div>
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script
		src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
	<script>
		
		function test(){
	
			var re = /^[0-9]*$/;
			 var str1 = $(".checkNumText").val();
			var str2 = $(".lossNumText").val();
			
			if(re.test(str1)&&re.test(str2)){
			
			return true;}
			else{
			alert("格式不正确，请重新检查");
			return false;
			} 
		
		};
		
		$(".role-list").on("click", "#btn-defaultshow-add-form", function(){
			var recordId =  $(this).parents("tr").find(".storeIdrecordId").text();
			alert(recordId);
			$("#roleDescrecordId").val(recordId);
			});
		$(".role-list").on("click", ".show-add-formtijiao", function(){
			var recordId =  $(this).parents("tr").find(".storeIdrecordId").text();
			location.href="updatestocktakingstatetext.action?recordId="+recordId;
			
			});
		$("#").click(function(){
			var recordId = $(this).parents("form").find("div").find("input").html();
			var checkNum = $("#checkNumText").parents("tr").find(".checkNumText").val();
			var lossNum = $(this).parents("tr").find(".lossNumText").val();
			var reson = $(this).parents("tr").find(".resonText").val();
			alert(checkNum+recordId+lossNum+reson);
			$.ajax({
				url : "#",
				data : {
					recordId:recordId,
					lossNum:lossNum,
					checkNum:checkNum,
					reson:reson
					
				},
				type : "POST",
				dataType : "json",
				success : function(json) {
					if(json.msg == 1){
						location.href="AuthManage/store/stocktakingSearch.action";
						alert(121212);
						
					};
				}
			});
		});
		$("#chooseStore").change(function(){
		var id = $("#chooseStore").val();
			location.href="stocktakingSearch.action?storeId="+id;
		
		});
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
						url : "listperms.html",
						type : "POST",
						dataType : "json",
						success : function(data) {
							for ( var i in data) {
								obj
										.append('<input type="checkbox" name="permIds" value="' +
								data[i].permissionId + '"/>'
												+ data[i].permissionDesc + ':');
								if (data[i].isNavi === 1) {
									obj.append('<font color="red">导航结点</font>');
								} else {
									obj.append("非导航结点");
								}
								obj.append("<br/>");
							}
						}
					});
		}
		$(".select-all-btn").change(
				function() {
					if ($(this).is(":checked")) { //$(this).prop("checked")
						$(".role-list input[type='checkbox']:gt(0)").prop(
								"checked", true);
					} else {
						$(".role-list input[type='checkbox']:gt(0)").prop(
								"checked", false);
					}
				});
		//更改权限
		$(".role-list")
				.on(
						"click",
						".updateAuth",
						function() {
							var roleId = $(this).parents("tr").find(".roleid")
									.html();
							var roleCode = $(this).parents("tr").find(
									".roleCode").html();
							window.location.href = "${pageContext.request.contextPath}/role/selectAuth.action?roleId="
									+ roleId + "&roleCode=" + roleCode + "";
						});

		//修改角色信息
		$(".role-list")
				.on(
						"click",
						".show-roleinfo-form",
						function() {
							var roleCode = $(this).parents("tr").find(
									".roleCode").html();
							$("#roleCode").val(roleCode);
							var role_name = $(this).parents("tr").find(
									".roleName").html();
							$("#roleName").val(role_name);
							var roleId = $(this).parents("tr").find(".roleid")
									.html();
							$(".update-role-submit")
									.click(
											function() {
												var roleName = $("#roleName")
														.val();
												var roleDesc = $("#roleDesc")
														.val();
												$
														.ajax({
															type : "POST",
															dataType : "json",
															url : "${pageContext.request.contextPath}/role/updateRole.action",
															data : {
																roleId : roleId,
																roleName : roleName,
																roleDesc : roleDesc
															},
															success : function(
																	json) {
																if (json.updateRole == 1) {
																	alert("修改成功");
																	location
																			.reload();
																} else {
																	showTips("修改失败");
																}
															}
														});

											});
						});
		//修改状态
		$(".role-list")
				.on(
						"click",
						".updateState",
						function() {
							var roleState = null;
							var role_state = $(this).parents("tr").find(
									".roleState").text();
							var roleid = $(this).parents("tr").find(".roleid")
									.html();
							if (role_state == "禁用") {
								roleState = "1";
							} else {
								roleState = "0";
							}
							$
									.ajax({
										type : "POST",
										dataType : "json",
										url : "${pageContext.request.contextPath}/role/updateState.action",
										data : {
											roleId : roleid,
											roleState : roleState
										},
										success : function(json) {
											if (json.updateState > 0) {
												location.reload();
											} else {
												showTips("修改失败");
											}
										}
									});
						});
		//添加角色
		$(".show-add-form")
				.click(
						function() {
							$(".role-submit")
									.click(
											function() {
												$("#add-user-form").modal(
														"hide");
												var roleCode = $("#codeInput")
														.val();
												var roleName = $(
														"#roleNameInput").val();
												var roleDesc = $("#descInput")
														.val();
												$
														.ajax({
															type : "POST",
															dataType : "json",
															url : "${pageContext.request.contextPath}/role/addRole.action",
															data : {
																roleCode : roleCode,
																roleName : roleName,
																roleDesc : roleDesc
															},
															success : function(
																	json) {
																if (json.addrole == 1) {
																	$(
																			"#role-form-div")
																			.hide();
																	location
																			.reload();
																} else if (json.addrole == 0) {
																	showTips("用户名已存在");
																}
															}
														});
											});
						});

		function getPermsByRoleId(roleId, doSuccess) {
			$.ajax({
				url : "showroleperms.html",
				data : {
					roleId : roleId
				},
				type : "POST",
				dataType : "json",
				success : function(data) {
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
				for ( var i in data) {
					var role = data[i].permissionDesc + "<br/>";
					rlTd.append(role);
				}
			});
		});
		$(".role-list").on(
				"click",
				".show-roleinfo-form",
				function() {
					getAllPerms($(".perm-inputs"));
					resetRoleForm("更新角色信息", "更新");
					var roleId = $(this).parents("tr").find(".roleid").html();
					$("input[name='roleId']").val(roleId);
					$.ajax({
						url : "getrole.html",
						data : {
							roleId : roleId
						},
						type : "POST",
						dataType : "json",
						success : function(data) {
							$("input[name='roleName']").val(data.roleName);
							$("input[name='roleDesc']").val(data.roleDesc);
							$("input[name='roleCode']").val(data.roleCode);
						}
					});
					getPermsByRoleId(roleId, function(data) {
						for ( var i in data) {
							$(
									'.role-form input[name="permIds"][value="'
											+ data[i].permissionId + '"]')
									.prop("checked", true);
						}
					});
				});

		$(".role-list").on("click", ".delete-this-role", function() {
			var roleTr = $(this).parents("tr");
			var roleId = roleTr.find(".roleid").html();
			if (confirm('确认删除ID为"' + roleId + '"的角色吗？')) {
				//请求删除该用户
				$.ajax({
					url : "delete.html",
					data : {
						roleId : roleId
					},
					type : "POST",
					success : function() {
						roleTr.remove();
						showTips("删除成功！");
					}
				});
			}
		});
		$().ready();
		
	</script>
</body>

</html>