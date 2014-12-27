package com.invoice.payroll.beans;

public class Payhead {

	private String txtPayId;
	private String txtPayheadName;
	private String prevPayheadName;
	private String txtPayslipName;
	private String txtPayheadType;
	private int accId;
	private String txtAccountName;
	private String getvalue;
	private String getyesno;	
	private String applicable_type;
	private String applicable;
	
	public String getApplicable() {
		return applicable;
	}
	public void setApplicable(String applicable) {
		this.applicable = applicable;
	}
	public String getPrevPayheadName() {
		return prevPayheadName;
	}
	public void setPrevPayheadName(String prevPayheadName) {
		this.prevPayheadName = prevPayheadName;
	}
	public String getApplicable_type() {
		return applicable_type;
	}
	public void setApplicable_type(String applicable_type) {
		this.applicable_type = applicable_type;
	}
	public int getAccId() {
		return accId;
	}
	public void setAccId(int accId) {
		this.accId = accId;
	}
	public String getGetvalue() {
		return getvalue;
	}
	public void setGetvalue(String getvalue) {
		this.getvalue = getvalue;
	}
	public String getGetyesno() {
		return getyesno;
	}
	public void setGetyesno(String getyesno) {
		this.getyesno = getyesno;
	}
	public String getTxtPayId() {
		return txtPayId;
	}
	public void setTxtPayId(String txtPayId) {
		this.txtPayId = txtPayId;
	}
	public String getTxtPayheadName() {
		return txtPayheadName;
	}
	public void setTxtPayheadName(String txtPayheadName) {
		this.txtPayheadName = txtPayheadName;
	}
	public String getTxtPayslipName() {
		return txtPayslipName;
	}
	public void setTxtPayslipName(String txtPayslipName) {
		this.txtPayslipName = txtPayslipName;
	}
	public String getTxtPayheadType() {
		return txtPayheadType;
	}
	public void setTxtPayheadType(String txtPayheadType) {
		this.txtPayheadType = txtPayheadType;
	}
	public String getTxtAccountName() {
		return txtAccountName;
	}
	public void setTxtAccountName(String txtAccountName) {
		this.txtAccountName = txtAccountName;
	}	
}
