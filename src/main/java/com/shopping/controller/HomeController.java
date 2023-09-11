package com.shopping.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HomeController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response); // "doGet/doPost() 메소드 호출 누락"메세지가 뜨면 이 줄이 빠진 것이다.
		super.gotoPage("common/home.jsp");
	}
}
