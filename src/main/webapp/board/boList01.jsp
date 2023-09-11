<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./../common/bootstrap5.jsp" %>
<%@ include file="./../common/common.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>board</title>
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
				<tr>
					<td align="center">1</td>
					<td>홍길동</td>
					<td>abc123</td>
					<td>java</td>
					<td>자바</td>
					<td>0</td>
					<td>2023/03/01</td>
					<td>
						<span class="badge">11</span>
					</td>
				</tr>
				<tr>
					<td align="center">2</td>
					<td>박영희</td>
					<td>def456</td>
					<td>Python</td>
					<td>파이썬</td>
					<td>11</td>
					<td>2023/08/15</td>
					<td>
						<span class="badge">22</span>
					</td>
				</tr>
				<tr>
					<td align="center">3</td>
					<td>장만월</td>
					<td>aka321</td>
					<td>html</td>
					<td>에이치티엠엘</td>
					<td>3</td>
					<td>2023/05/05</td>
					<td>
						<span class="badge">33</span>
					</td>
				</tr>
				<tr>
					<td align="center">4</td>
					<td>나영철</td>
					<td>qwe456</td>
					<td>sql</td>
					<td>에스큐엘</td>
					<td>0</td>
					<td>2023/07/16</td>
					<td>
						<span class="badge">44</span>
					</td>
				</tr>
			</tbody>
		</table>
		
		<!-- 
			ol : ordered list
			ul : unordered list
			li : list
		 -->
		
		<ul class="pagination">
			<li class="page-item">
				<a class="page-Link" href="#">이전</a>
			</li>
			<li class="page-item" >
				<a class="page-Link" href="#">1</a>
			</li>
			<li class="page-item active">
				<a class="page-Link" href="#">2</a>
			</li>
			<li class="page-item">
				<a class="page-Link" href="#">3</a>
			</li>
			<li class="page-item disabled">
				<a class="page-Link" href="#">4</a>
			</li>
			<li class="page-item">
				<a class="page-Link" href="#">5</a>
			</li>
			<li class="page-item">
				<a class="page-Link" href="#">다음</a>
			</li>
			
		</ul>
		
		
		
	</div>
</body>
</html>