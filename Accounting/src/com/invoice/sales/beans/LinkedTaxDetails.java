package com.invoice.sales.beans;

public class LinkedTaxDetails {
	
	private String linkedTaxId;
	private String mTaxID;
	private float mTaxAmt;
	private String linkedTaxName;
	private float linkedTaxRate;
	private float serLinkedTax;
	public String getLinkedTaxId() {
		return linkedTaxId;
	}
	public void setLinkedTaxId(String linkedTaxId) {
		this.linkedTaxId = linkedTaxId;
	}
	public String getmTaxID() {
		return mTaxID;
	}
	public void setmTaxID(String mTaxID) {
		this.mTaxID = mTaxID;
	}
	public float getmTaxAmt() {
		return mTaxAmt;
	}
	public void setmTaxAmt(float mTaxAmt) {
		this.mTaxAmt = mTaxAmt;
	}
	public String getLinkedTaxName() {
		return linkedTaxName;
	}
	public void setLinkedTaxName(String linkedTaxName) {
		this.linkedTaxName = linkedTaxName;
	}
	public float getLinkedTaxRate() {
		return linkedTaxRate;
	}
	public void setLinkedTaxRate(float linkedTaxRate) {
		this.linkedTaxRate = linkedTaxRate;
	}
	public float getSerLinkedTax() {
		return serLinkedTax;
	}
	public void setSerLinkedTax(float serLinkedTax) {
		this.serLinkedTax = serLinkedTax;
	}
	

}
