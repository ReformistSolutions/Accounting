package com.invoice.sales.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.invoice.accounting.beans.Taxes;
import com.invoice.company.beans.CompanyDetails;
import com.invoice.customer.beans.Customer;
import com.invoice.inventory.beans.CreateNewProduct;
import com.invoice.sales.beans.ComposeMail;
import com.invoice.sales.beans.Enquiry;
import com.invoice.sales.dao.EnquiryDao;

@Component(value="enquiryService")
public class EnquiryServiceImpl implements EnquiryService{

	private EnquiryDao enquiryDao;
	private JdbcTemplate jdbcTemplate;
	private int i;
	
public EnquiryDao getEnquiryDao() {
		return enquiryDao;
	}
	@Autowired
	public void setEnquiryDao(EnquiryDao enquiryDao) {
		this.enquiryDao = enquiryDao;
	}

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	@Autowired
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	
	@Override
	public List<Enquiry> show() {		
		return enquiryDao.show();
	}

	@Transactional(rollbackFor=Exception.class)
	@Override
	public int save(Enquiry enquiry) {
		
		i=enquiryDao.save(enquiry);
		return i;
	}
	@Override
	public List<Enquiry> editEnquiry(String enquiryId) {
	
		return enquiryDao.editEnquiry(enquiryId);
	}
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int updateEnquiry(Enquiry enquiry) {
		
		return enquiryDao.updateEnquiry(enquiry);
	}
	@Override
	public List<CreateNewProduct> retriveProductList() {		
		return enquiryDao.retriveProductList();
	}
	@Override
	public List<Customer> retriveCustomerList() {
		
		return enquiryDao.retriveCustomerList();
	}
	@Override
	public Enquiry generateId() {
		
		return enquiryDao.generateId();
	}
	@Override
	public String retriveDesc(String productId) {
		
		return enquiryDao.retriveDesc(productId);
	}
	@Override
	public int deleteEnquiry(String enquiryId) {
		
		return enquiryDao.deleteEnquiry(enquiryId);
	}
	@Override
	public List<CompanyDetails> getInfo(CompanyDetails companyDetails) {
		
		return enquiryDao.getInfo(companyDetails);
	}
	@Override
	public int sendMail(ComposeMail composeMail) {
		
		return enquiryDao.sendMail(composeMail);
	}
	@Override
	public List<Customer> retriveCustInfo(String custId,String id) {
		
		return enquiryDao.retriveCustInfo(custId,id);
	}
	@Override
	public List<Taxes> getTaxes(Taxes taxes){
		
		return enquiryDao.getTaxes(taxes);
	}
	@Override
	public String retriveMUnit(String productId) {
		
		return enquiryDao.retriveMUnit(productId);
	}
	@Override
	public String ShowAdd() 
	{
		return enquiryDao.ShowAdd();
	}
	@Override
	public String ShowDelete() 
	{
		return enquiryDao.ShowDelete();
	}
	@Override
	public String ShowUpdate() 
	{
		return enquiryDao.ShowUpdate();
	}
	@Override
	public String ShowNotAdd() 
	{
		return enquiryDao.ShowNotAdd();
	}
	@Override
	public String ShowNotDelete() 
	{
		return enquiryDao.ShowNotDelete();
	}
	@Override
	public String ShowNotUpdate() 
	{
		return enquiryDao.ShowNotUpdate();
	}
	@Override
	public String ShowRestore() 
	{
		return enquiryDao.ShowRestore();
	}
	@Override
	public String ShowNotRestrore() 
	{
		return enquiryDao.ShowNotRestrore();
	}
	
	
}

