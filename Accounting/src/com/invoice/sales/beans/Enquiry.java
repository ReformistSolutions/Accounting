package com.invoice.sales.beans;

import java.util.ArrayList;
import java.util.List;
import org.apache.commons.collections.FactoryUtils;
import org.apache.commons.collections.list.LazyList;


public class Enquiry {
	private String custID;
	private String txtCutName;
	private String txtEnqId;
	private String txtDate;	
	@SuppressWarnings("unchecked")
	private List<EnquiryDetails> enquiryDetails = LazyList.decorate(new ArrayList<EnquiryDetails>(),FactoryUtils.instantiateFactory(EnquiryDetails.class));
	private String txtPubNotes;
	private String txtPvtNotes;
	private String CustVatNo;
	private String status;
	private String createdBy;
	private String updatedBy;
	private String estCreated;
	public String getCustID() {
		return custID;
	}
	public void setCustID(String custID) {
		this.custID = custID;
	}
	public String getTxtCutName() {
		return txtCutName;
	}
	public void setTxtCutName(String txtCutName) {
		this.txtCutName = txtCutName;
	}
	public String getTxtEnqId() {
		return txtEnqId;
	}
	public void setTxtEnqId(String txtEnqId) {
		this.txtEnqId = txtEnqId;
	}
	public String getTxtDate() {
		return txtDate;
	}
	public void setTxtDate(String txtDate) {
		this.txtDate = txtDate;
	}
	public List<EnquiryDetails> getEnquiryDetails() {
		return enquiryDetails;
	}
	public void setEnquiryDetails(List<EnquiryDetails> enquiryDetails) {
		this.enquiryDetails = enquiryDetails;
	}
	public String getTxtPubNotes() {
		return txtPubNotes;
	}
	public void setTxtPubNotes(String txtPubNotes) {
		this.txtPubNotes = txtPubNotes;
	}
	public String getTxtPvtNotes() {
		return txtPvtNotes;
	}
	public void setTxtPvtNotes(String txtPvtNotes) {
		this.txtPvtNotes = txtPvtNotes;
	}
	public String getCustVatNo() {
		return CustVatNo;
	}
	public void setCustVatNo(String custVatNo) {
		CustVatNo = custVatNo;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
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
	public String getEstCreated() {
		return estCreated;
	}
	public void setEstCreated(String estCreated) {
		this.estCreated = estCreated;
	}
	
	
	
}