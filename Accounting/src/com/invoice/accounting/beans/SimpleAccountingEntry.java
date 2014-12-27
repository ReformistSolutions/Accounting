package com.invoice.accounting.beans;

public class SimpleAccountingEntry {

private String txtVoucherNo;
private String txtFromAcnt;
private String txtToAcnt;
private String txtAmount;
private String txtDescription;


public String getTxtDescription() {
	return txtDescription;
}

public void setTxtDescription(String txtDescription) {
	this.txtDescription = txtDescription;
}

public String getTxtAmount() {
	return txtAmount;
}

public void setTxtAmount(String txtAmount) {
	this.txtAmount = txtAmount;
}

public String getTxtToAcnt() {
	return txtToAcnt;
}

public void setTxtToAcnt(String txtToAcnt) {
	this.txtToAcnt = txtToAcnt;
}

public String getTxtFromAcnt() {
	return txtFromAcnt;
}

public void setTxtFromAcnt(String txtFromAcnt) {
	this.txtFromAcnt = txtFromAcnt;
}

public String getTxtVoucherNo() {
	return txtVoucherNo;
}

public void setTxtVoucherNo(String txtVoucherNo) {
	this.txtVoucherNo = txtVoucherNo;
}
}
