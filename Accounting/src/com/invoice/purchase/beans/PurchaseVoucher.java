package com.invoice.purchase.beans;

public class PurchaseVoucher {

	private String voucherNo;
	private String orderId;
	private int accountNo;
	private String accName;
	private String date;
	private float amount;
	private float tds;
	private String payMode;
	private String description;
	private String creadtedBy;
	private String updatedBy;
	private String venderId;
	private float avlBalance;
	
	public float getAvlBalance() {
		return avlBalance;
	}
	public void setAvlBalance(float avlBalance) {
		this.avlBalance = avlBalance;
	}
	public String getVoucherNo() {
		return voucherNo;
	}
	public void setVoucherNo(String voucherNo) {
		this.voucherNo = voucherNo;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}	
	public float getAmount() {
		return amount;
	}
	public void setAmount(float amount) {
		this.amount = amount;
	}
	public int getAccountNo() {
		return accountNo;
	}
	public void setAccountNo(int accountNo) {
		this.accountNo = accountNo;
	}
	
	public String getAccName() {
		return accName;
	}
	public void setAccName(String accName) {
		this.accName = accName;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	public float getTds() {
		return tds;
	}
	public void setTds(float tds) {
		this.tds = tds;
	}
	public String getPayMode() {
		return payMode;
	}
	public void setPayMode(String payMode) {
		this.payMode = payMode;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getCreadtedBy() {
		return creadtedBy;
	}
	public void setCreadtedBy(String creadtedBy) {
		this.creadtedBy = creadtedBy;
	}
	public String getUpdatedBy() {
		return updatedBy;
	}
	public void setUpdatedBy(String updatedBy) {
		this.updatedBy = updatedBy;
	}
	public String getVenderId() {
		return venderId;
	}
	public void setVenderId(String venderId) {
		this.venderId = venderId;
	}
	
	
	
}
