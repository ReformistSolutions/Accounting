package com.invoice.company.service;

import java.util.List;

import com.invoice.company.beans.CompanyDetails;

public interface CompanyDetailsService {
	
	
	public int save(CompanyDetails companyDetails);
	public List<CompanyDetails> view(CompanyDetails companyDetails);
	public int updateCompanyInfo(CompanyDetails companyDetails);
/*	public int getRegCount();*/
}
