package com.invoice.payroll.dao;


import java.util.List;

import com.invoice.company.beans.CompanyDetails;

public interface SalaryDao
{
	//public int savesaldtls(SalaryBeans salaryBeans);
	public List<CompanyDetails> getInfo(CompanyDetails companyDetails);
	
}
