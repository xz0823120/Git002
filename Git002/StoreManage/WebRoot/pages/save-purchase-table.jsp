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

		<title></title>

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
				<h1 class="page-header">采购单</h1>
				<div class="row placeholders"></div>
				<form action="${pageContext.request.contextPath}/purchase/save.action" method="get" name="myform">
					<table class="table table-hover table-bordered stat-list" style="width: 800px;height:500px;text-align:center;">
						<tr>
							<td>商品：</td>
							<td>
								<input type="hidden" maxlength="50" readonly="readonly" name="productId" value="${purchase.productId} "/>
								<span>${purchase.productName}</span>
							</td>
						</tr>
						<tr>
							<td>仓库：</td>
							<td>
								<input type="hidden" maxlength="100" readonly="readonly" name="storeId" value="${purchase.storeId}"/>
								<span>${purchase.storeName}</span>
							</td>
						</tr>
						<tr>
							<td>供货商:</td>
							<td>
								<input type="hidden" maxlength="50" readonly="readonly" name="supplyId" value="${purchase.supplyId}"/>
								<span>${purchase.supplyName}</span>
							</td>
						</tr>
						<tr>
							<td>产地:</td>
							<td>
								<input type="hidden" maxlength="200" readonly="readonly" name="placeId" value="${purchase.placeId}"/>
								<span>${purchase.placeName}</span>
							</td>
						</tr>
						<tr>
							<td>预计采购量:</td>
							<td style="text-align: left;">
								<input type="text" maxlength="30" name="buyNum" value="" id="save-buyNum" style="width: 30%;height: 100%;"/>
								<span style="color: red" id="save-buyNumError"></span>
							</td>
						</tr>
						<tr>
							<td>采购人:</td>
							<td style="text-align: left;">
								<input type="text" maxlength="50" name="buyUser" value="" id="save-buyUser" style="width: 30%;height: 100%;"/>
								<span style="color: red" id="save-buyUserError">采购人不能为空！</span>
							</td>
						</tr>
						<tr>
							<td>采购人电话:</td>
							<td style="text-align: left;">
								<input type="text" maxlength="11" name="phone" value="" id="save-phone" style="width: 30%;height: 100%;text-align: left;"/>
								<span style="color: red" id="save-phoneError">格式错误！！手机号码为11位纯数字</span>
							</td>
						</tr>
						<tr >
						<td colspan="2">
						<button type="button" class="btn btn-primary submit-purchase">保存</button>
						<button type="button" class="btn btn-warning " id="cancle-purchase">取消</button>
						</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
		
		<script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				//隐藏所有的格式验证提示
				$("#save-buyNumError").hide();
				$("#save-buyUserError").hide();
				$("#save-phoneError").hide();
				//单击取消按钮，返回到商品列表页面
				$("#cancle-purchase").click(function(){
					window.location.href = "${pageContext.request.contextPath}/product/product-list.action?storeId=1";
				});
				var flag1 = false;
				//验证预计采购量格式
				$("#save-buyNum").blur(function(){
					//alert($(this).val());
					if(!/^\d{1,6}\.\d{2}$/.test($(this).val())){
						$("#save-buyNumError").html("格式错误，保留到小数点后两位，最多8位有效数字");
						$("#save-buyNumError").show();
						flag1 = false;
					}else{
						$("#save-buyNumError").hide();
						if($(this).val()>0){
							flag1 = true;
							$("#save-buyNumError").hide();
						}else{
							$("#save-buyNumError").html("预计采购量必须大于零");
							$("#save-buyNumError").show();
							flag1 = false;
						}
						
					}
				});
				var flag3 = false;
				//采购人姓名的非空校验
				$("#save-buyUser").blur(function(){
					if(!!$(this).val()){
						$("#save-buyUserError").hide();
						flag3 = true;
					}else{
						$("#save-buyUserError").show();
						flag3 = false;
					}
				});
				
				var flag2 = false;
				//验证采购人电话格式
				$("#save-phone").blur(function(){
					//alert($(this).val());
					if(!/^\d{11}$/.test($(this).val())){
						$("#save-phoneError").show();
						flag2 = false;
					}else{
						$("#save-phoneError").hide();
						flag2 = true;
					}
				
				});
				
				$(".submit-purchase").click(function(){
					//如果输入都满足条件
					if(flag1 && flag2 && flag3){
						document.myform.submit();
					
					}
				
				});
			});
		</script>
	</body>

</html>