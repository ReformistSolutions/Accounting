package com.invoice.payroll.beans;

public class SalaryBeans 
{	
	
	private String payheadid;
	private String payheadname;
	private String payheadtype;
	private float payamt;
	private float total;
	private String daysname;
	private float daysamt;
	private String daytype;
	private String empid;
	private String empName;
	private String applicable_type;
	private String applicable;
	
	public String getApplicable() {
		return applicable;
	}
	public void setApplicable(String applicable) {
		this.applicable = applicable;
	}
	public String getApplicable_type() {
		return applicable_type;
	}
	public void setApplicable_type(String applicable_type) {
		this.applicable_type = applicable_type;
	}
	public String getEmpid() {
		return empid;
	}
	public void setEmpid(String empid) {
		this.empid = empid;
	}
	public String getDaytype() {
		return daytype;
	}
	public void setDaytype(String daytype) {
		this.daytype = daytype;
	}
	public String getPayheadid() {
		return payheadid;
	}
	public void setPayheadid(String payheadid) {
		this.payheadid = payheadid;
	}
	public String getDaysname() {
		return daysname;
	}
	public void setDaysname(String daysname) {
		this.daysname = daysname;
	}
	public float getDaysamt() {
		return daysamt;
	}
	public void setDaysamt(float daysamt) {
		this.daysamt = daysamt;
	}
	public float getTotal() {
		return total;
	}
	public void setTotal(float total) {
		this.total = total;
	}
	public String getPayheadname() {
		return payheadname;
	}
	public void setPayheadname(String payheadname) {
		this.payheadname = payheadname;
	}
	public String getPayheadtype() {
		return payheadtype;
	}
	public void setPayheadtype(String payheadtype) {
		this.payheadtype = payheadtype;
	}
	public float getPayamt() {
		return payamt;
	}
	public void setPayamt(float payamt) {
		this.payamt = payamt;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}	
	
}
