package com.invoice.sales.service;

import java.util.List;

import com.invoice.accounting.beans.Taxes;
import com.invoice.company.beans.CompanyDetails;
import com.invoice.customer.beans.Customer;
import com.invoice.inventory.beans.CreateNewProduct;
import com.invoice.sales.beans.ComposeMail;
import com.invoice.sales.beans.Enquiry;

public interface EnquiryService {
	
	public int save(Enquiry enquiry);
	public List<Enquiry> show();
	public List<Enquiry> editEnquiry(String enquiryId);
	public int updateEnquiry(Enquiry enquiry);
	public List<CreateNewProduct> retriveProductList();
	public List<Customer> retriveCustomerList();
	public String retriveDesc(String productId);
	public String retriveMUnit(String productId);	
	public int deleteEnquiry(String enquiryId);
	public List<CompanyDetails> getInfo(CompanyDetails companyDetails);
	public List<Customer> retriveCustInfo(String custId,String id);
	public int sendMail(ComposeMail composeMail);
	public Enquiry generateId();
	public List<Taxes> getTaxes(Taxes taxes);
	public String ShowAdd();
	public String ShowDelete();
	public String ShowUpdate();
	public String ShowNotAdd();
	public String ShowNotDelete();
	public String ShowNotUpdate();
	public String ShowRestore();
	public String ShowNotRestrore();
}
