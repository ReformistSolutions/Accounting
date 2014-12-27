package com.invoice.payroll.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.invoice.accounting.beans.NewAccount;
import com.invoice.payroll.beans.Payhead;
import com.invoice.payroll.beans.ProcessPayroll;
import com.invoice.payroll.beans.VeriableTemp;
import com.invoice.payroll.dao.InitiateProcessDao;

@Component("itiateProcessService")
public class InitiateProcessServiceImpl implements InitiateProcessService{

	InitiateProcessDao initiateProcessDao;

	public InitiateProcessDao getInitiateProcessDao() {
		return initiateProcessDao;
	}
	@Autowired
	public void setInitiateProcessDao(InitiateProcessDao initiateProcessDao) {
		this.initiateProcessDao = initiateProcessDao;
	}
	
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int save(VeriableTemp veriableTemp) {

		return initiateProcessDao.save(veriableTemp);
	}
	
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int saveSProcess(ProcessPayroll processPayroll) {

		return initiateProcessDao.saveSProcess(processPayroll);
	}
	@Override
	public List<ProcessPayroll> showPayrollprocess() {

		return initiateProcessDao.showPayrollprocess();
	}
	@Override
	public List<NewAccount> showAccountList() {

		return initiateProcessDao.showAccountList(); 
	}
	@Override
	public List<Payhead> showVeriableName(String empid) 
	{
		return initiateProcessDao.showVeriableName(empid);
	}
}
