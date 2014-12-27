package com.invoice.accounting.dao;



import java.util.List;


import com.invoice.accounting.beans.ComposeMail;
import com.invoice.accounting.beans.JournalHeader;
import com.invoice.accounting.beans.NewAccount;
import com.invoice.company.beans.CompanyDetails;
import com.invoice.purchase.beans.PurchaseVoucher;
import com.invoice.sales.beans.Receipts;

public interface JournalEntryDao
{
   public int saveJournalEntry(JournalHeader journalheader);
	public List<JournalHeader>show();
	public List<JournalHeader>staticshow();
	public List<JournalHeader> viewjournal(String voucherId);
	public List<PurchaseVoucher> retrivevoucher();
	public List<Receipts>retrivereceipt();
	public List<NewAccount>retriveaccount();
	public  JournalHeader generateId();
	public int updatejournal(JournalHeader journalHeader);
	public List<CompanyDetails> getInfo(CompanyDetails companyDetails);
	public int sendMail(ComposeMail composeMail);
	public int delete(String Jid);
}
