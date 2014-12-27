package com.invoice.inventory.beans;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.FactoryUtils;
import org.apache.commons.collections.list.LazyList;

public class Warehouse {

	private String warehousrID;
	private String wareHouseName;
	private String address;
	private String comments;
	
	@SuppressWarnings("unchecked")
	private List<WarehouseDetails> warehousedetails = LazyList.decorate(new ArrayList<WarehouseDetails>(),FactoryUtils.instantiateFactory(WarehouseDetails.class));
	public String getWarehousrID() {
		return warehousrID;
	}
	public void setWarehousrID(String warehousrID) {
		this.warehousrID = warehousrID;
	}
	
	public String getWareHouseName() {
		return wareHouseName;
	}
	public void setWareHouseName(String wareHouseName) {
		this.wareHouseName = wareHouseName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public List<WarehouseDetails> getWarehousedetails() {
		return warehousedetails;
	}
	public void setWarehousedetails(List<WarehouseDetails> warehousedetails) {
		this.warehousedetails = warehousedetails;
	}
	
	
}
