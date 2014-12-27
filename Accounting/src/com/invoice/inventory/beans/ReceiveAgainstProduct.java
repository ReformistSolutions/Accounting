package com.invoice.inventory.beans;
import java.util.ArrayList;
import java.util.List;
import org.apache.commons.collections.FactoryUtils;
import org.apache.commons.collections.list.LazyList;

public class ReceiveAgainstProduct {
	private String txtVNo;
	private String date;
	private String txtpurNo;
	@SuppressWarnings({ "unchecked" })
	private List<ReceiveAgainstProductDetails> receiveAgainstProductList = LazyList.decorate(new ArrayList<ReceiveAgainstProductDetails>(),FactoryUtils.instantiateFactory(ReceiveAgainstProductDetails.class));
	private String txtDetails;
	
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
	
	public String getTxtpurNo() {
		return txtpurNo;
	}
	public void setTxtpurNo(String txtpurNo) {
		this.txtpurNo = txtpurNo;
	}
	public List<ReceiveAgainstProductDetails> getReceiveAgainstProductList() {
		return receiveAgainstProductList;
	}
	public void setReceiveAgainstProductList(
			List<ReceiveAgainstProductDetails> receiveAgainstProductList) {
		this.receiveAgainstProductList = receiveAgainstProductList;
	}
	public String getTxtDetails() {
		return txtDetails;
	}
	public void setTxtDetails(String txtDetails) {
		this.txtDetails = txtDetails;
	}
}
