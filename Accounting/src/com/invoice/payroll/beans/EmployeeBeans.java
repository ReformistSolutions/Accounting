package com.invoice.payroll.beans;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.activation.CommandMap;

import org.apache.commons.collections.FactoryUtils;
import org.apache.commons.collections.list.LazyList;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class EmployeeBeans {
	
	private String NameSal;
	private String txtfname;
	private String txtmname;
	private String txtlname;
	private String TxtEmail;
	private String TxtUserName;
	private String [] userrole;
	private String Gender;
	private String bloodgrp;
	private String TxtContact;
	private String birthdt;
	private String TxtPA;
	private String TxtPermAdd;
	private String txtEmpId;
	private String JDdt;
	private String worktype;
	private String PayType;
	private String dept;
	private String Designation;
	private String TxtPAN;
	private String TxtPFNo;
	private String TxtBankNo;
	private String TxtBankName;
	private String TxtBankBranch;
	private String TxtIFSCCode;
	private String TxtLeavingdt;
	private String TxtEffdt;
	private float Txtbasic;
	private float TxtHRA;
	private float TxtDA;
	private float TxtTA;
	private String TxtEsi;
	private float txtprovfund;
	private float txtprofestax;
	private float txtincometax;
	@SuppressWarnings("unchecked")
	private List<SalaryBeans> salaryBeans = LazyList.decorate(new ArrayList<SalaryBeans>(),FactoryUtils.instantiateFactory(SalaryBeans.class));
	private String password;
	private float payheadtotal;
	private String effectiveDate;
	private String empId;
	private int leavesUsed;
	private int leavesTotal;
	private int daysAbsent;
	private float totalSalary;
	private String payName;
	private float absentValue;
	private String absenttype;
	private String accounttoPay;
	private String schuduleDate;
	private String monthNo;
	private String payrollType;
	private String oldPass;
	private String newPass;
	private String confPass;
	private String txtDeptName;
	private int txtDeptId;
	private String txtDeptDesc;
	private String txtDesigName;
	private int txtDesigId;
	private String txtDesigDesc;
	private int count;
	
	private CommonsMultipartFile file;
	public CommonsMultipartFile getFile() {
		return file;
	}
	public void setFile(CommonsMultipartFile file) {
		this.file = file;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getTxtDesigName() {
		return txtDesigName;
	}
	public void setTxtDesigName(String txtDesigName) {
		this.txtDesigName = txtDesigName;
	}
	public int getTxtDesigId() {
		return txtDesigId;
	}
	public void setTxtDesigId(int txtDesigId) {
		this.txtDesigId = txtDesigId;
	}
	public String getTxtDesigDesc() {
		return txtDesigDesc;
	}
	public void setTxtDesigDesc(String txtDesigDesc) {
		this.txtDesigDesc = txtDesigDesc;
	}
	public int getTxtDeptId() {
		return txtDeptId;
	}
	public void setTxtDeptId(int txtDeptId) {
		this.txtDeptId = txtDeptId;
	}
	public String getTxtDeptName() {
		return txtDeptName;
	}
	public void setTxtDeptName(String txtDeptName) {
		this.txtDeptName = txtDeptName;
	}
	public String getTxtDeptDesc() {
		return txtDeptDesc;
	}
	public void setTxtDeptDesc(String txtDeptDesc) {
		this.txtDeptDesc = txtDeptDesc;
	}
	public String getOldPass() {
		return oldPass;
	}
	public void setOldPass(String oldPass) {
		this.oldPass = oldPass;
	}
	public String getNewPass() {
		return newPass;
	}
	public void setNewPass(String newPass) {
		this.newPass = newPass;
	}	
	public String getConfPass() {
		return confPass;
	}
	public void setConfPass(String confPass) {
		this.confPass = confPass;
	}
	public String getPayrollType() {
		return payrollType;
	}
	public void setPayrollType(String payrollType) {
		this.payrollType = payrollType;
	}
	
	
	public String getMonthNo() {
		return monthNo;
	}
	public void setMonthNo(String monthNo) {
		this.monthNo = monthNo;
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
	public float getAbsentValue() {
		return absentValue;
	}
	public void setAbsentValue(float absentValue) {
		this.absentValue = absentValue;
	}
	public String getPayName() {
		return payName;
	}
	public void setPayName(String payName) {
		this.payName = payName;
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public float getTotalSalary() {
		return totalSalary;
	}
	public void setTotalSalary(float totalSalary) {
		this.totalSalary = totalSalary;
	}
	public int getDaysAbsent() {
		return daysAbsent;
	}
	public void setDaysAbsent(int daysAbsent) {
		this.daysAbsent = daysAbsent;
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
	public String getEffectiveDate() {
		return effectiveDate;
	}
	public void setEffectiveDate(String effectiveDate) {
		this.effectiveDate = effectiveDate;
	}
	public float getPayheadtotal() {
		return payheadtotal;
	}
	public void setPayheadtotal(float payheadtotal) {
		this.payheadtotal = payheadtotal;
	}
	public String getNameSal() {
		return NameSal;
	}
	public void setNameSal(String nameSal) {
		NameSal = nameSal;
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
	public String getTxtEmail() {
		return TxtEmail;
	}
	public void setTxtEmail(String txtEmail) {
		TxtEmail = txtEmail;
	}
	public String getTxtUserName() {
		return TxtUserName;
	}
	public void setTxtUserName(String txtUserName) {
		TxtUserName = txtUserName;
	}
	public String[] getUserrole() {
		return userrole;
	}
	public void setUserrole(String[] userrole) {
		this.userrole = userrole;
	}
	public String getGender() {
		return Gender;
	}
	public void setGender(String gender) {
		Gender = gender;
	}
	public String getBloodgrp() {
		return bloodgrp;
	}
	public void setBloodgrp(String bloodgrp) {
		this.bloodgrp = bloodgrp;
	}
	public String getTxtContact() {
		return TxtContact;
	}
	public void setTxtContact(String txtContact) {
		TxtContact = txtContact;
	}
	public String getBirthdt() {
		return birthdt;
	}
	public void setBirthdt(String birthdt) {
		this.birthdt = birthdt;
	}
	public String getTxtPA() {
		return TxtPA;
	}
	public void setTxtPA(String txtPA) {
		TxtPA = txtPA;
	}
	public String getTxtPermAdd() {
		return TxtPermAdd;
	}
	public void setTxtPermAdd(String txtPermAdd) {
		TxtPermAdd = txtPermAdd;
	}
	public String getTxtEmpId() {
		return txtEmpId;
	}
	public void setTxtEmpId(String txtEmpId) {
		this.txtEmpId = txtEmpId;
	}
	public String getJDdt() {
		return JDdt;
	}
	public void setJDdt(String jDdt) {
		JDdt = jDdt;
	}
	public String getWorktype() {
		return worktype;
	}
	public void setWorktype(String worktype) {
		this.worktype = worktype;
	}
	public String getPayType() {
		return PayType;
	}
	public void setPayType(String payType) {
		PayType = payType;
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
	public String getTxtPAN() {
		return TxtPAN;
	}
	public void setTxtPAN(String txtPAN) {
		TxtPAN = txtPAN;
	}
	public String getTxtPFNo() {
		return TxtPFNo;
	}
	public void setTxtPFNo(String txtPFNo) {
		TxtPFNo = txtPFNo;
	}
	public String getTxtBankNo() {
		return TxtBankNo;
	}
	public void setTxtBankNo(String txtBankNo) {
		TxtBankNo = txtBankNo;
	}
	public String getTxtBankName() {
		return TxtBankName;
	}
	public void setTxtBankName(String txtBankName) {
		TxtBankName = txtBankName;
	}
	public String getTxtBankBranch() {
		return TxtBankBranch;
	}
	public void setTxtBankBranch(String txtBankBranch) {
		TxtBankBranch = txtBankBranch;
	}
	public String getTxtIFSCCode() {
		return TxtIFSCCode;
	}
	public void setTxtIFSCCode(String txtIFSCCode) {
		TxtIFSCCode = txtIFSCCode;
	}
	public String getTxtLeavingdt() {
		return TxtLeavingdt;
	}
	public void setTxtLeavingdt(String txtLeavingdt) {
		TxtLeavingdt = txtLeavingdt;
	}
	public String getTxtEffdt() {
		return TxtEffdt;
	}
	public void setTxtEffdt(String txtEffdt) {
		TxtEffdt = txtEffdt;
	}
	public float getTxtbasic() {
		return Txtbasic;
	}
	public void setTxtbasic(float txtbasic) {
		Txtbasic = txtbasic;
	}
	public float getTxtHRA() {
		return TxtHRA;
	}
	public void setTxtHRA(float txtHRA) {
		TxtHRA = txtHRA;
	}
	public float getTxtDA() {
		return TxtDA;
	}
	public void setTxtDA(float txtDA) {
		TxtDA = txtDA;
	}
	public float getTxtTA() {
		return TxtTA;
	}
	public void setTxtTA(float txtTA) {
		TxtTA = txtTA;
	}
	public String getTxtEsi() {
		return TxtEsi;
	}
	public void setTxtEsi(String txtEsi) {
		TxtEsi = txtEsi;
	}
	public float getTxtprovfund() {
		return txtprovfund;
	}
	public void setTxtprovfund(float txtprovfund) {
		this.txtprovfund = txtprovfund;
	}
	public float getTxtprofestax() {
		return txtprofestax;
	}
	public void setTxtprofestax(float txtprofestax) {
		this.txtprofestax = txtprofestax;
	}
	public float getTxtincometax() {
		return txtincometax;
	}
	public void setTxtincometax(float txtincometax) {
		this.txtincometax = txtincometax;
	}
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public List<SalaryBeans> getSalaryBeans() {
		return salaryBeans;
	}
	public void setSalaryBeans(List<SalaryBeans> salaryBeans) {
		this.salaryBeans = salaryBeans;
	}

}
