package com.invoice.sales.service;

import java.util.List;

import com.invoice.accounting.beans.Taxes;
import com.invoice.customer.beans.Customer;
import com.invoice.inventory.beans.CreateNewProduct;
import com.invoice.sales.beans.DeliveryChallan;
import com.invoice.sales.beans.Details;
import com.invoice.sales.beans.Invoice;
import com.invoice.sales.beans.Order;
import com.invoice.sales.beans.Receipts;


public interface InvoiceService {
	
	public List<Invoice> show();
	public int save(Invoice invoice);
	public List<Invoice> editInvoice(String invoiceId);
	public List<Invoice> editInvoiceTaxDetails(String invoiceId);
	public List<Invoice> editInvoiceLinkedTaxDetails(String invoiceId);
	public int updateInvoice(Invoice invoice);
	public List<CreateNewProduct> retriveProductList();
	public List<Customer> retriveCustomerList();
	public List<DeliveryChallan> retriveChlList();
	public List<Taxes> retriveTaxList();
	public int deleteInvoice(String invoiceId,float amt);
	public List<Order> retriveOrderList();
	public Invoice generateInvId();
	public List<Customer> retriveCustInfo(String custId,String id);
	public List<Receipts> showReceipts(String invoiceId);
	public List<Details> retriveInvDetails(String invoiceId);
	public List<Invoice> retriveCustomerName(String invoiceId);
}
