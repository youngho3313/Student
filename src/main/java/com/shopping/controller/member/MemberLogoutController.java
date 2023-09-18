package com.shopping.controller.member;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.model.dao.MallDao;

public class MemberLogoutController extends SuperClass{
	@Override // 회원이 로그아웃을 시도합니다.
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		MallDao dao = new MallDao();
		Map<Integer, Integer> wishList = super.mycart.GetAllCartList(); //CartManager.GetAllCartList
		try {
			// session 영역에 남겨진 장바구니가 있으면, 임시테이블 WishList에 추가해 줍니다.
			if(super.loginfo != null){
				if(wishList.size() > 0) {
					dao.insertWishList(super.loginfo.getId(), wishList); // MallDao.insertWishList
				}
				
			}
			
			// 로그인시 저장했던 로그인 정보 등을 깨끅히 비웁니다.
			super.session.invalidate();
			//MallCalculate의 removeAttribute()랑 다른점은 invalidate는 깔끔하게 전부 비운다는 점이다.
			
			super.gotoPage("member/meLoginForm.jsp"); //로그인 페이지로 이동함
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
}
