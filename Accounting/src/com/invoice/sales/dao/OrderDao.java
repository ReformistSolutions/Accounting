package com.invoice.sales.dao;

import java.util.List;

import com.invoice.accounting.beans.Taxes;
import com.invoice.customer.beans.Customer;
import com.invoice.inventory.beans.CreateNewProduct;
import com.invoice.sales.beans.Order;


public interface OrderDao {
	
	public List<Order> show();
	public int save(Order order);
	public List<Order> editOrder(String orderId);
	public List<Order> editOrderTaxDetails(String orderId);
	public List<Order> editOrderLinkedTaxDetails(String orderId);
	public int updateOrder(Order order);
	public List<CreateNewProduct> retriveProductList();
	public List<Customer> retriveCustomerList();
	public List<Taxes> retriveTaxList();
	public int deleteOrder(String orderId);
	public Order generateOrdId();
	public List<Customer> retriveCustInfo(String custId,String id);
	public float retriveQuantity(String productId);
}
