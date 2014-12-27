package com.invoice.sales.service;

import java.util.List;

import com.invoice.accounting.beans.LinkedTax;
import com.invoice.accounting.beans.Taxes;
import com.invoice.customer.beans.Customer;
import com.invoice.inventory.beans.CreateNewProduct;
import com.invoice.sales.beans.Enquiry;
import com.invoice.sales.beans.Estimate;

public interface EstimateService {
	
	public List<Estimate> show();
	public int save(Estimate estimate);
	public List<Estimate> editEstimate(String estimateID);
	public List<Estimate> editEstimateTaxDetails(String estimateID);
	public List<Estimate> editEstimateLinkedTaxDetails(String estimateID);
	public int updateEstimate(Estimate estimate);
	public List<CreateNewProduct> retriveProductList();
	public List<Customer> retriveCustomerList();
	public List<Taxes> retriveTaxList();
	public List<Enquiry> retriveEnqList();
	public String retriveDesc(String productId);
	public String retriveBillAdd(String customerId);
	public String retriveShipAdd(String customerId);
	public int deleteEstimate(String estimateID);
	public Estimate generateEstId();
	public List<Taxes> retriveVat();
	public List<Taxes> retriveService();
	public List<Customer> retriveCustInfo(String custId,String id);
	public String retriveTaxID(String taxId);
	public List<LinkedTax> retriveLinkedtax(String taxId);
	public int getCounter(String taxId);
	public float retriveUnitPrice(String productId);
	
}
