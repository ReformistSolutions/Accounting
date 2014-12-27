package com.invoice.reports.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.invoice.accounting.beans.LinkedTax;
import com.invoice.accounting.beans.Taxes;
import com.invoice.inventory.beans.CreateNewProduct;
import com.invoice.inventory.beans.Warehouse;
import com.invoice.purchase.beans.ComposeMail;
import com.invoice.purchase.beans.Purchases;
import com.invoice.purchase.beans.Vender;
import com.invoice.reports.beans.BankReports;
import com.invoice.reports.beans.ChartCustomerInvoices;
import com.invoice.reports.beans.ExpenseReports;
import com.invoice.reports.beans.Stocktransreports;
import com.invoice.reports.dao.ReportsDao;
import com.invoice.sales.beans.Invoice;
import com.invoice.sales.beans.Order;

@Component(value="reportsService")
public class ReportsServiceImpl implements ReportsService{

	@Autowired
	ReportsDao reportsDao;

	@Override
	public List<Taxes> showSalesTotalTax() {
		
		return reportsDao.showSalesTotalTax();
	}

	@Override
	public List<LinkedTax> showSalesTotalLinkedTax() {
		
		return reportsDao.showSalesTotalLinkedTax();
	}

	@Override
	public List<Taxes> showPurTotalTax() {
		
		return reportsDao.showPurTotalTax();
	}

	@Override
	public List<LinkedTax> showPurTotalLinkedTax() {
		
		return reportsDao.showPurTotalLinkedTax();
	}

	@Override
	public List<Invoice> showOutstandingReceipts() {
		
		return reportsDao.showOutstandingReceipts();
	}

	@Override
	public float getOSReceiptsTotal() {
		
		return reportsDao.getOSReceiptsTotal();
	}
	@Override
	public List<Invoice> custOutstandingReceipts(String custId, String frmDate,
			String toDate) {
		
		return reportsDao.custOutstandingReceipts(custId, frmDate, toDate);
	}

	@Override
	public float custOSReceiptsTotal(String custId, String frmDate,
			String toDate) {
		
		return reportsDao.custOSReceiptsTotal(custId, frmDate, toDate);
	}

	@Override
	public List<ChartCustomerInvoices> showAllInvoices() {
		
		return reportsDao.showAllInvoices();
	}
	@Override
	public List<Purchases> outstandingPayments() 
	{
		return reportsDao.outstandingPayments();
	}

	@Override
	public List<Purchases> retrivePayments(String venderID,String startdate,String enddate)
	{ 
		return reportsDao.retrivePayments(venderID, startdate, enddate);
	}

	@Override
	public List<Vender> retriveVender() 
	{
		return reportsDao.retriveVender();
	}
	@Override
	public List<BankReports> showbankdetails() {

		return reportsDao.showbankdetails();
	}

	

	@Override
	public List<BankReports> showtype(String transactionType) {

		return reportsDao.showtype(transactionType); 
	}

	@Override
	public List<BankReports> showwaste() {
		
		return reportsDao.showwaste();
	}

	@Override
	public List<ExpenseReports> showexp() {
	
		return reportsDao.showexp();
	}

	@Override
	public List<BankReports> retrivestockwaste(String fromdate, String todate) {
		
		return reportsDao.retrivestockwaste(fromdate, todate);
	}

	@Override
	public List<Stocktransreports> showtransferstk() {
		
		return reportsDao.showtransferstk();
	}

	@Override
	public List<Stocktransreports> retrivestocktransfer(String fromdate,String todate) {
		
		return reportsDao.retrivestocktransfer(fromdate, todate);
	}

	@Override
	public List<CreateNewProduct> retriveProduct() {
		
		return reportsDao.retriveProduct();
	}
	@Override
	public List<CreateNewProduct> show() {
		return reportsDao.show();
	}

	@Override
	public List<Warehouse> retriveWareHouse() {
		return reportsDao.retriveWareHouse();
	}

	@Override
	public List<CreateNewProduct> showvaluation(String warehouseId) {
		return reportsDao.showvaluation(warehouseId);
	}

	@Override
	public List<Order> showsalessorder() {
		return reportsDao.showsalessorder();
	}

	@Override
	public List<Order> showcustomer(String custID, String frmdate, String todate) {

		return reportsDao.showcustomer(custID, frmdate, todate);
	}

	@Override
	public List<Order> showproducts(String productId, String fromdate,
			String todate) {
		return reportsDao.showproducts(productId, fromdate, todate);
	}

	@Override
	public List<CreateNewProduct> showproducts(String productType) {
	
		return reportsDao.showproducts(productType);
	}

	@Override
	public int sendMail(ComposeMail composeMail) 
	{
		return reportsDao.sendMail(composeMail);
	}
}
