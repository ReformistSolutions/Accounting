package com.invoice.accounting.beans;

public class CreatenewexpenseDetails {
	
	private int txtSrNo1;
	
	private String txttype;
	
	private String remark;
	
	private float txtamount;

	private String txtNewAccNo;
	
	private String typefrmaccno;
	
	
	
	public String getTypefrmaccno() {
		return typefrmaccno;
	}

	public void setTypefrmaccno(String typefrmaccno) {
		this.typefrmaccno = typefrmaccno;
	}

	public String getTxtNewAccNo() {
		return txtNewAccNo;
	}

	public void setTxtNewAccNo(String txtNewAccNo) {
		this.txtNewAccNo = txtNewAccNo;
	}

	public int getTxtSrNo1() {
		return txtSrNo1;
	}

	public void setTxtSrNo1(int txtSrNo1) {
		this.txtSrNo1 = txtSrNo1;
	}

	public String getTxttype() {
		return txttype;
	}

	public void setTxttype(String txttype) {
		this.txttype = txttype;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public float getTxtamount() {
		return txtamount;
	}

	public void setTxtamount(float txtamount) {
		this.txtamount = txtamount;
	}

}
