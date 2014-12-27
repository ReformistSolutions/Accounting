package com.invoice.customer.dao;

import java.util.List;

import com.invoice.customer.beans.Customer;


public interface customerDao {

 // public List<Customer> shwoDao();
  public int save(Customer customer);
  public List<Customer> show();
  public List<Customer> editCustomer(String customerID);
  public List<Customer> view(String customerID);
  public int update(Customer  customer);
  public int deleteCustomer(String  custId);
  public int inactiveCustomer(String  custId);
  public Customer generateId();
}
