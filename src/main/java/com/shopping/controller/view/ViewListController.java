package com.shopping.controller.view;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;

public class ViewListController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 데이터 보기 페이지로 이동합니다.
		super.doGet(request, response);
		super.gotoPage("view/ViewList.jsp");
	}
}
