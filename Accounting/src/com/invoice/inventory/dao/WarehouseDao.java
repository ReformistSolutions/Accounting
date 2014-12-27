package com.invoice.inventory.dao;

import java.util.List;

import com.invoice.company.beans.CompanyDetails;
import com.invoice.inventory.beans.ComposeMail;
import com.invoice.inventory.beans.CreateNewProduct;
import com.invoice.inventory.beans.Warehouse;

public interface WarehouseDao {

	public Warehouse generateID();
	
	public int save(Warehouse warehouse);
	
	public List<CreateNewProduct> retriveProduct();
	
	public List<Warehouse> editWarehouse(String warehousrID);
	
	public List<Warehouse> show();
	
	public int update(Warehouse warehouse);
	
	public List<CompanyDetails> getInfo(CompanyDetails companyDetails);
	
	public int sendMail(final ComposeMail composeMail);
	public String retriveWarehouseAvailqty(String productId);

}

