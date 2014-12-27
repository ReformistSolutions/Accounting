package com.invoice.sales.service;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.invoice.accounting.beans.Taxes;
import com.invoice.customer.beans.Customer;
import com.invoice.inventory.beans.CreateNewProduct;
import com.invoice.sales.beans.Order;
import com.invoice.sales.dao.OrderDao;


@Component(value="orderService")
public class OrderServiceImpl implements OrderService{

	OrderDao orderDao;
	private JdbcTemplate jdbcTemplate;
	
	public OrderDao getOrderDao() {
		return orderDao;
	}
	@Autowired
	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	@Autowired
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	@Override
	public List<Order> show() {
		
		return orderDao.show();
	}
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int save(Order order) {		

		return orderDao.save(order);
	}
	
	@Override
	public List<Order> editOrder(String orderId) {
		
		return orderDao.editOrder(orderId);
		
	}
	@Override
	public List<Order> editOrderTaxDetails(String orderId) {
		
		return orderDao.editOrderTaxDetails(orderId);
	}
	@Override
	public List<Order> editOrderLinkedTaxDetails(String orderId) {
		
		return orderDao.editOrderLinkedTaxDetails(orderId);
	} 
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int updateOrder(Order order) {
		
		return orderDao.updateOrder(order);
	}
	@Override
	public List<CreateNewProduct> retriveProductList() {
	 
		return orderDao.retriveProductList();
	}
	@Override
	public List<Customer> retriveCustomerList() {
		
		return orderDao.retriveCustomerList();
	}
	@Override
	public Order generateOrdId() {
		
		return orderDao.generateOrdId();
	}
	@Override
	public List<Taxes> retriveTaxList() {
		
		return orderDao.retriveTaxList();
	}
	@Override
	public int deleteOrder(String orderId) {
		
		return orderDao.deleteOrder(orderId);
	}
	@Override
	public List<Customer> retriveCustInfo(String custId, String id) {
		
		return orderDao.retriveCustInfo(custId, id);
	}
	@Override
	public float retriveQuantity(String productId) {
		
		return orderDao.retriveQuantity(productId);
	}
	

}
