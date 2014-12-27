package com.invoice.purchase.service;

import java.util.List;

import com.invoice.accounting.beans.JournalHeader;
import com.invoice.accounting.beans.Taxes;
import com.invoice.company.beans.CompanyDetails;
import com.invoice.inventory.beans.CreateNewProduct;
import com.invoice.purchase.beans.ComposeMail;
import com.invoice.purchase.beans.PurchaseOrder;
import com.invoice.purchase.beans.Vender;
import com.invoice.purchase.beans.purchaseDetails;

public interface PurchaseOrderService {

	public int saveOrder(PurchaseOrder purchaseOrder, JournalHeader journalHeader);
	public List<PurchaseOrder> showOrder();
	public List<PurchaseOrder> editOrder(String orderId);
	public List<PurchaseOrder> editPurOrdTaxDetails(String orderId);
	public List<PurchaseOrder> editPurOrdLinkedTaxDetails(String orderId);
	public List<CreateNewProduct> showProduct();
	public int updateOrder(PurchaseOrder purchaseOrder);
	public PurchaseOrder autoId();
	public List<Vender> showVenders();
	public List<Taxes> showTaxes();
	public List<purchaseDetails> showDetails(String orderId);
	public String retriveDesc(String productId);
	public String retriveAdd(String venderId);	
	public List<CompanyDetails> getInfo(CompanyDetails companyDetails);
	public int delete(String orderID);
	public List<Vender> retrriveVenderInfo(String venID,String id);
	public int sendMail(ComposeMail composeMail);
	public JournalHeader generateId();
	public String retrriveBankAcNo(String venderId);	
	public List<Taxes> retriveVat();
	public List<Taxes> retriveService();
	public String retriveUnitPrice(String productId);
}
