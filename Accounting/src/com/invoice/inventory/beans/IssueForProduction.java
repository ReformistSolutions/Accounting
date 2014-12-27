package com.invoice.inventory.beans;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.FactoryUtils;
import org.apache.commons.collections.list.LazyList;
import com.invoice.inventory.beans.Details;



public class IssueForProduction {

	private String txtVNo;
	private String date;
	private String wearehouseID;
	private String selectWarehouse;
	@SuppressWarnings({ "unchecked" })
	private List<Details> productList = LazyList.decorate(new ArrayList<Details>(),FactoryUtils.instantiateFactory(Details.class));
	private String txtDetails;
	private String status="active";
	public String getTxtVNo() {
		return txtVNo;
	}
	public void setTxtVNo(String txtVNo) {
		this.txtVNo = txtVNo;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getSelectWarehouse() {
		return selectWarehouse;
	}
	public void setSelectWarehouse(String selectWarehouse) {
		this.selectWarehouse = selectWarehouse;
	}
	public List<Details> getProductList() {
		return productList;
	}
	public void setProductList(List<Details> productList) {
		this.productList = productList;
	}
	public String getTxtDetails() {
		return txtDetails;
	}
	public void setTxtDetails(String txtDetails) {
		this.txtDetails = txtDetails;
	}
	public String getWearehouseID() {
		return wearehouseID;
	}
	public void setWearehouseID(String wearehouseID) {
		this.wearehouseID = wearehouseID;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
}