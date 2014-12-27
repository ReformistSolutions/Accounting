package com.invoice.accounting.beans;

public class LinkedTax {

	private String linkTaxID;	
	private String linkTaxName;
	private String linkregNo;
	private Float linksalesTax;
	private Float linkPurTax;
	private Float rate;
	private String linkdesc;
	private String mTaxID;	
	private String lTaxFillingFreq;	
	private Float totalLinkedTax;
	
	public Float getRate() {
		return rate;
	}

	public void setRate(Float rate) {
		this.rate = rate;
	}

	public String getLinkTaxID() {
		return linkTaxID;
	}

	public void setLinkTaxID(String linkTaxID) {
		this.linkTaxID = linkTaxID;
	}

	public String getLinkTaxName() {
		return linkTaxName;
	}

	public void setLinkTaxName(String linkTaxName) {
		this.linkTaxName = linkTaxName;
	}

	public String getLinkregNo() {
		return linkregNo;
	}

	public void setLinkregNo(String linkregNo) {
		this.linkregNo = linkregNo;
	}

	public Float getLinksalesTax() {
		return linksalesTax;
	}

	public void setLinksalesTax(Float linksalesTax) {
		this.linksalesTax = linksalesTax;
	}

	public Float getLinkPurTax() {
		return linkPurTax;
	}

	public void setLinkPurTax(Float linkPurTax) {
		this.linkPurTax = linkPurTax;
	}

	public String getLinkdesc() {
		return linkdesc;
	}

	public void setLinkdesc(String linkdesc) {
		this.linkdesc = linkdesc;
	}

	public String getmTaxID() {
		return mTaxID;
	}

	public void setmTaxID(String mTaxID) {
		this.mTaxID = mTaxID;
	}

	public String getlTaxFillingFreq() {
		return lTaxFillingFreq;
	}

	public void setlTaxFillingFreq(String lTaxFillingFreq) {
		this.lTaxFillingFreq = lTaxFillingFreq;
	}

	public Float getTotalLinkedTax() {
		return totalLinkedTax;
	}

	public void setTotalLinkedTax(Float totalLinkedTax) {
		this.totalLinkedTax = totalLinkedTax;
	}
	
}
