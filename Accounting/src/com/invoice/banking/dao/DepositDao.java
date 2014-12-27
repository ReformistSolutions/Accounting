package com.invoice.banking.dao;

import java.util.List;

import com.invoice.accounting.beans.JournalHeader;

import com.invoice.banking.beans.Deposit;
import com.invoice.company.beans.CompanyDetails;


public interface DepositDao {
	
	public int save(Deposit deposit,JournalHeader journalHeader);
	
	public List<Deposit> show();
	
	public List<Deposit> editDeposit(String voucherNo);

	public int updateDeposit(Deposit deposit);
	
	public Deposit autoId();
	
	public int delete(String voucherNo);

	public List<CompanyDetails> getInfo(CompanyDetails companyDetails);
	
	

}
