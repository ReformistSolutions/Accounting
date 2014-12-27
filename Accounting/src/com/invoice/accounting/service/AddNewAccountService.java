package com.invoice.accounting.service;

import java.util.List;

import com.invoice.accounting.beans.ComposeMail;
import com.invoice.accounting.beans.NewAccount;
import com.invoice.accounting.beans.NewAccountGroup;


import com.invoice.company.beans.CompanyDetails;

public interface AddNewAccountService {

	public int save(NewAccount newAccount);
	public List<NewAccount> showAccount();
	public List<NewAccount> viewAccountList(int accountID);
	public NewAccount genrateAccID();
	public List<CompanyDetails> getInfo(CompanyDetails companyDetails);
	public int sendMail(ComposeMail composeMail);
    public List<NewAccountGroup> retrivepGroupName();
    public List<NewAccountGroup> retrivesGroupName();
	public List<NewAccount> showsAccount();
	public List<NewAccount> viewsAccountList(int accountID);
	public int updatepaccount(NewAccount newAccount);
	public int updatesaccount(NewAccount newAccount);
    public int deletepAccount(int accountID);
    public int deletesAccount(int accountID);
}
