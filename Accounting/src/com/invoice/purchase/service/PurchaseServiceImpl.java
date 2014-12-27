package com.invoice.purchase.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.invoice.accounting.beans.Taxes;
import com.invoice.company.beans.CompanyDetails;
import com.invoice.inventory.beans.CreateNewProduct;
import com.invoice.purchase.beans.PurchaseVoucher;
import com.invoice.purchase.beans.Purchases;
import com.invoice.purchase.beans.Vender;
import com.invoice.purchase.dao.PurchaseDao;

@Component("purchaseService")
public class PurchaseServiceImpl implements PurchaseService{

	PurchaseDao purchaseDao;

	public PurchaseDao getPurchaseDao() {
		return purchaseDao;
	}
	@Autowired
	public void setPurchaseDao(PurchaseDao purchaseDao) {
		this.purchaseDao = purchaseDao;
	}
	@Override
	public Purchases generateId() {
		
		return purchaseDao.generateId();
	}
	@Override
	public List<CreateNewProduct> showProduct() {
		
		return purchaseDao.showProduct();
	}
	@Override
	public List<Vender> showVenders() {
		
		return purchaseDao.showVenders();
	}
	@Override
	public List<Taxes> showTaxes() {
		
		return purchaseDao.showTaxes();
	}
	@Override
	public List<Purchases> showPurchases() {
		
		return purchaseDao.showPurchases();
	}
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int save(Purchases purchases) {
		
		return purchaseDao.save(purchases);
	}
	@Override
	public List<Purchases> editPurchase(String purchaseId) {
	
		return purchaseDao.editPurchase(purchaseId);
	}
	@Override
	public List<Purchases> editPurTaxDetails(String purchaseId) {
	
		return purchaseDao.editPurTaxDetails(purchaseId);
	}
	@Override
	public List<Purchases> editPurLinkedTaxDetails(String purchaseId) {
		
		return purchaseDao.editPurLinkedTaxDetails(purchaseId);
	}
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int updatePurchase(Purchases purchases) {
		
		return purchaseDao.updatePurchase(purchases);
	}
	@Override
	public int delete(String purchaseId,float amt) {
		
		return purchaseDao.delete(purchaseId,amt);
	}
	@Override
	public List<CompanyDetails> getInfo(CompanyDetails companyDetails) {
		
		return purchaseDao.getInfo(companyDetails);
	}
	@Override
	public List<Vender> retrriveVenderInfo(String venID, String id) {
	
		return purchaseDao.retrriveVenderInfo(venID, id);
	}
	@Override
	public String retriveUnitPrice(String productId) 
	{
		return purchaseDao.retriveUnitPrice(productId); 
	}
	@Override
	public List<PurchaseVoucher> retrivePaymentHistory(String purchaseNo) 
	{
		return purchaseDao.retrivePaymentHistory(purchaseNo);
	}
	

}
