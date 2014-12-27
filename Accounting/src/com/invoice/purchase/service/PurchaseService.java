package com.invoice.purchase.service;

import java.util.List;

import com.invoice.accounting.beans.Taxes;
import com.invoice.company.beans.CompanyDetails;
import com.invoice.inventory.beans.CreateNewProduct;
import com.invoice.purchase.beans.PurchaseVoucher;
import com.invoice.purchase.beans.Purchases;
import com.invoice.purchase.beans.Vender;

public interface PurchaseService {

	public List<Purchases> showPurchases();
	public Purchases generateId();
	public List<CreateNewProduct> showProduct();
	public List<Vender> showVenders();
	public List<Taxes> showTaxes();
	public int save(Purchases purchases);
	public List<Purchases> editPurchase(String purchaseId);
	public List<Purchases> editPurTaxDetails(String purchaseId);
	public List<Purchases> editPurLinkedTaxDetails(String purchaseId);
	public int updatePurchase(Purchases purchases);
	public int delete(String purchaseId,float amt);
	public List<CompanyDetails> getInfo(CompanyDetails companyDetails);
	public List<Vender> retrriveVenderInfo(String venID,String id);
	public String retriveUnitPrice(String productId);
	public List<PurchaseVoucher> retrivePaymentHistory(String purchaseNo);
	/*public String checkPayAmount();*/
}
