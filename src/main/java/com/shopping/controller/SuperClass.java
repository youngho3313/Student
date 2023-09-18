package com.shopping.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shopping.model.bean.Member;
import com.shopping.model.mall.CartManager;

// 하위 컨트롤러 들이 공통적으로 사용하는 기능들을 여기에 명시합니다.
public class SuperClass implements SuperController {
	private HttpServletRequest request ;
	private HttpServletResponse response ;
	protected HttpSession session ; // 세션
	
	protected Member loginfo = null ; //로그인 여부를 파악하는 변수
	protected CartManager mycart = null; // 나의 카트
	
	public void youNeededLogin() {
		// 미로그인시 로그인 페이지로 이동시킵니다.
		String message = "로그인이 필요한 서비스입니다." ;
		this.gotoPage("member/meLoginForm.jsp") ;
	}
	
	public String getUrlInfomation(String todoCommand) {
		// todoCommand : todolist.txt 파일에 명시에 커맨드 이름
		// command 이름을 사용하여 FullName 웹 주소 형식으로 반환해 줍니다.
		String appName = this.request.getContextPath();
		String mappingName = "/Shopping" ;
		
		String text = appName + mappingName + "?command=" + todoCommand ;
		return text;
	}
	
	public Integer getNumberData(String parameter) {
		// 숫자형 파라미터에 대한 처리를 해주는 메소드
		// 잘못된 숫자 형식이면 0을 반환해 줍니다.
		boolean flag = false;
		
		flag = parameter==null || parameter.equals("") || parameter.equals("null") ;
		
		return flag ? 0 : Integer.parseInt(parameter) ;
	}
	
	public void setAlertMessage(String message) {
		// session 영역에서 "alertMessage"라는 이름으로 사용자에게 주의/오류/경고 문구등을 띄워 줍니다.
		// in common.jsp 파일 하단 참조
		session.setAttribute("alertMessage", message);
	}
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		this.request = request ;
		this.response = response ;
		this.session = request.getSession();
		
		this.loginfo = (Member)session.getAttribute("loginfo") ;
		this.mycart = (CartManager)session.getAttribute("mycart") ;
		if(mycart==null) {mycart = new CartManager(); }
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		this.request = request ;
		this.response = response ;
		this.session = request.getSession();
		
		this.loginfo = (Member)session.getAttribute("loginfo") ;
		this.mycart = (CartManager)session.getAttribute("mycart") ;
		if(mycart==null) {mycart = new CartManager(); }
	}

	public void gotoPage(String gotoPage) {
		if(this.request == null) { // HomeController에서 super.doGet(request, response); 실행했는지 체크
			System.out.println("doGet/doPost() 메소드 호출 누락");
			return ;
		}
		
		// 요청한 페이지로 포워딩합니다.
		RequestDispatcher dispatcher = null;
		try {
			dispatcher = request.getRequestDispatcher(gotoPage);
			dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String getUrlInformation(String todoCommand) {
		//  에서 사용합니다.
		String appName = this.request.getContextPath();
		String mappingName = "/Shopping";
		
		String text = appName + mappingName + "?command=" + todoCommand ;
		return text ;
	}





}
