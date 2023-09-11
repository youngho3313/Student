package com.shopping.controller.comment;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.controller.board.BoardDetailController;
import com.shopping.model.bean.Comment;
import com.shopping.model.dao.CommentDao;

public class CommentInsertController extends SuperClass{
	@Override // 부모 글번호에 대하여 로그인한 사람이 댓글을 작성하는 로직입니다.////
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);
		
		Comment bean = new Comment() ;
		bean.setNo(Integer.parseInt(request.getParameter("no"))); // 부모(게시물) 글번
		bean.setContent(request.getParameter("contetn")); // 내가 작성한 댓글 내용
		bean.setId(request.getParameter("id")); // 나의 아이디
		
		CommentDao dao = new CommentDao();
		int cnt = -1;
		
		try {
			cnt = dao.InsertData(bean);
			
			new BoardDetailController().doPost(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
