package com.invoice.sales.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.invoice.accounting.beans.Taxes;
import com.invoice.customer.beans.Customer;
import com.invoice.inventory.beans.CreateNewProduct;
import com.invoice.sales.beans.DeliveryChallan;
import com.invoice.sales.beans.Details;
import com.invoice.sales.beans.Invoice;
import com.invoice.sales.beans.Order;
import com.invoice.sales.beans.Receipts;
import com.invoice.sales.dao.InvoiceDao;


@Component(value="invoiceService")
public class InvoiceServiceImpl implements InvoiceService {

	private InvoiceDao invoiceDao;
	private JdbcTemplate jdbcTemplate;
	
	
	public InvoiceDao getInvoiceDao() {
		return invoiceDao;
	}
	@Autowired
	public void setInvoiceDao(InvoiceDao invoiceDao) {
		this.invoiceDao = invoiceDao;
	}
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	@Autowired
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Override
	public List<Invoice> show() {
		
		return invoiceDao.show();
	}
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int save(Invoice invoice) {
		int i=invoiceDao.save(invoice);
		return i;
	}
	@Override
	public List<Invoice> editInvoice(String invoiceId) {
	return invoiceDao.editInvoice(invoiceId);
	}
	@Override
	public List<Invoice> editInvoiceTaxDetails(String invoiceId) {
		
		return invoiceDao.editInvoiceTaxDetails(invoiceId);
	}
	@Override
	public List<Invoice> editInvoiceLinkedTaxDetails(String invoiceId) {
		
		return invoiceDao.editInvoiceLinkedTaxDetails(invoiceId);
	} 

	@Transactional(rollbackFor=Exception.class)
	@Override
	public int updateInvoice(Invoice invoice) {
		
		return invoiceDao.updateInvoice(invoice);
	}
	@Override
	public List<CreateNewProduct> retriveProductList() {
	
		return invoiceDao.retriveProductList();
	}
	@Override
	public List<Customer> retriveCustomerList() {
		
		return invoiceDao.retriveCustomerList();
	}
	@Override
	public Invoice generateInvId() {
		
		return invoiceDao.generateInvId();
	}
	@Override
	public List<DeliveryChallan> retriveChlList() {
		
		return invoiceDao.retriveChlList();
	}
	@Override
	public List<Taxes> retriveTaxList() {
	
		return invoiceDao.retriveTaxList();
	}
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int deleteInvoice(String invoiceId,float amt) {
		
		return invoiceDao.deleteInvoice(invoiceId,amt);
	}
	@Override
	public List<Order> retriveOrderList() {		
		return invoiceDao.retriveOrderList();
	}
	@Override
	public List<Customer> retriveCustInfo(String custId, String id) {
		
		return invoiceDao.retriveCustInfo(custId, id);
	}
	@Override
	public List<Receipts> showReceipts(String invoiceId) {
		
		return invoiceDao.showReceipts(invoiceId);
	}
	@Override
	public List<Details> retriveInvDetails(String invoiceId) {
		
		return invoiceDao.retriveInvDetails(invoiceId);
	}
	@Override
	public List<Invoice> retriveCustomerName(String invoiceId) {
	
		return invoiceDao.retriveCustomerName(invoiceId);
	}
	
}
