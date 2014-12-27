package com.invoice.accounting.service;



import java.util.List;

import com.invoice.accounting.beans.Createnewexpense;
import com.invoice.accounting.beans.NewAccount;

public interface CreateexpenseService {
	public Createnewexpense generateExpID();
    public int save(Createnewexpense createnewexpense);
    public List<NewAccount> retriveexpensetype();
    public List<NewAccount> retrivepaidfrom();
    public List<Createnewexpense> showexpense();
    public List<Createnewexpense> editexpense(String expid);
    public int updateexpense(Createnewexpense createnewexpense);
    public int delete(String expid);

}
