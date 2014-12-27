package com.invoice.inventory.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.invoice.company.beans.CompanyDetails;
import com.invoice.inventory.beans.CreateNewProduct;
import com.invoice.inventory.beans.RecordWastage;
import com.invoice.inventory.beans.Warehouse;
import com.invoice.inventory.dao.RecordWastageDao;
 @Component(value="recordWastageService")
public class RecordWastageServiceImplementation implements RecordWastageService{

	private RecordWastageDao recordWastageDao;
	
	public RecordWastageDao getRecordWastageDao() {
		return recordWastageDao;
	}
@Autowired
	public void setRecordWastageDao(RecordWastageDao recordWastageDao) {
		this.recordWastageDao = recordWastageDao;
	}
@Transactional(rollbackFor=Exception.class)
	@Override
	public int save(RecordWastage recordWastage) {
		
			return recordWastageDao.save(recordWastage);
		
	}
	@Override
	public List<RecordWastage> showRecWast() {
		 List<RecordWastage> recordWastageList=new ArrayList<RecordWastage>();
		 recordWastageList=recordWastageDao.showRecWast();
		 return recordWastageList;
	}
	@Override
	public List<RecordWastage> editRecordWastage(String txtVNo) {
		return recordWastageDao.editRecordWastage(txtVNo);
	}
	
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int updateRecordWastage(RecordWastage recordWastage) {
		return recordWastageDao.updateRecordWastage(recordWastage);
	}
	@Override
	public RecordWastage generateWasteID() {
		return recordWastageDao.generateWasteID();
	}
	@Override
	public List<Warehouse> retriveWareHouse() {
		return recordWastageDao.retriveWareHouse();
	}
	@Override
	public List<CreateNewProduct> retriveProduct() {
		return recordWastageDao.retriveProduct();
	}
	@Override
	public List<CompanyDetails> getInfo(CompanyDetails companyDetails) {
		return recordWastageDao.getInfo(companyDetails);
	}
	@Override
	public int delete(String txtVNo) {

		return recordWastageDao.delete(txtVNo);
	}
	@Override
	public List<RecordWastage> showrecord() {
		
		return recordWastageDao.showrecord();
	}
	
	@Override
	public List<CreateNewProduct> retriveWarehouseWProd(String wID) 
	{
		return recordWastageDao.retriveWarehouseWProd(wID);
	}
	@Override
	public String retriveWastageAvailqty(String productId, String wID) 
	{
		return recordWastageDao.retriveWastageAvailqty(productId, wID); 
	}
	
}
