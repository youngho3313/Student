package com.shopping.model.bean;

public class Combo03 {
	private String mname;
	private String pname;
	private String orderdate;
	private int qty;
	private int price;
	private int amount;
	
	
//	select m.name mname, p.name pname, o.orderdate, od.qty, p.price, od.qty * p.price as amount
//	from ((members m inner join orders o
//	on m.id=o.id) inner join orderdetails od
//	on o.oid=od.oid) inner join products p
//	on od.pnum=p.pnum
//	order by p.name desc, m.name asc ;
	
	
	public Combo03() {}


	@Override
	public String toString() {
		return "Combo03 [mname=" + mname + ", pname=" + pname + ", orderdate=" + orderdate + ", qty=" + qty + ", price="
				+ price + ", amount=" + amount + "]";
	}


	public String getMname() {
		return mname;
	}


	public void setMname(String mname) {
		this.mname = mname;
	}


	public String getPname() {
		return pname;
	}


	public void setPname(String pname) {
		this.pname = pname;
	}


	public String getOrderdate() {
		return orderdate;
	}


	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}


	public int getQty() {
		return qty;
	}


	public void setQty(int qty) {
		this.qty = qty;
	}


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}


	public int getAmount() {
		return amount;
	}


	public void setAmount(int amount) {
		this.amount = amount;
	}

	
	
	
	
	
}
