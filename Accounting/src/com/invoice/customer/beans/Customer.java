package com.invoice.customer.beans;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.FactoryUtils;
import org.apache.commons.collections.list.LazyList;


public class Customer
{
private String txtCustName; 
private String txtCustID;
private String id;
private String slctRegion;
/*private String slctType;*/
private String txtDate;
private String billingAddress;
private String billingcity;
private String billingstate;
private String billingcountry;
private String billingppincode;
private String shippingAddrLine;
private String shippingcity;
private String shippingstate;
private String shippingcountry;
private String shippingpincode;
@SuppressWarnings("unchecked")
private List<CustomerDetails> customerDetails = LazyList.decorate(new ArrayList<CustomerDetails>(),FactoryUtils.instantiateFactory(CustomerDetails.class));
private String txtMail1;
private String txtMob;
private String txtTel;
private String txtFax;
private String txtWeb;
private String txtStatus;
private String txtAcNo;
private String txtBankNm;
private String txtIfscCode;
private String txtPanNo;
private String txtCstNo;
private String txtVatNo;
private String txtLbtNo;
private String txtExcNo;
private String txtservicetax;
private String txtcurrency;
private String txtcurrencyLimit;
private String attachment;
private String subject;
private String regards;
private String bodyPart;
private String status;

public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
public String getTxtCustName() {
	return txtCustName;
}
public void setTxtCustName(String txtCustName) {
	this.txtCustName = txtCustName;
}
public String getTxtCustID() {
	return txtCustID;
}
public void setTxtCustID(String txtCustID) {
	this.txtCustID = txtCustID;
}

public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getSlctRegion() {
	return slctRegion;
}
public void setSlctRegion(String slctRegion) {
	this.slctRegion = slctRegion;
}
public String getTxtDate() {
	return txtDate;
}
public void setTxtDate(String txtDate) {
	this.txtDate = txtDate;
}
public String getBillingAddress() {
	return billingAddress;
}
public void setBillingAddress(String billingAddress) {
	this.billingAddress = billingAddress;
}
public String getBillingcity() {
	return billingcity;
}
public void setBillingcity(String billingcity) {
	this.billingcity = billingcity;
}
public String getBillingstate() {
	return billingstate;
}
public void setBillingstate(String billingstate) {
	this.billingstate = billingstate;
}
public String getBillingcountry() {
	return billingcountry;
}
public void setBillingcountry(String billingcountry) {
	this.billingcountry = billingcountry;
}
public String getBillingppincode() {
	return billingppincode;
}
public void setBillingppincode(String billingppincode) {
	this.billingppincode = billingppincode;
}
public String getShippingAddrLine() {
	return shippingAddrLine;
}
public void setShippingAddrLine(String shippingAddrLine) {
	this.shippingAddrLine = shippingAddrLine;
}
public String getShippingcity() {
	return shippingcity;
}
public void setShippingcity(String shippingcity) {
	this.shippingcity = shippingcity;
}
public String getShippingstate() {
	return shippingstate;
}
public void setShippingstate(String shippingstate) {
	this.shippingstate = shippingstate;
}
public String getShippingcountry() {
	return shippingcountry;
}
public void setShippingcountry(String shippingcountry) {
	this.shippingcountry = shippingcountry;
}
public String getShippingpincode() {
	return shippingpincode;
}
public void setShippingpincode(String shippingpincode) {
	this.shippingpincode = shippingpincode;
}
public List<CustomerDetails> getCustomerDetails() {
	return customerDetails;
}
public void setCustomerDetails(List<CustomerDetails> customerDetails) {
	this.customerDetails = customerDetails;
}
public String getTxtMail1() {
	return txtMail1;
}
public void setTxtMail1(String txtMail1) {
	this.txtMail1 = txtMail1;
}
public String getTxtMob() {
	return txtMob;
}
public void setTxtMob(String txtMob) {
	this.txtMob = txtMob;
}
public String getTxtTel() {
	return txtTel;
}
public void setTxtTel(String txtTel) {
	this.txtTel = txtTel;
}
public String getTxtFax() {
	return txtFax;
}
public void setTxtFax(String txtFax) {
	this.txtFax = txtFax;
}
public String getTxtWeb() {
	return txtWeb;
}
public void setTxtWeb(String txtWeb) {
	this.txtWeb = txtWeb;
}

public String getTxtStatus() {
	return txtStatus;
}
public void setTxtStatus(String txtStatus) {
	this.txtStatus = txtStatus;
}

public String getTxtAcNo() {
	return txtAcNo;
}
public void setTxtAcNo(String txtAcNo) {
	this.txtAcNo = txtAcNo;
}
public String getTxtBankNm() {
	return txtBankNm;
}
public void setTxtBankNm(String txtBankNm) {
	this.txtBankNm = txtBankNm;
}
public String getTxtIfscCode() {
	return txtIfscCode;
}
public void setTxtIfscCode(String txtIfscCode) {
	this.txtIfscCode = txtIfscCode;
}
public String getTxtPanNo() {
	return txtPanNo;
}
public void setTxtPanNo(String txtPanNo) {
	this.txtPanNo = txtPanNo;
}
public String getTxtCstNo() {
	return txtCstNo;
}
public void setTxtCstNo(String txtCstNo) {
	this.txtCstNo = txtCstNo;
}
public String getTxtVatNo() {
	return txtVatNo;
}
public void setTxtVatNo(String txtVatNo) {
	this.txtVatNo = txtVatNo;
}
public String getTxtLbtNo() {
	return txtLbtNo;
}
public void setTxtLbtNo(String txtLbtNo) {
	this.txtLbtNo = txtLbtNo;
}
public String getTxtExcNo() {
	return txtExcNo;
}
public void setTxtExcNo(String txtExcNo) {
	this.txtExcNo = txtExcNo;
}
public String getTxtcurrency() {
	return txtcurrency;
}

public String getTxtservicetax() {
	return txtservicetax;
}
public void setTxtservicetax(String txtservicetax) {
	this.txtservicetax = txtservicetax;
}
public void setTxtcurrency(String txtcurrency) {
	this.txtcurrency = txtcurrency;
}
public String getTxtcurrencyLimit() {
	return txtcurrencyLimit;
}
public void setTxtcurrencyLimit(String txtcurrencyLimit) {
	this.txtcurrencyLimit = txtcurrencyLimit;
}
public String getAttachment() {
	return attachment;
}
public void setAttachment(String attachment) {
	this.attachment = attachment;
}
public String getSubject() {
	return subject;
}
public void setSubject(String subject) {
	this.subject = subject;
}
public String getRegards() {
	return regards;
}
public void setRegards(String regards) {
	this.regards = regards;
}
public String getBodyPart() {
	return bodyPart;
}
public void setBodyPart(String bodyPart) {
	this.bodyPart = bodyPart;
}

}
