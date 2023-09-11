<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
    
<%@ include file="./../common/bootstrap5.jsp" %>
<%@ include file="./../common/common.jsp" %>

<%@ page import="com.shopping.model.dao.BoardDao" %>
<%@ page import="com.shopping.model.bean.Board" %>

<%
	// 스크립트 릿
	Integer no = 111;
	BoardDao dao = new BoardDao();
	Board bean = dao.getDataByPk(no);
	
%>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>boInsertForm</title>
	
	<script type="text/javascript">
		$(document).ready(function(){
			var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
			var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
			  return new bootstrap.Tooltip(tooltipTriggerEl)
			});
		});
	</script>
	
	<style type="text/CSS">
		/* box model에 대한 공부가 필요합니다. */
		h2{color:tomato; font-weight: bold;}
		.input-group{margin: 7px; }
		.input-group-text{
			display: block;
			margin-left: auto;
			margin-right: auto;
		}
		#buttonset{margin-top: 15px; }
		.radio_gender, .checkbox_hobby{font-size: 1.1rem; } /* 주위 글꼴의 1.1배 */
	</style>
	
</head>
<body>
	<div class="container">
		<h2>게시판 수정</h2>
		<p>사용자가 작성한 게시물을 수정하는 페이지입니다.</p>
		<form action="">
			<div class="input-group">
				<span class="input-group-text">글번호</span>
				<input class="form-control" type="text" id="fakeno" name="fakeno" value="<%=bean.getNo()%>" disabled="disabled">
				<input class="form-control" type="text" id="no" name="no" value="<%=bean.getNo()%>" hidden>
			</div>
			<div class="input-group">
				<span class="input-group-text">작성자</span>
				<input class="form-control" type="text" id="fakeid" name="fakeid" value="<%=bean.getId()%>" disabled="disabled">
				<input class="form-control" type="text" id="id" name="id" value="<%=bean.getId()%>" hidden>
			</div>
			<div class="input-group" hidden>
				<span class="input-group-text" >비밀번호</span>
				<input class="form-control" type="password" id="password" name="password" value="<%=bean.getPassword()%>">
			</div>
			<div class="input-group">
				<span class="input-group-text">제목</span>
				<input class="form-control" type="text" id="subject" name="subject" value="<%=bean.getSubject()%>" 
						data-bs-toggle="tooltip" title="원래 제목은 <%=bean.getSubject()%>" data-bs-placement="top">
			</div>
			<div class="input-group">
				<span class="input-group-text">내용</span>
				<input class="form-control" type="text" id="content" name="content" value="<%=bean.getContent()%>">
			</div>
			<div class="input-group" >
				<span class="input-group-text">조회수</span>
				<input class="form-control" type="number" id="fakereadhit" name="fakereadhit" value="<%=bean.getReadhit()%>" disabled="disabled">
				<input class="form-control" type="number" id="readhit" name="readhit" value="<%=bean.getReadhit()%>" hidden>
			</div>
			<div class="input-group" >
				<span class="input-group-text">작성일자</span>
				<input class="form-control date_style" type="datetime" id="regdate" name="regdate" value="<%=bean.getRegdate()%>">
<%-- 				<input class="form-control date_style" type="datetime" id="fakeregdate" name="fakeregdate" value="<%=bean.getRegdate()%>" disabled="disabled">
				<input class="form-control date_style" type="datetime" id="regdate" name="regdate" value="<%=bean.getRegdate()%>" hidden>
			 --%>
			</div>
		
			<div id="buttonset" class="input-group">
				<button type="submit" class="btn btn-primary">제출하기</button>
				
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="reset" class="btn btn-info">초기화</button>
				
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="reset" class="btn btn-danger" 
						data-bs-toggle="tooltip" title="초기화합니다." data-bs-placement="top">초기화</button>
			</div>
		</form>
	</div>
</body>
</html>