package com.invoice.banking.beans;

public class Transfer {
	
private String txttransVchrNo;
	
	private String txttransdate;
	
	private String txttransFrmAccnt;
	
	private String txttransToAccnt;
	
	private String txttransTransType;
	
	private Float txttransAmount;
	
	private String txttransDesc;
	
    private String fromAccountNo;
	
	public String getFromAccountNo() {
		return fromAccountNo;
	}

	public void setFromAccountNo(String fromAccountNo) {
		this.fromAccountNo = fromAccountNo;
	}

	public String getToAccountNo() {
		return toAccountNo;
	}

	public void setToAccountNo(String toAccountNo) {
		this.toAccountNo = toAccountNo;
	}

	private String toAccountNo;

	public String getTxttransVchrNo() {
		return txttransVchrNo;
	}

	public void setTxttransVchrNo(String txttransVchrNo) {
		this.txttransVchrNo = txttransVchrNo;
	}

	public String getTxttransdate() {
		return txttransdate;
	}

	public void setTxttransdate(String txttransdate) {
		this.txttransdate = txttransdate;
	}

	public String getTxttransFrmAccnt() {
		return txttransFrmAccnt;
	}

	public void setTxttransFrmAccnt(String txttransFrmAccnt) {
		this.txttransFrmAccnt = txttransFrmAccnt;
	}

	public String getTxttransToAccnt() {
		return txttransToAccnt;
	}

	public void setTxttransToAccnt(String txttransToAccnt) {
		this.txttransToAccnt = txttransToAccnt;
	}

	public String getTxttransTransType() {
		return txttransTransType;
	}

	public void setTxttransTransType(String txttransTransType) {
		this.txttransTransType = txttransTransType;
	}

	public Float getTxttransAmount() {
		return txttransAmount;
	}

	public void setTxttransAmount(Float txttransAmount) {
		this.txttransAmount = txttransAmount;
	}

	public String getTxttransDesc() {
		return txttransDesc;
	}

	public void setTxttransDesc(String txttransDesc) {
		this.txttransDesc = txttransDesc;
	}

	
}
