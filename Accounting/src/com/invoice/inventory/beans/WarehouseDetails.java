package com.invoice.inventory.beans;

public class WarehouseDetails {

	private String wID;
	private int srNo;
	private String itemId;
	private String itemCode;
	private String quantity;
	private String unit;
	private String decription;
	private String avlqty;
	
	public String getAvlqty() {
		return avlqty;
	}
	public void setAvlqty(String avlqty) {
		this.avlqty = avlqty;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public String getDecription() {
		return decription;
	}
	public void setDecription(String decription) {
		this.decription = decription;
	}
	public int getSrNo() {
		return srNo;
	}
	public void setSrNo(int srNo) {
		this.srNo = srNo;
	}
	public String getItemId() {
		return itemId;
	}
	public void setItemId(String itemId) {
		this.itemId = itemId;
	}

	public String getwID() {
		return wID;
	}
	public void setwID(String wID) {
		this.wID = wID;
	}
	public String getItemCode() {
		return itemCode;
	}
	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	
	
}
