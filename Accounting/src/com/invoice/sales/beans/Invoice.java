package com.invoice.sales.beans;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.FactoryUtils;
import org.apache.commons.collections.list.LazyList;

/**
 * @author Reformist
 *
 */
public class Invoice {

	private String txtInvID;
	private String custId;
	private String custVatNo;
	private String txtCName;
	private String orderId;
	private String txtDChNo;
	private String txtDate;
	private String txtDueDate;
	private String txtBillAddr;
	private String txtShipAddr;
	@SuppressWarnings("unchecked")
	private List<Details> productList = LazyList.decorate(new ArrayList<Details>(),FactoryUtils.instantiateFactory(Details.class));
	@SuppressWarnings("unchecked")
	private List<TaxDetailsList> taxList = LazyList.decorate(new ArrayList<TaxDetailsList>(), FactoryUtils.instantiateFactory(TaxDetailsList.class));
	@SuppressWarnings("unchecked")
	private List<LinkedTaxDetails> linkedTaxList = LazyList.decorate(new ArrayList<LinkedTaxDetails>(), FactoryUtils.instantiateFactory(LinkedTaxDetails.class));	
	private String  txtCPONo ;
	private float  txtTransCost ;
	private String txtpubNotes;
	private String txtpvtNotes;
	private float txtSubTotal;
	private String applyTax;
	private String radio;
	private float txtDiscount;
	private float txtDisTotal;
	private float txtTaxTotal;
	private String txtRoundOff;
	private float txtAmtPayble;
	private String currDate;
	private String createdBy;
	private String updatedBy;
	private float balance;
	private String oc_status;
	private float dateDiff;
	private String dstatus;
	
	public String getDstatus() {
		return dstatus;
	}
	public void setDstatus(String dstatus) {
		this.dstatus = dstatus;
	}
	public float getDateDiff() {
		return dateDiff;
	}
	public void setDateDiff(float dateDiff) {
		this.dateDiff = dateDiff;
	}
	public String getTxtInvID() {
		return txtInvID;
	}
	public void setTxtInvID(String txtInvID) {
		this.txtInvID = txtInvID;
	}
	
	public String getCustId() {
		return custId;
	}
	public void setCustId(String custId) {
		this.custId = custId;
	}
	
	public String getCustVatNo() {
		return custVatNo;
	}
	public void setCustVatNo(String custVatNo) {
		this.custVatNo = custVatNo;
	}
	public String getTxtCName() {
		return txtCName;
	}
	public void setTxtCName(String txtCName) {
		this.txtCName = txtCName;
	}
	
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getTxtDChNo() {
		return txtDChNo;
	}
	public void setTxtDChNo(String txtDChNo) {
		this.txtDChNo = txtDChNo;
	}
	public String getTxtDate() {
		return txtDate;
	}
	public void setTxtDate(String txtDate) {
		this.txtDate = txtDate;
	}
	public String getTxtDueDate() {
		return txtDueDate;
	}
	public void setTxtDueDate(String txtDueDate) {
		this.txtDueDate = txtDueDate;
	}
	public String getTxtBillAddr() {
		return txtBillAddr;
	}
	public void setTxtBillAddr(String txtBillAddr) {
		this.txtBillAddr = txtBillAddr;
	}
	public String getTxtShipAddr() {
		return txtShipAddr;
	}
	public void setTxtShipAddr(String txtShipAddr) {
		this.txtShipAddr = txtShipAddr;
	}
	public List<Details> getProductList() {
		return productList;
	}
	public void setProductList(List<Details> productList) {
		this.productList = productList;
	}
	public List<TaxDetailsList> getTaxList() {
		return taxList;
	}
	public void setTaxList(List<TaxDetailsList> taxList) {
		this.taxList = taxList;
	}
	public List<LinkedTaxDetails> getLinkedTaxList() {
		return linkedTaxList;
	}
	public void setLinkedTaxList(List<LinkedTaxDetails> linkedTaxList) {
		this.linkedTaxList = linkedTaxList;
	}
	public String getTxtCPONo() {
		return txtCPONo;
	}
	public void setTxtCPONo(String txtCPONo) {
		this.txtCPONo = txtCPONo;
	}
	public float getTxtTransCost() {
		return txtTransCost;
	}
	public void setTxtTransCost(float txtTransCost) {
		this.txtTransCost = txtTransCost;
	}
	public String getTxtpubNotes() {
		return txtpubNotes;
	}
	public void setTxtpubNotes(String txtpubNotes) {
		this.txtpubNotes = txtpubNotes;
	}
	public String getTxtpvtNotes() {
		return txtpvtNotes;
	}
	public void setTxtpvtNotes(String txtpvtNotes) {
		this.txtpvtNotes = txtpvtNotes;
	}
	public float getTxtSubTotal() {
		return txtSubTotal;
	}
	public void setTxtSubTotal(float txtSubTotal) {
		this.txtSubTotal = txtSubTotal;
	}	
	public String getApplyTax() {
		return applyTax;
	}
	public void setApplyTax(String applyTax) {
		this.applyTax = applyTax;
	}
	public String getRadio() {
		return radio;
	}
	public void setRadio(String radio) {
		this.radio = radio;
	}
	
	public float getTxtDiscount() {
		return txtDiscount;
	}
	public void setTxtDiscount(float txtDiscount) {
		this.txtDiscount = txtDiscount;
	}
	
	public float getTxtDisTotal() {
		return txtDisTotal;
	}
	public void setTxtDisTotal(float txtDisTotal) {
		this.txtDisTotal = txtDisTotal;
	}
	
	public float getTxtAmtPayble() {
		return txtAmtPayble;
	}
	public void setTxtAmtPayble(float txtAmtPayble) {
		this.txtAmtPayble = txtAmtPayble;
	}
	
	public float getTxtTaxTotal() {
		return txtTaxTotal;
	}
	public void setTxtTaxTotal(float txtTaxTotal) {
		this.txtTaxTotal = txtTaxTotal;
	}
	public String getTxtRoundOff() {
		return txtRoundOff;
	}
	public void setTxtRoundOff(String txtRoundOff) {
		this.txtRoundOff = txtRoundOff;
	}
	public String getCurrDate() {
		return currDate;
	}
	public void setCurrDate(String currDate) {
		this.currDate = currDate;
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
	public float getBalance() {
		return balance;
	}
	public void setBalance(float balance) {
		this.balance = balance;
	}
	public String getOc_status() {
		return oc_status;
	}
	public void setOc_status(String oc_status) {
		this.oc_status = oc_status;
	}
}
