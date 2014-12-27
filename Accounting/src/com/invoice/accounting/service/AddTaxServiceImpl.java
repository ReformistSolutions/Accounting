package com.invoice.accounting.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;


import com.invoice.accounting.beans.AddNewTax;
import com.invoice.accounting.beans.LinkedTax;
import com.invoice.accounting.beans.Taxes;
import com.invoice.accounting.dao.AddTaxDao;

@Component(value="addTaxService")
public class AddTaxServiceImpl implements AddTaxService{

	AddTaxDao addTaxDao;
	
	public AddTaxDao getAddTaxDao() {
		return addTaxDao;
	}
@Autowired
	public void setAddTaxDao(AddTaxDao addTaxDao) {
		this.addTaxDao = addTaxDao;
	}
	
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int save(AddNewTax addNewTax,LinkedTax linkedTax) {
    
		int i=addTaxDao.save(addNewTax,linkedTax);
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
	public AddNewTax genrateID() {
		
		return addTaxDao.genrateID();
	}
	@Override
	public List<Taxes> showSalesTax() {
		
		return addTaxDao.showSalesTax();
	}
	@Override
	public List<LinkedTax> showSalesLinkedTax() {
		
		return addTaxDao.showSalesLinkedTax();
	}
	@Override
	public List<Taxes> showPurTax() {
		
		return addTaxDao.showPurTax();
	}
	@Override
	public List<LinkedTax> showPurLinkedTax() {
		
		return addTaxDao.showPurLinkedTax();
	}	
}
