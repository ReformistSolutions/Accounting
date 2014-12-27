package com.invoice.inventory.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.invoice.company.beans.CompanyDetails;
import com.invoice.inventory.beans.ComposeMail;
import com.invoice.inventory.beans.CreateNewProduct;
import com.invoice.inventory.beans.Warehouse;
import com.invoice.inventory.dao.WarehouseDao;

@Component("warehouseService")
public class WarehouseServiceImpl implements WarehouseService
{
	
	
	private WarehouseDao warehouseDao;
	public WarehouseDao getWarehouseDao() {
		return warehouseDao;
	}
	@Autowired
	public void setWarehouseDao(WarehouseDao warehouseDao) {
		this.warehouseDao = warehouseDao;
	}
	@Override
	public Warehouse generateID() {
		
		return warehouseDao.generateID();
	}
	@Override
	public int save(Warehouse warehouse) {

		return warehouseDao.save(warehouse);
	}
	@Override
	public List<CreateNewProduct> retriveProduct() {
		
		return warehouseDao.retriveProduct();
	}
	@Override
	public List<Warehouse> editWarehouse(String warehousrID) {
		
		return warehouseDao.editWarehouse(warehousrID);
	}
	@Override
	public List<Warehouse> show() {
		
		return warehouseDao.show();
	}
	@Override
	public int update(Warehouse warehouse) {
		
		return warehouseDao.update(warehouse);
	}
	@Override
	public List<CompanyDetails> getInfo(CompanyDetails companyDetails) {
		
		return warehouseDao.getInfo(companyDetails);
	}
	@Override
	public int sendMail(ComposeMail composeMail) {
		
		return warehouseDao.sendMail(composeMail);
	}
	@Override
	public String retriveWarehouseAvailqty(String productId) 
	{
		return warehouseDao.retriveWarehouseAvailqty(productId); 
	}

	
	
}
