package com.shopping.controller.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.model.bean.Board;
import com.shopping.model.dao.BoardDao;

public class BoardUpdateController extends SuperClass {
	private final String PREFIX = "board/" ;
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		// 수정할 게시물 번호를 우선 챙깁니다. 
		Integer no = Integer.parseInt(request.getParameter("no")) ;
		
		BoardDao dao = new BoardDao() ;
		Board bean = dao.GetDataByPk(no) ;
		request.setAttribute("bean", bean); 
		
		super.gotoPage(PREFIX + "boUpdateForm.jsp");	
	}
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);
		
		Board bean = new Board() ;
		bean.setNo(Integer.parseInt(request.getParameter("no")));
		bean.setId(request.getParameter("id"));
		bean.setPassword(request.getParameter("password"));
		bean.setSubject(request.getParameter("subject"));
		bean.setContent(request.getParameter("content"));
		bean.setRegdate(request.getParameter("regdate"));
		
		// 답글을 위한 파라미터는 꼭 챙겨야 합니다ㅏ.
		Integer groupno = Integer.parseInt(request.getParameter("groupno"));
		Integer orderno = Integer.parseInt(request.getParameter("orderno"));
		Integer depth = Integer.parseInt(request.getParameter("depth"));
		bean.setGroupno(groupno); // 넘겨진 그룹 번호를 그대로 사용
		bean.setOrderno(orderno); // 순서 번호는 그대로 사용
		bean.setDepth(depth); // 글의 깊이는 그대로 사용
		
		BoardDao dao = new BoardDao() ;
		int cnt = -1 ;
		try {
			cnt = dao.UpdateData(bean);	
			
			if(cnt == -1) { // 등록 실패
				new BoardUpdateController().doGet(request, response);
				
			}else { // 성공
				// 게시물 목록 보기 페이지로 이동
				//현재 진행중인 페이지로 이동하기 위하여 페이징관련 파라미터도 넘겨줍니다.
				String gotopage = super.getUrlInformation("boList");
				gotopage += "&pageNumber=" + request.getParameter("pageNumber");
				gotopage += "&pageSize=" + request.getParameter("pageSize");
				gotopage += "&mode=" + request.getParameter("mode");
				gotopage += "&keyword=" + request.getParameter("keyword");
				response.sendRedirect(gotopage);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			new BoardUpdateController().doGet(request, response);
		}		
	}
}
