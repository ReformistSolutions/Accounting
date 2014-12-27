package com.invoice.reports.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.invoice.company.beans.CompanyDetails;
import com.invoice.purchase.beans.ComposeMail;
import com.invoice.reports.beans.PaymentAdvice;
import com.invoice.reports.dao.paymentAdviceDao;

@Component(value="paymentAdviceService")
public class paymentAdviceServiceImpl implements paymentAdviceService
{
	@Autowired
	paymentAdviceDao paymentAdviceDao;
	@Override
	public List<PaymentAdvice> showPaymentAdvice(int month,int year) 
	{
		return paymentAdviceDao.showPaymentAdvice(month,year);
	}
	@Override
	public List<PaymentAdvice> retrivePaymentAdvice(String month,String year) 
	{
		return paymentAdviceDao.retrivePaymentAdvice(month,year);
	}
	@Override
	public String showCompanyName() 
	{
		return paymentAdviceDao.showCompanyName();
	}
	@Override
	public List<CompanyDetails> getInfo(CompanyDetails companyDetails) 
	{
		return paymentAdviceDao.getInfo(companyDetails);
	}
	@Override
	public List<PaymentAdvice> retriveAdviceDetails(int month, int year) 
	{
		return paymentAdviceDao.retriveAdviceDetails(month, year);
	}
	@Override
	public int sendMail(ComposeMail composeMail) 
	{
		return paymentAdviceDao.sendMail(composeMail);
	}
	
}
