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

    <title>修改商品</title>

    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/static/css/layout.css" rel="stylesheet">
    <link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/zTree/css/zTreeStyle/zTreeStyle.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/zTree/css/demo.css"
	type="text/css">
<script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/zTree/js/jquery.ztree.core.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/zTree/js/jquery.ztree.excheck.js"></script>
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
          <h1 class="page-header">修改商品</h1>
          <div class="row placeholders">
            <div class="space-div"></div>
            <form action="${pageContext.request.contextPath}/product/upLoadImg.action?productId=${product.productId}" method="post" enctype="multipart/form-data">
            	<table class="table table-hover table-bordered">
           		 <tr>
            		<td style="width: 15%">图片上传</td>
            		<td rowspan="2">
    					<input type="file" name="file"/>
            			<input type="submit" value="上传"/>
            		</td>
            	</tr>
            	</table>
            </form>
            <form action="${pageContext.request.contextPath}/product/modification.action">
            <table class="table table-hover table-bordered product-list">
            	<tr>
            		<td style="width: 15%">商品名称</td>
            		<td>
            			<input type="text" value="${product.productName }" name="productName"/>
            			<input type="hidden" value="${product.productId }" name="productId"/>
            		</td>
            	</tr>
            	<tr>
            		<td>仓库</td>
            		<td>
            			<input id="storeName" type="text" value="${product.storeName }" readonly="readonly"/>
            			<input id="storeId" type="hidden" name="storeId" value="${product.storeId }"/>
            			<select class="storeIdChange" style="height: 33px" onchange="changeStore()">
							<c:forEach items="${store }" var="store" >
								<option value="${store.storeId }">${store.storeName }</option>
							</c:forEach>
						</select> 
            		</td>
            	</tr>
            	<tr>
            		<td>品牌</td>
            		<td>
            			<input id="brandName" type="text" value="${product.brandName }" readonly="readonly"/>
            			<input id="brandId" type="hidden" value="${product.brandId }" name="brandId"/>
            			<select class="brandIdChange" style="height: 33px" onchange="changeBrand()" >
							<c:forEach items="${brand }" var="brand" >
								<option value="${brand.brandId }">${brand.brandName }</option>
							</c:forEach>
						</select> 
            		</td>
            	</tr>
            	<tr>
            		<td>条形码</td>
            		<td><input type="text" value="${product.productNum }" readonly="readonly" name="productNum"/></td>
            	</tr>
            	<tr>
            		<td>库存</td>
            		<td><input type="text" value="${product.productInvent }" name="productInvent"/>
            		</td>
            	</tr>
            	<tr>
            		<td>种类</td>
            		<td>
            			<input id="typeName" type="text" value="${product.typeName }" readonly="readonly"/>
            			<input id="typeId" type="hidden" value="${product.typeId }" name="typeId"/>
						 <button type="button" class="btn btn-primary show-user-form" data-toggle="modal" data-target="#add-user-form">选择种类</button>
					</td>
            	</tr>
            	<tr>
            		<td>供应商</td>
            		<td>
            			<input id="supplyName" type="text" value="${product.supplyName }" />
            			<input id="supplyId" type="hidden" value="${product.supplyId }" name="supplyId"/>
            			<select class="changeIdSupply" style="height: 33px" onchange="changeSupply()" >
							<c:forEach items="${supplyList }" var="supply" >
								<option value="${supply.supplyId }">${supply.supplyName }</option>
							</c:forEach>
						</select> 
            		</td>
            	</tr>
            	<tr>
            		<td>产地</td>
            		<td>
            			<input id="placeName" type="text" value="${product.placeName }" />
            			<input id="placeId" type="hidden" value="${product.placeId }" name="placeId"/>
            			<select class="placeIdChange" style="height: 33px" onchange="changePlace()" >
							<c:forEach items="${placeList }" var="place" >
								<option value="${place.placeId }">${place.placeName }</option>
							</c:forEach>
						</select> 
            		</td>
            	</tr>
            	<tr>
            		<td>单位</td>
            		<td>
            			<input id="unitName" type="text" value="${product.unitName }" />
            			<input id="unitId" type="hidden" value="${product.unitId }" name="unitId"/>
            			<select class="unitIdChange" style="height: 33px"  onchange="changeUnit()" >
							<c:forEach items="${unitList }" var="unit" >
								<option value="${unit.unitId }">${unit.unitName }</option>
							</c:forEach>
						</select> 
            		</td>
            	</tr>
            	<tr>
            		<td>详细介绍</td>
            		<td><input type="text" value="${product.introduce }" name="introduce"/></td>
            	</tr>
            	<tr>
            		<td>进价</td>
            		<td><input type="text" value="${product.inPrice }" name="inPrice"/></td>
            	</tr>
            	<tr>
            		<td>售价</td>
            		<td><input type="text" value="${product.salePrice }" name="salePrice"/></td>
            	</tr>
            	<tr>
            		<td>会员价</td>
            		<td><input type="text" value="${product.memPrice }" name="memPrice"/></td>
            	</tr>
            	<tr>
            		<td>出厂日期</td>
            		<td>
            			<input id="productDate" type="datetime" name="productDate" value="<fmt:formatDate value="${product.productDate }" pattern="yyyy/MM/dd"/>"/>
            			<input class="productDate" type="date" onchange="changeProductDate()" />
            		</td>
            	</tr>
            	<tr>
            		<td>保质期</td>
            		<td>
            			<input id="suppDate"  type="datetime" name="suppDate" value="<fmt:formatDate value="${product.suppDate }" pattern="yyyy/MM/dd"/>" />
            			<input class="suppDate" type="date" onchange="changeSuppDate()" />
            		</td>
            	</tr>
            	
            </table>
            <input type="submit" class="btn btn-primary" value="确认修改" />
            </form>
            
          </div>          
        </div>
    </div>
 		
 		
 	
 	<div class="modal fade " id="add-user-form" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
                  <div class="modal-dialog modal-sm" role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" >选择商品种类</h4>
                      </div>
                      <div class="modal-body">
                      		<div class="zTreeDemoBackground left">
								<ul id="typeTree" class="ztree" style="width:270px;"></ul>
							</div>
                      </div>
                    </div>
                  </div>
                </div>
                
                
                
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    
    <script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
    <script>
/* 种类树 */
       var setting = {
        	   check:{
               enable:true,
               chkStyle: "radio",  //单选框
               radioType: "all"   //对所有节点设置单选
            },  
            
             /*  check:{//使用复选框
                enable:true
            },  */ 
            data: {
                simpleData:{//是否使用简单数据模式
                    enable:true
                }
            },
            callback:{
                onCheck:onCheck,
                
                beforeCheck:function(treeId,treeNode){
                	if(treeNode.isParent){
                		return false;
                	}
                }
                
            },
            view:{//变颜色
            	fontCss:getFont,
            	namelsHTML:true
            }          
        };
         //id 标识 ，pId 父id，name 名称，open 是否展开节点， checked  是否选中        
        var zNodes = ${typeTree};
		
		function getFont(treeId,node){//变颜色
			return node.font?node.font:{};
		}
		
        $(document).ready(function(){
            $.fn.zTree.init($("#typeTree"), setting, zNodes);
        });
			
            //选中复选框后触发事件
            function onCheck(e,treeId,treeNode){
            	var treeObj=$.fn.zTree.getZTreeObj("typeTree"),
            	nodes=treeObj.getCheckedNodes(true),
            	v="";
            	n="";
            	//获取选中的复选框的值
            	for(var i=0;i<nodes.length;i++){
            		v+=nodes[i].id;
            		n+=nodes[i].name;
            		//alert(nodes[i].id); //获取选中节点的值
            		/* $("#authIdInput").val(v); */
            	}
           	 	//alert(v);
           	 	//alert(n);
           	 	$("#typeName").val(n);
           	 	$("#typeId").val(v);
           	 	
            }
    	/* 改变商品生产日期 */
    	function changeProductDate(){
    		productDateStr=$(".productDate").val();
    		var productDate = new Date(productDateStr);
    		//alert(productDate);
    		$("#productDate").val(productDate);
    	}
    	/* 改变商品保质期 */
    	function changeSuppDate(){
    		suppDateStr=$(".suppDate").val();
    		var suppDate = new Date(suppDateStr);
    	   //alert(suppDate);
    		$("#suppDate").val(suppDate);
    	}
    	/* 改变单位  */
    	function changeUnit(){
    		//获取选中的仓库名称和仓库id
    		var unitName = $(".unitIdChange option:selected").text();
			var unitId = $(".unitIdChange").val();
    		//alert("storeName:"+storeName);
    		//alert("storeId:"+storeId);
    		
    		//将获取的仓库名称放在左边的文本框中
    		$("#unitId").val(unitId);
    		$("#unitName").val(unitName);
    	}
    	
    	
    	/* 改变仓库  */
    	function changeStore(){
    		//获取选中的仓库名称和仓库id
    		var storeName = $(".storeIdChange option:selected").text();
			var storeId = $(".storeIdChange").val();
    		//alert("storeName:"+storeName);
    		//alert("storeId:"+storeId);
    		
    		//将获取的仓库名称放在左边的文本框中
    		$("#storeId").val(storeId);
    		$("#storeName").val(storeName);
    	}
    	
    	/* 改变品牌 */
    	function changeBrand(){
    		var brandName = $(".brandIdChange option:selected").text();
    		//alert(brandName);
    		var brandId = $(".brandIdChange").val();
    		//alert("storeName:"+storeName);
    		//alert("storeId:"+storeId);
    		
    		//将获取的仓库名称放在左边的文本框中
    		$("#brandId").val(brandId);
    		$("#brandName").val(brandName);
    	}
    	
    	/* 改变供货商 */
   		function changeSupply(){
   			var supplyName = $(".changeIdSupply option:selected").text();
    		var supplyId = $(".changeIdSupply").val();
    		
    		$("#supplyId").val(supplyId);
    		$("#supplyName").val(supplyName);
   		}
   		
   		/* 改变产地*/
   		function changePlace(){
   			var placeName = $(".placeIdChange option:selected").text();
    		//alert(brandName);
    		var placeId = $(".placeIdChange").val();

    		$("#placeId").val(placeId);
    		$("#placeName").val(placeName);
   		}
   		
   		
    </script>
  </body>
</html>
