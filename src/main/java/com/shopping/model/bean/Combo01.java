package com.shopping.model.bean;

public class Combo01 {
	private String name;
	private String subject;
	private String content;
	private String regdate;
	
	
	public Combo01() {}

	@Override
	public String toString() {
		return "Combo01 [name=" + name + ", subject=" + subject + ", content=" + content + ", regdate=" + regdate + "]";
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
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
