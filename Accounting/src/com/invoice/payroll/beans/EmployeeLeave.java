package com.invoice.payroll.beans;

public class EmployeeLeave 
{
	private String leaveid;
	private String leaveName;
	private String empid;
	private String employeeid;
	private int leavebal;
	private int leavetaken;
	private int total;
	private String status;
	
	public String getEmployeeid() {
		return employeeid;
	}
	public void setEmployeeid(String employeeid) {
		this.employeeid = employeeid;
	}
	public String getLeaveName() {
		return leaveName;
	}
	public void setLeaveName(String leaveName) {
		this.leaveName = leaveName;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getLeaveid() {
		return leaveid;
	}
	public void setLeaveid(String leaveid) {
		this.leaveid = leaveid;
	}
	public String getEmpid() {
		return empid;
	}
	public void setEmpid(String empid) {
		this.empid = empid;
	}
	public int getLeavebal() {
		return leavebal;
	}
	public void setLeavebal(int leavebal) {
		this.leavebal = leavebal;
	}
	public int getLeavetaken() {
		return leavetaken;
	}
	public void setLeavetaken(int leavetaken) {
		this.leavetaken = leavetaken;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
}
