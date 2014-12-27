package com.invoice.accounting.service;

import java.util.List;

import com.invoice.accounting.beans.ComposeMail;
import com.invoice.accounting.beans.JournalHeader;
import com.invoice.accounting.beans.NewAccount;
import com.invoice.accounting.beans.NewCreditNote;
import com.invoice.company.beans.CompanyDetails;

public interface CreditNotesService {
	
	public int save(NewCreditNote newCreditNote,JournalHeader journalHeader);
	public List<NewCreditNote> showCredit();
	public int updateCreditNotes(NewCreditNote newCreditNote);
	public List<NewCreditNote> viewCredit(String voucherID);
    public List<NewAccount> retriveAccountNo();
    public NewCreditNote genrateID();
    public int deleteCredit(String voucherID);
    public List<CompanyDetails> getInfo(CompanyDetails companyDetails);
    public int sendMail(ComposeMail composeMail);
}
