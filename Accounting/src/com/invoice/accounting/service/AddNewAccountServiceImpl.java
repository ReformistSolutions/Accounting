package com.invoice.accounting.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.invoice.accounting.beans.ComposeMail;
import com.invoice.accounting.beans.NewAccount;
import com.invoice.accounting.beans.NewAccountGroup;


import com.invoice.accounting.dao.AddNewAccountDao;
import com.invoice.company.beans.CompanyDetails;

@Component(value="addNewAccountService")
public class AddNewAccountServiceImpl implements AddNewAccountService{

	AddNewAccountDao addNewAccountDao;
	
	public AddNewAccountDao getAddNewAccountDao() {
		return addNewAccountDao;
	}
@Autowired
	public void setAddNewAccountDao(AddNewAccountDao addNewAccountDao) {
		this.addNewAccountDao = addNewAccountDao;
	}
    
    @Transactional(rollbackFor=Exception.class)
	@Override
	public int save(NewAccount newAccount) {
		int i=addNewAccountDao.save(newAccount);
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
	public List<NewAccount> showAccount() {
		
		return addNewAccountDao.showAccount();
	}
	
	@Override
	public NewAccount genrateAccID() {
		
		return addNewAccountDao.genrateAccID();
	}
	@Override
	public List<NewAccount> viewAccountList(int accountID) {
		
		return addNewAccountDao.viewAccountList(accountID);
	}
	@Transactional(rollbackFor=Exception.class)
	
	@Override
	public List<CompanyDetails> getInfo(CompanyDetails companyDetails) {
		
		return addNewAccountDao.getInfo(companyDetails);
	}
	@Override
	public int sendMail(ComposeMail composeMail) {
		
		return addNewAccountDao.sendMail(composeMail);
	}
	@Override
	public List<NewAccountGroup> retrivepGroupName() {
		
		return addNewAccountDao.retrivepGroupName();
	}
	@Override
	public List<NewAccountGroup> retrivesGroupName() {
		
		return addNewAccountDao.retrivesGroupName();
	}
	@Override
	public List<NewAccount> showsAccount() {
		
		return addNewAccountDao.showsAccount();
	}
	@Override
	public List<NewAccount> viewsAccountList(int accountID) {
		
		return addNewAccountDao.viewsAccountList(accountID);
	}
	@Override
	public int updatepaccount(NewAccount newAccount) {
		
		return addNewAccountDao.updatepaccount(newAccount);
	}
	@Override
	public int updatesaccount(NewAccount newAccount) {
		
		return addNewAccountDao.updatesaccount(newAccount);
	}
	@Override
	public int deletepAccount(int accountID) {
		
		return addNewAccountDao.deletepAccount(accountID);
	}
	@Override
	public int deletesAccount(int accountID) {
		
		return addNewAccountDao.deletesAccount(accountID);
	}
	
	
	
	

}