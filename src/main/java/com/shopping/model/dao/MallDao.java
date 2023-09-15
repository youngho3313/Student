package com.shopping.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import com.shopping.model.bean.Member;
import com.shopping.model.bean.Order;

public class MallDao extends SuperDao {
	
	public List<Order> GetHistory(String id) throws Exception {
		// MallHistoryController.doGet에서 사용합니다.
		// 과거 쇼핑 내역을 최근 날짜순으로 정렬하여 반환해 줍니다.
		String sql = " select * from orders where id = ? order by orderdate desc " ;
		
		conn = super.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
		
		List<Order> orderList = new ArrayList<Order>();
		
		while(rs.next()) {
			orderList.add(this.makeOrderBean(rs)) ;
		}
		
		if(rs!=null) { rs.close();}
		if(pstmt!=null) { pstmt.close();}
		if(conn!=null) { conn.close();}
		
		return orderList;
	}
	
	private Order makeOrderBean(ResultSet rs) throws Exception {
		// 이 파일 GetHistory에서 사용합니다.
		Order bean = new Order() ;
		bean.setId(rs.getString("id"));
		bean.setOid(rs.getInt("oid"));
		bean.setOrderdate(String.valueOf(rs.getDate("orderdate")) );
		bean.setRemark(rs.getString("remark"));
		return bean;
	}

	// 결제 작업을 처리하는 메소드입니다. 
	public void Calculate(Member payer, Map<Integer, Integer> cartList) throws Exception {
		// MallCalculateController.doGet에서 사용
		// payer : 계산을 하는 사람(포인트 적립 대상자)
		// cartList : 카트에 담겨있는 '상품 번호'와 '구매 수량'
		
		PreparedStatement pstmt = null ;
		ResultSet rs = null;
		int cnt = -1;
		String sql = "" ;
		
		conn = super.getConnection();
		conn.setAutoCommit(false);
		
		// step01 : 주문 테이블(Orders)에 매출 1건 입력
		sql = " insert into orders(oid, id, orderdate) " ;
		sql += " values(seqoid.nextval, ?, sysdate)" ;
		pstmt = conn.prepareStatement(sql); //DML
		pstmt.setString(1, payer.getId());
		
		cnt = pstmt.executeUpdate() ;
		if(pstmt!=null) { pstmt.close();}
		//pstmt = null ; // step02를 실행하기 위해 pstmp의 참조관계를 끊는다. 
		//if(pstmt!=null) { pstmt.close();}를 사용해도 되고
		//pstmp01, pstmt02 식으로 이름을 다르게 해도 된다.
		
		// step02 : 'step01'에서 방금 들어간 송장 번호 읽기
		sql = " select max(oid) as invoice from orders" ;
		pstmt = conn.prepareStatement(sql); 
		rs = pstmt.executeQuery();
		
		int invoice = 0; // 송장번호
		if(rs.next()) {
			invoice = rs.getInt("invoice");
		}
		
		int totalPoint = 0; // 총 적립 포인트
		
		// 반복문을 사용하여 
		for(Integer pnum : cartList.keySet()) {
			// step03 : 주문 상세 테이블(OrderDetails)에 각 데이터 추가하기
			sql = " insert into orderdetails(odid, oid, pnum, qty) " ;
			sql += " values(seqodid.nextval, ?, ?, ?)" ;
			pstmt = conn.prepareStatement(sql); 
			pstmt.setInt(1, invoice); // 송장번호
			pstmt.setInt(2, pnum); // 상품 번호
			pstmt.setInt(3, cartList.get(pnum));// 구매수량
			
			cnt = pstmt.executeUpdate() ;
			if(pstmt!=null) { pstmt.close();}
			
			// step04 : 각 상품들의 재고 수량 뺄셈하기
			sql = " update products set stock = stock - ?  " ;
			sql += " where pnum = ? " ;
			pstmt = conn.prepareStatement(sql); 
			pstmt.setInt(1, cartList.get(pnum)); // 구매수량
			pstmt.setInt(2, pnum); // 상품 번호
			
			cnt = pstmt.executeUpdate() ;
			if(pstmt!=null) { pstmt.close();}
			
			// 각 상품들의 적립포인트를 구해줍니다.
			int point = cartList.get(pnum) * new ProductDao().GetMileagePoint(pnum);
			totalPoint += point ;
		}
		
		
		// step05 : 해당 회원의 적립포인트 변경하기 
		sql = " update members set mpoin = mpoint + ?  " ;
		sql += " where id = ? " ;	
		pstmt = conn.prepareStatement(sql); 
		pstmt.setInt(1, totalPoint); // 적립할 포인트
		pstmt.setString(2, payer.getId()); // 상품 번호
		cnt = pstmt.executeUpdate() ;
		if(pstmt!=null) { pstmt.close();}
		
		conn.commit();
		
		if(rs!=null) { rs.close();}
		if(pstmt!=null) { pstmt.close();}
		if(conn!=null) { conn.close();}
	}



}
