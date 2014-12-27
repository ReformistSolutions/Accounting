package com.invoice.sales.beans;

public class TaxDetailsList {

	private String taxId;
	private String taxType;
	private String taxRate;
	private float txtTaxValue;
	private float txtprevLinkTax;
	private int counter;
	private String registrationNo;
	private String fillingFrequency;
	private float totalTaxValue;
	private float totalLTaxValue;
	public String getTaxId() {
		return taxId;
	}
	public void setTaxId(String taxId) {
		this.taxId = taxId;
	}
	public String getTaxType() {
		return taxType;
	}
	public void setTaxType(String taxType) {
		this.taxType = taxType;
	}
	public String getTaxRate() {
		return taxRate;
	}
	public void setTaxRate(String taxRate) {
		this.taxRate = taxRate;
	}
	public float getTxtTaxValue() {
		return txtTaxValue;
	}
	public void setTxtTaxValue(float txtTaxValue) {
		this.txtTaxValue = txtTaxValue;
	}
	public float getTxtprevLinkTax() {
		return txtprevLinkTax;
	}
	public void setTxtprevLinkTax(float txtprevLinkTax) {
		this.txtprevLinkTax = txtprevLinkTax;
	}
	public int getCounter() {
		return counter;
	}
	public void setCounter(int counter) {
		this.counter = counter;
	}
	public String getRegistrationNo() {
		return registrationNo;
	}
	public void setRegistrationNo(String registrationNo) {
		this.registrationNo = registrationNo;
	}
	public String getFillingFrequency() {
		return fillingFrequency;
	}
	public void setFillingFrequency(String fillingFrequency) {
		this.fillingFrequency = fillingFrequency;
	}
	public float getTotalTaxValue() {
		return totalTaxValue;
	}
	public void setTotalTaxValue(float totalTaxValue) {
		this.totalTaxValue = totalTaxValue;
	}
	public float getTotalLTaxValue() {
		return totalLTaxValue;
	}
	public void setTotalLTaxValue(float totalLTaxValue) {
		this.totalLTaxValue = totalLTaxValue;
	}
	
}
