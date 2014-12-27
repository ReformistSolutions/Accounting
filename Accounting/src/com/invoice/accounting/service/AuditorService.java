package com.invoice.accounting.service;

import java.util.List;

import com.invoice.accounting.beans.AddNewAuditor;
import com.invoice.accounting.beans.ComposeMail;
import com.invoice.company.beans.CompanyDetails;
import com.invoice.newuser.beans.NewUserBean;

public interface AuditorService
{
	public int addnewAuditor(AddNewAuditor addnewAuditor);
	public int update(AddNewAuditor addNewAuditor);
	
	public List<AddNewAuditor> show();
	public List<AddNewAuditor> viewAuditors(String auditID);
	public AddNewAuditor generateID();
	public int deleteaAuditor(String auditID);
	public List<NewUserBean> ViewNewUser();
	public List<CompanyDetails> getInfo(CompanyDetails companyDetails);
	public int sendMail(ComposeMail composeMail);
}
