package com.invoice.accounting.beans;

public class NewAccount {
	
	private int txtNewAccNo;	
	private String txtAccountName;	
	private String txtAccountGroup;	
	private float txtOpeningBalance;
	private String txtStatus;
	private String groupID;
	private String accnttype;
	
	public String getAccnttype() {
		return accnttype;
	}
	public void setAccnttype(String accnttype) {
		this.accnttype = accnttype;
	}
	public String getGroupID() {
		return groupID;
	}
	public void setGroupID(String groupID) {
		this.groupID = groupID;
	}
	public int getTxtNewAccNo() {
		return txtNewAccNo;
	}
	public void setTxtNewAccNo(int txtNewAccNo) {
		this.txtNewAccNo = txtNewAccNo;
	}
	public String getTxtAccountName() {
		return txtAccountName;
	}
	public void setTxtAccountName(String txtAccountName) {
		this.txtAccountName = txtAccountName;
	}
	public String getTxtAccountGroup() {
		return txtAccountGroup;
	}
	public void setTxtAccountGroup(String txtAccountGroup) {
		this.txtAccountGroup = txtAccountGroup;
	}
	public float getTxtOpeningBalance() {
		return txtOpeningBalance;
	}
	public void setTxtOpeningBalance(float txtOpeningBalance) {
		this.txtOpeningBalance = txtOpeningBalance;
	}
	public String getTxtStatus() {
		return txtStatus;
	}
	public void setTxtStatus(String txtStatus) {
		this.txtStatus = txtStatus;
	}
	
	
	}