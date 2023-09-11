package com.shopping.myservlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shopping.model.bean.World;

/**
 * Servlet implementation class WorldServlet
 */
@WebServlet(
		urlPatterns = { "/world" }, 
		initParams = { 
				@WebInitParam(name = "tel", value = "0212345678"), 
				@WebInitParam(name = "fax", value = "0211112222")
		})
public class WorldServlet extends HttpServlet {
	private String tel ;
	private String fax ;
	
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WorldServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(this.getClass() + " doPost") ;
		String pnum = request.getParameter("pnum");
		String name = request.getParameter("name");
		String company = request.getParameter("company");
		String price = request.getParameter("price");
		
		System.out.println("pnum : " + pnum );
		System.out.println("name : " + name );
		System.out.println("company : " + company );
		System.out.println("price : " + price );
		
		// 개별 변수 바인딩
		request.setAttribute("pnum", pnum);
		request.setAttribute("name", name);
		request.setAttribute("company", company);
		request.setAttribute("price", price);
		
		
		// bean 객체 바인딩
		World bean = new World();
		bean.setPnum(pnum) ;
		bean.setName(name) ;
		bean.setCompany(company) ;
		bean.setPrice(price) ;
		request.setAttribute("bean", bean) ;
		
		HttpSession session = request.getSession();
		session.setAttribute("tel", this.tel) ;
		session.setAttribute("fax", this.fax) ;
		
		String gotopage = "example/servletTo02.jsp";
		
		//포워딩 방식
		RequestDispatcher dispatcher = request.getRequestDispatcher(gotopage);
		dispatcher.forward(request, response);
		
	}
    
	public void init(ServletConfig config) throws ServletException {
		System.out.println("서블릿이 초기화됩니다.");
		this.tel = config.getInitParameter("tel");
		this.fax = config.getInitParameter("fax");
		
		System.out.println("tel : " + this.tel );
		System.out.println("fax : " + this.fax );
		
		ServletContext application = config.getServletContext();
		String world = "헬로 월드입니다.";
		application.setAttribute("world", world);
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8") ;
		String method = request.getMethod() ;
		if(method.equalsIgnoreCase("post")) {
			this.doPost(request, response) ;
		}else {
			this.doGet(request, response) ;
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(this.getClass() + " doGet") ;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	

}
