package com.invoice.payroll.beans;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.FactoryUtils;
import org.apache.commons.collections.list.LazyList;

public class ProcessPayroll {

	private String accounttoPay;
	private String schuduleDate;
	private String txtfname;
	private String txtmname;
	private String txtlname;
	private int daysAbsent;
	private float totalSalary;
	@SuppressWarnings("unchecked")
	private List<ProcessPayrollList> processpayrolllist = LazyList.decorate(new ArrayList<ProcessPayrollList>(),FactoryUtils.instantiateFactory(ProcessPayrollList.class));
	
	private String txtEmpId;
	private String dept;
	private String Designation;
	private String TxtPFNo;
	private String JDdt;
	private String TxtEsi;
	private String TxtBankNo;
	private String payid;
	private String payheadname;
	private String payheadtype;
	private float payheadamt;
	private String applicable_type;
	
	public String getApplicable_type() {
		return applicable_type;
	}
	public void setApplicable_type(String applicable_type) {
		this.applicable_type = applicable_type;
	}
	public float getPayheadamt() {
		return payheadamt;
	}
	public void setPayheadamt(float payheadamt) {
		this.payheadamt = payheadamt;
	}
	private String deductionNamee;
	private float deductionAmt;
	private String deductionType;
	
	public String getDeductionType() {
		return deductionType;
	}
	public void setDeductionType(String deductionType) {
		this.deductionType = deductionType;
	}
	public String getPayid() {
		return payid;
	}
	public void setPayid(String payid) {
		this.payid = payid;
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
	public String getDeductionNamee() {
		return deductionNamee;
	}
	public void setDeductionNamee(String deductionNamee) {
		this.deductionNamee = deductionNamee;
	}
	public float getDeductionAmt() {
		return deductionAmt;
	}
	public void setDeductionAmt(float deductionAmt) {
		this.deductionAmt = deductionAmt;
	}
	public String getTxtEmpId() {
		return txtEmpId;
	}
	public void setTxtEmpId(String txtEmpId) {
		this.txtEmpId = txtEmpId;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public String getDesignation() {
		return Designation;
	}
	public void setDesignation(String designation) {
		Designation = designation;
	}
	public String getTxtPFNo() {
		return TxtPFNo;
	}
	public void setTxtPFNo(String txtPFNo) {
		TxtPFNo = txtPFNo;
	}
	public String getJDdt() {
		return JDdt;
	}
	public void setJDdt(String jDdt) {
		JDdt = jDdt;
	}
	public String getTxtEsi() {
		return TxtEsi;
	}
	public void setTxtEsi(String txtEsi) {
		TxtEsi = txtEsi;
	}
	public String getTxtBankNo() {
		return TxtBankNo;
	}
	public void setTxtBankNo(String txtBankNo) {
		TxtBankNo = txtBankNo;
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
	public List<ProcessPayrollList> getProcesspayrolllist() {
		return processpayrolllist;
	}
	public void setProcesspayrolllist(List<ProcessPayrollList> processpayrolllist) {
		this.processpayrolllist = processpayrolllist;
	}
}