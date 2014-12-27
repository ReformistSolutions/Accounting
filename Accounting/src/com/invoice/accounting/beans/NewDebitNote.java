package com.invoice.accounting.beans;

public class NewDebitNote {
	
	private String txtVoucherNo;
	
	private String txtTransactionDate;
	
	private String txtFromAcnt;
	
	private String txtToAcnt;
	
	private float txtAmount;
	
	private String txtDescription;
	
	private String txtStatus;

	private String frmAccno;
	
	private String toAccno;
	
	private Float txtAmounthidden; 
	
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


	public float getTxtAmount() {
		return txtAmount;
	}

	public void setTxtAmount(float txtAmount) {
		this.txtAmount = txtAmount;
	}

	public String getTxtDescription() {
		return txtDescription;
	}

	public void setTxtDescription(String txtDescription) {
		this.txtDescription = txtDescription;
	}

	public String getTxtStatus() {
		return txtStatus;
	}

	public void setTxtStatus(String txtStatus) {
		this.txtStatus = txtStatus;
	}

	public String getFrmAccno() {
		return frmAccno;
	}

	public void setFrmAccno(String frmAccno) {
		this.frmAccno = frmAccno;
	}

	public String getToAccno() {
		return toAccno;
	}

	public void setToAccno(String toAccno) {
		this.toAccno = toAccno;
	}

	public Float getTxtAmounthidden() {
		return txtAmounthidden;
	}

	public void setTxtAmounthidden(Float txtAmounthidden) {
		this.txtAmounthidden = txtAmounthidden;
	}
}