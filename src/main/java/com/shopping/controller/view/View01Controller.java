package com.shopping.controller.view;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.model.bean.Combo01;
import com.shopping.model.dao.CompositeDao;

public class View01Controller extends SuperClass {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		CompositeDao dao = new CompositeDao();
		List<Combo01> lists = null;
		
		try {
			lists = dao.View01();
			request.setAttribute("lists", lists);
			super.gotoPage("view/View01.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
