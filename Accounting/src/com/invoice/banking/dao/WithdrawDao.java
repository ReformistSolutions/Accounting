package com.invoice.banking.dao;



import java.util.List;


import com.invoice.accounting.beans.JournalHeader;
import com.invoice.accounting.beans.NewAccount;


import com.invoice.banking.beans.Withdraw;
import com.invoice.company.beans.CompanyDetails;

public interface WithdrawDao {
	
	
	public int save(Withdraw withdraw,JournalHeader journalHeader);
	
	public List<Withdraw> show();
	
	public List<Withdraw> editWithdraw(String voucherNo);
	
	public int updateWithdraw(Withdraw withdraw);
	
	public Withdraw autoId();
	
	public List<NewAccount> retriveAccountNos();

	public int delete(String voucherNo);
	
	public List<CompanyDetails> getInfo(CompanyDetails companyDetails);
	
	
}