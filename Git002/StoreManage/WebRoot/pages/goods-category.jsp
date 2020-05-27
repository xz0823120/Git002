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
				callback:{
				     onCheck:onCheck
				 },
				view: {
					fontCss: getFont,
					namelsHTML: true
				}
			};
			//id 标识 ，pId 父id，name 名称，open 是否展开节点， checked  是否选中        
			var zNodes = ${goodsCategoryTree};
			function getFont(treeId, node) {
				return node.font ? node.font : {};
			}
			$(document).ready(function() {
				$.fn.zTree.init($("#treeDemo"), setting, zNodes);
			});
			//用一个全局变量来接收选中的叶节点
			var id = 0;
			var pId = 0;
			//选中复选框后触发事件
		    function onCheck(e,treeId,treeNode){
	        	var treeObj=$.fn.zTree.getZTreeObj("treeDemo");
	        	nodes=treeObj.getCheckedNodes(true);
	        	if(nodes.length!=0){
	        		id = nodes[0].id;
	        		pId = nodes[0].pId;
	        		if(!pId){
	        			nodes[0].pId=0;
	        		}
	        		//alert("nodes[0].pId="+nodes[0].pId);
	        	} 
	        	//alert(id);
       		 }
			
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
					<h1 class="page-header">商品分类列表</h1>
					<div class="row placeholders">
						<div>
							<button type="button" class="btn btn-default show-add-form" style="width:100px;" data-toggle="modal" data-target="#save-goodsType-form-div" id="save-goodsType">添加商品分类</button>
							<button type="button" style="width:100px;" class="btn btn-primary" data-toggle="modal" data-target="#update-goodsType-form-div" id="update-goodsType">修改商品分类</button>
							<div class="modal fade " id="update-goodsType-form-div" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
								<div class="modal-dialog modal-md" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
											<h4 class="role-form-title"></h4>
										</div>
										<!-- 修改商品分类 -->
										<div class="modal-body">
											<h3>修改商品分类</h3>
											<form class="role-form">
												<input type="hidden" name="typeId" class="form-control" id="typeIdInput"/>
												<div class="form-group">
													<label for="update-typeCodeInput">商品分类编码</label> <input type="text" name="typeCode" class="form-control" readonly="readonly" id="update-typeCodeInput" />
												</div>
												<div class="form-group">
													<label for="update-typeNameInput">商品分类名称</label> <input type="text" name="typeName" class="form-control" id="update-typeNameInput" />
													<span style="color: red" id="update-typeNameError"></span>
												</div>
												<div class="form-group">
													<label for="update-typeDescInput">商品分类描述</label>
													<textarea rows="5" cols="68" id="update-typeDescInput" />
												</textarea>
												</div>
											</form>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
											<button type="button" class="btn btn-primary role-submit" id="updateType">提交</button>
										</div>
									</div>
								</div>
							</div>

						<div class="modal fade " id="save-goodsType-form-div" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
							<div class="modal-dialog modal-md" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
										<h4 class="role-form-title"></h4>
									</div>
									<!-- 添加分类-->
									<div class="modal-body">
										<h3>添加分类</h3>
										<form class="type-form">
											<input type="hidden" name="parentId" class="form-control" value="" id="typeparentId"/>
												<div class="form-group">
													<label for="save-typeCodeInput">商品分类编码</label> <input type="text" name="typeCode" class="form-control" id="save-typeCodeInput" />
													<span style="color: red" id="save-typeCodeError"></span>
												</div>
												<div class="form-group">
													<label for="save-typeNameInput">商品分类名称</label> <input type="text" name="typeName" class="form-control" id="save-typeNameInput" />
													<span style="color: red" id="save-typeNameError">分类名称不能为空</span>
												</div>
												<div class="form-group">
													<label for="save-typeDescInput">商品分类描述</label>
													<textarea rows="5" cols="68" id="save-typeDescInput" />
												</textarea>
												</div>
										</form>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
										<button type="button" class="btn btn-primary saveType-submit" id="checkon">提交</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="zTreeDemoBackground left">
						<ul id="treeDemo" class="ztree" style="width:1024px;"></ul>
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
		
		<script type="text/javascript">
			//延迟加载
			$(function(){
				//添加分类按钮的点击方法
				$("#save-goodsType").click(function(){
					$("#save-typeCodeError").hide();
					$("#save-typeNameError").hide();
					var parentId =id;
					//alert("pId="+pId);
					if(null != pId){
						$.ajax({
							url:"${pageContext.request.contextPath}/goodsCategory/verifyChildType.action",
							type:"POST",
							dataType:"JSON",
							data:{
							  	parentId:parentId,
							},
							success:function(data){
								if(data.mark=="no"){
									alert("该分类已经是最小，不能添加子分类！！！");
								}
							}
						});
					}
				});
				
				var flag1 = false;
				//添加商品分类时，对typeCode进行（前端）唯一验证
				$("#save-typeCodeInput").blur(function(){
					var typeCode = $(this).val();
					if(!!typeCode){
							$.ajax({
								url:"${pageContext.request.contextPath}/goodsCategory/verifyTypeCode.action",
								type:"POST",
								dataType:"JSON",
								data:{
								  	typeCode:typeCode
								},
								success:function(data){
									if(data.mark=="exit"){
										$("#save-typeCodeError").html("该分类编码已存在");
										$("#save-typeCodeError").show();
										flag1 = false;
									}else{
										$("#save-typeCodeError").hide();
										flag1 = true;
									}
								}
							});
				  	  	}else{
				  	  		flag1 = false;
				  	  		$("#save-typeCodeError").html("商品分类编码不能为空！！");
				  	  		$("#save-typeCodeError").show();
				  	  	}
				
					});
				var flag2 = false;
				//添加商品分类的商品分类名称不能为空
				$("#save-typeNameInput").blur(function(){
					var typeName = $(this).val();
					if(!!typeName){
						flag2 = true;
						$("#save-typeNameError").hide();
					}else{
						flag2 = false;
						$("#save-typeNameError").show();
					}
				
				});

				//添加商品分类的提交方法
				$(".saveType-submit").click(function(){
					var typeCode = $("#save-typeCodeInput").val();
					var typeName = $("#save-typeNameInput").val();
					var typeDesc = $("#save-typeDescInput").val();
					var parentId =id;
					//alert(parentId);
					if(flag1 && flag2){
						$.ajax({
							url:"${pageContext.request.contextPath}/goodsCategory/saveType.action",
							type:"POST",
							dataType:"JSON",
							data:{
							  	parentId:parentId, 
							  	typeCode:typeCode,
							  	typeName:typeName,
							  	typeDesc:typeDesc,
							},
							success:function(data){
								if(data.mark != -1){
									alert("商品分类插入成功！！");
									setTimeout(function(){
										window.location.reload();
									}, 1000);
								}else{
									alert("商品分类插入失败！！");
								}
							
							}
						});
					}
				});
				
				//修改商品分类的点击方法(修改的数据回显)
				$("#update-goodsType").click(function(){
						if(id == 0){
							alert("请选择要修改的分类");
						}else{
        				var typeId = id;
        				
        				//alert("typeId=" + typeId);
        				$.ajax({
        					url:"${pageContext.request.contextPath}/goodsCategory/updateTypeShow.action",
							type:"POST",
							dataType:"JSON",
							data:{
							  	typeId:typeId
							},
							success:function(data){
								console.log(data.typeName);
								console.log(data.typeDesc);
								console.log(data.typeCode);
								if(!!data.typeName && !!data.typeDesc && !!data.typeCode && !!data.typeId){
									$("#typeIdInput").val(data.typeId);
									$("#update-typeCodeInput").val(data.typeCode);
									$("#update-typeNameInput").val(data.typeName);
									$("#update-typeDescInput").val(data.typeDesc);
								}
							}
        				});
        			}
				});
				
				//修改分类按钮的点击方法
				$("#update-goodsType").click(function(){
					$("#update-typeNameError").hide();
				});
				var flag3 = false;
				//商品分类名称不能为空（修改）
				$("#update-typeNameInput").blur(function(){
					var typeName = $(this).val();
					if(!typeName){
						$("#update-typeNameError").html("商品分类名称不能为空！！");
						$("#update-typeNameError").show();
						flag3 = false;
					}else{
						$("#update-typeNameError").hide();
						flag3 = true;
					}
				
				});
				
				//修改商品分类的点击方法
				$("#updateType").click(function(){
					var typeId = $("#typeIdInput").val();
					var typeName = $("#update-typeNameInput").val();
					var typeDesc = $("#update-typeDescInput").val();
					//alert("typeId="+typeId);
					//alert("typeName="+typeName);
					//alert("typeDesc="+typeDesc);
					if(flag3){
						$.ajax({
	      					url:"${pageContext.request.contextPath}/goodsCategory/updateType.action",
							type:"POST",
							dataType:"JSON",
							data:{
						  		typeId:typeId,
						  		typeName:typeName,
						  		typeDesc:typeDesc
							},
							success:function(data){
								if(data.mark != -1){
									alert("修改成功！！");
									setTimeout(function(){
										window.location.reload();
									}, 1000);
								}else{
									alert("修改失败！！");
								}
							}
      					});
					}
				});
			});
		</script>

	</body>

</html>