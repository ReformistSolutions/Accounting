package com.invoice.inventory.dao;


import java.util.List;

import com.invoice.company.beans.CompanyDetails;
import com.invoice.inventory.beans.CreateNewProduct;
import com.invoice.inventory.beans.IssueForProduction;
import com.invoice.inventory.beans.Warehouse;

public interface IssueForProductionDao {
	public int save(IssueForProduction issueForProduction);
	public List<IssueForProduction> showIssueProdList();
	public List<IssueForProduction> editIssueForProduction(String txtVNo);
	public int updateIssueForProduct(IssueForProduction issueForProduction);
	public IssueForProduction generateIssueID();
	public List<Warehouse> retriveWareHouse();
	public List<CreateNewProduct> retriveProduct();
	public List<CompanyDetails> getInfo(CompanyDetails companyDetails);
	public int delete(String txtVNo);
	public String retriveDesc(String productId);
	public String retriveUnit(String productId);
	public String retriveStock(String productId);
}
