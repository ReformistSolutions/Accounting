package com.invoice.accounting.beans;

/**
 * @author Reformist
 *
 */
public class JournalDetails {

	private int txtSrNo;
	private String txtAccountName;	
	private String txtType;
	private float txtAmount;
	private String accno;
	private float hiddenAmount;
	private String accno1;
	private String accName;
	
	public String getAccno1() {
		return accno1;
	}
	public void setAccno1(String accno1) {
		this.accno1 = accno1;
	}
	public int getTxtSrNo() {
		return txtSrNo;
	}
	public void setTxtSrNo(int txtSrNo) {
		this.txtSrNo = txtSrNo;
	}
	public String getTxtAccountName() {
		return txtAccountName;
	}
	public void setTxtAccountName(String txtAccountName) {
		this.txtAccountName = txtAccountName;
	}
	public String getTxtType() {
		return txtType;
	}
	public void setTxtType(String txtType) {
		this.txtType = txtType;
	}
	public float getTxtAmount() {
		return txtAmount;
	}
	public void setTxtAmount(float txtAmount) {
		this.txtAmount = txtAmount;
	}
	public String getAccno() {
		return accno;
	}
	public void setAccno(String accno) {
		this.accno = accno;
	}
	public float getHiddenAmount() {
		return hiddenAmount;
	}
	public void setHiddenAmount(float hiddenAmount) {
		this.hiddenAmount = hiddenAmount;
	}
	public String getAccName() {
		return accName;
	}
	public void setAccName(String accName) {
		this.accName = accName;
	}	
	
	
}
