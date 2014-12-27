package com.invoice.sales.beans;

public class Details {
	
	private int srNo;
	private String prodId;
	private String itemCode;
	private String des;
	private int quantity;
	private float unitPrice;	
	private float itemTotal;
	private String taxName;
	private float exSubTotal;
	private String unit;
	private float aQty;
	private int rQty;
	private int dQty;
	private int invQty;
	
	public int getInvQty() {
		return invQty;
	}
	public void setInvQty(int invQty) {
		this.invQty = invQty;
	}
	public int getrQty() {
		return rQty;
	}
	public void setrQty(int rQty) {
		this.rQty = rQty;
	}
	public int getdQty() {
		return dQty;
	}
	public void setdQty(int dQty) {
		this.dQty = dQty;
	}
	public int getSrNo() {
		return srNo;
	}
	public void setSrNo(int srNo) {
		this.srNo = srNo;
	}
	public String getProdId() {
		return prodId;
	}
	public void setProdId(String prodId) {
		this.prodId = prodId;
	}
	public String getItemCode() {
		return itemCode;
	}
	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public float getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(float unitPrice) {
		this.unitPrice = unitPrice;
	}
	public float getItemTotal() {
		return itemTotal;
	}
	public void setItemTotal(float itemTotal) {
		this.itemTotal = itemTotal;
	}
	public String getTaxName() {
		return taxName;
	}
	public void setTaxName(String taxName) {
		this.taxName = taxName;
	}
	public float getExSubTotal() {
		return exSubTotal;
	}
	public void setExSubTotal(float exSubTotal) {
		this.exSubTotal = exSubTotal;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public float getaQty() {
		return aQty;
	}
	public void setaQty(float aQty) {
		this.aQty = aQty;
	}
	
}
