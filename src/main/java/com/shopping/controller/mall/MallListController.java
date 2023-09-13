package com.shopping.controller.mall;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;

public class MallListController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		System.out.println("카트 품목 갯수 : " + super.mycart.GetCartItemSize());
		
		Map<Integer, Integer> cartItems =  super.mycart.GetAllCartList();
		for(Integer key : cartItems.keySet()) {
			Integer value = cartItems.get(key);
			System.out.println("상품 번호 : " + key + ", 구매수량 : " + value );
		}
	}
}
