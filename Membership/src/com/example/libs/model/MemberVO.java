package com.example.libs.model;

import java.util.Date;

public class MemberVO {
	private String username, userid, passwd, email, zipcode, address1, address2;
	private Date regdate;
	
	public MemberVO() {}  //for Java Bean
	
	public MemberVO(String username, String userid, String passwd, String email, Date regdate) {                              this.username = username;
		this.username = username;           	this.userid = userid;
		this.passwd = passwd;                   this.email = email;
		this.regdate = regdate;
	}  //for 필수용

	public MemberVO(String username, String userid, String passwd, String email, String zipcode,
			String address1, String address2) {
		this.username = username;
		this.userid = userid;
		this.passwd = passwd;
		this.email = email;
		this.zipcode = zipcode;
		this.address1 = address1;
		this.address2 = address2;
	}

	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public Date getRegdate() {
		return this.regdate;
	}
	
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	
}
