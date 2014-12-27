package com.invoice.inventory.beans;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.FactoryUtils;
import org.apache.commons.collections.list.LazyList;

public class RecordTransferred {

	private String txtVNo;
	private String date;
	private String wearehouseID;
	private String selectWarehouse;
	@SuppressWarnings({ "unchecked" })
	private List<RecordTransferredDetails> recordTransferredDetailsList = LazyList.decorate(new ArrayList<RecordTransferredDetails>(),FactoryUtils.instantiateFactory(RecordTransferredDetails.class));
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
	public String getWearehouseID() {
		return wearehouseID;
	}
	public void setWearehouseID(String wearehouseID) {
		this.wearehouseID = wearehouseID;
	}
	public String getSelectWarehouse() {
		return selectWarehouse;
	}
	public void setSelectWarehouse(String selectWarehouse) {
		this.selectWarehouse = selectWarehouse;
	}
	public List<RecordTransferredDetails> getRecordTransferredDetailsList() {
		return recordTransferredDetailsList;
	}
	public void setRecordTransferredDetailsList(
			List<RecordTransferredDetails> recordTransferredDetailsList) {
		this.recordTransferredDetailsList = recordTransferredDetailsList;
	}
	public String getTxtDetails() {
		return txtDetails;
	}
	public void setTxtDetails(String txtDetails) {
		this.txtDetails = txtDetails;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
}