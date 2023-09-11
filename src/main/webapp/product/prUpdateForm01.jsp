<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./../common/bootstrap5.jsp" %>
<%@ include file="./../common/common.jsp" %>

<%@page import="com.shopping.model.bean.Product"%>
<%@page import="com.shopping.model.dao.ProductDao"%>

<%
	Integer pnum = 100;
	ProductDao dao = new ProductDao();
	Product bean = dao.getDataByPk(pnum);

%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>prInsertForm</title>
	<script type="text/javascript">
		$(document).ready(function(){
			/* value 속성의 값이 일치하는 항목에 대하여 체크 on 시킵니다. */
			$('option[value="<%=bean.getCategory()%>"]').attr('selected', true);
			

		});
	</script>
	<script type="text/javascript">
		$(document).ready(function(){
			var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
			var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
			  return new bootstrap.Tooltip(tooltipTriggerEl)
			});
		});
	</script>
	<style type="text/css">
		h2{color:blue;}
	</style>
</head>
<body>
	<div class="container">
		<h2>상품 수정</h2>
		<p>상품 정보를 수정하는 페이지 입니다.</p>
		<form action="">
			<div class="input-group">
				<span class="input-group-text">상품번호</span>
				<input class="form-control" type="number" id="pnum" name="pnum" value="<%=bean.getPnum()%>">
			</div>
			<div class="input-group">
				<span class="input-group-text">상품이름</span>
				<input class="form-control" type="text" id="name" name="name" value="<%=bean.getName()%>">
			</div>
			<div class="input-group">
				<span class="input-group-text">제조 회사</span>
				<input class="form-control" type="text" id="company" name="company" value="<%=bean.getCompany()%>">
			</div>
			<div class="input-group">
				<span class="input-group-text">이미지파일이름</span>
				<img alt="상품이미지" src="<%=bean.getImage01()%>" data-bs-toggle="tooltip" title="현재 적용되어 있는 이미지입니다." data-bs-placement="bottom">
				<input class="form-control" type="file" id="image01" name="image01" value="<%=bean.getImage01()%>">
			</div>
			<div class="input-group">
				<span class="input-group-text">재고수량</span>
				<input class="form-control" type="number" id="stock" name="stock" value="<%=bean.getStock()%>">
			</div>
			<div class="input-group">
				<span class="input-group-text">단가</span>
				<input class="form-control" type="number" id="price" name="price" value="<%=bean.getPrice()%>">
			</div>
			<div class="input-group">
				<span class="input-group-text">카테고리</span>
				<select id="category" name="category" class="form-select form-select-lg">
					<option value="-">---항목을 선택해주세요---</option>
					<option value="bread">빵</option>
					<option value="beverage">음료</option>
					<option value="cake">케이크</option>
					<option value="ramen">라면</option>
				</select>
			</div>
			<div class="input-group">
				<span class="input-group-text">상세설명</span>
				<input class="form-control" type="text" id="contents" name="contents" value="<%=bean.getContents()%>">
			</div>
			<div class="input-group">
				<span class="input-group-text">적립금</span>
				<input class="form-control" type="number" id="point" name="point" value="<%=bean.getPoint()%>">
			</div>
			<div class="input-group">
				<span class="input-group-text">입고일자</span>
				<input class="form-control" type="datetime" id="inputdate" name="inputdate" value="<%=bean.getInputdate()%>">
			</div>
			<br/>
			
			<div class="input-group">
				<button type="submit" class="btn btn-primary">등록</button>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="reset" class="btn btn-primary">초기화</button>
			</div>
		</form>
	</div>
</body>
</html>