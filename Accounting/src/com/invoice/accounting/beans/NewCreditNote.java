package com.invoice.accounting.beans;

public class NewCreditNote {

    private String txtVoucherNo;
	
	private String txtTransactionDate;
	
	private String txtFromAcnt;
	
	private String txtToAcnt;
	
	private float txtAmount;
	
	private String txtDescription;
 
	private String fromAccount;
	
	private String toAccount;
	
	private Float txtAmounthidden;
	
	private Float txtNewAmount;
	
	private String txtjourid;
	
	public String getTxtjourid() {
		return txtjourid;
	}

	public void setTxtjourid(String txtjourid) {
		this.txtjourid = txtjourid;
	}

	public float getTxtAmount() {
		return txtAmount;
	}

	public void setTxtAmount(float txtAmount) {
		this.txtAmount = txtAmount;
	}

	public String getTxtVoucherNo() {
		return txtVoucherNo;
	}

	public void setTxtVoucherNo(String txtVoucherNo) {
		this.txtVoucherNo = txtVoucherNo;
	}

	public String getTxtTransactionDate() {
		return txtTransactionDate;
	}

	public void setTxtTransactionDate(String txtTransactionDate) {
		this.txtTransactionDate = txtTransactionDate;
	}

	public String getTxtFromAcnt() {
		return txtFromAcnt;
	}

	public void setTxtFromAcnt(String txtFromAcnt) {
		this.txtFromAcnt = txtFromAcnt;
	}

	public String getTxtToAcnt() {
		return txtToAcnt;
	}

	public void setTxtToAcnt(String txtToAcnt) {
		this.txtToAcnt = txtToAcnt;
	}

	public String getTxtDescription() {
		return txtDescription;
	}

	public void setTxtDescription(String txtDescription) {
		this.txtDescription = txtDescription;
	}

	public String getFromAccount() {
		return fromAccount;
	}

	public void setFromAccount(String fromAccount) {
		this.fromAccount = fromAccount;
	}

	public String getToAccount() {
		return toAccount;
	}

	public void setToAccount(String toAccount) {
		this.toAccount = toAccount;
	}

	public Float getTxtAmounthidden() {
		return txtAmounthidden;
	}

	public void setTxtAmounthidden(Float txtAmounthidden) {
		this.txtAmounthidden = txtAmounthidden;
	}

	public Float getTxtNewAmount() {
		return txtNewAmount;
	}

	public void setTxtNewAmount(Float txtNewAmount) {
		this.txtNewAmount = txtNewAmount;
	}
}
