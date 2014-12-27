package com.invoice.inventory.beans;

public class RawMaterialDetails 
{

	private int srno;
	private String rawMId;
	private String productId;
	private String productName;
	private String desc;
	private String unitm;
	private float quantity;
	private float reqty;
	private float avlqty;
	private int counter;
	
	public String getUnitm() {
		return unitm;
	}
	public void setUnitm(String unitm) {
		this.unitm = unitm;
	}
	public int getSrno() {
		return srno;
	}
	public void setSrno(int srno) {
		this.srno = srno;
	}
	
	public String getRawMId() {
		return rawMId;
	}
	public void setRawMId(String rawMId) {
		this.rawMId = rawMId;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public float getQuantity() {
		return quantity;
	}
	public void setQuantity(float quantity) {
		this.quantity = quantity;
	}
	public float getReqty() {
		return reqty;
	}
	public void setReqty(float reqty) {
		this.reqty = reqty;
	}
	public float getAvlqty() {
		return avlqty;
	}
	public void setAvlqty(float avlqty) {
		this.avlqty = avlqty;
	}
	public int getCounter() {
		return counter;
	}
	public void setCounter(int counter) {
		this.counter = counter;
	}
	
	
}
