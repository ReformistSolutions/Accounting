package com.invoice.inventory.dao;

import java.util.List;

import com.invoice.company.beans.CompanyDetails;
import com.invoice.inventory.beans.CreateNewProduct;
import com.invoice.inventory.beans.ReceiveAgainstProduct;
import com.invoice.inventory.beans.Warehouse;
import com.invoice.purchase.beans.PurchaseOrder;


public interface ReceiveAgainstProductDao {
	public List<ReceiveAgainstProduct> showRecProd();
	public List<Warehouse> retriveWareHouse();
	public List<PurchaseOrder> retriveOrderId();
	public int save(ReceiveAgainstProduct receiveAgainstProduct);
	public ReceiveAgainstProduct generateID();
	public List<ReceiveAgainstProduct> edit(String txtVNo);
	public List<CreateNewProduct> retriveProduct();
	public int updateRecievedAgainstProd(ReceiveAgainstProduct receiveProd);
	public List<CompanyDetails> getInfo(CompanyDetails companyDetails);
	public int delete(String txtVNo);
}
