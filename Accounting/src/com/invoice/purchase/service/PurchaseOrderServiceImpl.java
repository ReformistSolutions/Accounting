package com.invoice.purchase.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.invoice.accounting.beans.JournalHeader;
import com.invoice.accounting.beans.Taxes;
import com.invoice.company.beans.CompanyDetails;
import com.invoice.inventory.beans.CreateNewProduct;
import com.invoice.purchase.beans.ComposeMail;
import com.invoice.purchase.beans.PurchaseOrder;
import com.invoice.purchase.beans.Vender;
import com.invoice.purchase.beans.purchaseDetails;
import com.invoice.purchase.dao.PurchaseOrderDao;

@Component(value="pOrderService")
public class PurchaseOrderServiceImpl implements PurchaseOrderService{

	@Autowired
	PurchaseOrderDao pOrderDao;		
	/*public PurchaseOrderDao getOrderDao() {
		return pOrderDao;
	}
	@Autowired
	public void setOrderDao(PurchaseOrderDao orderDao) {
		this.pOrderDao = orderDao;
	}*/
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int saveOrder(PurchaseOrder purchaseOrder,JournalHeader journalHeader) {
		
		int i = pOrderDao.saveOrder(purchaseOrder,journalHeader);
		return i;
	}
	@Override
	public List<PurchaseOrder> showOrder() {
		List<PurchaseOrder> purchaseOrderList = new ArrayList<PurchaseOrder>();
		purchaseOrderList=pOrderDao.showOrder();
		return purchaseOrderList;
	}
	@Override
	public List<PurchaseOrder> editOrder(String orderId) {
		
		return pOrderDao.editOrder(orderId);
	}
	@Override
	public List<CreateNewProduct> showProduct() {
		
		return pOrderDao.showProduct();
	}
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int updateOrder(PurchaseOrder purchaseOrder) {
		
		return pOrderDao.updateOrder(purchaseOrder); 
	}
	@Override
	public PurchaseOrder autoId() {
		
		return pOrderDao.autoId();
	}
	@Override
	public List<Vender> showVenders() {

		return pOrderDao.showVenders();
	}
	@Override
	public List<Taxes> showTaxes() {
		
		return pOrderDao.showTaxes();
	}
	@Override
	public List<purchaseDetails> showDetails(String orderId) {

		return pOrderDao.showDetails(orderId);
	}
	@Override
	public String retriveAdd(String venderId) {
		
		return pOrderDao.retriveAdd(venderId);
	}
	@Override
	public String retriveDesc(String productId) {
		
		return pOrderDao.retriveDesc(productId); 
	}
	@Override
	public List<CompanyDetails> getInfo(CompanyDetails companyDetails) {

		return pOrderDao.getInfo(companyDetails);
 	}
	@Override
	public int delete(String orderID) {

		return pOrderDao.delete(orderID); 
	}
	@Override
	public List<Vender> retrriveVenderInfo(String venID,String id) {

		return pOrderDao.retrriveVenderInfo(venID,id);
	}
	@Override
	public int sendMail(ComposeMail composeMail) {

		return pOrderDao.sendMail(composeMail);
	}
	@Override
	public JournalHeader generateId() {
		return pOrderDao.generateId();
	}
	@Override
	public String retrriveBankAcNo(String venderId) {

		return pOrderDao.retrriveBankAcNo(venderId);
	}
	@Override
	public List<Taxes> retriveVat() {
		return pOrderDao.retriveVat();
	}
	@Override
	public List<Taxes> retriveService() {

		return pOrderDao.retriveService();
	}
	@Override
	public List<PurchaseOrder> editPurOrdTaxDetails(String orderId) {
		
		return pOrderDao.editPurOrdTaxDetails(orderId);
	}
	@Override
	public List<PurchaseOrder> editPurOrdLinkedTaxDetails(String orderId) {
		
		return pOrderDao.editPurOrdLinkedTaxDetails(orderId);
	}
	@Override
	public String retriveUnitPrice(String productId) 
	{
		return pOrderDao.retriveUnitPrice(productId); 
	}
	
}
