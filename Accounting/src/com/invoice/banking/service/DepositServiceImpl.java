package com.invoice.banking.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.invoice.accounting.beans.JournalHeader;

import com.invoice.banking.beans.Deposit;


import com.invoice.banking.dao.DepositDao;
import com.invoice.company.beans.CompanyDetails;


@Component(value="depositService")
public class DepositServiceImpl implements DepositService {
	
	DepositDao depositDao;

	public DepositDao getDepositDao() {
		return depositDao;
	}
@Autowired
	public void setDepositDao(DepositDao depositDao) {
		this.depositDao = depositDao;
	}

	@Override
	public int save(Deposit deposit,JournalHeader journalHeader) {
		int i=depositDao.save(deposit,journalHeader);
		if(i>=1)
		{
		return 1;
		}
		else
		{
			return 0;
		
		}
	}
	@Override
	public List<Deposit> show() {
		List<Deposit> depoList=new ArrayList<Deposit>();
		depoList= depositDao.show();
		return depoList;
		
	}
	@Override
	public List<Deposit> editDeposit(String voucherNo) {
		return depositDao.editDeposit(voucherNo);
	}
	@Override
	public int updateDeposit(Deposit deposit) {
		return depositDao.updateDeposit(deposit);
	}
	@Override
	public Deposit autoId() {
		
		return depositDao.autoId();
	}
	@Override
	public int delete(String voucherNo) {
		
		return depositDao.delete(voucherNo);
	}
	@Override
	public List<CompanyDetails> getInfo(CompanyDetails companyDetails) {
		
		return depositDao.getInfo(companyDetails);
	}
	

}
