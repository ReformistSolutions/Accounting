package com.invoice.banking.service;

import java.util.List;


import com.invoice.accounting.beans.JournalHeader;
import com.invoice.banking.beans.Transfer;
import com.invoice.company.beans.CompanyDetails;

public interface TransferService {

	
	public int save(Transfer transfer,JournalHeader journalHeader);
	
	public List<Transfer> show();
	
	public List<Transfer> editTransfer(String voucherNo);
	
	public int updateTransfer(Transfer transfer);
	
	public Transfer autoId();
	
	public int delete(String voucherNo);
	
	public List<CompanyDetails> getInfo(CompanyDetails companyDetails);

	
}
