package test.bean;

import java.sql.*;

public class Dto {
	private String id;
	private String pass1;
	private String pass2;
	private String birth;
	private String sex;
	private String address;
	private String first_number;
	private String second_number;
	private String third_number;
	private String email_id;
	private String email_site_text;
	private String receive;
	private String interest;	
	private Timestamp reg_date;
	private String login_id;
	private String login_pw;
	
	public void setId(String id) {		this.id = id;	}
	public void setPass1(String pass1) {	this.pass1 = pass1;	}
	public void setPass2(String pass2) {	this.pass2 = pass2;	}
	public void setBirth(String birth) {	this.birth = birth;	}
	public void setSex(String sex) {	this.sex = sex;	}
	public void setAddress(String address) {	this.address = address;	}
	public void setFirst_number(String first_number) {	this.first_number = first_number;	}
	public void setSecond_number(String second_number) {	this.second_number = second_number;	}
	public void setThird_number(String third_number) {	this.third_number = third_number;	}
	public void setEmail_id(String email_id) {	this.email_id = email_id;	}
	public void setEmail_site_text(String email_site_text) {	this.email_site_text = email_site_text;	}
	public void setReceive(String receive) {	this.receive = receive;	}
	public void setInterest(String interest) {	this.interest = interest;	}
	public void setReg_date(Timestamp reg_date) {		this.reg_date = reg_date;	}
	public void setLogin_id(String login_id) {		this.login_id = login_id;	}
	public void setLogin_pw(String login_pw) {	this.login_pw = login_pw;	}
	
	
	
	public String getId() {	return this.id;	}
	public String getPass1() {	return this.pass1;	}
	public String getPass2() {	return this.pass2;	}
	public String getBirth() {	return this.birth;	}
	public String getSex() {	return this.sex;	}
	public String getAddress() {	return this.address;	}
	public String getFirst_number() {	return this.first_number;	}
	public String getSecond_number() {	return this.second_number;	}
	public String getThird_number() {	return this.third_number;	}
	public String getEmail_id() {	return this.email_id;	}
	public String getEmail_site_text() {	return this.email_site_text;	}
	public String getReceive() {	return this.receive;	}
	public String getInterest() {	return this.interest;	}
	public Timestamp getReg_date() { return this.reg_date;}
	public String getLogin_id() { return this.login_id;}
	public String getLogin_pw() { return this.login_pw;}

}
