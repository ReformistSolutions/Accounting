package com.invoice.purchase.beans;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.FactoryUtils;
import org.apache.commons.collections.list.LazyList;

import com.invoice.sales.beans.LinkedTaxDetails;
import com.invoice.sales.beans.TaxDetailsList;

public class PurchaseQuotation {
	
	private String txyQuotationNo;
	private String txtQuotationDate;
	private String venderID;
	private String txtCustName;
	private String selEnquiryNo;
	private String txtBillingTo;
	private String txtBillingCity;
	private String txtBillingState;
	private String txtBillingCountry;
	private int txtBillingPinCode;
	private String txtAreaShipto;
	private String txtShippingCity;
	private String txtShippingState;
	private String txtShippingCountry;
	private int txtShippingPinCode;
	
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
	private String CustVatNo;
	private String createdBy;
	private String updatedBy;
	private String serviceTax;
	private String orderCreated;

	
	public String getSelEnquiryNo() {
		return selEnquiryNo;
	}
	public void setSelEnquiryNo(String selEnquiryNo) {
		this.selEnquiryNo = selEnquiryNo;
	}
	public String getOrderCreated() {
		return orderCreated;
	}
	public void setOrderCreated(String orderCreated) {
		this.orderCreated = orderCreated;
	}
	public String getTxyQuotationNo() {
		return txyQuotationNo;
	}
	public void setTxyQuotationNo(String txyQuotationNo) {
		this.txyQuotationNo = txyQuotationNo;
	}
	public String getTxtQuotationDate() {
		return txtQuotationDate;
	}
	public void setTxtQuotationDate(String txtQuotationDate) {
		this.txtQuotationDate = txtQuotationDate;
	}
	public String getVenderID() {
		return venderID;
	}
	public void setVenderID(String venderID) {
		this.venderID = venderID;
	}
	public String getTxtCustName() {
		return txtCustName;
	}
	public void setTxtCustName(String txtCustName) {
		this.txtCustName = txtCustName;
	}
	public String getTxtBillingTo() {
		return txtBillingTo;
	}
	public void setTxtBillingTo(String txtBillingTo) {
		this.txtBillingTo = txtBillingTo;
	}
	public String getTxtAreaShipto() {
		return txtAreaShipto;
	}
	public void setTxtAreaShipto(String txtAreaShipto) {
		this.txtAreaShipto = txtAreaShipto;
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
	public String getTxtBillingCity() {
		return txtBillingCity;
	}
	public void setTxtBillingCity(String txtBillingCity) {
		this.txtBillingCity = txtBillingCity;
	}
	public String getTxtBillingState() {
		return txtBillingState;
	}
	public void setTxtBillingState(String txtBillingState) {
		this.txtBillingState = txtBillingState;
	}
	public String getTxtBillingCountry() {
		return txtBillingCountry;
	}
	public void setTxtBillingCountry(String txtBillingCountry) {
		this.txtBillingCountry = txtBillingCountry;
	}
	public int getTxtBillingPinCode() {
		return txtBillingPinCode;
	}
	public void setTxtBillingPinCode(int txtBillingPinCode) {
		this.txtBillingPinCode = txtBillingPinCode;
	}
	public String getTxtShippingCity() {
		return txtShippingCity;
	}
	public void setTxtShippingCity(String txtShippingCity) {
		this.txtShippingCity = txtShippingCity;
	}
	public String getTxtShippingState() {
		return txtShippingState;
	}
	public void setTxtShippingState(String txtShippingState) {
		this.txtShippingState = txtShippingState;
	}
	public String getTxtShippingCountry() {
		return txtShippingCountry;
	}
	public void setTxtShippingCountry(String txtShippingCountry) {
		this.txtShippingCountry = txtShippingCountry;
	}
	public int getTxtShippingPinCode() {
		return txtShippingPinCode;
	}
	public void setTxtShippingPinCode(int txtShippingPinCode) {
		this.txtShippingPinCode = txtShippingPinCode;
	}
	
}