package com.invoice.accounting.beans;

public class Taxes {
	
	private String taxId;
	private String taxName;
	private String regNo;
	private String fillFreq;
	private String applyTo;
	private float taxRate;
	private String description;
	private String status;
	private String vatName;
	private String serviceName;
	private float serviceTaxRate;
	private float totalTaxAmt;
	
	public float getServiceTaxRate() {
		return serviceTaxRate;
	}
	public void setServiceTaxRate(float serviceTaxRate) {
		this.serviceTaxRate = serviceTaxRate;
	}
	public String getVatName() {
		return vatName;
	}
	public void setVatName(String vatName) {
		this.vatName = vatName;
	}
	public String getServiceName() {
		return serviceName;
	}
	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}
	public String getTaxId() {
		return taxId;
	}
	public void setTaxId(String taxId) {
		this.taxId = taxId;
	}
	public String getTaxName() {
		return taxName;
	}
	public void setTaxName(String taxName) {
		this.taxName = taxName;
	}
	public String getRegNo() {
		return regNo;
	}
	public void setRegNo(String regNo) {
		this.regNo = regNo;
	}
	public String getFillFreq() {
		return fillFreq;
	}
	public void setFillFreq(String fillFreq) {
		this.fillFreq = fillFreq;
	}
	public String getApplyTo() {
		return applyTo;
	}
	public void setApplyTo(String applyTo) {
		this.applyTo = applyTo;
	}
	public float getTaxRate() {
		return taxRate;
	}
	public void setTaxRate(float taxRate) {
		this.taxRate = taxRate;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public float getTotalTaxAmt() {
		return totalTaxAmt;
	}
	public void setTotalTaxAmt(float totalTaxAmt) {
		this.totalTaxAmt = totalTaxAmt;
	}
	

}
