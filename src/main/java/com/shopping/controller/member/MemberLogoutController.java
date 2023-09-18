package com.shopping.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;

public class MemberLogoutController extends SuperClass{
	@Override // 회원이 로그아웃을 시도합니다.
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		// session 영역에 남겨진 장바구니가 있으면, 임시테이블 WishList에 추가해 줍니다.
		
		
		// 로그인시 저장했던 로그인 정보 등을 깨끅히 비웁니다.
		super.session.invalidate();
		//MallCalculate의 removeAttribute()랑 다른점은 invalidate는 깔끔하게 전부 비운다는 점이다.
		
		super.gotoPage("member/meLoginForm.jsp"); //로그인 페이지로 이동함
	}
}
