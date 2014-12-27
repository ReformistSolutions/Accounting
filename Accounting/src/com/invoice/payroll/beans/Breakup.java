package com.invoice.payroll.beans;

import java.util.ArrayList;

public class Breakup {

	private String empId;
	private ArrayList<Float> payamt;
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public ArrayList<Float> getPayamt() {
		return payamt;
	}
	public void setPayamt(ArrayList<Float> payamt) {
		this.payamt = payamt;
	}
	
	
}
