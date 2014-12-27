package com.invoice.payroll.beans;

public class Leave 
{
	private String leaveId;
	private String leaveName;
	private int noLeaves;
	private String txtEmpId;
	
	public String getTxtEmpId() {
		return txtEmpId;
	}
	public void setTxtEmpId(String txtEmpId) {
		this.txtEmpId = txtEmpId;
	}
	public int getNoLeaves() {
		return noLeaves;
	}
	public void setNoLeaves(int noLeaves) {
		this.noLeaves = noLeaves;
	}
	public String getLeaveId() {
		return leaveId;
	}
	public void setLeaveId(String leaveId) {
		this.leaveId = leaveId;
	}
	public String getLeaveName() {
		return leaveName;
	}
	public void setLeaveName(String leaveName) {
		this.leaveName = leaveName;
	}
	
	
}
