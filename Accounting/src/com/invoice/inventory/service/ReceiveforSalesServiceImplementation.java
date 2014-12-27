package com.invoice.inventory.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.invoice.company.beans.CompanyDetails;
import com.invoice.inventory.beans.CreateNewProduct;
import com.invoice.inventory.beans.ReceiveforSales;
import com.invoice.inventory.beans.Warehouse;
import com.invoice.inventory.dao.ReceiveforSalesDao;
import com.invoice.sales.beans.Order;

@Component(value="receiveForSalesService")
public class ReceiveforSalesServiceImplementation implements ReceiveforSalesService{
	private ReceiveforSalesDao receiveForServiceDao;
	private JdbcTemplate jdbcTemplate;


public ReceiveforSalesDao getReceiveForServiceDao() {
		return receiveForServiceDao;
	}
@Autowired
	public void setReceiveForServiceDao(ReceiveforSalesDao receiveForServiceDao) {
		this.receiveForServiceDao = receiveForServiceDao;
	}
public JdbcTemplate getJdbcTemplate() {
	return jdbcTemplate;
}
@Autowired
public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
	this.jdbcTemplate = jdbcTemplate;
}
@Transactional(rollbackFor=Exception.class)
@Override
public int save(ReceiveforSales receiveForSales) {
	int i=receiveForServiceDao.save(receiveForSales);
	if(i>0)
	{
		return 1;
	}
	else
	{
		return 0;
	}
}
@Override
public List<ReceiveforSales> showSalesProd() {
	List<ReceiveforSales> receivedSales=new ArrayList<ReceiveforSales>();
	receivedSales=receiveForServiceDao.showSalesProd();
	return receivedSales;
}
@Override
public List<ReceiveforSales> editReceiveforSales(String txtVNo) {
	return receiveForServiceDao.editReceiveforSales(txtVNo);
}

@Transactional(rollbackFor=Exception.class)
@Override
public int updateReceiveforSales(ReceiveforSales receiveforSales) {
	return receiveForServiceDao.updateReceiveforSales(receiveforSales);
}
@Override
public ReceiveforSales generateReceiveID() {
	return receiveForServiceDao.generateReceiveID();
}
@Override
public List<Warehouse> retriveWareHouse() {
	return receiveForServiceDao.retriveWareHouse();
}
@Override
public List<CreateNewProduct> retriveProduct() {
	return receiveForServiceDao.retriveProduct();
}
@Override
public List<CompanyDetails> getInfo(CompanyDetails companyDetails) {

	return receiveForServiceDao.getInfo(companyDetails); 
}
@Override
public int delete(String txtVNo) {

	return receiveForServiceDao.delete(txtVNo); 
}
@Override
public List<Order> retriveOrderId() {
	
	return receiveForServiceDao.retriveOrderId();
}
@Override
public String retriveDesc(String productId) {
	
	return receiveForServiceDao.retriveDesc(productId);
}
@Override
public String retriveUnit(String productId) {
	
	return receiveForServiceDao.retriveUnit(productId);
}
}
