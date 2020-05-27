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

		<title>出库单管理 - 出库单列表</title>

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
				<h1 class="page-header">出库单列表</h1>
				<div class="row placeholders">
					<div>
						 <form action="${pageContext.request.contextPath}/outstore/outstore-list.action" style="float: right;">
						 	<label>选择仓库:</label> 
							<select id="storeId" name="storeId" style="width: 100px;height: 25px;">
								<c:forEach items="${store}" var="store" varStatus="status">
									<option value="${store.storeId}" ${(param.storeId==store.storeId )? "selected='selected'": "" }>${store.storeName} </option>
								</c:forEach>
							</select> 
							<label style="margin-left: 250px;">商品名:</label>
							<input type="text" placeholder="商品名" id="getProductName" name="getProductName" value="${param.getProductName}" style="width: 100px;height: 26px" />
							<label>起始时间:</label> 
							<input type="date" id="dateStateTime" name="dateStateTime" value="${param.dateStateTime}"/>
							<label>结束时间:</label> 
							<input type="date" id="dateEndTime" name="dateEndTime" value="${param.dateEndTime}"/>
							<input type="submit" class="btn btn-primary " data-toggle="modal"  value="查询">
						</form>
					</div>
					<div class="space-div"></div>
					<table class="table table-hover table-bordered outstore-list" >
						<tr>
							<td>出库单ID</td>
							<td>商品名称</td>
							<td>仓库名称</td>
							<td>理货员</td>
							<td>出库数量</td>
							<td>是否出库</td>
							<td>创建时间</td>
							<td style="display:none">创建时间</td>
							<td style="display:none">创建时间</td>
							<td>操作</td>
						</tr>
						<c:forEach items="${outStoreInfoList}" var="outStoreInfoList">
							<tr>
								<td class="outsId">${outStoreInfoList.outsId}</td>
								<td class="getProductName">${outStoreInfoList.getProductName}</td>
								<td class="getStoreName">${outStoreInfoList.getStoreName}</td>
								<td class="userId">${outStoreInfoList.getCode}</td>
								<td class="outNum">${outStoreInfoList.outNum}</td>
								<td class="isOut">${(outStoreInfoList.isOut=='1')?'<font style="color:green">已出库</font>':'<font style="color:red">未出库</font>'}</td>
								<td class="createtime">${outStoreInfoList.createTime}</td>
								<td class="storeIdNew" style="display:none">${outStoreInfoList.storeId}</td>
								<td class="productIdNew" style="display:none">${outStoreInfoList.productId}</td>
								<td>
									<c:if test="${outStoreInfoList.isOut==0}">
										<button type="button" class="btn btn-primary update-this-isOut" >确定出库</button>
									</c:if>
								</td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan="10">
							     <jsp:include page="standard.jsp"></jsp:include>
							</td>
						</tr>
					</table>
					
		<!-- Bootstrap core JavaScript
    ================================================== -->
		<!-- Placed at the end of the document so the pages load faster -->
		<script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
		<script>
			//用户请求出库
			$(".outstore-list").on("click", ".update-this-isOut", function() {
				var userTr = $(this).parents("tr");
				var outsId = userTr.find(".outsId").html();
				var productId = userTr.find(".productIdNew").html();
				var storeId = userTr.find(".storeIdNew").html();
				var outNum = userTr.find(".outNum").html();
				var getProductName = userTr.find(".getProductName").html();  
				if(confirm('确认商品名为"' + getProductName + '"出库操作吗？')) {
					$.ajax({
						url: "${pageContext.request.contextPath}/outstore/addOutStoreFrom.action",
						data: {outsId: outsId,
							productId:productId,
						 	outNum:outNum,
						 	storeId:storeId
						 },
						type: "POST",
						dataType: "json",
						traditional:true,
						success: function(json) {
							if(json.num==1){
								alert("出库成功！");
								location.reload();
							}else{
								alert("库存不足！！！");
								location.reload();
							}
							
						}
					});
				}
			});
			$(function(){
				//仓库下拉框的change事件
				$("#storeId").change(function(){
					var storeId = $(this).val();
					window.location.href = "${pageContext.request.contextPath}/outstore/outstore-list.action?storeId="+ storeId +"";
				});
			});
		</script>
	</body>

</html>