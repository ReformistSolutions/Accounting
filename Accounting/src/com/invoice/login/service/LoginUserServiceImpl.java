package com.invoice.login.service;

import java.util.ArrayList;
import java.util.Iterator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.invoice.login.beans.Login;
import com.invoice.login.dao.LoginUserDao;

@Component(value="loginUserService")
public class LoginUserServiceImpl implements LoginUserService {

	LoginUserDao loginUserDao;
	
	
	public LoginUserDao getLoginUserDao() {
		return loginUserDao;
	}

	@Autowired
	public void setLoginUserDao(LoginUserDao loginUserDao) {
		this.loginUserDao = loginUserDao;
	}

	@Override
	public Login authontication(String userName, String password) {
	
		
		return 	loginUserDao.authonticationDao(userName, password);
	}

	@Override
	public boolean authontication(Login l,String cRole) 
	{
		boolean b=false;
		try
		{
			ArrayList<String>role=l.getRole();
			Iterator<String> iterator = role.iterator();
			while (iterator.hasNext()) 
			{
				if(iterator.next().equals(cRole))
				{
					b=true;
				}
			}
			return b;
		}
		catch(Exception e)
		{
			return b;
		}
	}
	@Override
	public boolean chkFlag(Login l) {
		
		try
		{
			if(l.isFlag())
			{
				return true;
			}
			else
			{
				return false;
			}
		}
		catch(Exception e)
		{
			return false;
		}
		
	}

	@Override
	public int Count() 
	{
		return loginUserDao.Count();
	}

	


	
}
