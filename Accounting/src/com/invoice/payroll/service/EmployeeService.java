package com.invoice.payroll.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.invoice.payroll.beans.BreakupByEmployee;
import com.invoice.payroll.beans.ComposeMail;
import com.invoice.payroll.beans.EmployeeBeans;
import com.invoice.payroll.beans.EmployeeLeave;
import com.invoice.payroll.beans.Leave;
import com.invoice.payroll.beans.Payhead;
import com.invoice.payroll.beans.ProcessPayroll;
import com.invoice.payroll.beans.SalaryBeans;

public interface EmployeeService 
{
	
	 public int  saveEmployeedtls(EmployeeBeans employeeBeans,SalaryBeans salaryBeans);
	 public  EmployeeBeans generateId();
	 public List<EmployeeBeans>show();
	 public List<EmployeeBeans> showEmployee(String emp_ID);
	 public int updateEmployeedtl(EmployeeBeans employeeBeans);
	 public int delete(String emp_ID);
	 public int restoreEmp(String emp_ID);
	 public List<EmployeeBeans>inactiveshow();	
	 public List<EmployeeBeans>showAdmin();
	 public int cnttotal();
	 public int cntactive();
	 public int cntinactive();
	 public EmployeeBeans showEmployeeEmpID(String txtEmpId);	 
	 public int sendMail(String loginEmpId,ComposeMail composeMail);
	 public List<Payhead> showPayhead(String type);
	 public List<EmployeeLeave> showLeaves(String emp_ID);
	 public List<SalaryBeans> showSal(String emp_ID);
	 public List<BreakupByEmployee> showBreakByEmp();	
	 public List<EmployeeBeans> salaryProcess();
	 public List<Payhead> showVeriableName();
	 public int retriveVeriables(String empid);
	 public List<EmployeeBeans> processPayroll();
	 public List<SalaryBeans> showDeduction(String emp_ID,int month,int year);
	 public List<ProcessPayroll> showDaysDeduction(String emp_ID,int month,int year);
	 public String showNetSalary(String emp_ID,int month,int year);
	 public String showEarningAmount(String emp_ID,int month,int year);
	 public float showDeductionAmount(String emp_ID,int month,int year); 
	 public List<EmployeeBeans> viewSalary(String emp_ID);
	 public List<EmployeeBeans> retriveSalarySlip(String month,String year,String empid);
	List<SalaryBeans> showEarning(String emp_ID, int month, int year);
	public List<ProcessPayroll> processDate(); 
	 public List<ProcessPayroll> showConfirmPayroll();
	 public int saveLeaves(Leave leave); 
	 public List<Leave> editLeave(String empid,String leaveid);
	 public int updateLeave(Leave leave);
	 public List<SalaryBeans> showBreakupheadList();
	 public List<SalaryBeans> showBreakupamtList();
	 public List<EmployeeBeans> empList();
	 public List<SalaryBeans> showBreakupheadListW();
	 public List<SalaryBeans> showBreakupamtListW();
	 public List<EmployeeBeans> empListW();
	 public List<ComposeMail> composeMail(String emp_ID);
	 public String shwoCompdate();
	 public int changePassword(EmployeeBeans employeeBeans);
	 public String ShowAdd();
	 public String ShowDelete();
	 public String ShowUpdate();
	 public String ShowNotAdd();
	 public String ShowNotDelete();
	 public String ShowNotUpdate();
	 public String ShowRestore();
	 public String ShowNotRestore();
	 public String ShowApproved();
	 public String ShowRejected();
	 public String ShowNotApproved();
	 public String ShowNotRejected();
	 public int saveDepartment(String deptName,String deptDesc);
	 public List<EmployeeBeans> retriveDept();
	 public int saveDesignation(String desigName,String desigDesc);
	 public List<EmployeeBeans> retriveDesig();
	 public int retriveUserName(String userName);
	// public int uploadFile(EmployeeBeans uploadFile,HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException; 
}