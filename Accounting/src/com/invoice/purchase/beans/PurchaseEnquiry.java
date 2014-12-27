package com.invoice.purchase.beans;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.FactoryUtils;
import org.apache.commons.collections.list.LazyList;

public class PurchaseEnquiry {

	private String enqID;
	private String venderID;
	private String supplierName; 
	private String venderEmail;
	private String enqDate;
	@SuppressWarnings("unchecked")
	private List<PurchaseEnquiryDetails> purchasenquiryDetails = LazyList.decorate(new ArrayList<PurchaseEnquiryDetails>(),FactoryUtils.instantiateFactory(PurchaseEnquiryDetails.class));
	private String pubNotes; 
	private String priNotes;
	private String createdBy;
	private String updatedBy;
	private String qoutCreated;

	public String getQoutCreated() {
		return qoutCreated;
	}
	public void setQoutCreated(String qoutCreated) {
		this.qoutCreated = qoutCreated;
	}

	
	public String getSupplierName() {
		return supplierName;
	}
	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}
	public String getEnqID() {
		return enqID;
	}
	public void setEnqID(String enqID) {
		this.enqID = enqID;
	}
	public String getVenderEmail() {
		return venderEmail;
	}
	public void setVenderEmail(String venderEmail) {
		this.venderEmail = venderEmail;
	}
	public String getVenderID() {
		return venderID;
	}
	public void setVenderID(String venderID) {
		this.venderID = venderID;
	}
	public String getEnqDate() {
		return enqDate;
	}
	public void setEnqDate(String enqDate) {
		this.enqDate = enqDate;
	}
	public List<PurchaseEnquiryDetails> getPurchasenquiryDetails() {
		return purchasenquiryDetails;
	}
	public void setPurchasenquiryDetails(
			List<PurchaseEnquiryDetails> purchasenquiryDetails) {
		this.purchasenquiryDetails = purchasenquiryDetails;
	}
	public String getPubNotes() {
		return pubNotes;
	}
	public void setPubNotes(String pubNotes) {
		this.pubNotes = pubNotes;
	}
	public String getPriNotes() {
		return priNotes;
	}
	public void setPriNotes(String priNotes) {
		this.priNotes = priNotes;
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
