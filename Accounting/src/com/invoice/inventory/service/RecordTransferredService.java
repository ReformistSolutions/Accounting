package com.invoice.inventory.service;

import java.util.List;

import com.invoice.company.beans.CompanyDetails;
import com.invoice.inventory.beans.CreateNewProduct;
import com.invoice.inventory.beans.RecordTransferred;
import com.invoice.inventory.beans.Warehouse;

public interface RecordTransferredService {
	public int save(RecordTransferred recordTransferred);
	public List<RecordTransferred> showRecTrans();
	public List<RecordTransferred> editRecordTransferred(String txtVNo);
	public int updateRecordTransferred(RecordTransferred recordTransferred);
	public RecordTransferred generateTransID();
	public List<Warehouse> retriveWareHouse();
	public List<CreateNewProduct> retriveProduct();
	public List<CompanyDetails> getInfo(CompanyDetails companyDetails);
	public int delete(String txtVNo);
	public List<CreateNewProduct> retriveWarehouseProd(String wID);
	public String retriveAvailqty(String productId,String wID);
	public int checkProduct(String prodID,String wid);
}
