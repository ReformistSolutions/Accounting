package com.invoice.company.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.invoice.company.beans.CompanyDetails;
import com.invoice.company.dao.CompanyDetailsDao;


@Component(value="companyDetailsService")
public class CompanyDetailsServiceImpl implements CompanyDetailsService {
	
	CompanyDetailsDao companyDetailsDao;

	public CompanyDetailsDao getCompanyDetailsDao() {
		return companyDetailsDao;
	}
	@Autowired
	public void setCompanyDetailsDao(CompanyDetailsDao companyDetailsDao) {
		this.companyDetailsDao = companyDetailsDao;
	}
	@Override
	public int save(CompanyDetails companyDetails) {
		
		return companyDetailsDao.save(companyDetails);
	}
	@Override
	public List<CompanyDetails> view(CompanyDetails companyDetails) {
		
		return companyDetailsDao.view(companyDetails);
	}
	@Override
	public int updateCompanyInfo(CompanyDetails companyDetails) {

		return companyDetailsDao.updateCompanyInfo(companyDetails);
	}
	/*@Override
	public int getRegCount() {
		
		return companyDetailsDao.getRegCount();
	}*/
}