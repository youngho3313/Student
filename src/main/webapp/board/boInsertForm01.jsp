<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ include file="./../common/bootstrap5.jsp" %>
<%@ include file="./../common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>boInsertForm</title>
	
	<style type="text/CSS">
		/* box model에 대한 공부가 필요합니다. */
		.input-group{margin: 7px;}
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
		<h2>게시판</h2>
		<p>사용자가 작성한 게시물의 목록입니다.</p>
		<form action="">
			<div class="input-group">
				<span class="input-group-text">글번호</span>
				<input class="form-control" type="text" id="no" name="no">
			</div>
			<div class="input-group">
				<span class="input-group-text">작성자</span>
				<input class="form-control" type="text" id="id" name="id">
			</div>
			<div class="input-group">
				<span class="input-group-text">비밀번호</span>
				<input class="form-control" type="password" id="password" name="password">
			</div>
			<div class="input-group">
				<span class="input-group-text">제목</span>
				<input class="form-control" type="text" id="subject" name="subject">
			</div>
			<div class="input-group">
				<span class="input-group-text">내용</span>
				<input class="form-control" type="text" id="content" name="content">
			</div>
			<div class="input-group">
				<span class="input-group-text">조회수</span>
				<input class="form-control" type="number" id="readhit" name="readhit">
			</div>
			<div class="input-group" >
				<span class="input-group-text">작성일자</span>
				<input class="form-control date_style" type="date" id="regdate" name="regdate">
			</div>
		
			<div id="buttonset" class="input-group">
				<button type="submit" class="btn btn-primary">제출하기</button>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="reset" class="btn btn-primary">초기화</button>
			</div>
		</form>
	</div>
</body>
</html>