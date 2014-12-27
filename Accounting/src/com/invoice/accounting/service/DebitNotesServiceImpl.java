package com.invoice.accounting.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.invoice.accounting.beans.ComposeMail;
import com.invoice.accounting.beans.JournalHeader;
import com.invoice.accounting.beans.NewAccount;
import com.invoice.accounting.beans.NewDebitNote;
import com.invoice.accounting.dao.DebitNotesDao;
import com.invoice.company.beans.CompanyDetails;

public class DebitNotesServiceImpl implements DebitNotesService{

	DebitNotesDao debitNotesDao;
	
	public DebitNotesDao getDebitNotesDao() {
		return debitNotesDao;
	}
	
@Autowired
	public void setDebitNotesDao(DebitNotesDao debitNotesDao) {
		this.debitNotesDao = debitNotesDao;
	}

@Transactional(rollbackFor=Exception.class)
@Override
public int save(NewDebitNote newDebitNote,JournalHeader journalHeader) {
	int i=debitNotesDao.save(newDebitNote, journalHeader);
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
public List<NewDebitNote> showDebit() {
	
	return debitNotesDao.showDebit();
}

@Override
public List<NewAccount> retriveAccountNos() {
	
	return debitNotesDao.retriveAccountNos();
}

@Transactional(rollbackFor=Exception.class)
@Override
public int updateDebitNotes(NewDebitNote newDebitNote) {

	return debitNotesDao.updateDebitNotes(newDebitNote);
}

@Override
public NewDebitNote genrateID() {
	return debitNotesDao.genrateID();
}

@Override
public List<NewDebitNote> editdebit(String voucherID) {
	return debitNotesDao.editdebit(voucherID);
}

@Override
public int deletedebit(String voucherID) {
		return debitNotesDao.deletedebit(voucherID);
}

@Override
public List<CompanyDetails> getInfo(CompanyDetails companyDetails) {
	return debitNotesDao.getInfo(companyDetails);
}

@Override
public int sendMail(ComposeMail composeMail) {
		return debitNotesDao.sendMail(composeMail);
}

}