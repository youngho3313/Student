package com.shopping.model.bean;

public class Combo02 {
	private String name;
	private int cnt;
	
//	select m.name, count(*) as cnt
//	from members m inner join boards b 
//	on m.id = b.id
//	group by m.name
//	order by m.name ; 
	
	
	public Combo02() {}

	@Override
	public String toString() {
		return "Combo02 [name=" + name + ", cnt=" + cnt + "]";
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	
	
	
	
}
