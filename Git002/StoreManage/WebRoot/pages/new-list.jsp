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

		<title>调货列表</title>

		<!-- Bootstrap core CSS -->
		<link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">

		<!-- Custom styles for this template -->
		<link href="${pageContext.request.contextPath}/static/css/layout.css" rel="stylesheet">
	</head>

	<body >

		<!-- 头部 -->
		<jsp:include page="header.jsp" />

		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-3 col-md-2 sidebar">
					<jsp:include page="navibar.jsp" />
				</div>
				<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
					<h1 class="page-header">调货列表</h1>
					<div class="row placeholders">
						<div>
							<!-- <button type="button" class="btn btn-warning delete-query" data-toggle="modal" data-target="#delete-confirm-dialog">删除所选</button> -->
					<form action="${pageContext.request.contextPath}/product/showStoreProduct.action" >
					<label>选择仓库</label> 
                	 <select id="storeId" name="storeId" style="height: 30px">
					<c:forEach items="${store}" var="store" varStatus="status" >
						<option  value="${store.storeId }"${(param.storeId==store.storeId )? "selected='selected'":"" }>${store.storeName }</option>
					</c:forEach>
					</select>  
                	<input value="${param.productName}" type="text" name="productName" style="width: 100px;height: 30px" placeholder="商品名称"/>
                	<input value="${param.brandName}" type="text" name="brandName" style="width: 100px;height: 30px" placeholder="品牌"/>
                	<input value="${param.typeName}" type="text" name="typeName" style="width: 100px;height: 30px" placeholder="类型"/>
                	<input value="${param.supplyName}" type="text" name="supplyName" style="width: 100px;height: 30px" placeholder="供应商"/>
                	<input value="${param.placeName}" type="text" name="placeName" style="width: 100px;height: 30px" placeholder="产地"/>
                	<input type="submit" value="查询" style="width: 100px;height: 30px" />
                </form>
						</div>
						<div class="space-div"></div>
						<table class="table table-hover table-bordered store-list">
							<tr>
								<td><input type="checkbox" class="select-all-btn" /></td>
								<td>商品ID</td>
								<td>仓库名称</td>
								<td>商品名称</td>
								<td>商品编号</td>
								<td>商品品牌</td>
								<td>商品分类</td>
								<td>商品供货商</td>
								<td>商品产地</td>
								<td>商品库存</td>
								<td>商品进价</td>
								<td>操作</td>
							</tr>
							<c:forEach items="${tansProductList}" var="product">
							<tr>
									<td><input type="checkbox" name="storeIds" value="${product.productId}" /></td>
									<td class="productid">${product.productId}</td>
									<td class="productstoreid">${product.storeName}</td>
									<td class="productname">${product.productName}</td>
									<td class="productnum">${product.productNum}</td>
									<td class="productbrand">${product.brandName}</td>
									<td class="producttype">${product.typeName}</td>
									<td class="productsupply">${product.supplyName}</td>
									<td class="productplace">${product.placeName}</td>
									<td class="productinvent">${product.productInvent}
									</td>
									<td class="productinprice">${product.inPrice}</td>
									<td>
 									<input type="button" class="btn btn-primary trans-store-form" data-toggle="modal" data-target="#Transshipment" value="调货">
 								</td>
							</tr>
							</c:forEach>
						</table>
						<div class="modal fade " id="Transshipment" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" >
							<div class="modal-dialog modal-sm" role="document" >
								<div class="modal-content" style="width:320px">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
										<h4 class="modal-title">调货确认信息</h4>
									</div>
									<div class="modal-body">
										<form class="update-userrole-form">
											<div class="form-group">
												<label for="submitProductName">商品名称</label>
												<input type="text" name="submitProductName" class="form-control" id="submitProductName" readonly="readonly">
											</div>
											<div class="form-group">
												<label for="submitProductNum">商品编号</label>
												<input type="text" name="submitProductNum" class="form-control" id="submitProductNum">
											</div>
											<div class="form-group">
												<label for="submitProductInvent">库存</label>
												<input type="text" name="submitProductInvent" class="form-control" id="submitProductInvent" readonly="readonly">
											</div>
											<div class="form-group">
												<label for="submitProductSum">数量</label>
												<input type="text" name="submitProductSum" class="form-control" id="submitProductSum" placeholder="调货数量应小于库存量">
											</div>
											<div class="roles-div">
											</div>
										</form>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
										<button type="button" class="btn btn-primary update-store-submit">调货 </button>
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
		//选择仓库 查询仓库对应的商品
		$(function(){
		//仓库下拉框的change事件
				$("#storeId").change(function(){
					var storeId = $(this).val();
					window.location.href = "${pageContext.request.contextPath}/product/showStoreProduct.action?storeId="+storeId+"";
				});
			});
 			
 		//查询按钮
  	/* 	function selectSubmit(){
			var storeid=$("#chooseStore").val();
  			//var storeid=document.getElementById(chooseStore).value;
  			alert(storeid);
  			$("#chooseAndSelectStore").attr("action","${pageContext.request.contextPath}/product/showStoreProduct.action?storeid="+$("#chooseStore").val()+"");
  			//$("#chooseAndSelectStore").attr("action","${pageContext.request.contextPath}/product/showStoreProduct.action?storeid="+storeid+"");
  			$("#chooseAndSelectStore").submit();
  		} */
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
			
			
		//调货回显（商品id,商品名称，商品数量）----------
		var submitstoreid = null;
		 $(".store-list").on("click",".trans-store-form",function(){
		 	//submitProductInvent
			submitstoreid = $(this).parents("tr").find(".productid").html();
			var productname = $(this).parents("tr").find(".productname").html();
			var productnum = $(this).parents("tr").find(".productnum").html();
			var productinvent = $(this).parents("tr").find(".productinvent").html();
			$("#submitProductName").val(productname);
			//$("#submitProductType").val(producttype);
			$("#submitProductInvent").val(productinvent);
			//productnum
			$("#submitProductNum").val(productnum);
	}); 
		
				//获取修改后的值
				//var targetstoreId = ${targetstoreid};
				$(".update-store-submit").click(function() {
					var submitProductSum = $("input[name='submitProductSum']").val();
					var sourceStoreId=$("#storeId").val();
					var submitProductNum = $("input[name='submitProductNum']").val();
					var sessionTargetStoreId = ${targetStoreId};
					//alert("目标库id"+sessionTargetStoreId);
					if(submitProductNum==null || submitProductNum ==""){
						alert("请先输入商品编号");
						return false;
					}else{
						if(submitProductSum ==null || submitProductNum=="" ){
							alert("请输入调货量");
							return false;
						}else{
							//alert("源商品id"+submitstoreid+"调货数量："+submitProductSum+"源仓库id"+sourceStoreId);
					$.ajax({
						type: "POST",
						dataType: "json",
						url: "${pageContext.request.contextPath}/product/transStore.action",
						data: {
							//源仓库
							sourceStoreId:sourceStoreId,
							//源商品id
							productId:submitstoreid,
							//目标仓库
							targetStoreId:sessionTargetStoreId,
							//调货数量
							transNum:submitProductSum,
							//商品编号（唯一性检验）
							productNum:submitProductNum
						},
						success: function(json){
							if(json.num == 1){
								showTips("调货成功");
								window.location.href="${pageContext.request.contextPath}/trans/queryTransshipment.action";
							}else if (json.num == 0){
								showTips("抱歉！执行遇到了一个问题！");
								return false;
							}else if (json.num == -1){
								showTips("调货数量应大于0小于等于当前商品库存");
								return false;
							}else if (json.num == -2){
								showTips("商品编号重复！请先修改商品编号！");
								return false;
							}else if (json.num == -3){
								showTips("目标仓库和源仓库冲突！请核对调货仓库！");
								return false;
							}else{
								showTips("抱歉！遇到了一个问题！");
								return false;
							}
						},error:function(){ 
							showTips("抱歉！出现了一个未知的错误！");
							//window.location.href="${pageContext.request.contextPath}1111/sto1re/queryStore.action"; 
							return false;
                		},
					});
							
						}
					}
					
				});
			
			
		</script>
	</body>

</html>