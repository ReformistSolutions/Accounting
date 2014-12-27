package com.invoice.reports.dao;

import java.util.List;

import com.invoice.company.beans.CompanyDetails;
import com.invoice.purchase.beans.ComposeMail;
import com.invoice.reports.beans.PaymentAdvice;

public interface paymentAdviceDao 
{

	public List<PaymentAdvice> showPaymentAdvice(int month,int year);
	public List<PaymentAdvice> retriveAdviceDetails(int month,int year);
	public List<PaymentAdvice> retrivePaymentAdvice(String month,String year);
	public String showCompanyName();
	public List<CompanyDetails> getInfo(CompanyDetails companyDetails);
	public int sendMail(ComposeMail composeMail);
}
 