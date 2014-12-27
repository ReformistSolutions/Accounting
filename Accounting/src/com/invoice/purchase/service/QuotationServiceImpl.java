package com.invoice.purchase.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.invoice.accounting.beans.LinkedTax;
import com.invoice.accounting.beans.Taxes;
import com.invoice.company.beans.CompanyDetails;
import com.invoice.inventory.beans.CreateNewProduct;
import com.invoice.purchase.beans.ComposeMail;
import com.invoice.purchase.beans.PurchaseQuotation;
import com.invoice.purchase.beans.Vender;
import com.invoice.purchase.beans.purchaseDetails;
import com.invoice.purchase.dao.QuotationDao;

@Component(value="purchaseQuotationService")
public class QuotationServiceImpl implements QuotationService{

	private QuotationDao quotationDao;
	private int i;
	public QuotationDao getQuotationDao() {
		return quotationDao;
	}
	@Autowired
	public void setQuotationDao(QuotationDao quotationDao) {
		this.quotationDao = quotationDao;
	}
	private JdbcTemplate jdbcTemplate;
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	@Autowired
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int saveQuotation(PurchaseQuotation purchaseQuotation) {
		
		i=quotationDao.saveQuotation(purchaseQuotation);
		if(i>0)
		{
			return 1;
		}
		else{
			return 0;
		}
	}
	@Override
	public List<PurchaseQuotation> showQuotation() {
		List<PurchaseQuotation> purchaseQuotationList = new ArrayList<PurchaseQuotation>();
		purchaseQuotationList = quotationDao.showQuotaion();
		return purchaseQuotationList;
	}
	@Override
	public List<PurchaseQuotation> viewQuotaion(String quoationId) 
	{
		return quotationDao.view(quoationId);  
	}
	@Override
	public List<CreateNewProduct> showProduct() 
	{		
		return quotationDao.showProduct();
	}
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int updateQuotation(PurchaseQuotation purchaseQuotation) {

		return quotationDao.updateQuotation(purchaseQuotation); 
	}
	@Override
	public PurchaseQuotation autoId() {
		
		return quotationDao.autoId(); 
	}
	@Override
	public List<Vender> showVenders() {
		
		return quotationDao.showVenders();
	}
	@Override
	public List<Taxes> showTaxes() {

		return quotationDao.showTaxes();
	}
	@Override
	public List<purchaseDetails> showDetails(String quotationId) {
 
		return quotationDao.showDetails(quotationId);
	}
	@Override
	
	public String retriveAdd(String venderId) {

		return quotationDao.retriveAdd(venderId); 
	}
	@Override
	public String retriveShippiing(String venderId) {

		return quotationDao.retriveShippiing(venderId);
	}
	@Override
	public String retriveDesc(String productId) {
		
		return quotationDao.retriveDesc(productId);
	}
	@Override
	public List<CompanyDetails> getInfo(CompanyDetails companyDetails) {

		return quotationDao.getInfo(companyDetails); 
	}
	@Override
	public int delete(String quotId) {

		return quotationDao.delete(quotId);
	}
	@Override
	public List<Vender> retrriveVenderInfo(String venID,String id) {

		return quotationDao.retrriveVenderInfo(venID,id); 
	}
	@Override
	public int sendMail(ComposeMail composeMail) {

		return quotationDao.sendMail(composeMail);
	}
	@Override
	public List<Taxes> retriveVat() {

		return quotationDao.retriveVat();
	}
	@Override
	public List<Taxes> retriveService() {

		return quotationDao.retriveService();
	}
	@Override
	public String retriveTaxID(String taxName) {

		return quotationDao.retriveTaxID(taxName);
	}
	@Override
	public List<LinkedTax> retriveLinkedtax(String taxId){

		return quotationDao.retriveLinkedtax(taxId);
	}	
	@Override
	public int getCounter(String taxId) {
	
		return quotationDao.getCounter(taxId);
	}
	@Override
	public List<PurchaseQuotation> editPurQuotTaxDetails(String quoationId) {
		
		return quotationDao.editPurQuotTaxDetails(quoationId);
	}
	@Override
	public List<PurchaseQuotation> editPurQuotLinkedTaxDetails(String quoationId) {
		
		return quotationDao.editPurQuotLinkedTaxDetails(quoationId);
	}
	@Override
	public String retriveUnitPrice(String productId) 
	{
		return quotationDao.retriveUnitPrice(productId); 
	}
}