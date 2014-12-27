package com.invoice.payroll.service;

public interface GenPassword
{
	public String getPasword(String emId);
	public String sendLoginDetails(String uName,String pass);
}
