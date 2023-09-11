<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="./../common/bootstrap5.jsp" %>
<%@ include file="./../common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>prInsertForm</title>
	<style type="text/css">
		.input-group{margin: 7px;}
		.input-group-text{
			display: block;
			margin-left: auto;
			margin-right: auto;
		}
		#buttonset{margin-top: 15px; }
		
		#productPnum1{display:none; visibility:hidden;} /* 상품 번호는 안보이게 지정 */
	</style>
	<script type="text/javascript">
		$(document).ready(function(){
			$('#inputdate').datepicker({dateFormat: "yy/mm/dd"});
			
			/* prepend : 제일 앞에 붙인다. , append : 제일 뒤에 붙인다. */
			/* $("#category").prepend('<option value="aaa">bbb</option>'); */
			
			/* 2번째 요소(빵)를 선택한다. */
			/* $('option').eq(2).attr('selected', true); */
			
			/* 이전에 선택했던 카테고리 정보가 자동으로 선택되어 있도록 합니다. */
			var category = '${requestScope.bean.category}';
			/* alert(category); */
			
			var optionList = $('#category option');
			optionList.each(function(){
				console.log($(this).val());
				if($(this).val() == category){
					$('option[value="' + category + '"]').attr('selected', true);
				}
			});
		});
		function validCheck(){
			
			var name = $('#name').val();
			if(name.length < 4 || name.length > 10){
				swal('상품명은 4글자 이상 10글자 이하이어야 합니다.');
				return false;
			}
			
			var company= $('#company').val();
			if(company.length < 4 || company.length > 10){
				swal('제조 회사는 4글자 이상 10글자 이하이어야 합니다.');
				return false;
			}
			
			var contents = $('#contents').val();
			if(contents.length < 10 || contents.length > 30){
				swal('상품에 대한 코멘트는 10글자 이상 30글자 이하이어야 합니다.');
				return false;
			}
			
			var image01 = $('#image01').val();
			if(image01 == ''){
				swal('이미지는 필수 입력 사항입니다.');
				return false;
			}
			var isCheck = false;
			const imgCheck = ['.png', '.jpg'] ;
			for(var i=0 ; i < imgCheck.length ; i++){
				if(image01.endsWith(imgCheck[i])){
					isCheck = true;
					break;
				}
			}if(isCheck == false){
				alert('이미지의 확장자는  png 또는 jpg 형식이어야 합니다.(')
			}
			
			var stock = $('#stock').val();
			if(stock == '' || isNaN(stock) == true){
				swal('재고는(은) 숫자 형식이어야 합니다.');
				$('#stock').focus();
				return false;
			}else{
				const maxStock = 5;
				var numStock = Number(stock);
				if (numStock < 0 || numStock >= maxStock){
					swal('재고는 최대 5개까지입니다.');
					$('#stock').focus();
					return false;
				}
			}
			
			var price = $('#price').val();
			if(price == '' || isNaN(price) == true){
				swal('단가는(은) 숫자 형식이어야 합니다.');
				$('#price').focus();
				return false;
			}else{
				var numPrice = Number(price);
				if(numPrice < 100 || numPrice > 10000){
					swal('단가는(은) 100이상 10000이하의 값이어야 합니다.');
					$('#price').focus();
					return false;
				}
			}
			
			var point = $('#point').val();
			if(point == '' || isNaN(price) == true){
				swal('포인트는(은) 숫자 형식이어야 합니다.');
				$('#point').focus();
				return false;
			}else{
				var numPoint = Number(point);
				if(numPoint < 3 || numPoint > 10){
					swal('포인트는 3이상 10이하의 값이어야 합니다.');
					$('#point').focus;
					return false;
				}
			}
			
			var category = $('#category').val();
			if(category == '-'){
				swal('카테고리를 반드시 선택해 주세요.');
				$('#category').focus();
				return false;
			}
			/* 날짜 형식은 반드시 yyyy/mm/dd 형식 또는 yyyy-mm-dd으로 작성해 주세요. */
			var inputdate = $('#inputdate').val();
			var regex = /^\d{4}[\/-][01]\d{1}[\/-][0123]\d{1}$/ ;
			var result = regex.test(inputdate) ;
			if(result == false){
  				alert('날짜 형식은 반드시 yyyy/mm/dd 형식 또는 yyyy-mm-dd으로 작성해 주세요.');
  				$('#inputdate').focus() ;
  				return false ;
  			} 
		}
		
	</script>
</head>
<body>
	<div class="container">
		<h2>상품 수정</h2>
		<p>관리자가 상품을 수정하는 페이지 입니다.</p>
		<form action="<%=withFormTag%>" method="post" enctype="multipart/form-data">
			<input type="hidden" name="pageNumber" value="<%=request.getParameter("pageNumber")%>">
			<input type="hidden" name="pageSize" value="<%=request.getParameter("pageSize")%>">
			<input type="hidden" name="mode" value="<%=request.getParameter("mode")%>">
			<input type="hidden" name="keyword" value="<%=request.getParameter("keyword")%>">
		
			<input type="hidden" name="command" value="prUpdate">
			<div id="productPnum" class="input-group">
				<span class="input-group-text col-md-2">상품번호</span>
				<input class="form-control" type="number" disabled="disabled"
					id="fakepnum" name="fakepnum" value="${requestScope.bean.pnum}">
				
				<input type="number" id="pnum" name="pnum" value="${requestScope.bean.pnum}">
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">상품이름</span>
				<input class="form-control" type="text" id="name" name="name" value="${requestScope.bean.name}">
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">제조 회사</span>
				<input class="form-control" type="text" id="company" name="company" value="${requestScope.bean.company}">
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">이미지01</span>
				<input class="form-control" type="file" id="image01" name="image01" >
				<input type="text" name="deleteImage01" value="${requestScope.bean.image01}">
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">이미지02</span>
				<input class="form-control" type="file" id="image02" name="image02">
				<input type="text" name="deleteImage02" value="${requestScope.bean.image02}">
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">이미지03</span>
				<input class="form-control" type="file" id="image03" name="image03">
				<input type="text" name="deleteImage03" value="${requestScope.bean.image03}">
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">재고수량</span>
				<input class="form-control" type="number" id="stock" name="stock" value="${requestScope.bean.stock}">
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">단가</span>
				<input class="form-control" type="number" id="price" name="price" value="${requestScope.bean.price}">
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">카테고리</span>
				<select id="category" name="category" class="form-select form-select-lg">
					<c:forEach var="category" items="${requestScope.categories}">
						<option value="${category.engname}">${category.korname}</option>
					</c:forEach>
				</select>
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">상세설명</span>
				<input class="form-control" type="text" id="contents" name="contents" value="${requestScope.bean.contents}">
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">적립금</span>
				<input class="form-control" type="number" id="point" name="point" value="${requestScope.bean.point}">
			</div>
			
			<div class="input-group">
				<span class="input-group-text col-md-2">입고일자</span>
				<input class="form-control date_style" type="datetime" id="inputdate" name="inputdate" value="${requestScope.bean.inputdate}">
			</div>
			
			<div id="buttonset"  class="input-group">
				<button type="submit" class="btn btn-primary" onclick="return validCheck();">
					수정
				</button>
				&nbsp;&nbsp;&nbsp;
				<button type="reset" class="btn btn-primary">초기화</button>
			</div>
		</form>
	</div>
</body>
</html>