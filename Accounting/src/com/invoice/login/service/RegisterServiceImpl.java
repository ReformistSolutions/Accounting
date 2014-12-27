package com.invoice.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.invoice.login.beans.NewRegistration;
import com.invoice.login.dao.RegisterDao;

@Component(value="logService")
public class RegisterServiceImpl implements RegisterService{

	RegisterDao logDao;
	public RegisterDao getLogDao() {
		return logDao;
	}
	@Autowired
	public void setLogDao(RegisterDao logDao) {
		this.logDao = logDao;
	}
	@Override
	public int saveService(NewRegistration login) {
		
		return logDao.saveDao(login);
	}

}
