package com.invoice.accounting.service;

import java.util.List;

import com.invoice.accounting.beans.ComposeMail;
import com.invoice.accounting.beans.NewAccountGroup;
import com.invoice.company.beans.CompanyDetails;

public interface AccountGroupService {

public int save(NewAccountGroup newAccountGroup);
public List<NewAccountGroup> showgroupAccount();
public int updateGroupAccount(NewAccountGroup newAccountGroup);
public int updatesGroupAccount(NewAccountGroup newAccountGroup);
public List<NewAccountGroup> viewAccountGrop(String groupID);
public NewAccountGroup genrateAccID();
public int deletegroup(String groupID);
public int deletesgroup(String groupID);
public int deleteAccount(String accountID); 
public List<CompanyDetails> getInfo(CompanyDetails companyDetails);
public int sendMail(ComposeMail composeMail);
public NewAccountGroup genratesAccID();
public List<NewAccountGroup> showgroupsAccount();
public List<NewAccountGroup> viewsAccountGrop(String groupID);

}
