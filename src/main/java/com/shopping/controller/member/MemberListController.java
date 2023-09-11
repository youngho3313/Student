package com.shopping.controller.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.model.bean.Member;
import com.shopping.model.dao.MemberDao;
import com.shopping.utility.Paging;

public class MemberListController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		//페이징 처리를 위한 파라미터
		String pageNumber = request.getParameter("pageNumber");
		String pageSize = request.getParameter("pageSize") ;
		String mode = request.getParameter("mode") ;
		String keyword = request.getParameter("keyword") ;
		
		MemberDao dao = new MemberDao();
		try {
			int totalCount = dao.GetTotalRecordCount();
			String url = super.getUrlInfomation("meList") ;
			boolean isGrid = false;
			Paging pageInfo = new Paging(pageNumber, pageSize, totalCount, url, mode, keyword, isGrid);
			
			List<Member> lists = dao.selectAll(pageInfo);
			
			request.setAttribute("datalist", lists);
			
			//페이징관련 정보를 바인딩
			request.setAttribute("pageInfo", pageInfo);
			
			super.gotoPage("member/meList.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
