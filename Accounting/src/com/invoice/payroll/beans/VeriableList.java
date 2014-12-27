package com.invoice.payroll.beans;

public class VeriableList {

	private String payhead_id;
	private String payhead_type;
	private String applicable_type;
	private String amount;
	
	public String getApplicable_type() {
		return applicable_type;
	}
	public void setApplicable_type(String applicable_type) {
		this.applicable_type = applicable_type;
	}
	public String getPayhead_type() {
		return payhead_type;
	}
	public void setPayhead_type(String payhead_type) {
		this.payhead_type = payhead_type;
	}
	public String getPayhead_id() {
		return payhead_id;
	}
	public void setPayhead_id(String payhead_id) {
		this.payhead_id = payhead_id;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
}
