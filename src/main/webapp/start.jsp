<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./../common/bootstrap5.jsp" %>    
<%@ include file="./../common/common.jsp" %>

<!-- 2023년 09월 15일 수업내용입니다. -->
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
<%
	String gotopage = notWithFormTag + "home";
	//out.print(gotopage);
	response.sendRedirect(gotopage);
%>
</body>
</html>