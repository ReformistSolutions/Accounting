package com.invoice.accounting.dao;

import java.util.List;

import com.invoice.accounting.beans.Createnewexpense;
import com.invoice.accounting.beans.NewAccount;

public interface CreateexpenseDao {
	
	public Createnewexpense generateExpID();
   
    public List<NewAccount> retriveexpensetype();
    public List<NewAccount> retrivepaidfrom();
    public List<Createnewexpense> showexpense();
    public List<Createnewexpense> editexpense(String expid);
    public int updateexpense(Createnewexpense createnewexpense);
    public int delete(String expid);
	int save(Createnewexpense createnewexpense);

}
