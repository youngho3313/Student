package com.shopping.myservlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.sport.SportController;
import com.shopping.utility.MyUtility;

/**
 * Servlet implementation class SportServlet
 */
@WebServlet(urlPatterns= {"/Sport"}, initParams = {
		@WebInitParam(name = "txtSport", value = "/WEB-INF/sport.txt"),
		@WebInitParam(name = "txtSetting2", value = "/WEB-INF/setting2.txt")
})
public class SportServlet extends HttpServlet {
	private String txtSport = null;
	private String txtSetting2 = null;
	
	private ServletContext application = null;
	
	// map for "sports.txt"
	private Map<String, SportController> sportMap = null;
	
	// map for "setting2.txt"
	private Map<String, String> setting2Map = null;
	
	
	private static final long serialVersionUID = 1L;
    public SportServlet() {}


	public void init(ServletConfig config) throws ServletException {
		System.out.println(this.getClass() + " init() called");
		
		this.txtSport = config.getInitParameter("txtSport");
		System.out.println("txtSport is [" + txtSport + "]");
		
		this.txtSetting2 = config.getInitParameter("txtSetting2");
		System.out.println("txtSetting2 is [" + txtSetting2 + "]");
		
		
		
		
		this.application = config.getServletContext() ;
		
		String webFullPathName = application.getRealPath(txtSport);
		System.out.println("webFullPathName is [" + webFullPathName + "]");
		
		String webSetting2Name = application.getRealPath(txtSetting2);
		System.out.println("webSetting2Name is [" + webSetting2Name + "]");
		
		sportMap = MyUtility.getSportMap(webFullPathName);
		System.out.println("맵 사이즈 : " + sportMap.size());
		
		setting2Map = MyUtility.getSetting2Map(webSetting2Name);
		
		// map : 모든 이가 공유할 데이터 객체 이름
		application.setAttribute("map", setting2Map);
		
		
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String command = request.getParameter("command");
		System.out.println("command is [" + command + "]");
		
		SportController controller = sportMap.get(command);
		if(controller != null) {
			controller.play();
		}else {
			System.out.println("request command is not found");
		}
		
		String gotopage = "example/sportTo.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(gotopage);
		dispatcher.forward(request, response);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doProcess(request, response);
	}

}
