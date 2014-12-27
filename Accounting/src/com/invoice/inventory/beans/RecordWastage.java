package com.invoice.inventory.beans;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.FactoryUtils;
import org.apache.commons.collections.list.LazyList;

public class RecordWastage {

	private String txtVNo;
	private String wearehouseID;
	private String selectWarehouse;
	private String date;
	@SuppressWarnings({ "unchecked" })
	private List<RecordWastageDetails> recordWastageDetailsList = LazyList.decorate(new ArrayList<RecordWastageDetails>(),FactoryUtils.instantiateFactory(RecordWastageDetails.class));
	private String txtDetails;
	private String status="active";
	public String getTxtVNo() {
		return txtVNo;
	}
	public void setTxtVNo(String txtVNo) {
		this.txtVNo = txtVNo;
	}
	public String getSelectWarehouse() {
		return selectWarehouse;
	}
	public void setSelectWarehouse(String selectWarehouse) {
		this.selectWarehouse = selectWarehouse;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	public List<RecordWastageDetails> getRecordWastageDetailsList() {
		return recordWastageDetailsList;
	}
	public void setRecordWastageDetailsList(
			List<RecordWastageDetails> recordWastageDetailsList) {
		this.recordWastageDetailsList = recordWastageDetailsList;
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