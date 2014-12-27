package com.invoice.inventory.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.invoice.company.beans.CompanyDetails;
import com.invoice.inventory.beans.CreateNewProduct;
import com.invoice.inventory.beans.RecordTransferred;
import com.invoice.inventory.beans.Warehouse;
import com.invoice.inventory.dao.RecordTransferredDao;

@Component(value="recordTransferredService")
public class RecordTransferredServiceImplementation implements RecordTransferredService{
	private RecordTransferredDao recordTransferredDao;
	private JdbcTemplate jdbctemplate;
	
	

	public RecordTransferredDao getRecordTransferredDao() {
		return recordTransferredDao;
	}
	@Autowired
	public void setRecordTransferredDao(RecordTransferredDao recordTransferredDao) {
		this.recordTransferredDao = recordTransferredDao;
	}
	public JdbcTemplate getJdbctemplate() {
		return jdbctemplate;
	}
@Transactional(rollbackFor=Exception.class)
@Autowired
	public void setJdbctemplate(JdbcTemplate jdbctemplate) {
		this.jdbctemplate = jdbctemplate;
	}

	@Override
	public int save(RecordTransferred recordTransferred) {
		int i=recordTransferredDao.save(recordTransferred);
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
	public List<RecordTransferred> showRecTrans() {
		List<RecordTransferred> trasfredRcrdList=new ArrayList<RecordTransferred>();
		trasfredRcrdList=recordTransferredDao.showRecTrans();
		return trasfredRcrdList;
	}
	@Override
	public List<RecordTransferred> editRecordTransferred(String txtVNo) {
		return recordTransferredDao.editRecordTransferred(txtVNo);
	}
	
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int updateRecordTransferred(RecordTransferred recordTransferred) {
		return recordTransferredDao.updateRecordTransferred(recordTransferred);
	}
	@Override
	public RecordTransferred generateTransID() {
		return recordTransferredDao.generateTransID();
	}
	@Override
	public List<Warehouse> retriveWareHouse() {
		return recordTransferredDao.retriveWareHouse();
	}
	@Override
	public List<CreateNewProduct> retriveProduct() {
		return recordTransferredDao.retriveProduct();
	}
	@Override
	public List<CompanyDetails> getInfo(CompanyDetails companyDetails) {
		return recordTransferredDao.getInfo(companyDetails); 
	}
	@Override
	public int delete(String txtVNo) {

		return recordTransferredDao.delete(txtVNo);
	}
	@Override
	public List<CreateNewProduct> retriveWarehouseProd(String wID) 
	{
		return recordTransferredDao.retriveWarehouseProd(wID); 
	}
	@Override
	public String retriveAvailqty(String productId,String wID) {
		
		return recordTransferredDao.retriveAvailqty(productId,wID);
	}
	@Override
	public int checkProduct(String prodID, String wid) 
	{
		return recordTransferredDao.checkProduct(prodID, wid);
	}
	

}
