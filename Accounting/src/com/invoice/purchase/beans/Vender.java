package com.invoice.purchase.beans;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.FactoryUtils;
import org.apache.commons.collections.list.LazyList;


public class Vender
{
	private String txtCustID;
	private String txtCustName; 
	private String slctRegion;	
	private String txtDate;
	private String txtBillingAdd; 
	private String txtBillingCity;
	private String txtBillingState;
	private String txtBillingCountry;
	private int txtBillingPinCode;
	private String txtShippingAdd;
	private String txtShippingCity;
	private String txtShippingState;
	private String txtShippingCountry;
	private int txtShippingPinCode;
	@SuppressWarnings("unchecked")
	private List<VenderDetails> venderDetails = LazyList.decorate(new ArrayList<VenderDetails>(),FactoryUtils.instantiateFactory(VenderDetails.class));	
	private String txtAcNo;
	private String txtBankNm;
	private String txtCurrency;
	private int txtCreditLimit;
	private String txtIfscCode;
	private String txtPanNo;
	private String txtCstNo;
	private String txtVatNo;
	private String txtLbtNo;
	private String txtExcNo;
	private String txtServiceTaxNo;
	private String txtMail1;
	private String txtMob;
	private String txtTel;
	private String txtFax;
	private String txtWeb;
	private String attachment;
	private String id;
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
	public String getTxtCustID() {
		return txtCustID;
	}
	public void setTxtCustID(String txtCustID) {
		this.txtCustID = txtCustID;
	}
	public String getTxtCustName() {
		return txtCustName;
	}
	public void setTxtCustName(String txtCustName) {
		this.txtCustName = txtCustName;
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
	public String getTxtBillingAdd() {
		return txtBillingAdd;
	}
	public void setTxtBillingAdd(String txtBillingAdd) {
		this.txtBillingAdd = txtBillingAdd;
	}
	public String getTxtBillingCity() {
		return txtBillingCity;
	}
	public void setTxtBillingCity(String txtBillingCity) {
		this.txtBillingCity = txtBillingCity;
	}
	public String getTxtBillingState() {
		return txtBillingState;
	}
	public void setTxtBillingState(String txtBillingState) {
		this.txtBillingState = txtBillingState;
	}
	public String getTxtBillingCountry() {
		return txtBillingCountry;
	}
	public void setTxtBillingCountry(String txtBillingCountry) {
		this.txtBillingCountry = txtBillingCountry;
	}
	public int getTxtBillingPinCode() {
		return txtBillingPinCode;
	}
	public void setTxtBillingPinCode(int txtBillingPinCode) {
		this.txtBillingPinCode = txtBillingPinCode;
	}
	public String getTxtShippingAdd() {
		return txtShippingAdd;
	}
	public void setTxtShippingAdd(String txtShippingAdd) {
		this.txtShippingAdd = txtShippingAdd;
	}
	public String getTxtShippingCity() {
		return txtShippingCity;
	}
	public void setTxtShippingCity(String txtShippingCity) {
		this.txtShippingCity = txtShippingCity;
	}
	public String getTxtShippingState() {
		return txtShippingState;
	}
	public void setTxtShippingState(String txtShippingState) {
		this.txtShippingState = txtShippingState;
	}
	public String getTxtShippingCountry() {
		return txtShippingCountry;
	}
	public void setTxtShippingCountry(String txtShippingCountry) {
		this.txtShippingCountry = txtShippingCountry;
	}
	public int getTxtShippingPinCode() {
		return txtShippingPinCode;
	}
	public void setTxtShippingPinCode(int txtShippingPinCode) {
		this.txtShippingPinCode = txtShippingPinCode;
	}
	public List<VenderDetails> getVenderDetails() {
		return venderDetails;
	}
	public void setVenderDetails(List<VenderDetails> venderDetails) {
		this.venderDetails = venderDetails;
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
	public String getTxtCurrency() {
		return txtCurrency;
	}
	public void setTxtCurrency(String txtCurrency) {
		this.txtCurrency = txtCurrency;
	}
	public int getTxtCreditLimit() {
		return txtCreditLimit;
	}
	public void setTxtCreditLimit(int txtCreditLimit) {
		this.txtCreditLimit = txtCreditLimit;
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
	public String getTxtServiceTaxNo() {
		return txtServiceTaxNo;
	}
	public void setTxtServiceTaxNo(String txtServiceTaxNo) {
		this.txtServiceTaxNo = txtServiceTaxNo;
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
	public String getAttachment() {
		return attachment;
	}
	public void setAttachment(String attachment) {
		this.attachment = attachment;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
