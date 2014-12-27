package com.invoice.sales.beans;

public class Payment {
	
	private String txtPayId;
	private String txtDate;
	private String txtInvId;
	private String selMethod;
	private float txtAmt;
	private float txtInvAmt;
	private float txtPaidAmt;
	private float txtBal;
	public String getTxtPayId() {
		return txtPayId;
	}
	public void setTxtPayId(String txtPayId) {
		this.txtPayId = txtPayId;
	}
	public String getTxtDate() {
		return txtDate;
	}
	public void setTxtDate(String txtDate) {
		this.txtDate = txtDate;
	}
	
	public String getTxtInvId() {
		return txtInvId;
	}
	public void setTxtInvId(String txtInvId) {
		this.txtInvId = txtInvId;
	}
	public String getSelMethod() {
		return selMethod;
	}
	public void setSelMethod(String selMethod) {
		this.selMethod = selMethod;
	}
	public float getTxtAmt() {
		return txtAmt;
	}
	public void setTxtAmt(float txtAmt) {
		this.txtAmt = txtAmt;
	}
	
	public float getTxtInvAmt() {
		return txtInvAmt;
	}
	public void setTxtInvAmt(float txtInvAmt) {
		this.txtInvAmt = txtInvAmt;
	}
	public float getTxtPaidAmt() {
		return txtPaidAmt;
	}
	public void setTxtPaidAmt(float txtPaidAmt) {
		this.txtPaidAmt = txtPaidAmt;
	}
	public float getTxtBal() {
		return txtBal;
	}
	public void setTxtBal(float txtBal) {
		this.txtBal = txtBal;
	}
	

}
