<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./../common/bootstrap5.jsp" %>    
<%@ include file="./../common/common.jsp" %>

<!-- 베타입니다. -->
<!-- 깃허브 연습용입니다. -->
<!-- 23년 9월 15일 금요일 5시 16분 -->
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