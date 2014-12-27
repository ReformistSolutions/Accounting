package com.invoice.sales.dao;

import java.util.List;

import com.invoice.accounting.beans.NewAccount;
import com.invoice.customer.beans.Customer;
import com.invoice.sales.beans.Invoice;
import com.invoice.sales.beans.Receipts;

public interface ReceiptDao {
	
	
	public int save(Receipts receipts);
	public List<Receipts> show();
	public List<Receipts> editReceipt(String receiptId);
	public int updateReceipt(Receipts receipts);
	public List<NewAccount> retriveAcList();
	public List<Invoice> retriveInvList();
	public int deleteReceipt(String receiptId);
	public Receipts generateRcptId();
	public List<Customer> retriveCustInfo(String custId,String id);
	public float retriveInvBal(String invoiceId);
	public List<NewAccount> retriveAccount(String invoiceId);
	public List<NewAccount> retriveToAccount(String paymentMode);
}
