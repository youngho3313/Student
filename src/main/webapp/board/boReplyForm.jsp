<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
      
<%@ include file="./../common/bootstrap5.jsp" %>
<%@ include file="./../common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>boUpdate</title>
	<style type="text/CSS">
		/* box model에 대한 공부가 필요합니다. */
		.input-group{margin: 7px;}
		.input-group-text{
			display: block;
			margin-left: auto;
			margin-right: auto;
		}
		#buttonset{margin-top: 15px; }
		
		#boardNo{display: none; visibility:hidden;}
	</style>
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
	
</head>
<body>
	<div class="container">
		<h2>게시물 답글</h2>
		<p>특정 게시물에 대한 답글을 작성하는 페이지입니다.</p>
		<form action="<%=withFormTag%>" method="post">
			<input type="hidden" name="pageNumber" value="<%=request.getParameter("pageNumber")%>">
			<input type="hidden" name="pageSize" value="<%=request.getParameter("pageSize")%>">
			<input type="hidden" name="mode" value="<%=request.getParameter("mode")%>">
			<input type="hidden" name="keyword" value="<%=request.getParameter("keyword")%>">
			
			<!--  -->
			<%-- 답글과 관련된 파라미터 목록 --%>
			<input type="hidden" name="groupno" value="<%=request.getParameter("groupno")%>">
			<input type="hidden" name="orderno" value="<%=request.getParameter("orderno")%>">
			<input type="hidden" name="depth" value="<%=request.getParameter("depth")%>">
			
			<input type="hidden" name="command" value="boReply">
			<div id="boardNo" class="input-group">
				<span class="input-group-text col-md-2">게시물 번호</span>
				<input class="form-control" type="text" id="no" name="no">
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">작성자</span>
				<c:set var="userInfo" value="${sessionScope.loginfo.name}(${sessionScope.loginfo.id})"/>
				<input id="fakeid" name="fakeid" disabled="disabled"
				 	type="text" class="form-control" placeholder="" value="${userInfo}">
				 
				<input id="id" name="id" type="text" value="${sessionScope.loginfo.id}">
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">글 제목</span>
				<input class="form-control" type="text" id="subject" name="subject" >
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">글 내용</span>
				<input class="form-control" type="text" id="content" name="content" >
			</div>
			
			<div class="input-group">
				<span class="input-group-text col-md-2">비밀번호</span>
				<input id="password" name="password" type="password"  class="form-control" >
			</div>
			<div class="input-group" >
				<span class="input-group-text col-md-2">등록일자</span>
				<input class="form-control date_style" type="datetime" id="regdate" name="regdate" >
			</div>
			
		
			<div id="buttonset" class="input-group">
				<button type="submit" class="btn btn-primary" 
					onclick="return validCheck();">답글작성
				</button>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="reset" class="btn btn-primary">초기화</button>
			</div>
		</form>
	</div>
</body>
</html>