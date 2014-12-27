package com.invoice.customer.service;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.invoice.customer.beans.Customer;
import com.invoice.customer.dao.customerDao;

@Component(value="customerService")
public class CustomerServiceImpl implements CustomerService{

	customerDao customerDao;
	private int i;
	
	public customerDao getCustomerDao() {
		return customerDao;
	}
	@Autowired
	public void setCustomerDao(customerDao customerDao) {
		this.customerDao = customerDao;
	}

	private JdbcTemplate jdbcTemplate;
    
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
    @Autowired
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	
    @Transactional(rollbackFor=Exception.class)
	@Override
	public int save(Customer customer) {
		i=customerDao.save(customer);
		if(i>0)
		{
			return 1;
		}
		else{
			return 0;
		}
		
	}
	@Override
	public List<Customer> show() {
		List<Customer> customerAddList=new ArrayList<Customer>();
		customerAddList= customerDao.show();
		return customerAddList;
		
	}
	@Override
	public List<Customer> editCustomer(String customerID) {
		return customerDao.editCustomer(customerID);
	
	}
	@Override
	public List<Customer> view(String customerID) {
		return customerDao.view(customerID); 
	}
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int update(Customer customer) {
		
		return customerDao.update(customer);
	}
	@Override
	public Customer generateId() {
		
		return customerDao.generateId() ;
	}
	@Override
	public int deleteCustomer(String custId) {
		
		return customerDao.deleteCustomer(custId);
	}
	@Override
	public int inactiveCustomer(String custId) 
	{
		return customerDao.inactiveCustomer(custId); 
	}
	
}
