package com.invoice.sales.beans;

/**
 * @author Reformist
 *
 */
public class DeliveryChallanDetails {

	private int srNo;
	private String prodID;
	private String itemCode;
	private int quantity;
	private String unit;
	private int rQty;
	public int getSrNo() {
		return srNo;
	}
	public void setSrNo(int srNo) {
		this.srNo = srNo;
	}
	
	public String getProdID() {
		return prodID;
	}
	public void setProdID(String prodID) {
		this.prodID = prodID;
	}
	public String getItemCode() {
		return itemCode;
	}
	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public int getrQty() {
		return rQty;
	}
	public void setrQty(int rQty) {
		this.rQty = rQty;
	}
	

	
	
}
