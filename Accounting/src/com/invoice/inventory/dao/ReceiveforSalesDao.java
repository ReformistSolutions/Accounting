package com.invoice.inventory.dao;

import java.util.List;

import com.invoice.company.beans.CompanyDetails;
import com.invoice.inventory.beans.CreateNewProduct;
import com.invoice.inventory.beans.ReceiveforSales;
import com.invoice.inventory.beans.Warehouse;
import com.invoice.sales.beans.Order;

public interface ReceiveforSalesDao {
	public int save(ReceiveforSales receiveForSales);
	public List<ReceiveforSales> showSalesProd();
	public List<ReceiveforSales> editReceiveforSales(String txtVNo);
	public int updateReceiveforSales(ReceiveforSales receiveforSales);
	public ReceiveforSales generateReceiveID();
	public List<Warehouse> retriveWareHouse();
	public List<CreateNewProduct> retriveProduct();
	public List<CompanyDetails> getInfo(CompanyDetails companyDetails);
	public int delete(String txtVNo);
	public List<Order> retriveOrderId();
	public String retriveDesc(String productId);
	public String retriveUnit(String productId);
}
