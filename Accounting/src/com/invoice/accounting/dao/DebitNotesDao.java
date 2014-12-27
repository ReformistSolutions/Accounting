package com.invoice.accounting.dao;

import java.util.List;

import com.invoice.accounting.beans.ComposeMail;
import com.invoice.accounting.beans.JournalHeader;
import com.invoice.accounting.beans.NewAccount;
import com.invoice.accounting.beans.NewDebitNote;
import com.invoice.company.beans.CompanyDetails;

public interface DebitNotesDao {

	public int save(NewDebitNote newDebitNote,JournalHeader journalHeader);
    public int updateDebitNotes(NewDebitNote newDebitNote);
	
	public List<NewDebitNote> showDebit();
	public List<NewDebitNote> editdebit(String voucherID);
	public List<NewAccount> retriveAccountNos();
	public NewDebitNote genrateID();
	public int deletedebit(String voucherID);
	public List<CompanyDetails> getInfo(CompanyDetails companyDetails);
	public int sendMail(ComposeMail composeMail);
}
