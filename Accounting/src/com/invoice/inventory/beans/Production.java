package com.invoice.inventory.beans;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.FactoryUtils;
import org.apache.commons.collections.list.LazyList;

public class Production 
{

	private String productionID;
	private String sorderId;
	private String prodDate;
	@SuppressWarnings({ "unchecked" })
	private List<RawMaterialDetails> rawMaterialList = LazyList.decorate(new ArrayList<RawMaterialDetails>(),FactoryUtils.instantiateFactory(RawMaterialDetails.class));
	@SuppressWarnings({ "unchecked" })
	private List<ProductionDetails> productList = LazyList.decorate(new ArrayList<ProductionDetails>(),FactoryUtils.instantiateFactory(ProductionDetails.class));
	private String createdBy;
	private String updatedBy;
	private String updateDate;
	private String status;
	private String productionstatus;
	private String completedDate;
	private String productId;
	private String warehouse;

	public String getProductionID() {
		return productionID;
	}
	public void setProductionID(String productionID) {
		this.productionID = productionID;
	}
	public String getSorderId() {
		return sorderId;
	}
	public void setSorderId(String sorderId) {
		this.sorderId = sorderId;
	}
	public String getProdDate() {
		return prodDate;
	}
	public void setProdDate(String prodDate) {
		this.prodDate = prodDate;
	}
	public List<RawMaterialDetails> getRawMaterialList() {
		return rawMaterialList;
	}
	public void setRawMaterialList(List<RawMaterialDetails> rawMaterialList) {
		this.rawMaterialList = rawMaterialList;
	}
	public List<ProductionDetails> getProductList() {
		return productList;
	}
	public void setProductList(List<ProductionDetails> productList) {
		this.productList = productList;
	}
	public String getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}
	public String getUpdatedBy() {
		return updatedBy;
	}
	public void setUpdatedBy(String updatedBy) {
		this.updatedBy = updatedBy;
	}
	public String getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getProductionstatus() {
		return productionstatus;
	}
	public void setProductionstatus(String productionstatus) {
		this.productionstatus = productionstatus;
	}
	public String getCompletedDate() {
		return completedDate;
	}
	public void setCompletedDate(String completedDate) {
		this.completedDate = completedDate;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getWarehouse() {
		return warehouse;
	}
	public void setWarehouse(String warehouse) {
		this.warehouse = warehouse;
	}
	

}
