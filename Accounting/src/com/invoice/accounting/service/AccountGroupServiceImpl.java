package com.invoice.accounting.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.invoice.accounting.beans.ComposeMail;
import com.invoice.accounting.beans.NewAccountGroup;
import com.invoice.accounting.dao.AccountGroupDao;
import com.invoice.company.beans.CompanyDetails;

@Component(value="accountGroupService")
public class AccountGroupServiceImpl implements AccountGroupService {

	AccountGroupDao accountGroupDao;
	
	public AccountGroupDao getAccountGroupDao() {
		return accountGroupDao;
	}
    
	@Autowired
	public void setAccountGroupDao(AccountGroupDao accountGroupDao) {
		this.accountGroupDao = accountGroupDao;
	}
    
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int save(NewAccountGroup newAccountGroup) {
		int i=accountGroupDao.save(newAccountGroup);
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
	public List<NewAccountGroup> showgroupAccount() {
		
		return accountGroupDao.showgroupAccount();
	}

	@Override
	public List<NewAccountGroup> viewAccountGrop(String groupID) {
		
		return accountGroupDao.viewAccountGrop(groupID);
	}

	@Override
	public NewAccountGroup genrateAccID() {
		
		return accountGroupDao.genrateAccID();
	}

	@Transactional(rollbackFor=Exception.class)
	@Override
	public int updateGroupAccount(NewAccountGroup newAccountGroup) {
	
		return accountGroupDao.updateGroupAccount(newAccountGroup);
	}

	@Override
	public int deletegroup(String groupID) {
		return accountGroupDao.deletegroup(groupID);
	}

	@Override
	public int deleteAccount(String accountID) {
		return 0;
	}

	@Override
	public List<CompanyDetails> getInfo(CompanyDetails companyDetails) {
		return accountGroupDao.getInfo(companyDetails);
	}

	@Override
	public int sendMail(ComposeMail composeMail) {
		return accountGroupDao.sendMail(composeMail);
	}

	@Override
	public NewAccountGroup genratesAccID() {
		
		return accountGroupDao.genratesAccID();
	}

	@Override
	public List<NewAccountGroup> showgroupsAccount() {
		
		return accountGroupDao.showgroupsAccount();
	}

	@Override
	public List<NewAccountGroup> viewsAccountGrop(String groupID) {
		
		return accountGroupDao.viewsAccountGrop(groupID);
	}

	@Override
	public int updatesGroupAccount(NewAccountGroup newAccountGroup) {
		
		return accountGroupDao.updatesGroupAccount(newAccountGroup);
	}

	@Override
	public int deletesgroup(String groupID) {
		
		return accountGroupDao.deletesgroup(groupID);
	}

	
}

