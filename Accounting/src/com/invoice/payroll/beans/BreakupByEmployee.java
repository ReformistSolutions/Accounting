package com.invoice.payroll.beans;


public class BreakupByEmployee 
{
	private String emp_Name;
	private float total;
	private float payamt;
	private float payHedamt;
	private String payhead_name;
	
	public String getPayhead_name() {
		return payhead_name;
	}
	public void setPayhead_name(String payhead_name) {
		this.payhead_name = payhead_name;
	}
	public float getPayHedamt() {
		return payHedamt;
	}
	public void setPayHedamt(float payHedamt) {
		this.payHedamt = payHedamt;
	}
	public float getPayamt() {
		return payamt;
	}
	public void setPayamt(float payamt) {
		this.payamt = payamt;
	}
	public String getEmp_Name() {
		return emp_Name;
	}
	public void setEmp_Name(String emp_Name) {
		this.emp_Name = emp_Name;
	}	
	public float getTotal() {
		return total;
	}
	public void setTotal(float total) {
		this.total = total;
	}	
}
