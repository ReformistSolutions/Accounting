package com.invoice.inventory.beans;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.FactoryUtils;
import org.apache.commons.collections.list.LazyList;

public class CreateNewProduct {

	private String productCode;
	private String txtName;
	private String productType;
	private String Inventory;
	private String Batch;
	private float txtOpeningStock;
	private String txtReorderlevel;
	private String txtUnitOfMeasure;
	private float txtSalesPrice;
	private float txtPurchasePrice;
	private String txtDes;
	private String selectIncomeAmt;
	private String selectExpenseAccnt;
	private String status;
	private String productId;
	private float inventoryvalue;
	
	
	public float getInventoryvalue() {
		return inventoryvalue;
	}
	public void setInventoryvalue(float inventoryvalue) {
		this.inventoryvalue = inventoryvalue;
	}
	public String getStatus()
	{
		return status;
	}
	@SuppressWarnings({ "unchecked" })
	private List<Details> createNewPdetails = LazyList.decorate(new ArrayList<Details>(),FactoryUtils.instantiateFactory(Details.class));
	public void setStatus(String status) {
		this.status = status;
	}
	public String getProductCode() {
		return productCode;
	}
	
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
	
	public String getProductType() {
		return productType;
	}
	public void setProductType(String productType) {
		this.productType = productType;
	}
	public String getTxtName() {
		return txtName;
	}
	public void setTxtName(String txtName) {
		this.txtName = txtName;
	}
	
	
	public String getInventory() {
		return Inventory;
	}
	public void setInventory(String inventory) {
		Inventory = inventory;
	}
	public String getBatch() {
		return Batch;
	}
	public void setBatch(String batch) {
		Batch = batch;
	}
	
	public float getTxtOpeningStock() {
		return txtOpeningStock;
	}
	public void setTxtOpeningStock(float txtOpeningStock) {
		this.txtOpeningStock = txtOpeningStock;
	}
	public String getTxtReorderlevel() {
		return txtReorderlevel;
	}
	public void setTxtReorderlevel(String txtReorderlevel) {
		this.txtReorderlevel = txtReorderlevel;
	}
	public String getTxtUnitOfMeasure() {
		return txtUnitOfMeasure;
	}
	public void setTxtUnitOfMeasure(String txtUnitOfMeasure) {
		this.txtUnitOfMeasure = txtUnitOfMeasure;
	}
	public float getTxtSalesPrice() {
		return txtSalesPrice;
	}
	public void setTxtSalesPrice(float txtSalesPrice) {
		this.txtSalesPrice = txtSalesPrice;
	}
	public float getTxtPurchasePrice() {
		return txtPurchasePrice;
	}
	public void setTxtPurchasePrice(float txtPurchasePrice) {
		this.txtPurchasePrice = txtPurchasePrice;
	}
	public String getTxtDes() {
		return txtDes;
	}
	public void setTxtDes(String txtDes) {
		this.txtDes = txtDes;
	}
	public String getSelectIncomeAmt() {
		return selectIncomeAmt;
	}
	public void setSelectIncomeAmt(String selectIncomeAmt) {
		this.selectIncomeAmt = selectIncomeAmt;
	}
	public String getSelectExpenseAccnt() {
		return selectExpenseAccnt;
	}
	public void setSelectExpenseAccnt(String selectExpenseAccnt) {
		this.selectExpenseAccnt = selectExpenseAccnt;
	}
	public List<Details> getCreateNewPdetails() {
		return createNewPdetails;
	}
	public void setCreateNewPdetails(List<Details> createNewPdetails) {
		this.createNewPdetails = createNewPdetails;
	}
	

	
}
