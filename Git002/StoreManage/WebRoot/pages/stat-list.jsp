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

		<title>统计列表</title>

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
				<h1 class="page-header">列表导出</h1>
				<div class="row placeholders"></div>
				<div style="margin-left: 120px;margin-bottom: 10px">
					<label>选择仓库:</label> 
					<select id="chooseStore" name="chooseStore">
						<c:forEach items="${storeList}" var="store" varStatus="status">
							<option value="${store.storeId}">${store.storeName}</option>
						</c:forEach>
					</select>
				</div>
				<table class="table table-hover table-bordered stat-list" style="width: 800px;margin: auto;text-align:center;">
					<tr>
						<td>列表名称</td>
						<td>条件</td>
						<td>操作</td>
					</tr>
					<tr>
						<td>下架商品列表</td>
						<td></td>
						<td>
						<button type="button" class="btn btn-warning " id="outProduct">导出</button>
						</td>
					</tr>
					<tr>
						<td>库存不足商品列表</td>
						<td></td>
						<td>
						<button type="button" class="btn btn-warning " id="understock">导出</button>
						</td>
					</tr>
					<tr>
						<td>商品库存情况</td>
						<td></td>
						<td>
						<button type="button" class="btn btn-warning " id="productInvent">导出</button>
						</td>
					</tr>
					
					<tr>
						<td>商品损耗率统计情况</td>
						<td>
							<label>批次号：</label>
							<select id="chooseBatch">
								<c:forEach items="${checkList}" var="storeCheck" >
									<option value="${storeCheck.batchId}">${storeCheck.batchNum}</option>
								</c:forEach>
							</select>
						</td>
						<td>
							<button type="button" class="btn btn-warning " id="lossRatio">导出</button>
						</td>
					</tr>
					<tr>
						<td>商品销售量情况</td>
						<td>
							起：<input type="date" id="maketStart"/>&nbsp;&nbsp;&nbsp;&nbsp;止：<input type="date" id="maketEnd"/>
						</td>
						<td>
						<button type="button" class="btn btn-warning " id="marketRatio">导出</button>
						</td>
					</tr>
					<tr>
						<td>商品采购情况</td>
						<td>
							起：<input type="date" id="purchaseStart"/>&nbsp;&nbsp;&nbsp;&nbsp;止：<input type="date" id="purchaseEnd"/>
						</td>
						<td>
							<button type="button" class="btn btn-warning " id="purchase">导出</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		
		<script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				//获取仓库Id
				var storeId = 1;
				$("#chooseStore").change(function(){
					storeId = $(this).val();
				});
				//获取批次Id
				var batchId = 1;
				$("#chooseBatch").change(function(){
					batchId = $(this).val();
				});
				//导出下架商品列表
				$("#outProduct").click(function(){
					window.location.href="${pageContext.request.contextPath}/stat/outProduct.action?storeId="+storeId+"";				
				});
				//导出库存不足的商品列表
				$("#understock").click(function(){
					window.location.href="${pageContext.request.contextPath}/stat/understock.action?storeId="+storeId+"";
				});
				//导出不同分类下的商品库存情况
				$("#productInvent").click(function(){
					window.location.href="${pageContext.request.contextPath}/stat/invent.action?storeId="+storeId+"";
				});
				//导出商品损耗比
				$("#lossRatio").click(function(){
					window.location.href="${pageContext.request.contextPath}/stat/lossRatio.action?storeId="+storeId+"&batchId="+batchId+"";
				});
				//导出商品销售比
				$("#marketRatio").click(function(){
					var startTime = $("#maketStart").val();
					var endTime = $("#maketEnd").val();
					if(startTime > endTime){
						alert("请选择正确的时间格式");
					}else{
					window.location.href="${pageContext.request.contextPath}/stat/marketRatio.action?storeId="+storeId+"&startTime="+startTime+"&endTime="+endTime+"";
					}
				});
				//导出规定时间的采购情况
				$("#purchase").click(function(){
					var startTime = $("#purchaseStart").val();
					var endTime = $("#purchaseEnd").val();
					if(startTime > endTime){
						alert("请选择正确的时间格式");
					}else{
						window.location.href="${pageContext.request.contextPath}/stat/purchase.action?storeId="+storeId+"&startTime="+startTime+"&endTime="+endTime+"";
					}
				});
			});
		</script>
	</body>

</html>