package com.invoice.inventory.service;

import java.util.List;

import com.invoice.company.beans.CompanyDetails;
import com.invoice.inventory.beans.CreateNewProduct;
import com.invoice.inventory.beans.RecordWastage;
import com.invoice.inventory.beans.Warehouse;

public interface RecordWastageService {
public int save(RecordWastage recordWastage);
public List<RecordWastage> showRecWast();
public List<RecordWastage> editRecordWastage(String txtVNo);
public int updateRecordWastage(RecordWastage recordWastage);
public RecordWastage generateWasteID();
public List<Warehouse> retriveWareHouse();
public List<CreateNewProduct> retriveProduct();
public List<CompanyDetails> getInfo(CompanyDetails companyDetails);
public int delete(String txtVNo);
public List<RecordWastage> showrecord();
//public String retrivewasteAvailqty(String productId,String wID);
public List<CreateNewProduct> retriveWarehouseWProd(String wID);
public String retriveWastageAvailqty(String productId,String wID);
}
