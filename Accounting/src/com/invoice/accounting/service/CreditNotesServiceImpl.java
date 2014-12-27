package com.invoice.accounting.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.invoice.accounting.beans.ComposeMail;
import com.invoice.accounting.beans.JournalHeader;
import com.invoice.accounting.beans.NewAccount;
import com.invoice.accounting.beans.NewCreditNote;
import com.invoice.accounting.dao.CreditNotesDao;
import com.invoice.company.beans.CompanyDetails;

public class CreditNotesServiceImpl implements CreditNotesService{

	CreditNotesDao creditNotesDao;
	
	public CreditNotesDao getCreditNotesDao() {
		return creditNotesDao;
	}
 @Autowired
	public void setCreditNotesDao(CreditNotesDao creditNotesDao) {
		this.creditNotesDao = creditNotesDao;
	}
 	
 	@Transactional(rollbackFor=Exception.class)
	@Override
	public int save(NewCreditNote newCreditNote,JournalHeader journalHeader) {
		int i=creditNotesDao.save(newCreditNote, journalHeader);
		if(i>0)
		{
			return (1);
		}
		else
		{
			return (0);
		}	
	}
	@Override
	public List<NewCreditNote> showCredit() {

		return creditNotesDao.showCredit();
	}
	
	@Override
	public List<NewCreditNote> viewCredit(String voucherID) {
		
		return creditNotesDao.viewCredit(voucherID);
	}
	@Override
	public List<NewAccount> retriveAccountNo() {
		
		return creditNotesDao.retriveAccountNo();
	}
	@Override
	public NewCreditNote genrateID() {
		
		return creditNotesDao.genrateID();
	}
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int updateCreditNotes(NewCreditNote newCreditNote) {
		return creditNotesDao.updateCreditNotes(newCreditNote);
	}
	@Override
	public int deleteCredit(String voucherID) {
		return creditNotesDao.deleteCredit(voucherID);
	}
	@Override
	public List<CompanyDetails> getInfo(CompanyDetails companyDetails) {
		return creditNotesDao.getInfo(companyDetails);
	}
	@Override
	public int sendMail(ComposeMail composeMail) {
		
		return creditNotesDao.sendMail(composeMail);
	}
	
}
