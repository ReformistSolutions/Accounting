package com.invoice.company.dao;

import java.util.List;

import com.invoice.company.beans.CompanyDetails;

public interface CompanyDetailsDao {
	
	public int save(CompanyDetails companyDetails);
	public List<CompanyDetails> view(CompanyDetails companyDetails);
	public int updateCompanyInfo(CompanyDetails companyDetails);
	/*public int getRegCount();*/
}