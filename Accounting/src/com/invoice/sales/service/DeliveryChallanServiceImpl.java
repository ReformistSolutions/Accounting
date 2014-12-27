package com.invoice.sales.service;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.invoice.customer.beans.Customer;
import com.invoice.inventory.beans.CreateNewProduct;
import com.invoice.sales.beans.DeliveryChallan;
import com.invoice.sales.beans.Invoice;
import com.invoice.sales.dao.DeliveryChallanDao;

@Component(value="deliveryChallanService")
public class DeliveryChallanServiceImpl implements DeliveryChallanService{
	
	DeliveryChallanDao deliveryChallanDao;

	public DeliveryChallanDao getDeliveryChallanDao() {
		return deliveryChallanDao;
	}
	@Autowired
	public void setDeliveryChallanDao(DeliveryChallanDao deliveryChallanDao) {
		this.deliveryChallanDao = deliveryChallanDao;
	}
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int save(DeliveryChallan deliveryChallan) {
		
		return deliveryChallanDao.save(deliveryChallan);
	}
	@Override
	public List<DeliveryChallan> show() {
		
		return deliveryChallanDao.show();
	}
	@Override
	public List<DeliveryChallan> editChallan(String challanId) {
		
		return deliveryChallanDao.editChallan(challanId);
	}
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int updateChallan(DeliveryChallan deliveryChallan) {
		
		return deliveryChallanDao.updateChallan(deliveryChallan);
	}
	@Override
	public List<CreateNewProduct> retriveProductList() {
	
		return deliveryChallanDao.retriveProductList();
	}
	@Override
	public List<Customer> retriveCustomerList() {
		
		return deliveryChallanDao.retriveCustomerList();
	}
	@Override
	public DeliveryChallan generateChId() {
		
		return deliveryChallanDao.generateChId();
	}
	@Override
	public List<Invoice> retriveInvList() {
		
		return deliveryChallanDao.retriveInvList();
	}
	@Override
	public int deleteChallan(String challanId) {
		
		return deliveryChallanDao.deleteChallan(challanId);
	}
	@Override
	public List<Customer> retriveCustInfo(String custId, String id) {
		
		return deliveryChallanDao.retriveCustInfo(custId, id);
	} 
	
}
