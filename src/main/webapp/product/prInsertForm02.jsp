<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./../common/bootstrap5.jsp" %>
<%@ include file="./../common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>prInsertForm</title>
	<script type="text/javascript">
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
		<h2>상품 등록</h2>
		<p>상품 등록하는 페이지 입니다.</p>
		<form action="">
			<div class="input-group">
				<span class="input-group-text">상품번호</span>
				<input class="form-control" type="number" id="pnum" name="pnum">
			</div>
			<div class="input-group">
				<span class="input-group-text">상품이름</span>
				<input class="form-control" type="text" id="name" name="name">
			</div>
			<div class="input-group">
				<span class="input-group-text">제조 회사</span>
				<input class="form-control" type="text" id="company" name="company">
			</div>
			<div class="input-group">
				<span class="input-group-text">이미지파일이름</span>
				<input class="form-control" type="file" id="image01" name="image01">
			</div>
			<div class="input-group">
				<span class="input-group-text">재고수량</span>
				<input class="form-control" type="number" id="stock" name="stock">
			</div>
			<div class="input-group">
				<span class="input-group-text">단가</span>
				<input class="form-control" type="number" id="price" name="price">
			</div>
			<div class="input-group">
				<span class="input-group-text">카테고리</span>
				<select id="category" name="category" class="form-select form-select-lg">
					<option value="-">---항목을 선택해주세요---</option>
					<option value="bread">빵</option>
					<option value="beverage">음료</option>
					<option value="cake">케이크</option>
				</select>
			</div>
			<div class="input-group">
				<span class="input-group-text">상세설명</span>
				<input class="form-control" type="text" id="contents" name="contents">
			</div>
			<div class="input-group">
				<span class="input-group-text">적립금</span>
				<input class="form-control" type="number" id="point" name="point">
			</div>
			<div class="input-group">
				<span class="input-group-text">입고일자</span>
				<input class="form-control" type="date" id="inputdate" name="inputdate">
			</div>
			
			
			<div class="input-group">
				<button type="submit" class="btn btn-primary" onclick="return validCheck();">
					등록
				</button>
				&nbsp;&nbsp;&nbsp;
				<button type="reset" class="btn btn-primary">초기화</button>
			</div>
		</form>
	</div>
</body>
</html>