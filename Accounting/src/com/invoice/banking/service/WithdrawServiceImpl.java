package com.invoice.banking.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


import com.invoice.accounting.beans.JournalHeader;
import com.invoice.accounting.beans.NewAccount;

import com.invoice.banking.beans.Withdraw;
import com.invoice.banking.dao.WithdrawDao;
import com.invoice.company.beans.CompanyDetails;


@Component(value="withdrawService")
public class WithdrawServiceImpl implements WithdrawService {
	
	WithdrawDao withdrawDao;

	public WithdrawDao getWithdrawDao() {
		return withdrawDao;
	}

	@Autowired
	public void setWithdrawDao(WithdrawDao withdrawDao) {
		this.withdrawDao = withdrawDao;
	}

	@Override
	public int save(Withdraw withdraw,JournalHeader journalHeader) {
		
		int i=withdrawDao.save(withdraw,journalHeader);
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
	public List<Withdraw> show() {
		List<Withdraw> withList=new ArrayList<Withdraw>();
		withList= withdrawDao.show();
		return withList;
		
	}

	@Override
	public List<Withdraw> editWithdraw(String voucherNo) {
		
		return withdrawDao.editWithdraw(voucherNo);
	}

	@Override
	public int updateWithdaw(Withdraw withdraw) {
		
		
		return withdrawDao.updateWithdraw(withdraw);
	}

	@Override
	public Withdraw autoId() {
		
		return withdrawDao.autoId();
	}

	@Override
	public List<NewAccount> retriveAccountNos() {
		
		return withdrawDao.retriveAccountNos();
	}

@Override
	public int delete(String voucherNo) {
		
		return withdrawDao.delete(voucherNo);
	}

@Override
public List<CompanyDetails> getInfo(CompanyDetails companyDetails) {
	
	return withdrawDao.getInfo(companyDetails);
}



	
}
