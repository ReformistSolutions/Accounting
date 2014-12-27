package com.invoice.banking.service;

import java.util.List;


import com.invoice.accounting.beans.JournalHeader;
import com.invoice.accounting.beans.NewAccount;
import com.invoice.banking.beans.Withdraw;
import com.invoice.company.beans.CompanyDetails;


public interface WithdrawService {
	
	public int save(Withdraw withdraw,JournalHeader journalHeader);
	
	public List<Withdraw> show();
	
	public List<Withdraw> editWithdraw(String voucherNo);

	public int updateWithdaw(Withdraw withdraw);
	
	public Withdraw autoId();
	
	public List<NewAccount> retriveAccountNos();
	
	public int delete(String voucherNo);
	
	public List<CompanyDetails> getInfo(CompanyDetails companyDetails);
	
	

}
