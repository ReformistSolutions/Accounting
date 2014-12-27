package com.invoice.reports.service;

import java.util.List;

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
import com.invoice.sales.beans.Invoice;
import com.invoice.sales.beans.Order;

public interface ReportsService {

	public List<Taxes> showSalesTotalTax();
	public List<LinkedTax> showSalesTotalLinkedTax();
	public List<Taxes> showPurTotalTax();
	public List<LinkedTax> showPurTotalLinkedTax();
	public List<Invoice> showOutstandingReceipts();
	public float getOSReceiptsTotal();
	public List<Invoice> custOutstandingReceipts(String custId,String frmDate,String toDate);
	public float custOSReceiptsTotal(String custId,String frmDate,String toDate);
	public List<ChartCustomerInvoices> showAllInvoices();
	public List<Purchases> outstandingPayments();
	public List<Purchases> retrivePayments(String venderID,String startdate,String enddate);
	public List<Vender> retriveVender();
	public List<BankReports> showbankdetails();
    public List<BankReports> showtype(String transactionType);
	public List<BankReports> showwaste();
	public List<ExpenseReports> showexp();
	public List<BankReports> retrivestockwaste(String fromdate,String todate);
	public List<Stocktransreports> showtransferstk();
	public List<Stocktransreports> retrivestocktransfer(String fromdate,String todate);
	public List<CreateNewProduct> retriveProduct();
	public List<CreateNewProduct> show();
	public List<Warehouse> retriveWareHouse();
	public List<CreateNewProduct> showvaluation(String warehouseId);
	public List<Order> showsalessorder();
	public List<Order> showcustomer(String custID,String frmdate,String todate);
	public List<Order> showproducts(String productId,String fromdate,String todate);
	public List<CreateNewProduct> showproducts(String productType);
	public int sendMail(ComposeMail composeMail);
}
