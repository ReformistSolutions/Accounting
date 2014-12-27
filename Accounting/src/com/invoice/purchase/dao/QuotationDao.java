package com.invoice.purchase.dao;

import java.util.List;

import com.invoice.accounting.beans.LinkedTax;
import com.invoice.accounting.beans.Taxes;
import com.invoice.company.beans.CompanyDetails;
import com.invoice.inventory.beans.CreateNewProduct;
import com.invoice.purchase.beans.ComposeMail;
import com.invoice.purchase.beans.PurchaseQuotation;
import com.invoice.purchase.beans.Vender;
import com.invoice.purchase.beans.purchaseDetails;


public interface QuotationDao 
{
	public int saveQuotation(PurchaseQuotation purchaseQuotation);
	public List<PurchaseQuotation> showQuotaion();
	public List<PurchaseQuotation> view(String quoationId);
	public List<PurchaseQuotation> editPurQuotTaxDetails(String quoationId);
	public List<PurchaseQuotation> editPurQuotLinkedTaxDetails(String quoationId);
	public List<CreateNewProduct> showProduct();
	public int updateQuotation(PurchaseQuotation purchaseQuotation);
	public PurchaseQuotation autoId();
	public List<Vender> showVenders();
	public List<Taxes> showTaxes();
	public List<purchaseDetails> showDetails(String quotationId);
	public String retriveDesc(String productId);
	public String retriveAdd(String venderId);
	public String retriveShippiing(String venderId);
	public List<CompanyDetails> getInfo(CompanyDetails companyDetails);
	public int delete(String quotId);
	public List<Vender> retrriveVenderInfo(String venID,String id);
	public int sendMail(ComposeMail composeMail);
	public List<Taxes> retriveVat();
	public List<Taxes> retriveService();
	public String retriveTaxID(String taxId);
	public List<LinkedTax> retriveLinkedtax(String taxId);
	public int getCounter(String taxId);
	public String retriveUnitPrice(String productId);
	/*public String retriveEducation(String taxId);
	public String retriveHigherEducation(String taxId);*/
}