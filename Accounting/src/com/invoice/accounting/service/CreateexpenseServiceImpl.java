package com.invoice.accounting.service;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.invoice.accounting.beans.Createnewexpense;
import com.invoice.accounting.beans.NewAccount;
import com.invoice.accounting.dao.CreateexpenseDao;

@Component(value="createexpenseService")
public class CreateexpenseServiceImpl implements CreateexpenseService{
	CreateexpenseDao createexpenseDao;

	public CreateexpenseDao getCreateexpenseDao() {
		return createexpenseDao;
	}
    @Autowired
	public void setCreateexpenseDao(CreateexpenseDao createexpenseDao) {
		this.createexpenseDao = createexpenseDao;
	}
	
	@Override
	public int save(Createnewexpense createnewexpense) {
		
		return createexpenseDao.save(createnewexpense);
	}
	@Override
	public List<NewAccount> retriveexpensetype() {
		
		return createexpenseDao.retriveexpensetype();
	}
	@Override
	public List<NewAccount> retrivepaidfrom() {
		
		return createexpenseDao.retrivepaidfrom();
	}
	@Override
	public List<Createnewexpense> showexpense() {
		
		return createexpenseDao.showexpense();
	}
	@Override
	public List<Createnewexpense> editexpense(String expid) {
		
		return createexpenseDao.editexpense(expid);
	}
	@Override
	public int updateexpense(Createnewexpense createnewexpense) {
		
		return createexpenseDao.updateexpense(createnewexpense);
	}
	@Override
	public int delete(String expid) {
		
		return createexpenseDao.delete(expid);
	}
	
	@Override
	public Createnewexpense generateExpID() {
		
		return createexpenseDao.generateExpID();
	}

}
