<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<c:if test="${(Page.totalNum)>0}">
总 ${Page.totalNum} 条&nbsp; 
每页 ${Page.pageNum} 条&nbsp; 
总 ${Page.totalPage} 页 &nbsp; 
第 ${Page.currNo} 页&nbsp; 
 
<c:if test="${Page.currNo==1}">首页</c:if>
<c:if test="${Page.currNo!=1}"><a href="${pageContext.request.contextPath}/${Page.urlString}?${Page.params}&currNo=1">首页</a></c:if>
&nbsp;
<c:if test="${Page.currNo==1}">上一页</c:if>
<c:if test="${Page.currNo!=1}"><a href="${pageContext.request.contextPath}/${Page.urlString}?${Page.params}&currNo=${Page.currNo-1}">上一页</a></c:if>
&nbsp;
<c:if test="${Page.currNo==Page.totalPage}">下一页</c:if>
<c:if test="${Page.currNo!=Page.totalPage}"><a href="${pageContext.request.contextPath}/${Page.urlString}?${Page.params}&currNo=${Page.currNo+1}">下一页</a></c:if>
&nbsp;
<c:if test="${Page.currNo==Page.totalPage}">尾页</c:if>
<c:if test="${Page.currNo!=Page.totalPage}"><a href="${pageContext.request.contextPath}/${Page.urlString}?${Page.params}&currNo=${Page.totalPage}">尾页</a></c:if>
&nbsp;
 第&nbsp;<select onchange="location.href='${pageContext.request.contextPath}/${Page.urlString}?${Page.params}&currNo='+this.value" style="width: 35px">
	<c:forEach var="selectvalue" begin="1" end="${Page.totalPage}" step="1">
		<option value="${selectvalue}" ${Page.currNo eq selectvalue ?"selected='selected'":""}>
			${selectvalue}   
		</option>
	</c:forEach>
</select>&nbsp;
页 
</c:if>



