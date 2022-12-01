package com.danbplus.member.sample.domain;

public class Member {
	
	String	mem_id;
	String	mem_pw;
	String	mem_name;
	String	mem_tel;
	String	mem_regDate;	
	String	mem_uptDate;
	
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_pw() {
		return mem_pw;
	}
	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_tel() {
		return mem_tel;
	}
	public void setMem_tel(String mem_tel) {
		this.mem_tel = mem_tel;
	}
	public String getMem_regDate() {
		return mem_regDate;
	}
	public void setMem_regDate(String mem_regDate) {
		this.mem_regDate = mem_regDate;
	}
	public String getMem_uptDate() {
		return mem_uptDate;
	}
	public void setMem_uptDate(String mem_uptDate) {
		this.mem_uptDate = mem_uptDate;
	}
	@Override
	public String toString() {
		return "Member [mem_id=" + mem_id + ", mem_pw=" + mem_pw + ", mem_name=" + mem_name + ", mem_tel=" + mem_tel
				+ ", mem_regDate=" + mem_regDate + ", mem_uptDate=" + mem_uptDate + "]";
	}
}
