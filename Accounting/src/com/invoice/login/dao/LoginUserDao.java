package com.invoice.login.dao;

import com.invoice.login.beans.Login;



public interface LoginUserDao {

	public Login authonticationDao(String userName,String password);
	public int Count();
}
