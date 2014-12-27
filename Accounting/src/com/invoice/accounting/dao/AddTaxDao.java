package com.invoice.accounting.dao;

import java.util.List;

import com.invoice.accounting.beans.AddNewTax;
import com.invoice.accounting.beans.LinkedTax;
import com.invoice.accounting.beans.Taxes;

public interface AddTaxDao {

	public int save(AddNewTax addNewTax,LinkedTax linkedTax);
	public AddNewTax genrateID();
	public List<Taxes> showSalesTax();
	public List<LinkedTax> showSalesLinkedTax();
	public List<Taxes> showPurTax();
	public List<LinkedTax> showPurLinkedTax();
}
