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

		<title>权限管理 - 权限列表</title>
		<!-- Bootstrap core CSS -->
		<link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
		<!-- Custom styles for this template -->
		<link href="${pageContext.request.contextPath}/static/css/layout.css" rel="stylesheet">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/static/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/static/zTree/css/demo.css" type="text/css">
		<script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/static/zTree/js/jquery.ztree.core.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/static/zTree/js/jquery.ztree.excheck.js"></script>
		<script type="text/javascript">
			var setting = {

				check: {
					enable: true,
					chkStyle: "radio", //单选框
					radioType: "all" //对所有节点设置单选
				},

				/*  check:{//使用复选框
                enable:true
            	},  */
				data: {
					simpleData: { //是否使用简单数据模式
						enable: true
					}
				},
				/*  callback:{
				     onCheck:onCheck
				 }  */
				view: {
					fontCss: getFont,
					namelsHTML: true
				}
			};
			//id 标识 ，pId 父id，name 名称，open 是否展开节点， checked  是否选中        
			var zNodes = ${jsonArray};

			function getFont(treeId, node) {
				return node.font ? node.font : {};
			}
			$(document).ready(function() {
				$.fn.zTree.init($("#treeDemo"), setting, zNodes);
			});
			//请求添加权限        
			$(document).ready(function() {
				$("#CodeDiv").hide();
				$("#URLDiv").hide();
				$("#authCodeError").hide();
				$("#authOrderError").hide();
				$("#authUrlError").hide();
				var flag1 = true;
				var flag2 = true;
				var flag3 = true;
				//隐藏/显示url和code框
				$("#authType").change(function() {
					var authType = $("#authType").val();
					if(authType == 2) {
						$("#URLDiv").show();
						$("#CodeDiv").hide();
					} else if(authType == 3) {
						$("#CodeDiv").show();
						$("#URLDiv").hide();
					} else if(authType == 1) {
						$("#CodeDiv").hide();
						$("#URLDiv").hide();
					}
				});
				//获取父id
				var parentId = 0;
				$(".show-add-form").click(function() {
					var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
					nodes = treeObj.getCheckedNodes(true);
					for(var i = 0; i < nodes.length; i++) {
						if(nodes[i].id != null && nodes[i].id != "") {
							parentId += nodes[i].id;
						} else {
							parentId = 0;
						}
					};
				});
				//URL非空验证
				$("#urlInput1").blur(function(){
					var urlInput1 = $("#urlInput1").val();
					if(urlInput1 == null || urlInput1 ==""){
						$("#authUrlError").html("URL不能为空");
						$("#authUrlError").show();
						flag3 = false;
					}else{
						$("#authUrlError").hide();
						flag3 = true;
					}
				});
				//code唯一验证
				$("#codeInput1").blur(function(){
					var authCode = $("#codeInput1").val();
					$.ajax({
						type:"POST",					
						dataType:"json",
						url:"${pageContext.request.contextPath}/auth/checkCode.action",
						data:{
							authCode:authCode
						},
						success:function(json){
							if(json.num == 1){
								$("#authCodeError").html("AuthCode已存在");
								$("#authCodeError").show();
								$("#authOrderError").hide();
								flag1 = false;
							}else if(json.num == -1){
								$("#authCodeError").html("AuthCode不能为空");
								$("#authCodeError").show();
								$("#authOrderError").hide();
								flag1 = false;
							}else{
								$("#authCodeError").hide();
								flag1 = true;
							}
						}
					});					
				});
				//验证AuthOrder格式
				$("#OrderInput").blur(function(){
					var authOrder = $("#OrderInput").val();
					if(!/^[0-9]+$/.test(authOrder)){
						$("#authOrderError").html("AuthOrder格式错误，只能是数字");
						$("#authOrderError").show();
						$("#authCodeError").hide();
						flag2 = false;
					}else{
						flag2 = true;
						$("#authOrderError").hide();
					}
				});
				//提交按钮
				$("#checkon").click(function() {
					if(!!flag1 && !!flag2 && !!flag3){
						var authName = $("#authNameInput1").val();
						var authDesc = $("#descInput1").val();
						var authType = $("#authType").val();
						var authUrl = $("#urlInput1").val();
						var authCode = $("#codeInput1").val();
						var authOrder = $("#OrderInput").val();
						
						$.ajax({
							Type: "POST",
							dataType: "json",
							url: "${pageContext.request.contextPath}/auth/addAuth.action",
							data: {
								parentId: parentId,
								authName: authName,
								authDesc: authDesc,
								authType: authType,
								authUrl: authUrl,
								authCode: authCode,
								authOrder: authOrder
							},
							success: function(json) {
								if(json.num > 0) {
									alert("添加成功");
									location.reload();
								}else if(json.num == 0){
									alert("authCode已存在");
								};
							},
							error:function(){
								alert("1111");
							}
						});
					};	
				});
			});
			//删除权限
			$(document).ready(function() {
				var authId = "";
				$("#deleteAuth").click(function() {
					var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
					nodes = treeObj.getCheckedNodes(true);
					for(var i = 0; i < nodes.length; i++) {
						if(nodes[i].id != null && nodes[i].id != "") {
							authId += nodes[i].id;
						}
					};
				});
				$(".delete-selected-confirm").click(function(){
					$.ajax({
							type:"POST",
							dataType:"json",
							url:"${pageContext.request.contextPath}/auth/deleteAuth.action",
							data:{
								authId:authId,
								authState:0
							},
							success:function(json){
								if(json.num == 1){
									alert("删除成功");
									location.reload();
								}else if(json.num == 0){
									alert("该权限不能删除");
								}else if(json.num == -1){
									alert("请选择要删除的权限");
								}
							}
						});
				});
			});
			//修改权限
			$(document).ready(function() {
				$("#url-div").hide();
				var authId = "";
				$("#UpdateAuth").click(function() {
					var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
					nodes = treeObj.getCheckedNodes(true);
					for(var i = 0; i < nodes.length; i++) {
						if(nodes[i].id != null && nodes[i].id != "") {
							authId += nodes[i].id;
						};
					};
					$.ajax({
						type: "POST",
						dataType: "json",
						url: "${pageContext.request.contextPath}/auth/queryAuthById.action",
						data: {
							authId: authId
						},
						success: function(json) {
							if(json.num == "1") {
								if(json.authType == 2) {
									$("#url-div").show();
								}
								$("#authNameInput").val(json.authName);
								$("#descInput").val(json.authDesc);
								$("#orderInput").val(json.authOrder);
								$("#urlInput").val(json.authUrl);

							} else if(json.num == "0") {
								alert("请选择要修改的权限");
							}
						}
					});
				});
				
				$("#updateAuth").click(function() {
					var authName = $("#authNameInput").val();
					var authDesc = $("#descInput").val();
					var authOrder = $("#orderInput").val();
					var authUrl = $("#urlInput").val();
					$.ajax({
						type: "POST",
						dataType: "json",
						url: "${pageContext.request.contextPath}/auth/updateAuth.action",
						data: {
							authId: authId,
							authName: authName,
							authDesc: authDesc,
							authOrder: authOrder,
							authUrl: authUrl
						},
						success: function(json) {
							if(json.num > 0) {
								alert("修改成功");
								location.reload();
							} else {
								alert("修改失败");
							}
						}
					});
				});
			});
			//恢复权限
			$(document).ready(function(){
				var authId = "";
				$("#regainAuth").click(function(){
					var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
					nodes = treeObj.getCheckedNodes(true);
					for(var i = 0; i < nodes.length; i++) {
						if(nodes[i].id != null && nodes[i].id != "") {
							authId += nodes[i].id;
						}
					};
				});
				$(".regain-selected-confirm").click(function(){
					$.ajax({
						type:"POST",
						dataType:"json",
						url:"${pageContext.request.contextPath}/auth/restartAuth.action",
						data:{
							authId:authId,
							authState:1
						},
						success:function(json){
							if(json.num >0){
								alert("恢复成功");
								location.reload();
							}else{
								alert("请选择要恢复的权限");
							}
						}
					});
				});
			});
		</script>
	</head>

	<body>

		<!-- 头部 -->
		<jsp:include page="header.jsp" />

		<div class="container-fluid" style="margin-top: 30px;">
			<div class="row">
				<div class="col-sm-3 col-md-2 sidebar">
					<jsp:include page="navibar.jsp" />
				</div>
				<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
					<h1 class="page-header">权限列表</h1>
					<div class="row placeholders">
						<!--添加权限表单 start-->
						<div>
							<button type="button" class="btn btn-default show-add-form" style="width:100px;" data-toggle="modal" data-target="#update-auth-form-div" id="UpdateAuth">修改权限</button>
							<button type="button" style="width:100px;" class="btn btn-primary" data-toggle="modal" data-target="#regain-confirm-dialog" id="regainAuth">恢复权限</button>
							<div class="modal fade " id="update-auth-form-div" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
								<div class="modal-dialog modal-md" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
											<h4 class="role-form-title"></h4>
										</div>
										<!-- 修改权限 -->
										<div class="modal-body">
											<h3>修改权限</h3>
											<form class="role-form">
												<!-- <input type="text" name="authId" class="form-control" id="authIdInput"> -->
												<div class="form-group">
													<label for="authNameInput">权限名称</label> <input type="text" name="authName" class="form-control" id="authNameInput" />
												</div>
												<div class="form-group">
													<label for="descInput">权限描述</label> <input type="text" name="authDesc" class="form-control" id="descInput" />
												</div>
												<div class="form-group">
													<label for="orderInput">权限排序</label>
													<input type="text" name="authOrder" class="form-control" id="orderInput" />
												</div>
												<div id="url-div">
													<label for="urlInput">权限Url</label>
													<input type="text" name="authURL" class="form-control" id="urlInput" />
												</div id="code-div">
											</form>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
											<button type="button" class="btn btn-primary role-submit" id="updateAuth">提交</button>
										</div>
									</div>
								</div>
							</div>
							<!-- 恢复权限 -->
							<div class="modal fade " id="regain-confirm-dialog" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
								<div class="modal-dialog modal-sm" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
											<h4 class="modal-title">警告</h4>
										</div>
										<div class="modal-body">
										确定启用所选权限吗
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
											<button type="button" class="btn btn-primary regain-selected-confirm" >确认</button>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="modal fade " id="role-form-div" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
							<div class="modal-dialog modal-md" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
										<h4 class="role-form-title"></h4>
									</div>
									<!-- 添加权限 -->
									<div class="modal-body">
										<h4>添加权限</h4>
										<form class="role-form">
											<!-- <input type="text" name="authId" class="form-control" id="authIdInput"> -->
											<div class="form-group">
												<label for="authNameInput1">名称</label> <input type="text" name="authName" class="form-control" id="authNameInput1" placeholder="权限名称">
											</div>
											<div class="form-group">
												<label for="descInput1">权限描述</label> <input type="text" name="authDesc" class="form-control" id="descInput1" placeholder="权限描述">
											</div>
											<div class="form-group">
												<label>分类</label>
												<select id="authType">
													<option value="1">模版</option>
													<option value="2">列表</option>
													<option value="3">按钮</option>
												</select>
											</div>
											<div class="form-group" id="URLDiv">
												<label for="descInput1">权限url</label>
												<input type="text" name="authurl" class="form-control" id="urlInput1" placeholder="权限url">
												<label id="authUrlError" style="color:red"></label>
											</div>
											<div class="form-group" id="CodeDiv">
												<label for="codeInput1">权限code</label>
												<input type="text" name="authCode" class="form-control" id="codeInput1" placeholder="权限代码">
												<label id="authCodeError" style="color:red"></label>
											</div>
											<div class="form-group">
												<label>排序</label>
												<input type="text" name="authOrder" class="form-control" id="OrderInput" placeholder="排序" maxlength="1"/>
												<label id="authOrderError" style="color:red"></label>
											</div>
										</form>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
										<button type="button" class="btn btn-primary role-submit" id="checkon">提交</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 删除权限  -->
					<div class="modal fade " id="delete-confirm-dialog" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
						<div class="modal-dialog modal-sm" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									<h4 class="modal-title">警告</h4>
								</div>
								<div class="modal-body">
									确认删除所选权限吗
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
									<button type="button" class="btn btn-primary delete-selected-confirm">确认</button>
								</div>
							</div>
						</div>
					</div>
					<!--添加权限表单 end-->
					<div class="space-div"></div>

					<div class="zTreeDemoBackground left">
						<ul id="treeDemo" class="ztree" style="width:1024px;"></ul>
					</div>
					<div class="space-div"></div>
					<div>
						<button type="button" class="btn btn-default show-add-form" data-toggle="modal" data-target="#role-form-div" style="width: 100px;">添加权限</button>
						<button type="button" style="width:100px;" class="btn btn-primary" id="deleteAuth" data-toggle="modal" data-target="#delete-confirm-dialog">删除权限</button>
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
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
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

		<script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>

	</body>

</html>