package com.invoice.sales.beans;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.FactoryUtils;
import org.apache.commons.collections.list.LazyList;

/**
 * @author Reformist
 *
 */
public class Estimate {
	
	private String txtEstID;
	private String txtDate;
	private String custID;	
	private String txtCutName;	
	private String txtEnqNo;
	private String txtBillAddr;
	private String txtShipAddr;
	@SuppressWarnings("unchecked")
	private List<Details> productList = LazyList.decorate(new ArrayList<Details>(),FactoryUtils.instantiateFactory(Details.class));
	@SuppressWarnings("unchecked")
	private List<TaxDetailsList> taxList = LazyList.decorate(new ArrayList<TaxDetailsList>(), FactoryUtils.instantiateFactory(TaxDetailsList.class));
	@SuppressWarnings("unchecked")
	private List<LinkedTaxDetails> linkedTaxList = LazyList.decorate(new ArrayList<LinkedTaxDetails>(), FactoryUtils.instantiateFactory(LinkedTaxDetails.class));	
	private String txtpubNotes;
	private String txtpvtNotes;
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
	private String ordCreated;
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
	public String getTxtEnqNo() {
		return txtEnqNo;
	}
	public void setTxtEnqNo(String txtEnqNo) {
		this.txtEnqNo = txtEnqNo;
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
	public float getTxtDiscount() {
		return txtDiscount;
	}
	public void setTxtDiscount(float txtDiscount) {
		this.txtDiscount = txtDiscount;
	}
	
	public String getRadio() {
		return radio;
	}
	public void setRadio(String radio) {
		this.radio = radio;
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
	public String getOrdCreated() {
		return ordCreated;
	}
	public void setOrdCreated(String ordCreated) {
		this.ordCreated = ordCreated;
	}
	
	
}