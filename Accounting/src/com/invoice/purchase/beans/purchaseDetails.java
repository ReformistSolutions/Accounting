package com.invoice.purchase.beans;

public class purchaseDetails {

	
	private int srNo;
	private String prodId;
	private String itemCode;
	private String des;
	private String unit;
	private int quantity;
	private float unitPrice;
	private float discount;
	private float taxType;	
	private String taxName;
	private float taxRate;
	private float taxAmt;
	private String taxtyp;
	private float taxDiscount;
	private float subTotal;
	private float itemTotal;
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
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
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
	public float getDiscount() {
		return discount;
	}
	public void setDiscount(float discount) {
		this.discount = discount;
	}
	
	
	
	public float getTaxType() {
		return taxType;
	}
	public void setTaxType(float taxType) {
		this.taxType = taxType;
	}
	public float getTaxAmt() {
		return taxAmt;
	}
	public void setTaxAmt(float taxAmt) {
		this.taxAmt = taxAmt;
	}	
	
	public String getTaxtyp() {
		return taxtyp;
	}
	public void setTaxtyp(String taxtyp) {
		this.taxtyp = taxtyp;
	}
	public float getTaxDiscount() {
		return taxDiscount;
	}
	public void setTaxDiscount(float taxDiscount) {
		this.taxDiscount = taxDiscount;
	}
	public float getSubTotal() {
		return subTotal;
	}
	public void setSubTotal(float subTotal) {
		this.subTotal = subTotal;
	}
	public String getTaxName() {
		return taxName;
	}
	public void setTaxName(String taxName) {
		this.taxName = taxName;
	}
	public float getItemTotal() {
		return itemTotal;
	}
	public void setItemTotal(float itemTotal) {
		this.itemTotal = itemTotal;
	}
	public float getTaxRate() {
		return taxRate;
	}
	public void setTaxRate(float taxRate) {
		this.taxRate = taxRate;
	}
	
}
