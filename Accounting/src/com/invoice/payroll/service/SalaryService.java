package com.invoice.payroll.service;

import java.util.List;

import com.invoice.company.beans.CompanyDetails;

public interface SalaryService
{
	//public int savesaldtls(SalaryBeans salaryBeans);
	public List<CompanyDetails> getInfo(CompanyDetails companyDetails);
}
