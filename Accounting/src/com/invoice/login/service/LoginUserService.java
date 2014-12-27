package com.invoice.login.service;

import com.invoice.login.beans.Login;



public interface LoginUserService {

	public Login authontication(String userName,String password);
	public boolean authontication(Login l,String cRole);
	public boolean chkFlag(Login l);
	public int Count();
}
