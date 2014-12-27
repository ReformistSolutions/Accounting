package com.invoice.purchase.beans;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.FactoryUtils;
import org.apache.commons.collections.list.LazyList;

import com.invoice.sales.beans.LinkedTaxDetails;
import com.invoice.sales.beans.TaxDetailsList;

public class Purchases {
	
	private String venderID;
	private String selSupplierName;
	private String bankAcNo;
	private String selOrderID;
	private String txtPurchaseNo;
	private String txtPurchaseDate;
	private String txtAreaAddress;
	private String txtDueDate;
	@SuppressWarnings("unchecked")
	private List<purchaseDetails> productList = LazyList.decorate(new ArrayList<purchaseDetails>(),FactoryUtils.instantiateFactory(purchaseDetails.class));
	@SuppressWarnings("unchecked")
	private List<TaxDetailsList> taxList = LazyList.decorate(new ArrayList<TaxDetailsList>(),FactoryUtils.instantiateFactory(TaxDetailsList.class));
	@SuppressWarnings("unchecked")
	private List<LinkedTaxDetails> linkedTaxList = LazyList.decorate(new ArrayList<LinkedTaxDetails>(), FactoryUtils.instantiateFactory(LinkedTaxDetails.class));	
	private String txtPubNotes;
	private String txtPvtNotes;	
	private float txtSubTotal;
	private String radio;
	private float txtDiscount;
	private float txtDisTotal;
	private float txtTaxTotal;
	private String txtRoundOff;
	private float txtAmtPayble;
	private float balAmt;
	private String CustVatNo;
	private String createdBy;
	private String updatedBy;
	private String serviceTax;
	private String payamtYes;
	private String payamtNo;
	private String paymentDate;
	private float total;
	private float overduedays;

	
	public String getSelOrderID() {
		return selOrderID;
	}
	public void setSelOrderID(String selOrderID) {
		this.selOrderID = selOrderID;
	}
	public String getPayamtYes() {
		return payamtYes;
	}
	public void setPayamtYes(String payamtYes) {
		this.payamtYes = payamtYes;
	}
	public String getPayamtNo() {
		return payamtNo;
	}
	public void setPayamtNo(String payamtNo) {
		this.payamtNo = payamtNo;
	}
	public String getVenderID() {
		return venderID;
	}
	public void setVenderID(String venderID) {
		this.venderID = venderID;
	}
	public String getSelSupplierName() {
		return selSupplierName;
	}
	public void setSelSupplierName(String selSupplierName) {
		this.selSupplierName = selSupplierName;
	}
	public String getBankAcNo() {
		return bankAcNo;
	}
	public void setBankAcNo(String bankAcNo) {
		this.bankAcNo = bankAcNo;
	}
	public String getTxtPurchaseNo() {
		return txtPurchaseNo;
	}
	public void setTxtPurchaseNo(String txtPurchaseNo) {
		this.txtPurchaseNo = txtPurchaseNo;
	}
	public String getTxtPurchaseDate() {
		return txtPurchaseDate;
	}
	public void setTxtPurchaseDate(String txtPurchaseDate) {
		this.txtPurchaseDate = txtPurchaseDate;
	}
	public String getTxtAreaAddress() {
		return txtAreaAddress;
	}
	public void setTxtAreaAddress(String txtAreaAddress) {
		this.txtAreaAddress = txtAreaAddress;
	}
	public String getTxtDueDate() {
		return txtDueDate;
	}
	public void setTxtDueDate(String txtDueDate) {
		this.txtDueDate = txtDueDate;
	}
	public List<purchaseDetails> getProductList() {
		return productList;
	}
	public void setProductList(List<purchaseDetails> productList) {
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
	public float getTxtSubTotal() {
		return txtSubTotal;
	}
	public void setTxtSubTotal(float txtSubTotal) {
		this.txtSubTotal = txtSubTotal;
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
	public float getTxtAmtPayble() {
		return txtAmtPayble;
	}
	public void setTxtAmtPayble(float txtAmtPayble) {
		this.txtAmtPayble = txtAmtPayble;
	}	
	public float getBalAmt() {
		return balAmt;
	}
	public void setBalAmt(float balAmt) {
		this.balAmt = balAmt;
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
	public String getServiceTax() {
		return serviceTax;
	}
	public void setServiceTax(String serviceTax) {
		this.serviceTax = serviceTax;
	}
	public String getPaymentDate() {
		return paymentDate;
	}
	public void setPaymentDate(String paymentDate) {
		this.paymentDate = paymentDate;
	}
	public float getTotal() {
		return total;
	}
	public void setTotal(float total) {
		this.total = total;
	}
	public float getOverduedays() {
		return overduedays;
	}
	public void setOverduedays(float overduedays) {
		this.overduedays = overduedays;
	}
	
	
}
