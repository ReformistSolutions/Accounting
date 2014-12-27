package com.invoice.reports.beans;

public class ChartCustomerInvoices {

	private String customerId;
	private String customerName;
	private int completed;
	private int incompleted;
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public int getCompleted() {
		return completed;
	}
	public void setCompleted(int completed) {
		this.completed = completed;
	}
	public int getIncompleted() {
		return incompleted;
	}
	public void setIncompleted(int incompleted) {
		this.incompleted = incompleted;
	}
	
}
