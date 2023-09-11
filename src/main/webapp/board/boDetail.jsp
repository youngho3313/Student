<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="./../common/bootstrap5.jsp" %>
<%@ include file="./../common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<script type="text/javascript">
		function getListComment(){
			$('#comment_list').empty(); //.empty : jquery함수
			/* $.ajax() 함수를 이용하여 데이터 보여주기 */
			$.ajax({
				url:'<%=notWithFormTag%>cmList', 
				data:'no=' + '${requestScope.bean.no}',
				type:'get',
				dataType:'json',
				success:function(result, status){
					/* console.log('result는 넘어온 데이터 결과 값') ; */
					/* console.log(result) ; */
					
					$.each(result, function(idx){ /* idx는 색인 번호 */
						var cnum = result[idx].cnum ;
						var id = result[idx].id ;
						var content = result[idx].content ;
						var regdate = result[idx].regdate ;
						addNewItem(cnum, id, content, regdate);
					});
				},
				error:function(result, status){
					console.log(result) ;
					console.log(status) ;
				}
			});
		}
		
		function addNewItem(cnum, id, content, regdate){
			/* 댓글 1개를 추가해주는 함수입니다. */
			var litag = $('<li>') ; /* 댓글의 외곽 li 태그 */
			litag.addClass('commentItem') ;
			
			var ptag = $('<p>'); /* 작성자 정보가 들어갈 태그 */
			ptag.addClass('id') ;
			
			var spantag = $('<span>'); /* 작성자 이름이 들어갈 태그 */
			spantag.addClass('name') ;
			spantag.html(id + "님");
			
			var spandate = $('<span>'); /* 작성 일자가 들어갈 태그 */
			spandate.html("&nbsp;&nbsp;/&nbsp;&nbsp;" = regdate + '&nbsp;');
			
			// 로그인한 사람이 작성한 댓글이면 삭제 가능
			if(id == '${sessionScope.loginfo.id}'){ 
				var inputtag = $('<input>') ;  /* 삭제 버튼 */
				var attrlist = {'id':id, 'type':'button', 'value':'삭제', 
						        'class':'btn btn-ontline-primary', 'cnum':cnum};
				inputtag.attr(attrlist) ;
				inputtag.addClass('delete_btn') ;
			}else{
				var inputtag = '' ;
			}
			
			var content_p = $('<p>') ; /* 작성한 댓글 내용 */
			content_p.html(content) ;
			
			/* 조립하기(compose up) */
			ptag.append(spantag).append(spandate).append(inputtag) ;
			litag.append(ptag).append(content_p) ;
			
			$('#comment_list').append(litag) ;
			
		}
		$(document).ready(function(){
			console.log('boDetail start');
			getListComment();
			
			/* 사용자가 댓글을 입력하고, 전송 버튼을 눌렀습니다. */
			$('#comment_form').submit(function(){
				/* 댓글 입력없이 전송 버튼을 누른 경우 */
				if($('#content').val()){
					alert('댓글을 입력해 주셔야 합니다.');
					$('#content').focus();
					reutrn false ;
				}
				
				/* post 방식으로 데이터를 전송합니다. */
				var URL = '<%=notWithFormTag%>cmInsert' ;
				var parameters = $('#comment_form').serialize() ;
				$.post(URL, parameters, function(data){
					$('#content').val('');
					getListComment(); /* 목록 갱신하기 */
				}).fail(funtion(){
					alert('댓글 작성에 실패하였습니다.');
					return false ;
				}) ;
				
				return true;
			});
		});
		
	</script>
	
	<style type="text/css">
      /* 댓글들을 위한 스타일 지정 */
      * {
         padding: 0;
         margin: 0;
         color: #333;
      }
      ul { list-style: none; }
      #container { padding: 30px 20px; }
      #insertComment {
         padding: 20px 15px;
         border-bottom: 1px solid #7BAEB5;
      }

      #insertComment label {
         display: inline-block;
         width: 80px;
         font-size: 14px;
         font-weight: bold;
         margin-bottom: 10px;
      }

      #insertComment input[type='text'], #insertComment textarea {
         border: 1px solid #ccc;
         vertical-align: middle;
         padding: 3px 10px;
         font-size: 12px;
         line-height: 150%;
      }

      #insertComment textarea {
         width: 450px;
         height: 120px ;
      }

      .commentItem {
         font-size: 13px;
         color: #333;
         padding: 15px;
         border-bottom: 1px dotted #ccc;
         line-height: 150%;
      }

      .commentItem .id {
         color: #555;
         line-height: 200%;
      }

      .commentItem .id input {
         vertical-align: middle;
      }

      .commentItem .id .name {
         color: #222;
         font-weight: bold;
         font-size: 14px;
      }
      
      .form-group {
         margin-bottom: 3px;
      }
      
      .form-control {
         height: 25px;
      }
      .btn-primary{opacity: 0.8;}
   </style>
	
</head>
<body>
	<div class="container">
		<h2>${requestScope.bean.no}번 글의 상세정보</h2>
		<table class="table">
			<thead></thead>
			<tbody>
				<tr>
					<td align="center">글번호</td>
					<td>${requestScope.bean.no}</td>
				</tr>
				<tr>
					<td align="center">아이디</td>
					<td>
						
						<c:if test="${requestScope.bean.id==null}">
								!아이디정보없음!
							</c:if>
							<c:if test="${requestScope.bean.id!= null}">
								${requestScope.bean.id}
							</c:if>
					</td>
				</tr>
				<tr>
					<td align="center">비밀번호</td>
					<td>${requestScope.bean.password}</td>
				</tr>
				<tr>
					<td align="center">글제목</td>
					<td>${requestScope.bean.subject}</td>
				</tr>
				<tr>
					<td align="center">글내용</td>
					<td>${requestScope.bean.content}</td>
				</tr>
				<tr>
					<td align="center">조회수</td>
					<td>${requestScope.bean.readhit}</td>
				</tr>
				<tr>
					<td align="center">작성일자</td>
					<td>${requestScope.bean.regdate}</td>
				</tr>
			</tbody>
		</table>
		
		<div id="backButton">
			<button type="button" class="btn btn-primary" onclick="history.back();">
				돌아 가기
			</button>
		</div>
		
		<div>
			<%-- 댓글 영역(Comment Zone --%>
			<ul id="comment_list">
				<%-- 여기에 동적으로 요소들을 추가합니다. --%>
			</ul>
		</div>
		
		<div id="insertComment">
			<form id="comment_form" method="post" role="form" class="form-horizontal" >
				<table class="table">
					<thead>
                    </thead>
                      <tbody>
                        <tr>
                          <td>
                             <label for="content" class="col-xs-3 col-lg-3 control-label">작성자</label>              
                          </td>
                          <td>
                           <input type="hidden" name="no" value="${bean.no}" />
                           <input type="text" name="fakeid" id="fakeid" class="form-control" size="10" 
                              disabled="disabled" value="${sessionScope.loginfo.name}(${sessionScope.loginfo.id})님">                           
                           <input type="hidden" name="id" id="id" value="${sessionScope.loginfo.id}">
                          </td>
                        </tr>
                        <tr>
                          <td>
                             <label for="content" class="col-xs-3 col-lg-3 control-label">댓글 내용</label>
                          </td>
                          <td>
                             <textarea name="content" rows="3" cols="50" id="content" ></textarea>
                          </td>
                        </tr>
                        <tr>
                          <td colspan="2">
                             <button type="submit" class="btn btn-info">저장하기</button> 
                        </td>
                        </tr>
                      </tbody>
				</table>
			</form>   
		</div>
		
	</div>
</body>
</html>