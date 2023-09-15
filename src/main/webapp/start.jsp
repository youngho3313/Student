<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./../common/bootstrap5.jsp" %>    
<%@ include file="./../common/common.jsp" %>

<!-- 0915새브랜치입니다. -->
<!-- 업로드 테스트입니다.2 시54분 -->
<!-- 다시 테스트 2시58분 -->
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