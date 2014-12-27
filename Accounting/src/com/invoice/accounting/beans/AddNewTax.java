package com.invoice.accounting.beans;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.FactoryUtils;
import org.apache.commons.collections.list.LazyList;

public class AddNewTax {
 	
    private String taxid;	
	private String txtTaxName;	
	private String txtRegNo;	
	private String txtFillingFre;	
	private String txtApplyTo;	
	private float txtSalesTaxRate;	
	private String txtDescription;	
	private String txtStatus;	
	private Float txtPurTax;	
	private String salepurchase;
	@SuppressWarnings("unchecked")
	private List<LinkedTax> linkedTax = LazyList.decorate(new ArrayList<LinkedTax>(),FactoryUtils.instantiateFactory(LinkedTax.class));
	
	public String getTaxid() {
		return taxid;
	}

	public void setTaxid(String taxid) {
		this.taxid = taxid;
	}

	public String getTxtApplyTo() {
		return txtApplyTo;
	}

	public String getTxtTaxName() {
		return txtTaxName;
	}

	public void setTxtTaxName(String txtTaxName) {
		this.txtTaxName = txtTaxName;
	}

	public String getTxtRegNo() {
		return txtRegNo;
	}

	public void setTxtRegNo(String txtRegNo) {
		this.txtRegNo = txtRegNo;
	}

	public String getTxtFillingFre() {
		return txtFillingFre;
	}

	public void setTxtFillingFre(String txtFillingFre) {
		this.txtFillingFre = txtFillingFre;
	}

	public float getTxtSalesTaxRate() {
		return txtSalesTaxRate;
	}

	public void setTxtSalesTaxRate(float txtSalesTaxRate) {
		this.txtSalesTaxRate = txtSalesTaxRate;
	}

	public String getTxtDescription() {
		return txtDescription;
	}

	public void setTxtDescription(String txtDescription) {
		this.txtDescription = txtDescription;
	}

	public void setTxtApplyTo(String txtApplyTo) {
		this.txtApplyTo = txtApplyTo;
	}

	public String getTxtStatus() {
		return txtStatus;
	}

	public void setTxtStatus(String txtStatus) {
		this.txtStatus = txtStatus;
	}

	public Float getTxtPurTax() {
		return txtPurTax;
	}

	public void setTxtPurTax(Float txtPurTax) {
		this.txtPurTax = txtPurTax;
	}

	public String getSalepurchase() {
		return salepurchase;
	}

	public void setSalepurchase(String salepurchase) {
		this.salepurchase = salepurchase;
	}

	public List<LinkedTax> getLinkedTax() {
		return linkedTax;
	}

	public void setLinkedTax(List<LinkedTax> linkedTax) {
		this.linkedTax = linkedTax;
	}
	
	
}
