package com.invoice.sales.service;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.invoice.accounting.beans.NewAccount;
import com.invoice.customer.beans.Customer;
import com.invoice.sales.beans.Invoice;
import com.invoice.sales.beans.Receipts;
import com.invoice.sales.dao.ReceiptDao;


@Component(value="receiptService")
public class ReceiptServiceImpl implements ReceiptService{
	
	ReceiptDao receiptDao;
	

	public ReceiptDao getReceiptDao() {
		return receiptDao;
	}
	@Autowired
	public void setReceiptDao(ReceiptDao receiptDao) {
		this.receiptDao = receiptDao;
	}
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int save(Receipts receipts) {
		
		return receiptDao.save(receipts);
	}

	@Override
	public List<Receipts> show() {
		List<Receipts> receiptsList=new ArrayList<Receipts>();
		receiptsList= receiptDao.show();
		return receiptsList;
	}

	@Override
	public List<Receipts> editReceipt(String receiptId) {
		
		return receiptDao.editReceipt(receiptId);
	}
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int updateReceipt(Receipts receipts) {
		
		return receiptDao.updateReceipt(receipts);
	}
	@Override
	public Receipts generateRcptId() {
		
		return receiptDao.generateRcptId();
	}
	@Override
	public List<NewAccount> retriveAcList() {
		
		return receiptDao.retriveAcList();
	}
	@Override
	public List<Invoice> retriveInvList() {
		
		return receiptDao.retriveInvList();
	}
	@Override
	public int deleteReceipt(String receiptId) {
		
		return receiptDao.deleteReceipt(receiptId);
	}
	@Override
	public List<Customer> retriveCustInfo(String custId, String id) {
		
		return receiptDao.retriveCustInfo(custId, id);
	}
	@Override
	public float retriveInvBal(String invoiceId) {
		
		return receiptDao.retriveInvBal(invoiceId);
	}
	@Override
	public List<NewAccount> retriveAccount(String invoiceId) {
		
		return receiptDao.retriveAccount(invoiceId);
	}
	@Override
	public List<NewAccount> retriveToAccount(String paymentMode) {
		
		return receiptDao.retriveToAccount(paymentMode);
	}

}
