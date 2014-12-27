package com.invoice.customer.service;

import java.util.List;

import com.invoice.customer.beans.Customer;


public interface CustomerService {

	//public List<Customer> showCustomer();
	public int save(Customer customer);
	public List<Customer> show();
	public List<Customer> editCustomer(String customerID);
	public List<Customer> view(String customerID);
	//public List<Customer> update(String customerID);
	public int update(Customer customer);
	public int deleteCustomer(String  custId);
	public int inactiveCustomer(String  custId);
	 public Customer generateId();
}
