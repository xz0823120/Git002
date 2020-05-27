<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <title>商品管理 - 商品列表</title>

    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/static/css/layout.css" rel="stylesheet">
  </head>

  <body>

    <!-- 头部 -->
    <jsp:include page="header.jsp"/>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <jsp:include page="navibar.jsp"/>
         </div>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h1 class="page-header">商品列表</h1>
          <div class="row placeholders">
          	<div>
          		 <div>
				 <form action="${pageContext.request.contextPath}/product/jumpAddProductJsp.action">             
                	<button type="submit" class="btn btn-primary">添加新商品</button>
                <!--修改商品信息表单-->
               	</form>
                <form action="${pageContext.request.contextPath}/product/product-list.action">
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <select id="storeId" style="height: 33px" name="storeId">
					<c:forEach items="${store }" var="store">
						<option value="${store.storeId }"${(param.storeId==store.storeId )? "selected='selected'":"" }>${store.storeName }</option>
					</c:forEach>
				</select>  
                	<input value="${param.productName}" type="text" name="productName" style="width: 100px;height: 33px" placeholder="商品名称"/>
                	<input value="${param.brandName}" type="text" name="brandName" style="width: 100px;height: 33px" placeholder="品牌"/>
                	<input value="${param.typeName}" type="text" name="typeName" style="width: 100px;height: 33px" placeholder="类型"/>
                	<input value="${param.supplyName}" type="text" name="supplyName" style="width: 100px;height: 33px" placeholder="供应商"/>
                	<input value="${param.placeName}" type="text" name="placeName" style="width: 100px;height: 33px" placeholder="产地"/>
                	<select style="width: 100px;height: 33px" name="upDownState">
                		<option value="">上/下架</option>
                		<option value="1"${(param.upDownState=='1' )? "selected='selected'": "" }>已上架</option>
                		<option value="0"${(param.upDownState=='0' )? "selected='selected'": "" }>未上架</option>
                	</select>
                	<select style="width: 100px;height: 33px" name="isOverDate">
                		<option value="">已/未过期</option>
                		<option value="1"${(param.isOverDate=='1' )? "selected='selected'": "" }>未过期</option>
                		<option value="0"${(param.isOverDate=='0' )? "selected='selected'": "" }>已过期</option>
                	</select>
                	<input type="submit" value="确认查询" style="width: 100px;height: 33px"/>
                </form>
               
                </div>
                <div class="modal fade " id="add-user-form" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
                  <div class="modal-dialog modal-sm" role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" >添加新商品</h4>
                      </div>
                      <div class="modal-body">
                      	<form class="user-form">
                          <div class="form-group">
                            <label for="userNameInput">用户名</label>
                            <input type="text" name="userName" class="form-control" id="userNameInput" placeholder="用户名">
                          </div>
                          <div class="form-group">
                            <label for="passwordInput">密码</label>
                            <input type="password" name="password" class="form-control" id="passwordInput" placeholder="密码">
                          </div>
                          <label>角色选择</label>
                          <div class="roles-div">
                          </div>
                        </form>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        <button type="button" class="btn btn-primary add-user-submit">添加 </button>
                      </div>
                    </div>
                  </div>
                </div>
            </div>
            <div class="space-div"></div>
            <table class="table table-hover table-bordered product-list">
            	<tr>
                	<td><input type="checkbox" class="select-all-btn"/></td>
                    <td>商品图片</td>
                    <td>商品名称</td>
                    <td>库存</td>
                    <td>仓库ID</td>
                    <td>仓库</td>
                    <td>品牌</td>
                    <td>类型</td>
                    <td>供应商</td>
                    <td>产地</td>
                    <td>单位</td>
                    <td>上/下架</td>
                    <td>售价</td>
                    <td style="display:none">售价</td>
                    <td>生产日期</td>
                    <td>保质期</td>
                    <td style="width: 14%">操作</td>
                </tr>
                <!--  <tr>
                	<td><input type="checkbox" name="userIds" value="11"/></td>
                    <td class="userid">1</td>
                    <td class="username">sisu</td>
                    <td><a href="javascript:void(0);" class="show-user-roles" >查看所有角色</a></td>
                    <td>
                    	<a class="glyphicon glyphicon-wrench show-userrole-form" aria-hidden="true" title="修改所有角色" href="javascript:void(0);" data-toggle="modal" data-target="#update-userrole-dialog"></a>
                    	<a class="glyphicon glyphicon-remove delete-this-user" aria-hidden="true" title="删除用户" href="javascript:void(0);"></a>
                    </td>
                </tr>-->
                <c:forEach items="${productList }" var="pro">
                	<tr>
                		<td><input type="checkbox" name="userIds" value="${pro.productId }"/></td>
                		<td class="productImg"><img src="${pageContext.request.contextPath}${pro.imgs }" style="width: 100px;height: 100px"/></td>
                		<td class="productName">${pro.productName }</td>
                		<td class="productInvent">${pro.productInvent }</td>
                		<td class="storeId">${pro.storeId }</td>
                		<td>${pro.storeName }</td>
	                    <td>${pro.brandName }</td>
	                    <td>${pro.typeName }</td>
	                    <td>${pro.supplyName }</td>
	                    <td>${pro.placeName }</td>
	                    <td>${pro.unitName }</td>
	                    <td>${(pro.upDownState=='1')?'<font color="green">已上架</font>':'<font color="red">未上架</font>'}</td>
	                    <td>${pro.salePrice }</td>
	                    <td style="display:none" class="productId">${pro.productId }</td>
	                    <td><fmt:formatDate value="${pro.productDate }" pattern="yyyy-MM-dd"/></td>
	                    <td><fmt:formatDate value="${pro.suppDate }" pattern="yyyy-MM-dd"/></td>
	                    <td>
	                    	<a href="${pageContext.request.contextPath}/product/reverseProduct.action?productId=${pro.productId}&storeId=${pro.storeId}&storeName=${pro.storeName}&brandId=${pro.brandId}&brandName=${pro.brandName}&productName=${pro.productName}&productNum=${pro.productNum}&productInvent=${pro.productInvent}&typeId=${pro.typeId}&typeName=${pro.typeName}&supplyId=${pro.supplyId}&supplyName=${pro.supplyName}&placeId=${pro.placeId}&placeName=${pro.placeName}&unitId=${pro.unitId}&unitName=${pro.unitName}&upDownState=${pro.upDownState}&inPrice=${pro.inPrice}&salePrice=${pro.salePrice}&memPrice=${pro.memPrice}&createTime=${pro.createTime}&updateTime=${pro.updateTime}&createBy=${pro.createBy}&updateBy=${pro.updateBy}&imgs=${pro.imgs}&productDate=${pro.productDate}&suppDate=${pro.suppDate}&introduce=${pro.introduce}" id="changeProductA" onclick="return changeProductA(${pro.upDownState})">修改</a>&nbsp;&nbsp;
	                    	<%-- <a href="${pageContext.request.contextPath}/product/upLoadImg.action?productId=${pro.productId}">上传</a>&nbsp;&nbsp;&nbsp; --%>
	                    	<c:if test="${pro.upDownState==0 }">
	                    		<a href="${pageContext.request.contextPath}/product/changeState.action?upDownState=1&productId=${pro.productId }">上架</a>
	                    	</c:if>
	                    	<c:if test="${pro.upDownState==1 }">
	                    		<a href="${pageContext.request.contextPath}/product/changeState.action?upDownState=0&productId=${pro.productId }">下架</a>
	                    	</c:if>
	                    	&nbsp;&nbsp;
	                    	<a href="${pageContext.request.contextPath}/product/showStoreProduct.action?targetStoreId=${pro.storeId}">调货</a>&nbsp;&nbsp;
	                    	<a href="${pageContext.request.contextPath}/purchase/saveParams.action?productId=${pro.productId}&productName=${pro.productName}&storeId=${pro.storeId}&storeName=${pro.storeName}&supplyId=${pro.supplyId}&supplyName=${pro.supplyName}&placeId=${pro.placeId}&placeName=${pro.placeName}">采购</a>&nbsp;&nbsp;
	                    	<a class=" show-productMess-form" data-toggle="modal" data-target="#insert-outStoreMess-from">出库</a>&nbsp;&nbsp;
	                    	<a href="${pageContext.request.contextPath}/store/toInsertMethod.action?productName=${pro.productName }&storeId=${pro.storeId }&productId=${pro.productId}">盘点</a>&nbsp;&nbsp;
	                    </td>
                	</tr>
                </c:forEach>
            </table>
            
            <jsp:include page="standard1.jsp"></jsp:include>
             <div class="modal fade " id="insert-outStoreMess-from" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
						<div class="modal-dialog modal-sm" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									<h4 class="modal-title">出库表单</h4>
								</div>
								<div class="modal-body">
									<form class="update-userrole-form">
										<div class="form-group">
											<label for="userNameInput">商品ID</label>
											<input type="text" name="userName" class="form-control" id="productIdInput" readonly="readonly">
										</div>
										<div class="form-group">
											<label for="userNameInput">仓库ID</label>
											<input type="text" name="userName" class="form-control" id="storeIdInput" readonly="readonly">
										</div>
										<div class="form-group">
											<label for="userNameInput">数量</label>
											<input type="text" name="userName" class="form-control" id="productNumInput">
											<label id="userNameInputError" style="color:red"></label>
										</div>
										<div class="roles-div">
										</div>
									</form>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
									<button type="button" class="btn btn-primary update-userrole-submit" id="storeNumSubmit">提交 </button>
								</div>
							</div>
						</div>
					</div>
          </div>  
            <!--修改用户角色表单-->
            <div class="modal fade " id="update-userrole-dialog" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
                  <div class="modal-dialog modal-sm" role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" >操作</h4>
                      </div>
                    </div>
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
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" >提示信息</h4>
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
    	function getAllRoles(obj){
        	obj.html("");
    		$.ajax({
				url:"listRoles.html",
				type:"POST",
				dataType:"json",
				success:function(data){
					for(var i in data){
						obj.append("<input type='checkbox' name='roleIds' value='"+
								data[i].roleId+"'/>"+data[i].roleName+":"+data[i].roleDesc);
						obj.append("<br/>");
					}
				}
			});
       	}
       	function showTips(content){
       		$("#op-tips-content").html(content);
			$("#op-tips-dialog").modal("show");
       	}
    	$(".select-all-btn").change(function(){
			if($(this).is(":checked")){//$(this).prop("checked")
				$(".user-list input[type='checkbox']:gt(0)").prop("checked",true);
			}else{
				$(".user-list input[type='checkbox']:gt(0)").prop("checked",false);
			}
		});
		$(".delete-selected-confirm").click(function(){
			$("#delete-confirm-dialog").modal("hide");
			var cbs=$("input[name='userIds']:checked")
			if(cbs.length===0){
				showTips("没有选中任意项！");
			}else{
				var userids=new Array();
				$.each(cbs,function(i,cb){
					userids[i]=cb.value;
				});
				//请求删除所选用户
				$.ajax({
					url:"deletemore.html",
					data:{userIds:userids},
					type:"POST",
					traditional:true,
					success:function(){
						cbs.parent().parent().remove();
						showTips("删除所选成功！");
					}
				});
			}
		});
		$(".show-user-form").click(function(){
			getAllRoles($(".user-form .roles-div"));
		});
		$(".add-user-submit").click(function(){
			//请求添加新用户
			$.ajax({
				url:"add.html",
				data:$(".user-form").serialize(),
				type:"POST",
				dataType:"json",
				success:function(data){
					$("#add-user-form").modal("hide");
					showTips("添加成功！");

					var newTr="<tr><td><input type='checkbox' name='userIds' value="+data.userId+"/></td>"+
                		"<td class='userid'>"+data.userId+"</td>"+
                		"<td class='username'>"+data.userName+"</td>"+
                		"<td><a href='javascript:void(0);' class='show-user-roles' >显示所有角色</a></td>"+
	                    "<td>"+
	                    	"<a class='glyphicon glyphicon-wrench show-userrole-form' aria-hidden='true' title='修改所有角色' href='javascript:void(0);' data-toggle='modal' data-target='#update-userrole-dialog'></a> "+
	                    	"<a class='glyphicon glyphicon-remove delete-this-user' aria-hidden='true' title='删除用户' href='javascript:void(0);'></a>"+
	                    "</td></tr>";
					$(".user-list tr").eq(0).after(newTr);
				}
			});
		});
		function getRolesByUserName(username,doSuccess){
			$.ajax({
				url:"showroles.html",
				data:{userName:username},
				type:"POST",
				dataType:"json",
				success:function(data){
					doSuccess(data);
				}
			});
		}
		$(".user-list").on("click",".show-user-roles",function(){
			var username=$(this).parents("tr").find(".username").html();
			var urTd=$(this).parent();
			//请求查看用户角色
			/*$.ajax({
				url:"showroles.html",
				data:{userName:username},
				type:"POST",
				dataType:"json",
				success:function(data){
					for(var i in data){
						var role=data[i].roleName+":"+data[i].roleDesc+"<br/>";
						urObj.append(role);
					}
				}
			});*/
			getRolesByUserName(username,function(data){
				urTd.html("");
				for(var i in data){
					var role=data[i].roleName+":"+data[i].roleDesc+"<br/>";
					urTd.append(role);
				}
			});
		});
		$(".user-list").on("click",".show-userrole-form",function(){
			var userid=$(this).parents("tr").find(".userid").html();
			var username=$(this).parents("tr").find(".username").html();
			$(".update-userrole-form input[name='userId']").val(userid);
			//获取当前用户当前角色
			getAllRoles($(".update-userrole-form .roles-div"));
			getRolesByUserName(username,function(data){
				for(var i in data){
					$('.update-userrole-form input[name="roleIds"][value="'+data[i].roleId+'"]').prop("checked",true);
				}
			});
		});
		//确认修改用户角色
		$(".update-userrole-submit").click(function(){
			$.ajax({
				url:"corelationRole.html",
				data:$(".update-userrole-form").serialize(),
				type:"POST",
				success:function(){
					$("#update-userrole-dialog").modal("hide");
					showTips("更新成功！");
				}
			});
		});
		$(".user-list").on("click",".delete-this-user",function(){
			var userTr=$(this).parents("tr");
			var userid=userTr.find(".userid").html();
			if(confirm('确认删除ID为"'+userid+'"的用户吗？')){
				//请求删除该用户
				$.ajax({
					url:"delete.html",
					data:{userId:userid},
					type:"POST",
					success:function(){
						userTr.remove();
						showTips("删除成功！");
					}
				});
			}
		});
		$(".product-list").on("click", ".show-productMess-form", function() {
				var productId = $(this).parents("tr").find(".productId").html();
				$("#productIdInput").val(productId);
				var storeId = $(this).parents("tr").find(".storeId").html();
				$("#storeIdInput").val(storeId);
				var outNum = $(this).parents("tr").find(".productInvent").html();
				$("#outNum").val("库存"+outNum);
				$(".update-userrole-submit").click(function() {
					var productId = $("#productIdInput").val();
					var storeId = $("#storeIdInput").val();
					var outNum = $("#productNumInput").val();
					var createBy=${user.userId};
					$.ajax({
						type: "POST",
						dataType: "json",
						url: "${pageContext.request.contextPath}/product/addOutStoreFrom.action",
						data: {
							productId: productId,
							storeId: storeId,
							outNum: outNum,
							createBy : createBy
						},
						success: function() {
								alert("出库成功！");
								location.reload();
						}
					});
				});
			});
			$("#productNumInput").blur(function(){
					var productInvent = $("#productNumInput").val();
					var productId = $("#productIdInput").val();
					var storeId = $("#storeIdInput").val();
					$.ajax({
						type:"POST",					
						dataType:"json",
						url:"${pageContext.request.contextPath}/product/checkProductInvent.action",
						data:{
							productInvent:productInvent,
							productId :productId,
							storeId :storeId
						},
						success:function(json){
							if(json.num == 1){
								$("#userNameInputError").html();
								$("#userNameInputError").hide();
								$("#storeNumSubmit").show();
								flag1 = false;
							}else if(json.num == 0){
								$("#userNameInputError").html("出库数量大于库存数量，请重新输入！");
								$("#userNameInputError").show();
								$("#storeNumSubmit").hide();
							}else{
								$("#userNameInputError").html("请重新输入出库数量！");
								$("#userNameInputError").show();
								$("#storeNumSubmit").hide();
								}
						}
					});					
				});
				
		/* 修改商品 */
		function changeProductA(state){
			var upDownState= state;
			//alert(upDownState);
			if(upDownState==0){
				return true;
			}else if(upDownState==1){
				alert("已上架不能修改！");
				return false;
			}
		}
			/*  */
		
    </script>
  </body>
</html>
