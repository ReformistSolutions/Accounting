package com.invoice.accounting.service;

import java.util.List;

import com.invoice.accounting.beans.AddNewTax;
import com.invoice.accounting.beans.LinkedTax;
import com.invoice.accounting.beans.Taxes;

public interface AddTaxService {

	public int save(AddNewTax addNewTax,LinkedTax linkedTax);
	public AddNewTax genrateID();
	public List<Taxes> showSalesTax();
	public List<LinkedTax> showSalesLinkedTax();
	public List<Taxes> showPurTax();
	public List<LinkedTax> showPurLinkedTax();
}
