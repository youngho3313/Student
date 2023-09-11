package com.shopping.model.bean;

public class Comment {
	private Integer cnum;
	private Integer no;
	private String id;
	private String content;
	private String regdate;
	
	
	public Comment() {
		super();
	}

	@Override
	public String toString() {
		return "Comment [cnum=" + cnum + ", no=" + no + ", id=" + id + ", content=" + content + ", regdate=" + regdate
				+ "]";
	}
	
	public Integer getCnum() {
		return cnum;
	}
	public void setCnum(Integer cnum) {
		this.cnum = cnum;
	}
	public Integer getNo() {
		return no;
	}
	public void setNo(Integer no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	
}
