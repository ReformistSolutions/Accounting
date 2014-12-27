package com.invoice.sales.beans;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.FactoryUtils;
import org.apache.commons.collections.list.LazyList;

public class Order {
	private String txtSOID;
	private String custId;
	private String txtCName;
	private String txtEstID;
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
	private String CustVatNo;
	private String currDate;
	private String updatedBy;
	private String createdBy;	
	private String invCreated;
	private String oc_status;
	private String product;
	private float quantity;
	
	
	public String getProduct() {
		return product;
	}
	public void setProduct(String product) {
		this.product = product;
	}
	public float getQuantity() {
		return quantity;
	}
	public void setQuantity(float quantity) {
		this.quantity = quantity;
	}
	public String getTxtSOID() {
		return txtSOID;
	}
	public void setTxtSOID(String txtSOID) {
		this.txtSOID = txtSOID;
	}
	
	public String getCustId() {
		return custId;
	}
	public void setCustId(String custId) {
		this.custId = custId;
	}
	public String getTxtCName() {
		return txtCName;
	}
	public void setTxtCName(String txtCName) {
		this.txtCName = txtCName;
	}
	
	public String getTxtEstID() {
		return txtEstID;
	}
	public void setTxtEstID(String txtEstID) {
		this.txtEstID = txtEstID;
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
	public String getCustVatNo() {
		return CustVatNo;
	}
	public void setCustVatNo(String custVatNo) {
		CustVatNo = custVatNo;
	}
	public String getCurrDate() {
		return currDate;
	}
	public void setCurrDate(String currDate) {
		this.currDate = currDate;
	}
	public String getUpdatedBy() {
		return updatedBy;
	}
	public void setUpdatedBy(String updatedBy) {
		this.updatedBy = updatedBy;
	}
	public String getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}
	public String getInvCreated() {
		return invCreated;
	}
	public void setInvCreated(String invCreated) {
		this.invCreated = invCreated;
	}
	public String getOc_status() {
		return oc_status;
	}
	public void setOc_status(String oc_status) {
		this.oc_status = oc_status;
	}
	
}