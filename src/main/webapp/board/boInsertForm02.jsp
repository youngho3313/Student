<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ include file="./../common/bootstrap5.jsp" %>
<%@ include file="./../common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>boInsertForm</title>
	
	<script type="text/javascript">
			function validCheck(){
				/* 글 제목은 3글자 이상 20글자 이하이어야 합니다.
				글 내용은 5글자 이상 30글자 이하이어야 합니다.
				날짜 형식은 반드시 yyyy/mm/dd 형식 또는 yyyy-mm-dd으로 작성해 주세요. */
				var subject = $('#subject').val();
				swal('helo');
				if(subject.length < 3 || subject.length > 20){
					swal('글 제목은 3글자 이상 20글자 이하이어야 합니다.');
					$('#subject').focus();
					return false;
				}
				
				var content = $('#content').val();
				if(content.length < 5 || content.length > 30){
					swal('글 내용은 5글자 이상 30글자 이하이어야 합니다.');
					$('#content').focus();
					return false;
				}
				
				var regdate = $('#regdate').val();
				var regex1 = /^\d{4}\/[01]\d{1}\/[0123]\d{1}$/;
				var result1 = regex1.test(regdate);
				var regex2 = /^\d{4}\-[01]\d{1}\-[0123]\d{1}$/;
				var result2 = regex2.test(regdate);
				if(result1 == false && result2 == false){
					swal('날짜 형식은 반드시 yyyy/mm/dd 형식 또는 yyyy-mm-dd으로 작성해 주세요.');
					return false;
				}
				
				
			}
	</script>
	
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
		<h2>게시물 등록</h2>
		<p>사용자가 게시물을 등록하는 페이지입니다.</p>
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
			<div class="input-group" hidden>
				<span class="input-group-text">조회수</span>
				<input class="form-control" type="number" id="readhit" name="readhit" >
			</div>
			<div class="input-group" >
				<span class="input-group-text">작성일자</span>
				<input class="form-control date_style" type="datetime" id="regdate" name="regdate">
			</div>
		
			<div id="buttonset" class="input-group">
				<button type="submit" class="btn btn-primary" onclick="return validCheck();">
					제출하기
				</button>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="reset" class="btn btn-primary">초기화</button>
			</div>
		</form>
	</div>
</body>
</html>