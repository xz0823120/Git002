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
                    <td>仓库</td>
                    <td>预计采购量</td>
                    <td>实际采购量</td>
                    <td>单位</td>
                    <td>供应商</td>
                    <td>产地</td>
                    <td>采购人</td>
                    <td>电话</td>
                </tr>
               
                <c:forEach items="${purList}" var="pro">
                	<tr>
                		<td><input type="checkbox" name="userIds" value="${pro.productId }"/></td>
                		<td>${pro.buyId }</td>
                		<td>${pro.productName }</td>
                		<td>${pro.storeName }</td>
                		<td>${pro.buyNum}</td>
                		<td>${pro.factBuyNum}</td>
                		<td>${pro.unitName}</td>
	                    <td>${pro.supplyName }</td>
	                    <td>${pro.placeName }</td>
	                    <td>${pro.buyUser}</td>
	                    <td>${pro.phone}</td>
                	</tr>
                </c:forEach>
            </table>
	</body>
</html>