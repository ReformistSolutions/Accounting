package com.invoice.purchase.service;



import java.util.List;

import com.invoice.company.beans.CompanyDetails;
import com.invoice.inventory.beans.CreateNewProduct;
import com.invoice.purchase.beans.ComposeMail;
import com.invoice.purchase.beans.PurchaseEnquiry;
import com.invoice.purchase.beans.PurchaseEnquiryDetails;
import com.invoice.purchase.beans.Vender;
 
public interface EnquiryService {
	
	public int saveEquiry(PurchaseEnquiry purchaseEnquiry);
	public List<PurchaseEnquiry> showEnquiry();
	public List<PurchaseEnquiry> edit(String enquiryId);
	public List<PurchaseEnquiry> view(String enquiryId);
	public List<CreateNewProduct> showProduct();
	public int updateEnquiry(PurchaseEnquiry purchaseEnquiry);
	public PurchaseEnquiry autoID();
	public List<Vender> showVenders();
	public List<PurchaseEnquiryDetails> showDetails(String enquiryId);
	public String retriveDesc(String productId);
	public String retriveUnit(String productId);
	public List<CompanyDetails> getInfo(CompanyDetails companyDetails);
	public int delete(String enquiryId);
	public int sendMail(ComposeMail composeMail);
	public List<Vender> retrriveVenderInfo(String vendId,String id);
	public String ShowAdd();
	public String ShowDelete();
	public String ShowUpdate();
	public String ShowRestore();
	public String ShowNotAdd();
	public String ShowNotDelete();
	public String ShowNotUpdate();
	public String ShowNotRestore();	
}

