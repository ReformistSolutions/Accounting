package com.invoice.payroll.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.invoice.company.beans.CompanyDetails;
import com.invoice.payroll.dao.SalaryDao;

@Component(value="salaryService")
public class SalaryServiceImpl implements SalaryService
{

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	
	@Autowired
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public SalaryDao getSalaryDao() {
		return salaryDao;
	}
	@Autowired
	public void setSalaryDao(SalaryDao salaryDao) {
		this.salaryDao = salaryDao;
	}

	private JdbcTemplate jdbcTemplate;
	private SalaryDao salaryDao;
	
	/*@Override
	public int savesaldtls(SalaryBeans salaryBeans) 
	{
		
		return salaryDao.savesaldtls(salaryBeans);
	}*/

	@Override
	public List<CompanyDetails> getInfo(CompanyDetails companyDetails) {
		
		return salaryDao.getInfo(companyDetails);
	}

}
