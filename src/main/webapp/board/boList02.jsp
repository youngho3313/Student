<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./../common/bootstrap5.jsp" %>
<%@ include file="./../common/common.jsp" %>
    
<%@page import="com.shopping.model.bean.Board"%>
<%@page import="com.shopping.model.dao.BoardDao"%>
<%
	BoardDao dao = new BoardDao();
	List<Board> lists = dao.getDataList();
	
	// request라는 저장소(캐비넷)에 lists를 저장하는데, 이름은 "datalist"입니다.
	// 속성(attribute)은 저장하고자 하는 어떠한 데이터
	// 데이터가 정장되는 저장소를 영역(scope)라고 합니다.
	request.setAttribute("datalist", lists);
%>    

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>board</title>
	<style type="text/css">
		.container{margin-top: 10px;}
		.rounded-pill{opacity: 1.0;}
	</style>

</head>
<body>
	<div class="container">
		<h2>게시글 목록</h2>
		<p>게시글 목록을 보여주는 페이지입니다.</p>
		<table class="table table-hover">
		<!-- table-hover, table-striped, table-condensed  -->
			<thead>
				<tr>
					<th>글번호</th>
					<th>작성자</th>
					<th>비밀번호</th>
					<th>글 제목</th>
					<th>글 내용</th>
					<th>조회수</th>
					<th>작성일자</th>
					
				</tr>
			</thead>
			<tbody>
				<c:forEach var="bean" items="${requestScope.datalist}" varStatus="status">
					<tr>
						<td align="center">${bean.no}</td>
						<td>${bean.id}</td>
						<td>${bean.password}</td>
						<td>
							<c:forEach var="i" begin="1" end="${bean.depth }" step="1">
								<span class="badge rounded-pill bg-secondary">re</span>
							</c:forEach>
							${bean.subject}
						</td>
						<td>${bean.content}</td>
						<td>
							<c:if test="${bean.readhit >= 30 }">
								<span class="badge rounded-pill bg-primary">${bean.readhit}</span>
							</c:if>
							<c:if test="${bean.readhit < 30 }">
								<span class="badge rounded-pill bg-danger">${bean.readhit}</span>
							</c:if>
						</td>
						<td>${bean.regdate}</td>
						
					</tr>
				</c:forEach>
				
			</tbody>
		</table>

		<ul class="pagination">
			<li class="page-item"><a class="page-link" href="#">Previous</a></li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item active"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item disabled"><a class="page-link" href="#">4</a></li>
			<li class="page-item"><a class="page-link" href="#">5</a></li>
			<li class="page-item"><a class="page-link" href="#">Next</a></li>
		</ul>
	
	</div>
</body>
</html>