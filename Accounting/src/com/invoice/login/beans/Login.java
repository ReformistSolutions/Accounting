package com.invoice.login.beans;

import java.util.ArrayList;


import org.springframework.context.annotation.Scope;

@Scope("session")
public class Login {

	private String uname;
	private String password;
	private ArrayList<String> role;
	private boolean flag;
	private String empUserId;
	
	public String getEmpUserId() {
		return empUserId;
	}
	public void setEmpUserId(String empUserId) {
		this.empUserId = empUserId;
	}
	public boolean isFlag() {
		return flag;
	}
	public void setFlag(boolean flag) {
		this.flag = flag;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public ArrayList<String> getRole() {
		return role;
	}
	public void setRole(ArrayList<String> role) {
		this.role = role;
	}
	
	
	
	
}
