package com.invoice.sales.beans;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.FactoryUtils;
import org.apache.commons.collections.list.LazyList;

public class DeliveryChallan {

	private String challanID;
	private String invoiceID;
	private String date;
	private String custId;
	private String customerName;
	private String billingAdd;
	@SuppressWarnings("unchecked")
	private List<DeliveryChallanDetails> deliveryChallandetails = LazyList.decorate(new ArrayList<DeliveryChallanDetails>(),FactoryUtils.instantiateFactory(DeliveryChallanDetails.class));
	private String CustVatNo;
	private String createdBy;
	private String updatedBy;
	private String chType;
	
	
	public String getChType() {
		return chType;
	}
	public void setChType(String chType) {
		this.chType = chType;
	}
	public String getChallanID() {
		return challanID;
	}
	public void setChallanID(String challanID) {
		this.challanID = challanID;
	}
	
	public String getInvoiceID() {
		return invoiceID;
	}
	public void setInvoiceID(String invoiceID) {
		this.invoiceID = invoiceID;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	public String getCustId() {
		return custId;
	}
	public void setCustId(String custId) {
		this.custId = custId;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getBillingAdd() {
		return billingAdd;
	}
	public void setBillingAdd(String billingAdd) {
		this.billingAdd = billingAdd;
	}
	public List<DeliveryChallanDetails> getDeliveryChallandetails() {
		return deliveryChallandetails;
	}
	public void setDeliveryChallandetails(
			List<DeliveryChallanDetails> deliveryChallandetails) {
		this.deliveryChallandetails = deliveryChallandetails;
	}
	public String getCustVatNo() {
		return CustVatNo;
	}
	public void setCustVatNo(String custVatNo) {
		CustVatNo = custVatNo;
	}
	public String getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}
	public String getUpdatedBy() {
		return updatedBy;
	}
	public void setUpdatedBy(String updatedBy) {
		this.updatedBy = updatedBy;
	}
	
	
}
