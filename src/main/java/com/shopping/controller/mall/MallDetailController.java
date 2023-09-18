package com.shopping.controller.mall;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.model.bean.Order;
import com.shopping.model.dao.MallDao;
import com.shopping.model.mall.CartItem;

public class MallDetailController extends SuperClass {
	// maHistory의 '상세보기'에서 사용합니다.
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
			Order order = dao.getDetailHistory(oid) ; 
			List<CartItem> lists = dao.showDetail(oid);
			
			request.setAttribute("order", order); // 바인딩 : 주문정보
			request.setAttribute("lists", lists); // 바인딩 : 쇼핑정보
			
			super.gotoPage("mall/maDetail.jsp");
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}
