package com.invoice.purchase.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.invoice.company.beans.CompanyDetails;
import com.invoice.inventory.beans.CreateNewProduct;
import com.invoice.purchase.beans.ComposeMail;
import com.invoice.purchase.beans.PurchaseEnquiry;
import com.invoice.purchase.beans.PurchaseEnquiryDetails;
import com.invoice.purchase.beans.Vender;
import com.invoice.purchase.dao.PurchaseEnquiryDao;

@Component(value="purchaseEnquiryService")
public class EnquiryServiceImpl implements EnquiryService{

	PurchaseEnquiryDao puchaseenquiryDao;

	public PurchaseEnquiryDao getPuchaseenquiryDao() {
		return puchaseenquiryDao;
	}
	@Autowired
	public void setPuchaseenquiryDao(PurchaseEnquiryDao puchaseenquiryDao) {
		this.puchaseenquiryDao = puchaseenquiryDao;
	}
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int saveEquiry(PurchaseEnquiry purchaseEnquiry) {
		int i=puchaseenquiryDao.save(purchaseEnquiry);
		return i; 
	}
	@Override
	public List<PurchaseEnquiry> showEnquiry() {
		
		List<PurchaseEnquiry> purchaseEnquiryList = new ArrayList<PurchaseEnquiry>();
		purchaseEnquiryList = puchaseenquiryDao.show();
		return purchaseEnquiryList;
	}
	@Override
	public List<PurchaseEnquiry> edit(String enquiryId) {

		return null;
	}
	@Override
	public List<PurchaseEnquiry> view(String enquiryId) {

		return puchaseenquiryDao.view(enquiryId); 
	}
	@Override
	public List<CreateNewProduct> showProduct() {
		
		return puchaseenquiryDao.showProduct();
	}
	@Override
	public int updateEnquiry(PurchaseEnquiry purchaseEnquiry) {
		
		return puchaseenquiryDao.updateEnquiry(purchaseEnquiry); 
	}
	/*@Override
	public String autoId() {
		
		return puchaseenquiryDao.autoId();
	}	 */
	@Override
	public PurchaseEnquiry autoID() {
		
		return puchaseenquiryDao.autoID();
	}
	@Override
	public List<Vender> showVenders() {				
		return puchaseenquiryDao.showVenders();
	}
	@Override
	public List<PurchaseEnquiryDetails> showDetails(String enquiryId) {
		
		return puchaseenquiryDao.showDetails(enquiryId);
	}
	@Override
	public String retriveDesc(String productId) {
		
		String desc=puchaseenquiryDao.retriveDesc(productId);
		return desc;
	}
	@Override
	public List<CompanyDetails> getInfo(CompanyDetails companyDetails) {
		
		return puchaseenquiryDao.getInfo(companyDetails); 
	}
	@Override
	public int delete(String enquiryId) {

		return puchaseenquiryDao.delete(enquiryId);
	}
	@Override
	public int sendMail(ComposeMail composeMail) {
		
		return puchaseenquiryDao.sendMail(composeMail); 
	}
	@Override
	public List<Vender> retrriveVenderInfo(String vendId,String id) {

		return puchaseenquiryDao.retrriveVenderInfo(vendId,id);
	}
	@Override
	public String retriveUnit(String productId) 
	{
		return puchaseenquiryDao.retriveUnit(productId);
	}
	@Override
	public String ShowAdd() 
	{
		return puchaseenquiryDao.ShowAdd();
	}
	@Override
	public String ShowDelete() 
	{
		return puchaseenquiryDao.ShowDelete();
	}
	@Override
	public String ShowUpdate() 
	{
		return puchaseenquiryDao.ShowUpdate();
	}
	@Override
	public String ShowRestore() 
	{
		return puchaseenquiryDao.ShowRestore();
	}
	@Override
	public String ShowNotAdd() 
	{
		return puchaseenquiryDao.ShowNotAdd();
	}
	@Override
	public String ShowNotDelete() 
	{
		return puchaseenquiryDao.ShowNotDelete();
	}
	@Override
	public String ShowNotUpdate() 
	{
		return puchaseenquiryDao.ShowNotUpdate();
	}
	@Override
	public String ShowNotRestore() 
	{
		return puchaseenquiryDao.ShowNotRestore();
	}
}