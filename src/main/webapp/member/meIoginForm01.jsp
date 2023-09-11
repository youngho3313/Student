<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
        
<%@ include file="./../common/bootstrap5.jsp" %>
<%@ include file="./../common/common.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>meLoginForm01</title>
	<script type="text/javascript"> 
		$(document).ready(function(){
			var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
			var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
			  return new bootstrap.Tooltip(tooltipTriggerEl)
			});
		});
	</script>
	<style type="text/css">
		.container{margin-top: 3px;}
		
	</style>
</head>
<body>
	<div class="container">
		<h2>로그인 페이지</h2>
		<p>로그인을 위한 페이지입니다.</p>
		<form action="">
			<div>
				<label for="id" class="form-Label">아이디 :</label>
				<input class="form-control" type="text" id="id" name="id" 
				placeholder="아이디를 입력하세요"
				data-bs-toggle="tooltip" 
				title="아이디는 3글자 이상이어야 합니다." 
				data-bs-placement="top">
			</div>
			<div>
				<label for="password" class="form-Label">비밀 번호 :</label>
				<input class="form-control" type="password" id="password" name="password">
			</div>
			<!-- contextual class : btn-primary, btn-into, btn-danger -->
			<button type="submit" class="btn btn-primary">로그인</button>
			<a type="button" href="meInsertForm01.jsp" class="btn btn-info">회원가입</a>
		</form>
	</div>
</body>
</html>