<%@ page language="java" pageEncoding="UTF-8"%>
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
  
//response.setHeader("Content-disposition","inline; filename=MyExcel.xls");   
  
response.setHeader("Content-disposition","inline; filename=MyExcel.doc");   
%>  
<html>
	<head>
		<title></title>
	</head>
	<body>
		<table class="table table-hover table-bordered user-list" style="text-align: center;">
						<tr>
							<td><input type="checkbox" class="select-all-btn" /></td>
							<td>ID</td>
							<td>用户名</td>
							<td>用户昵称</td>
							<td>用户类型</td>
							<td>用户状态</td>
							<td>创建人</td>
							<td>创建时间</td>
						</tr>
						<c:forEach items="${users}" var="user">
							<tr>
								<td><input type="checkbox" name="userIds" value="${user.userId }" /></td>
								<td class="userid">${user.userId}</td>
								<td class="usercode">${user.userCode}</td>
								<td class="username">${user.userName}</td>
								<td class="usertype">${(user.userType=='1')?'超级管理员':(user.userType=='2')?'管理员':'普通用户'}</td>
								<td class="userstate">${(user.userState=='0')?'<font style="color:red">禁用</font>':'<font style="color:green">启用</font>'}</td>
								<td>${user.getCode}</td>
								<td class="createby">
									<fmt:formatDate value="${user.createTime}" pattern="yyyy-MM-dd" />
								</td>
							</tr>
						</c:forEach>
					</table>
	
	</body>

</html>
