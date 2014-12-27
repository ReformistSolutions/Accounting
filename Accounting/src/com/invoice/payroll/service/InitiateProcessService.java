package com.invoice.payroll.service;

import java.util.List;

import com.invoice.accounting.beans.NewAccount;
import com.invoice.payroll.beans.Payhead;
import com.invoice.payroll.beans.ProcessPayroll;
import com.invoice.payroll.beans.VeriableTemp;

public interface InitiateProcessService {

	public int save(VeriableTemp veriableTemp);
	public int saveSProcess(ProcessPayroll processPayroll);
	public List<ProcessPayroll> showPayrollprocess();
	public List<NewAccount> showAccountList();
	public List<Payhead> showVeriableName(String empid);
}
