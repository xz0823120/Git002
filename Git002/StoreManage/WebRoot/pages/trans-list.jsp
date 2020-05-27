<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
		<title>调货单</title>
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
					<h1 class="page-header">调货单</h1>
					<div class="row placeholders">
					<!-- 搜索模块 -->
						<div>
					<form action="${pageContext.request.contextPath}/trans/queryTransshipment.action" >
					 
					
					<label>选择目标仓库</label> 
                	 <select id="targetStoreId" name="targetStoreId" style="height: 30px">
					<c:forEach items="${storeList}" var="store" varStatus="status" >
						<option  value="${store.storeId }"${(param.targetStoreId==store.storeId )? "selected='selected'":"" }>${store.storeName }</option>
					</c:forEach>
					</select> 
					
					<label>选择源仓库</label> 
                	 <select id="sourceStoreId" name="sourceStoreId" style="height: 30px">
					<c:forEach items="${storeList}" var="store" varStatus="status" >
						<option  value="${store.storeId}"${(param.sourceStoreId==store.storeId )? "selected='selected'":"" }>${store.storeName }</option>
					</c:forEach>
					</select> 
					 
                		<input value="${param.sourceProductName}" type="text" name="sourceProductName" style="width: 100px;height: 30px" placeholder="源商品名称"/>
                		<input value="${param.targetProductName}" type="text" name="targetProductName" style="width: 100px;height: 30px" placeholder="目标商品名称"/>
                		<input value="${param.createName}" type="text" name="createName" style="width: 100px;height: 30px" placeholder="调货人"/>
                		<input type="submit" value="查询" style="width: 100px;height: 30px" />
               	    </form>
						</div>
						<div class="space-div"></div>
						<table class="table table-hover table-bordered trans-list">
							<tr>
								<td><input type="checkbox" class="select-all-btn" /></td>
								<td>调货编号</td>
								<td>目标仓库名</td>
								<td>目标商品名</td>
								<td>源仓库名称</td>
								<td>源商品名称</td>
								<td>调货量</td>
								<td>调货状态</td>
								<td>调货人</td>
								<td>调货时间</td>
								<td>操作</td>
							</tr>
							<c:forEach items="${transshipmentList}" var="transshipment">
								<tr>
									<td><input type="checkbox" name="transshipmentIds" value="${transshipment.transId}"/></td>
									<td class="transId">${transshipment.transId}</td>
									<td >
										${transshipment.targetStoreName}
										<input type="hidden" value="${transshipment.targetStoreId}" class="targetStoreId">
									</td>
									<td>
										${transshipment.targetProductName}
										<input type="hidden" value="${transshipment.targetProductId}" id ="targetProductId" class="targetProductId">
									</td>
									<td >
										${transshipment.sourceStoreName}
										<input type="hidden" value="${transshipment.sourceStoreId}" id="sourceStoreId" class="sourceStoreId">
									</td>
									<td >
										${transshipment.sourceProductName}
										<input type="hidden" value="${transshipment.sourceProductId}" id="sourceProductId" class="sourceProductId">
									</td>
									
									<td class="transNum">${transshipment.transNum}</td>
									<td class="auditState"><span style="color:${transshipment.auditState eq 0?"red":"green"};">${transshipment.auditState eq 0?"未完成":"已完成"}</span></td>
									<td class="createBy">${transshipment.createName}</td>
									<td class="createTime"><fmt:formatDate type="both" value="${transshipment.createTime}" /></td>
									<td>
									<button type="button" class="btn  btn-primary start-trans"  style="width:100px">
										<span style="color:${transshipment.auditState eq 0?"firebrick":""};">${transshipment.auditState eq 0?"调货 ":"已完成调货"}</span>
									</button>
										<!--  <button type="button" class="btn btn-warning delete-query" data-toggle="modal" id="updateUserState">取消调货</button>
										-->
									</td>
								</tr>
							</c:forEach>
						</table>
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
		//选择源仓库 查询仓库对应的商品
		$(function(){
		//仓库下拉框的change事件
				/* $("#sourceStoreId").change(function(){
					var sourceStoreId = $(this).val();
					alert(sourceStoreId);
					window.location.href = "${pageContext.request.contextPath}/trans/queryTransshipment.action?sourceStoreId="+sourceStoreId+"";
				}); */
			});
		//选择目标仓库 查询仓库对应的商品
		$(function(){
		//仓库下拉框的change事件
				$("#targetStoreId").change(function(){
					var targetStoreId = $(this).val();
					window.location.href = "${pageContext.request.contextPath}/trans/queryTransshipment.action?targetStoreId="+targetStoreId+"";
				});
			});
		
		
		
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
		
			
//确认调货调货
$(".trans-list").on("click",".start-trans",function(){
		var state=$(this).parents("tr").find(".auditState").text();
		var transSum=$(this).parents("tr").find(".transNum").text();
		var sourceStoreId=$(this).parents("tr").find(".sourceStoreId").val();
		var sourceProductId=$(this).parents("tr").find(".sourceProductId").val();
		
		var targetProductId=$(this).parents("tr").find(".targetProductId").val();
		var transshipmentId=$(this).parents("tr").find(".transId").text();
		//alert("源仓库:"+sourceStoreId+"源商品:"+sourceProductId+"目标商品id"+targetProductId);
		//alert("state:"+state+"transid:"+transshipmentId+"数量:"+transSum);
		if(state=="未完成"){
			//获取调货表的id
			//需要源商品id、仓库id(可不要)（根据商品id、源仓库id查数量 然后再减去调货量：源仓库剩余库存）
			//var transshipmentId = $("input[name='transshipmentIds']:checked").val();
			$.ajax({
				url:"${pageContext.request.contextPath}/trans/confirmTransshipment.action",
				type:"POST",
				data:{
					sourceStoreId:sourceStoreId,
					sourceProductId:sourceProductId,
					transId:transshipmentId,
					transNum:transSum,
					targetProductId:targetProductId
				},
				dataType:"json",
				success:function(data){
					if(data.isSuccess==1){
						showTips("调货成功！");
							window.location.href="${pageContext.request.contextPath}/trans/queryTransshipment.action";
					}else if(data.isSuccess==-1){
						showTips("调货时遇到一些麻烦！");
							//window.location.href="${pageContext.request.contextPath}/trans/queryTransshipment";
					}else{
						showTips("已完成调货，无需再次确认！");
					}				
				},
				error:function(){ 
					showTips("抱歉！发生了一个意外！");
                },
			});
		}else{
			showTips("已完成调货！无需再次确认！");
			return false;
		}
	})
		</script>
	</body>

</html>