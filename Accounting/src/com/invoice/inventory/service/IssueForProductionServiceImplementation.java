package com.invoice.inventory.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.invoice.company.beans.CompanyDetails;
import com.invoice.inventory.beans.CreateNewProduct;
import com.invoice.inventory.beans.IssueForProduction;
import com.invoice.inventory.beans.Warehouse;
import com.invoice.inventory.dao.IssueForProductionDao;

@Component(value="issueForProductionService")
public class IssueForProductionServiceImplementation implements IssueForProductionService {
	
private IssueForProductionDao issueForProductionDao;
private JdbcTemplate jdbcTemplate;


public JdbcTemplate getJdbcTemplate() {
	return jdbcTemplate;
}
@Autowired
public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
	this.jdbcTemplate = jdbcTemplate;
}

public IssueForProductionDao getIssueForProductionDao() {
	return issueForProductionDao;
}
@Autowired
public void setIssueForProductionDao(IssueForProductionDao issueForProductionDao) {
	this.issueForProductionDao = issueForProductionDao;
}

@Override
public int save(IssueForProduction issueForProduction) {
	
		int i=issueForProductionDao.save(issueForProduction);
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
public List<IssueForProduction> showIssueProdList() {
	List<IssueForProduction> showIssueForProductList=new ArrayList<IssueForProduction>();
	showIssueForProductList=issueForProductionDao.showIssueProdList();
	return showIssueForProductList;
}
@Override
public List<IssueForProduction> editIssueForProduction(String txtVNo) {

	return issueForProductionDao.editIssueForProduction(txtVNo);
}
@Override
public int updateIssueForProduct(IssueForProduction issueForProduction) {

	return issueForProductionDao.updateIssueForProduct(issueForProduction);
}
@Override
public IssueForProduction generateIssueID() {

	return issueForProductionDao.generateIssueID();
}
@Override
public List<Warehouse> retriveWareHouse() {

	return issueForProductionDao.retriveWareHouse();
}
@Override
public List<CreateNewProduct> retriveProduct() {

	return issueForProductionDao.retriveProduct();
}
@Override
public List<CompanyDetails> getInfo(CompanyDetails companyDetails) {

	return issueForProductionDao.getInfo(companyDetails);
}
@Override
public int delete(String txtVNo) {

	return issueForProductionDao.delete(txtVNo);
}
@Override
public String retriveDesc(String productId) {
	
	return issueForProductionDao.retriveDesc(productId);
}
@Override
public String retriveUnit(String productId) {
	
	return issueForProductionDao.retriveUnit(productId);
}
@Override
public String retriveStock(String productId) {
	
	return issueForProductionDao.retriveStock(productId);
}

}
