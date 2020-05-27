<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="application/msword" %>  
<%-- 
Word只需要把contentType="application/msexcel"改为contentType="application/msword" 
--%>

<%   
  //独立打开excel软件   
  //response.setHeader("Content-disposition","attachment; filename=MyExcel.xls");   
  
//嵌套在ie里打开excel   
  
response.setHeader("Content-disposition","inline; filename=MyExcel.xls");   
  
//response.setHeader("Content-disposition","inline; filename=MyExcel.doc");   
%>  
<html>
	<head>
		<title></title>
	</head>
	<body>
		<table class="table table-hover table-bordered product-list">
            	<tr>
                	<td><input type="checkbox" class="select-all-btn"/></td>
                    <td>ID</td>
                    <td>商品名称</td>
                    <td>商品编号</td>
                    <td>库存</td>
                    <td>单位</td>
                    <td>仓库</td>
                    <td>品牌</td>
                    <td>类型</td>
                    <td>供应商</td>
                    <td>产地</td>
                    <td>上/下架</td>
                    <td>售价</td>
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
                <c:forEach items="${outList}" var="pro">
                	<tr>
                		<td><input type="checkbox" name="userIds" value="${pro.productId }"/></td>
                		<td class="productId">${pro.productId }</td>
                		<td class="productName">${pro.productName }</td>
                		<td>${pro.productNum}</td>
                		<td>${pro.productInvent }</td>
	                    <td>${pro.unitName }</td>
                		<td>${pro.storeName }</td>
	                    <td>${pro.brandName }</td>
	                    <td>${pro.typeName }</td>
	                    <td>${pro.supplyName }</td>
	                    <td>${pro.placeName }</td>
	                    <td>${(pro.upDownState=='0')?"下架":"上架"}</td>
	                    <td>${pro.salePrice }</td>
                	</tr>
                </c:forEach>
            </table>
	</body>
</html>