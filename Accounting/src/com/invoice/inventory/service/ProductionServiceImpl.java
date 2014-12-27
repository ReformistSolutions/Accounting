package com.invoice.inventory.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.invoice.company.beans.CompanyDetails;
import com.invoice.inventory.beans.Production;
import com.invoice.inventory.beans.ProductionDetails;
import com.invoice.inventory.beans.RawMaterialDetails;
import com.invoice.inventory.dao.ProductionDao;
import com.invoice.sales.beans.Order;

@Component("productionService") 
public class ProductionServiceImpl implements ProductionService
{
	ProductionDao productionDao;
	public ProductionDao getProductionDao() {
		return productionDao;
	}
	@Autowired
	public void setProductionDao(ProductionDao productionDao) {
		this.productionDao = productionDao;
	}

	@Override
	public Production generateId() {

		return productionDao.generateId();
	}
	@Override
	public List<Order> showOrder() {

		return productionDao.showOrder();
	}
	@Override
	public List<ProductionDetails> retrivepProductDetails(String orderID) {

		return productionDao.retrivepProductDetails(orderID);
	}
	@Override
	public List<RawMaterialDetails> retriveRawMaterial(String productId,float qty) {
	
		return productionDao.retriveRawMaterial(productId,qty);
	}
	@Override
	public List<RawMaterialDetails> retriveRawMaterialList() {
		
		return productionDao.retriveRawMaterialList();
	}
	@Override
	public String retriveRMDesc(String rmId) {
		
		return productionDao.retriveRMDesc(rmId);
	}
	@Override
	public float retriveRMQty(String rmId,String productId) {
		
		return productionDao.retriveRMQty(rmId,productId);
	}
	@Override
	public String retriveProductDesc(String productId) {
		
		return productionDao.retriveProductDesc(productId);
	}
	@Override
	public float retriveProductQty(String productId) {
		
		return productionDao.retriveProductQty(productId);
	}
	@Override
	public String retriveProductUnit(String productId) {
		
		return productionDao.retriveProductUnit(productId);
	}
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int save(Production production) {
		
		return productionDao.save(production);
	}
	@Override
	public List<Production> showPending() {
		
		return productionDao.showPending();
	}
	@Override
	public List<Production> showCompleted() {
		
		return productionDao.showCompleted();
	}
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int completeProductionOrder(Production production) {
		
		return productionDao.completeProductionOrder(production);
	}
	@Override
	public int deleteProductionOrder(String productionId) {
		
		return productionDao.deleteProductionOrder(productionId);
	}
	@Override
	public List<Production> edit(String productionId) {
		
		return productionDao.edit(productionId);
	}
	@Override
	public List<RawMaterialDetails> showRawMaterial(String productionId,String productId) {
		
		return productionDao.showRawMaterial(productionId,productId);
	}
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int updateProduction(Production production) {
		
		return productionDao.updateProduction(production);
	}
	@Override
	public List<CompanyDetails> getInfo(CompanyDetails companyDetails) {
		
		return productionDao.getInfo(companyDetails);
	}

}
