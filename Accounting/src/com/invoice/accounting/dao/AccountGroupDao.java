package com.invoice.accounting.dao;

import java.util.List;

import com.invoice.accounting.beans.ComposeMail;
import com.invoice.accounting.beans.NewAccountGroup;
import com.invoice.company.beans.CompanyDetails;

public interface AccountGroupDao {

   public int save(NewAccountGroup newAccountGroup);
   public List<NewAccountGroup> showgroupAccount();
   public List<NewAccountGroup> viewAccountGrop(String groupID);
   public NewAccountGroup genrateAccID();
   public int updateGroupAccount(NewAccountGroup newAccountGroup);
   public int deletegroup(String groupID);
   public int deletesgroup(String groupID);
   public List<CompanyDetails> getInfo(CompanyDetails companyDetails); 
   public int sendMail(ComposeMail composeMail);
   public NewAccountGroup genratesAccID();
   public List<NewAccountGroup> showgroupsAccount();
   public List<NewAccountGroup> viewsAccountGrop(String groupID);
   public int updatesGroupAccount(NewAccountGroup newAccountGroup);
   
   
   
}
