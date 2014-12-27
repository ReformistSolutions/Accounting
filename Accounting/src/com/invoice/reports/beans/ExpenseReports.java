package com.invoice.reports.beans;

public class ExpenseReports {
	
	private String expid;
	
	private String paidfrm;
	
	private String expdate;
	
	private String exptype;
	
	private float total;
	
	private String descrption;

	public String getExpid() {
		return expid;
	}

	public void setExpid(String expid) {
		this.expid = expid;
	}

	public String getPaidfrm() {
		return paidfrm;
	}

	public void setPaidfrm(String paidfrm) {
		this.paidfrm = paidfrm;
	}

	public String getExpdate() {
		return expdate;
	}

	public void setExpdate(String expdate) {
		this.expdate = expdate;
	}

	public String getExptype() {
		return exptype;
	}

	public void setExptype(String exptype) {
		this.exptype = exptype;
	}

	public float getTotal() {
		return total;
	}

	public void setTotal(float total) {
		this.total = total;
	}

	public String getDescrption() {
		return descrption;
	}

	public void setDescrption(String descrption) {
		this.descrption = descrption;
	}
	
	
	
	
}
