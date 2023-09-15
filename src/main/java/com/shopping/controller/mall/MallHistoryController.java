package com.shopping.controller.mall;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.controller.product.ProductListController;
import com.shopping.model.bean.Order;
import com.shopping.model.dao.MallDao;

public class MallHistoryController extends SuperClass {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		if(super.loginfo==null) {
			super.youNeededLogin();
			return;
		}
		
		MallDao dao = new MallDao() ;
		
		try {
			List<Order> orderList = dao.GetHistory(super.loginfo.getId()) ;
			if(orderList.size()==0) {
				super.setAlertMessage("이전 결재 내역이 존재하지 않습니다."); 
				new ProductListController().doGet(request, response); // prList로 이동
				
			}else {
				request.setAttribute("orderList", orderList); // request에 바인딩
				super.gotoPage("mall/maHistory.jsp");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}
