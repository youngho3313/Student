package com.shopping.controller.mall;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.model.dao.MallDao;

public class MallDetailController extends SuperClass {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		if(super.loginfo == null) {
			super.youNeededLogin();
			return;
		}
		
		MallDao dao = new MallDao();
		try {
			int oid = Integer.parseInt(request.getParameter("oid")) ;
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}
