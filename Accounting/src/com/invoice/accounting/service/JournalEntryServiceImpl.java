package com.invoice.accounting.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.invoice.accounting.beans.ComposeMail;
import com.invoice.accounting.beans.JournalHeader;
import com.invoice.accounting.beans.NewAccount;

import com.invoice.accounting.dao.JournalEntryDao;
import com.invoice.company.beans.CompanyDetails;
import com.invoice.purchase.beans.PurchaseVoucher;
import com.invoice.sales.beans.Receipts;

@Component(value="journalEntryService")
 class JournalEntryServiceImpl implements JournalEntryService 
{
	private  JournalEntryDao journalEntryDao;
	
	
	public JournalEntryDao getJournalEntryDao() {
		return journalEntryDao;
	}
	@Autowired
	public void setJournalEntryDao(JournalEntryDao journalEntryDao) {
		this.journalEntryDao = journalEntryDao;
	}
	
	@Override
	public int saveJournalEntry(JournalHeader journalHeader) {
		
		return journalEntryDao.saveJournalEntry(journalHeader);
	}
	@Override
	public List<JournalHeader> show() {
		
		return journalEntryDao.show();
	}
	@Override
	public List<JournalHeader> viewjournal(String voucher_No) {
		
		return journalEntryDao.viewjournal(voucher_No);
	}
	@Override
	public List<PurchaseVoucher> retrivevoucher() {
	
		return journalEntryDao.retrivevoucher();
		
		
	}
	@Override
	public List<Receipts> retrivereceipt() {
		 
		return journalEntryDao.retrivereceipt();
				}
	@Override
	public List<NewAccount> retriveaccount() {
		
		return journalEntryDao.retriveaccount();
	}
	@Override
	public JournalHeader generateId() {
		
		return journalEntryDao.generateId();
	}
	@Override
	public int updatejournal(JournalHeader journalHeader) {
		
		return journalEntryDao.updatejournal(journalHeader);
	}
	@Override
	public List<JournalHeader> staticshow() {
		
		return journalEntryDao.staticshow();
	}
	@Override
	public List<CompanyDetails> getInfo(CompanyDetails companyDetails) {

		return journalEntryDao.getInfo(companyDetails);
	}
	@Override
	public int sendMail(ComposeMail composeMail) {
		return journalEntryDao.sendMail(composeMail);
	}
	@Override
	public int delete(String Jid) {
		
		return journalEntryDao.delete(Jid);
	}
	
	
}
