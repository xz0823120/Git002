<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <title>盛世管理系统</title>

    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/static/css/layout.css" rel="stylesheet">
  	
  	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/bodymovin.js"></script>
  	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/data.js"></script>
  	<style>
	html {
	  margin: 0;
	  padding: 0;
	  background-color: white;
	}
	
	body,
	html {
	  width: 100%;
	  height: 100%;
	  overflow: hidden;
	}
	
	#svgContainer {
	  width: 640px;
	  height: 512px;
	  background-color: white;
	  position: absolute;
	  top: 500px;
	  left: 0;
	  right: 0;
	  bottom: 0;
	  margin: auto;
	}
</style>

  </head>

  <body>

	<!-- 头部 -->
    <jsp:include page="header.jsp"/>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <jsp:include page="navibar.jsp"/>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h1 class="page-header">欢迎使用</h1>
          <h5 style="z-index: 1;top: 40px;right: 10px;position: absolute;">您有
          	<a href="${pageContext.request.contextPath}/message/selectUserMessage.action?createTime=&fromUser=&state=0&msgTitle=">${MyMessageCount}条</a>
         未读站内消息 </h5>
          
			<div id="svgContainer"></div>  
			<script type="text/javascript">
				var svgContainer = document.getElementById('svgContainer');
				var animItem = bodymovin.loadAnimation({
				  wrapper: svgContainer,
				  animType: 'svg',
				  loop: true,
				  animationData: JSON.parse(animationData)
				});
			</script>  
        </div>
      </div>
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
  </body>
</html>
