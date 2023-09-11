package com.shopping.controller.product;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.shopping.controller.SuperClass;
import com.shopping.model.bean.Category;
import com.shopping.model.bean.Product;
import com.shopping.model.dao.CategoryDao;
import com.shopping.model.dao.ProductDao;

public class ProductUpdateController  extends SuperClass{
	private final String PREFIX = "product/";
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		// Categories 테이블에서 상품 카테고리 목록을 읽어서 request에 바인딩합니다.
		CategoryDao cdao = new CategoryDao();
		List<Category> lists = null;
		
		//상품 수정시 넘어오는 상품번호를 우선 챙깁니다.
		Integer pnum = Integer.parseInt(request.getParameter("pnum"))  ;
		
		ProductDao pdao = new ProductDao();
		Product bean =  pdao.GetDataByPk(pnum) ;
		
		try {
			lists = cdao.getCategoryList("product", "select");
			request.setAttribute("categories", lists);
			request.setAttribute("bean", bean); // 기존에 저장되어 있는 데이터를 불러오는데 사용한다.
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		super.gotoPage(PREFIX + "prUpdateForm.jsp"); // prUpdate.jsp 로 변경?
		
	}
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);
		
		// Object를 MultipartRequest로 강등
		MultipartRequest mr = (MultipartRequest)request.getAttribute("mr"); 
		
		Product bean = new Product();
		
		//상품 등록과는 다르게 수정은 상품번호를 반드시 챙겨야 합니다.
		bean.setPnum(super.getNumberData(mr.getParameter("pnum")));
		
		bean.setName(mr.getParameter("name"));
		bean.setCompany(mr.getParameter("company"));
		
		bean.setImage01(mr.getFilesystemName("image01"));
		bean.setImage02(mr.getFilesystemName("image02"));
		bean.setImage03(mr.getFilesystemName("image03"));
		
		bean.setStock(super.getNumberData(mr.getParameter("stock")));
		bean.setPrice(super.getNumberData(mr.getParameter("price")));
		
		bean.setCategory(mr.getParameter("category"));
		bean.setContents(mr.getParameter("contents"));
		
		bean.setPoint(super.getNumberData(mr.getParameter("point")));
		bean.setInputdate(mr.getParameter("inputdate"));
		
		ProductDao dao = new ProductDao();
		int cnt = -1;
		try {
			cnt = dao.UpdateData(bean);
			
			if(cnt == -1) { 
				super.gotoPage(PREFIX + "prUpdateForm.jsp");
				
			}else {
				String gotopage = super.getUrlInformation("prList");
				gotopage += "&pageNumber=" + mr.getParameter("pageNumber");
				gotopage += "&pageSize=" + mr.getParameter("pageSize");
				gotopage += "&mode=" + mr.getParameter("mode");
				gotopage += "&keyword=" + mr.getParameter("keyword");
				response.sendRedirect(gotopage);
				
//				new ProductInsertController().doGet(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
