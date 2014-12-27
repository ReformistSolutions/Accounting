package com.invoice.payroll.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.invoice.payroll.beans.Payhead;
import com.invoice.payroll.dao.PayheadDao;

@Component(value="payheadService")
public class PayheadServiceImpl implements PayheadService
{

	PayheadDao payheadDao;	
	public PayheadDao getPayheadDao() {
		return payheadDao;
	}
	@Autowired
	public void setPayheadDao(PayheadDao payheadDao) {
		this.payheadDao = payheadDao;
	}

	@Override
	public Payhead generateID() {
		
		return payheadDao.generateID();
	}
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int save(Payhead payhead) {
		
		return payheadDao.save(payhead);
	}

	@Override
	public List<Payhead> show() {
		
		return payheadDao.show();
	}

	@Override
	public List<Payhead> view(String payheadId) {
		
		return payheadDao.view(payheadId);
	}
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int updatePayHead(Payhead payhead) {
		
		return payheadDao.updatePayHead(payhead);
	}

	@Override
	public int delete(String payheadId) {
		
		return payheadDao.delete(payheadId);
	}
	@Override
	public List<Payhead> retriveAccountName(String paytype) {

		return payheadDao.retriveAccountName(paytype);
	}
}
