package com.invoice.inventory.beans;

public class ReceiveAgainstProductDetails {
	private int txtSrNo1;
	private String prodId;
	private String txtItem1;
	private int txtQuant1;
	private String wID;
    private String selectWarehouse;
    
	public String getProdId() {
		return prodId;
	}
	public void setProdId(String prodId) {
		this.prodId = prodId;
	}
	public String getwID() {
		return wID;
	}
	public void setwID(String wID) {
		this.wID = wID;
	}
	public int getTxtSrNo1() {
		return txtSrNo1;
	}
	public void setTxtSrNo1(int txtSrNo1) {
		this.txtSrNo1 = txtSrNo1;
	}
	public String getTxtItem1() {
		return txtItem1;
	}
	public void setTxtItem1(String txtItem1) {
		this.txtItem1 = txtItem1;
	}
	public int getTxtQuant1() {
		return txtQuant1;
	}
	public void setTxtQuant1(int txtQuant1) {
		this.txtQuant1 = txtQuant1;
	}
	public String getSelectWarehouse() {
		return selectWarehouse;
	}
	public void setSelectWarehouse(String selectWarehouse) {
		this.selectWarehouse = selectWarehouse;
	} 
}
