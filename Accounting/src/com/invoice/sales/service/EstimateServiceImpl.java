package com.invoice.sales.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.invoice.accounting.beans.LinkedTax;
import com.invoice.accounting.beans.Taxes;
import com.invoice.customer.beans.Customer;
import com.invoice.inventory.beans.CreateNewProduct;
import com.invoice.sales.beans.Enquiry;
import com.invoice.sales.beans.Estimate;
import com.invoice.sales.dao.EstimateDao;

@Component(value="estimateService")
public class EstimateServiceImpl implements EstimateService {

	private EstimateDao estimateDao;
	private JdbcTemplate jdbcTemplate;

	public EstimateDao getEstimateDao() {
		return estimateDao;
	}
	@Autowired
	public void setEstimateDao(EstimateDao estimateDao) {
		this.estimateDao = estimateDao;
	}

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	@Autowired
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Override
	public List<Estimate> show() {		
		return estimateDao.show();
	}
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int save(Estimate estimate) {	
	
		return estimateDao.save(estimate);
	}
	@Override
	public List<Estimate> editEstimate(String estimateID) {
		
		return estimateDao.editEstimate(estimateID);
		
	}
	@Override
	public List<Estimate> editEstimateTaxDetails(String estimateID) {
		
		return estimateDao.editEstimateTaxDetails(estimateID);
	}
	@Override
	public List<Estimate> editEstimateLinkedTaxDetails(String estimateID) {
		
		return estimateDao.editEstimateLinkedTaxDetails(estimateID);
	}
	
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int updateEstimate(Estimate estimate) {
		
		return estimateDao.updateEstimate(estimate);
	}
	@Override
	public List<CreateNewProduct> retriveProductList() {	
		return estimateDao.retriveProductList();
	}
	@Override
	public List<Customer> retriveCustomerList() {
		
		return estimateDao.retriveCustomerList();
	}
	@Override
	public Estimate generateEstId() {
		
		return estimateDao.generateEstId();
	}
	@Override
	public List<Taxes> retriveTaxList() {
		
		return estimateDao.retriveTaxList();
	}
	@Override
	public String retriveDesc(String productId) {
		String desc=estimateDao.retriveDesc(productId);
		return desc;
	}
	@Override
	public String retriveBillAdd(String customerId) {		
		return estimateDao.retriveBillAdd(customerId);
	}
	@Override
	public String retriveShipAdd(String customerId) {
		
		return estimateDao.retriveShipAdd(customerId);
	}
	@Override
	public int deleteEstimate(String estimateID) {
		
		return estimateDao.deleteEstimate(estimateID);
	}
	@Override
	public List<Taxes> retriveVat() {

		return estimateDao.retriveVat();
	}
	@Override
	public List<Taxes> retriveService() {

		return estimateDao.retriveService();
	}
	@Override
	public List<Customer> retriveCustInfo(String custId,String id) {
		
		return estimateDao.retriveCustInfo(custId,id);
	}
	
	@Override
	public String retriveTaxID(String taxId) {
		
		return estimateDao.retriveTaxID(taxId);
	}
	@Override
	public List<LinkedTax> retriveLinkedtax(String taxId) {
		
		return estimateDao.retriveLinkedtax(taxId);
	}
	@Override
	public int getCounter(String taxId) {
		
		return estimateDao.getCounter(taxId);
	}
	@Override
	public List<Enquiry> retriveEnqList() {
		
		return estimateDao.retriveEnqList();
	}
	@Override
	public float retriveUnitPrice(String productId) {
		
		return estimateDao.retriveUnitPrice(productId);
	}
	
}
