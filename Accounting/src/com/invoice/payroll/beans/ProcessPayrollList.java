package com.invoice.payroll.beans;

public class ProcessPayrollList {

	private String empId;
	private String txtfname;
	private String txtmname;
	private String txtlname;
	private int leavesUsed;
	private int leavesTotal;
	private int daysAbsent;
	private float totalSalary;
	private String payName;
	private float absentValue;
	private String absenttype;
	private String absentName;
	private String accounttoPay;
	private String schuduleDate;
	private String count;
	
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	public String getAbsentName() {
		return absentName;
	}
	public void setAbsentName(String absentName) {
		this.absentName = absentName;
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public String getTxtfname() {
		return txtfname;
	}
	public void setTxtfname(String txtfname) {
		this.txtfname = txtfname;
	}
	public String getTxtmname() {
		return txtmname;
	}
	public void setTxtmname(String txtmname) {
		this.txtmname = txtmname;
	}
	public String getTxtlname() {
		return txtlname;
	}
	public void setTxtlname(String txtlname) {
		this.txtlname = txtlname;
	}
	public int getLeavesUsed() {
		return leavesUsed;
	}
	public void setLeavesUsed(int leavesUsed) {
		this.leavesUsed = leavesUsed;
	}
	public int getLeavesTotal() {
		return leavesTotal;
	}
	public void setLeavesTotal(int leavesTotal) {
		this.leavesTotal = leavesTotal;
	}
	public int getDaysAbsent() {
		return daysAbsent;
	}
	public void setDaysAbsent(int daysAbsent) {
		this.daysAbsent = daysAbsent;
	}
	public float getTotalSalary() {
		return totalSalary;
	}
	public void setTotalSalary(float totalSalary) {
		this.totalSalary = totalSalary;
	}
	public String getPayName() {
		return payName;
	}
	public void setPayName(String payName) {
		this.payName = payName;
	}
	public float getAbsentValue() {
		return absentValue;
	}
	public void setAbsentValue(float absentValue) {
		this.absentValue = absentValue;
	}
	public String getAbsenttype() {
		return absenttype;
	}
	public void setAbsenttype(String absenttype) {
		this.absenttype = absenttype;
	}
	public String getAccounttoPay() {
		return accounttoPay;
	}
	public void setAccounttoPay(String accounttoPay) {
		this.accounttoPay = accounttoPay;
	}
	public String getSchuduleDate() {
		return schuduleDate;
	}
	public void setSchuduleDate(String schuduleDate) {
		this.schuduleDate = schuduleDate;
	}
	
	
}
