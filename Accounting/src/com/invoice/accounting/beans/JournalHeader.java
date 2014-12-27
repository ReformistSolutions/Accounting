package com.invoice.accounting.beans;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.FactoryUtils;
import org.apache.commons.collections.list.LazyList;

public class JournalHeader {

	private String account_Name;
	private float amount;
	private String txtjourid;	
	private String txtVchrNo;	
	private String txtDate;
	private String txtSource;
	private String txtDescription;
	private float txtCreditAmount;
	private float txtDebitAmount;
	private float txtTotal;
	
	
	public float getTxtTotal() {
		return txtTotal;
	}
	public void setTxtTotal(float txtTotal) {
		this.txtTotal = txtTotal;
	}
	public String getAccount_Name() {
		return account_Name;
	}
	public void setAccount_Name(String account_Name) {
		this.account_Name = account_Name;
	}
	public float getAmount() {
		return amount;
	}
	public void setAmount(float amount) {
		this.amount = amount;
	}
	public String getTxtjourid() {
		return txtjourid;
	}
	public void setTxtjourid(String txtjourid) {
		this.txtjourid = txtjourid;
	}
	public String getTxtVchrNo() {
		return txtVchrNo;
	}
	public void setTxtVchrNo(String txtVchrNo) {
		this.txtVchrNo = txtVchrNo;
	}
	public String getTxtDate() {
		return txtDate;
	}
	public void setTxtDate(String txtDate) {
		this.txtDate = txtDate;
	}
	public String getTxtSource() {
		return txtSource;
	}
	public void setTxtSource(String txtSource) {
		this.txtSource = txtSource;
	}
	public List<JournalDetails> getJournalDetails() {
		return journalDetails;
	}
	
	public String getTxtDescription() {
		return txtDescription;
	}
	public void setTxtDescription(String txtDescription) {
		this.txtDescription = txtDescription;
	}
	
	
	public float getTxtCreditAmount() {
		return txtCreditAmount;
	}
	public void setTxtCreditAmount(float txtCreditAmount) {
		this.txtCreditAmount = txtCreditAmount;
	}
	public float getTxtDebitAmount() {
		return txtDebitAmount;
	}
	public void setTxtDebitAmount(float txtDebitAmount) {
		this.txtDebitAmount = txtDebitAmount;
	}
	
	
	public void setJournalDetails(List<JournalDetails> journalDetails) {
		this.journalDetails = journalDetails;
	}
	@SuppressWarnings("unchecked")
	private List<JournalDetails> journalDetails = LazyList.decorate(new ArrayList<JournalDetails>(),FactoryUtils.instantiateFactory(JournalDetails.class));

}
