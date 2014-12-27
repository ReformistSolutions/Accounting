package com.invoice.purchase.dao;



import java.util.List;

import com.invoice.company.beans.CompanyDetails;
import com.invoice.inventory.beans.CreateNewProduct;
import com.invoice.purchase.beans.ComposeMail;
import com.invoice.purchase.beans.PurchaseEnquiry;
import com.invoice.purchase.beans.PurchaseEnquiryDetails;
import com.invoice.purchase.beans.Vender;


public interface PurchaseEnquiryDao {
	public int save(PurchaseEnquiry purchaseEnquiry); 
	public List<PurchaseEnquiry> show(); 
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
	public List<Vender> retrriveVenderInfo(String venID,String id);
	public int sendMail(ComposeMail composeMail);
	public String ShowAdd();
	public String ShowDelete();
	public String ShowUpdate();
	public String ShowRestore();
	public String ShowNotAdd();
	public String ShowNotDelete();
	public String ShowNotUpdate();
	public String ShowNotRestore();	
}
