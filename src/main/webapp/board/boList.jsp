<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./../common/bootstrap5.jsp" %>
<%@ include file="./../common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>board</title>
	<script type="text/javascript">
		$(document).ready(function(){
			/* 상세검색을 한 후 selected option을 보존하여 출력한다. */
			var optionList = $('#mode option');
			for(var i=0; i < optionList.length ; i++){
				if(optionList[i].value == '${requestScope.pageInfo.mode}'){
					optionList[i].selected = true ;
				}
			}
			/* 상세검색을 한 후 검색어(keyword)를 보존하여 출력한다. */
			$('#keyword').val('${requestScope.pageInfo.keyword}');
		});
		
		/* 전체검색 버튼 selectAll() */
		function searchAll(){
			location.href = '<%=notWithFormTag%>boList' ;
		}
		
		/* 글쓰기 버튼 */
		function writeForm(){
			location.href = '<%=notWithFormTag%>boInsert' ;
		}
	</script>
	<style type="text/css">
		.container{margin-top: 10px;}
		.rounded-pill{opacity: 0.7;}
		.removeUnderLine{text-decoration-line: none;}
		
		.mode, .keyword{margin: auto; }
		.col{margin: auto; }
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
					<th>수정</th>
					<th>답글</th>
				</tr>
			</thead>
			<tbody >
				<tr>
					<td colspan="9" align="right">
						<div class="row">
			               <div class="col-sm-1"></div>
			               <div class="col-sm-10">               
			                  <form name="myform" action="<%=withFormTag%>" method="get">
			                     <input type="hidden" name="command" value="boList">
			                     <div class="row">
			                        <div class="col-sm-12 ">
			                           <select class="form-control-sm" id="mode" name="mode">
			                              <option value="all" selected="selected">--- 선택해 주세요 ---
			                              <option value="id">작성자
			                              <option value="subject">글제목
			                              <option value="content">글내용
			                           </select>
			                        
			                        
			                        <input class="form-control-sm" type="text" name="keyword" id="keyword"
			                           placeholder="키워드 입력">
			                                           
			                           <button type="submit" class="btn btn-warning form-control-sm" onclick="">검색</button>
			                        
			                           <button type="button" class="btn btn-warning form-control-sm" onclick="searchAll();">전체 검색</button>
			                                            
			                           <button type="button" class="btn btn-info form-control-sm"  onclick="writeForm();">글 쓰기</button>
			                                 
			                           ${requestScope.pageInfo.pagingStatus}
			                        </div>
			                     </div>
			                  </form>                     
			               </div>
			               <div class="col-sm-1"></div>
			            </div>
					</td>		
				</tr>
				<c:forEach var="bean" items="${requestScope.datalist}" varStatus="status" >
					<tr>
					
						<td align="center">${bean.no}</td>
						<td>
							${bean.id}
							<%-- <c:if test="${bean.id==null}">
								아이디정보없음
							</c:if>
							<c:if test="${bean.id!= null}">
								${bean.id}
							</c:if> --%>
						</td>
						<td>${bean.password}</td>
						<td >
							<c:forEach var="i" begin="1" end="${bean.depth}" step="1">
								<span class="badge rounded-pill bg-secondary">re</span>
							</c:forEach>
							<a href="<%=notWithFormTag%>boDetail&no=${bean.no}">${bean.subject}</a>
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
						<td>
							<c:if test="${sessionScope.loginfo.id == bean.id || sessionScope.loginfo.id == 'admin'}">
								<c:set var="replyInfo" value="&groupno=${bean.groupno}&orderno=${bean.orderno}&depth=${bean.depth}"/>
								<a href="<%=notWithFormTag%>boUpdate&no=${bean.no}${requestScope.pageInfo.flowParameter}${replyInfo}">
									수정
								</a>
							</c:if>
						</td>
						<td>
							<c:set var="replyInfo" value="&groupno=${bean.groupno}&orderno=${bean.orderno}&depth=${bean.depth}"/>
							
							<a href="<%=notWithFormTag%>boReply&no=${bean.no}${requestScope.pageInfo.flowParameter}${replyInfo}">
								답글
							</a>
						</td>
					</tr>
					
				</c:forEach>
				
			</tbody>
		</table>
		${requestScope.pageInfo.pagingHtml}
		
	</div>
</body>
</html>