<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
    This is my JSP page. <br>
    <form action="fileUpload.action" method="post" enctype="multipart/form-data">
    	<input type="file" name="file"/>
    	<input type="submit" value="上传"/>
    </form>
    
    <br/><br/><br/>
     <form  action="filesUploads.action" method="post" enctype="multipart/form-data">
        <input type="file" name="files" /><br/>
        <input type="file" name="files"/><br/>
        <input type="file" name="files" />
       <input type="submit" value="上传"/>
    </form>
    <a href="${pageContext.request.contextPath}/upload/jd-gui-0.3.5.windows.zip">下载</a><br/>
    <a href="download.action">online下载</a>
  </body>
</html>
