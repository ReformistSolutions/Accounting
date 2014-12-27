package com.invoice.inventory.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.invoice.company.beans.CompanyDetails;
import com.invoice.inventory.beans.CreateNewProduct;
import com.invoice.inventory.beans.ReceiveAgainstProduct;
import com.invoice.inventory.beans.Warehouse;
import com.invoice.inventory.dao.ReceiveAgainstProductDao;
import com.invoice.purchase.beans.PurchaseOrder;

@Component(value="receiveProService")
public class ReceiveAgainstProsuctServiceImplementation implements ReceiveAgainstProductService{

	ReceiveAgainstProductDao receiveAgainstProductDao;
	
	public ReceiveAgainstProductDao getReceiveAgainstProductDao() {
		return receiveAgainstProductDao;
	}
	@Autowired
	public void setReceiveAgainstProductDao(ReceiveAgainstProductDao receiveAgainstProductDao) {
		this.receiveAgainstProductDao = receiveAgainstProductDao;
	}

	@Override
	public int save(ReceiveAgainstProduct receiveAgainstProduct) {

		int i=receiveAgainstProductDao.save(receiveAgainstProduct);
		return i;
	}
	@Override
	public List<Warehouse> retriveWareHouse() {

		return receiveAgainstProductDao.retriveWareHouse();
	}
	@Override
	public ReceiveAgainstProduct generateID() {

		return receiveAgainstProductDao.generateID();
	}
	@Override
	public List<PurchaseOrder> retriveOrderId() {

		return receiveAgainstProductDao.retriveOrderId();
	}
	@Override
	public List<ReceiveAgainstProduct> showRecProdService() {

		return receiveAgainstProductDao.showRecProd();
	}
	@Override
	public List<ReceiveAgainstProduct> edit(String txtVNo) {

		return receiveAgainstProductDao.edit(txtVNo); 
	}
	@Override
	public List<CreateNewProduct> retriveProduct() {

		return receiveAgainstProductDao.retriveProduct();
	}
	@Override
	public int updateRecievedAgainstProd(ReceiveAgainstProduct receiveProd) {

		return receiveAgainstProductDao.updateRecievedAgainstProd(receiveProd);
	}
	@Override
	public List<CompanyDetails> getInfo(CompanyDetails companyDetails) {
		
		return receiveAgainstProductDao.getInfo(companyDetails); 
	}
	@Override
	public int delete(String txtVNo) {

		return receiveAgainstProductDao.delete(txtVNo);
	}	
}

  