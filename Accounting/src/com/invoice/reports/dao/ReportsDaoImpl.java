package com.invoice.reports.dao;

import java.io.File;
import java.io.FileOutputStream;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.mail.javamail.MimeMessageHelper;
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
import com.invoice.sales.beans.Invoice;
import com.invoice.sales.beans.Order;
import com.itextpdf.text.pdf.PdfWriter;


@Component(value="reportsDao")
public class ReportsDaoImpl implements ReportsDao{

	@Autowired
	JdbcTemplate jdbcTemplate;
	

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	@Autowired
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	@Override
	public List<Taxes> showSalesTotalTax() {
		try{
			 
			String sql="select * from taxes where tax_apply_to='S' OR tax_apply_to='S,P' OR tax_apply_to='B'";		
			return jdbcTemplate.query(sql, new RowMapper<Taxes>() {		
			List<Taxes> taxList=new ArrayList<Taxes>();
			@Override
			public Taxes mapRow(ResultSet rs, int arg1) throws SQLException {
				Taxes taxes=new Taxes();
				String invTaxId="";
				float totalTax=0;
				String taxId=rs.getString("tax_id");				
				taxes.setTaxName(rs.getString("tax_Name"));				
				taxes.setRegNo(rs.getString("registration_No"));				
				taxes.setFillFreq(rs.getString("filling_frequency"));				
				taxes.setTaxRate(rs.getFloat("sales_tax_rate"));
				for (Taxes invId : (getSalesTaxId())) 
				{
					invTaxId=invId.getTaxId();
					if(invTaxId.equals(taxId))
					{
						totalTax=jdbcTemplate.queryForObject("select sum(tax_Amount) from sales_invoice_tax_details where tax_Id='"+taxId+"'",Float.class);
					}
				}
				taxes.setTotalTaxAmt(totalTax);				
				taxList.add(taxes);
				return taxes;
			}
		});
		}catch(Exception e)
		{
			System.out.println(e);
			return null;
		}
	}
	private List<Taxes> getSalesTaxId()
	{
		try{
			String sql="select tax_Id from sales_invoice_tax_details";		
			return jdbcTemplate.query(sql, new RowMapper<Taxes>() {		
				List<Taxes> taxList=new ArrayList<Taxes>();
				@Override
				public Taxes mapRow(ResultSet rs, int arg1) throws SQLException {
					Taxes taxes=new Taxes();					
					taxes.setTaxId(rs.getString("tax_id"));
					taxList.add(taxes);
					return taxes;
				}
			});
			}catch(Exception e)
			{
				System.out.println(e);
				return null;
			}
	}
	@Override
	public List<LinkedTax> showSalesTotalLinkedTax() {
		try{
			String sql="select * from linkedtax";		
			return jdbcTemplate.query(sql, new RowMapper<LinkedTax>() {		
				List<LinkedTax> linkedTaxList=new ArrayList<LinkedTax>();
				@Override
				public LinkedTax mapRow(ResultSet rs, int arg1) throws SQLException {
					LinkedTax linkedTax=new LinkedTax();
					String linkedTaxId="";
					float totalLTax=0;
					String lTaxId=rs.getString("linkedTaxID");
					linkedTax.setLinkTaxName(rs.getString("taxName"));
					linkedTax.setLinkregNo(rs.getString("registraionNo"));
					linkedTax.setLinksalesTax(rs.getFloat("sales_tax_rate"));
					linkedTax.setlTaxFillingFreq(rs.getString("filling_frequency"));
					for (LinkedTax invLinkedTaxId : (getSalesLinkedTaxId())) 
					{
						linkedTaxId=invLinkedTaxId.getLinkTaxID();
						if(linkedTaxId.equals(lTaxId))
						{
							totalLTax=jdbcTemplate.queryForObject("select sum(linked_Tax_Amt) from sales_inv_linked_tax_details where linked_Tax_Id='"+lTaxId+"'",Float.class);
						}
					}
					linkedTax.setTotalLinkedTax(totalLTax);
					linkedTaxList.add(linkedTax);
					return linkedTax;
				}
			});
			}catch(Exception e)
			{
				return null;
			}
	}
	private List<LinkedTax> getSalesLinkedTaxId()
	{
		try{
			String sql="select linked_Tax_Id from sales_inv_linked_tax_details";		
			return jdbcTemplate.query(sql, new RowMapper<LinkedTax>() {		
				List<LinkedTax> lTaxList=new ArrayList<LinkedTax>();
				@Override
				public LinkedTax mapRow(ResultSet rs, int arg1) throws SQLException {
					LinkedTax linkedTax=new LinkedTax();					
					linkedTax.setLinkTaxID(rs.getString("linked_Tax_Id"));
					lTaxList.add(linkedTax);
					return linkedTax;
				}
			});
			}catch(Exception e)
			{
				System.out.println(e);
				return null;
			}
	}
	@Override
	public List<Taxes> showPurTotalTax() {
		try{
			String sql="select * from taxes where tax_apply_to='P' OR tax_apply_to='S,P' OR tax_apply_to='B'";
			return jdbcTemplate.query(sql, new RowMapper<Taxes>() {		
				List<Taxes> taxList=new ArrayList<Taxes>();
				@Override
				public Taxes mapRow(ResultSet rs, int arg1) throws SQLException {
					Taxes taxes=new Taxes();
					String purTaxId="";
					float totalTax=0;
					String taxId=rs.getString("tax_id");
					taxes.setTaxName(rs.getString("tax_Name"));
					taxes.setRegNo(rs.getString("registration_No"));
					taxes.setFillFreq(rs.getString("filling_frequency"));
					taxes.setTaxRate(rs.getFloat("purchase_tax_Rate"));
					for (Taxes invId : (getPurTaxId())) 
					{
						purTaxId=invId.getTaxId();
						if(purTaxId.equals(taxId))
						{
							totalTax=jdbcTemplate.queryForObject("select sum(tax_Amt) from purchase_tax_details where tax_Id='"+taxId+"'",Float.class);
						}
					}
					taxes.setTotalTaxAmt(totalTax);
					taxList.add(taxes);
					return taxes;
				}
			});
			}catch(Exception e)
			{
				System.out.println(e);
				return null;
			}
	}
	private List<Taxes> getPurTaxId()
	{
		try{
			String sql="select tax_Id from purchase_tax_details";		
			return jdbcTemplate.query(sql, new RowMapper<Taxes>() {		
				List<Taxes> taxList=new ArrayList<Taxes>();
				@Override
				public Taxes mapRow(ResultSet rs, int arg1) throws SQLException {
					Taxes taxes=new Taxes();					
					taxes.setTaxId(rs.getString("tax_Id"));
					taxList.add(taxes);
					return taxes;
				}
			});
			}catch(Exception e)
			{
				System.out.println(e);
				return null;
			}
	}
	@Override
	public List<LinkedTax> showPurTotalLinkedTax() {
		try{
			String sql="select * from linkedtax";		
			return jdbcTemplate.query(sql, new RowMapper<LinkedTax>() {		
				List<LinkedTax> linkedTaxList=new ArrayList<LinkedTax>();
				@Override
				public LinkedTax mapRow(ResultSet rs, int arg1) throws SQLException {
					LinkedTax linkedTax=new LinkedTax();
					String linkedTaxId="";
					float totalLTax=0;
					String lTaxId=rs.getString("linkedTaxID");
					linkedTax.setLinkTaxName(rs.getString("taxName"));
					linkedTax.setLinkregNo(rs.getString("registraionNo"));
					linkedTax.setLinksalesTax(rs.getFloat("purchase_tax_rate"));
					linkedTax.setlTaxFillingFreq(rs.getString("filling_frequency"));
					for (LinkedTax invLinkedTaxId : (getPurLinkedTaxId())) 
					{
						linkedTaxId=invLinkedTaxId.getLinkTaxID();
						if(linkedTaxId.equals(lTaxId))
						{
							totalLTax=jdbcTemplate.queryForObject("select sum(linked_Tax_Amt) from purchase_linked_tax_details where linked_Tax_Id='"+lTaxId+"'",Float.class);
						}
					}
					linkedTax.setTotalLinkedTax(totalLTax);
					linkedTaxList.add(linkedTax);
					return linkedTax;
				}
			});
			}catch(Exception e)
			{
				return null;
			}
	}
	private List<LinkedTax> getPurLinkedTaxId()
	{
		try{
			String sql="select linked_Tax_Id from purchase_linked_tax_details";		
			return jdbcTemplate.query(sql, new RowMapper<LinkedTax>() {		
				List<LinkedTax> lTaxList=new ArrayList<LinkedTax>();
				@Override
				public LinkedTax mapRow(ResultSet rs, int arg1) throws SQLException {
					LinkedTax linkedTax=new LinkedTax();					
					linkedTax.setLinkTaxID(rs.getString("linked_Tax_Id"));
					lTaxList.add(linkedTax);
					return linkedTax;
				}
			});
			}catch(Exception e)
			{
				System.out.println(e);
				return null;
			}
	}
	@Override
	public List<Invoice> showOutstandingReceipts() {
		try{
			// DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");	     
		    // Date date = new Date();	     
		    // Date dt=dateFormat.format(date);
		     final java.sql.Timestamp dt=new java.sql.Timestamp(new java.util.Date().getTime());
			String sql="select * from vsalesinvoice where sales_Invoice_Status='Active' and sales_Invoice_Balance>0  group by sales_Invoice_Id";		
			return jdbcTemplate.query(sql, new RowMapper<Invoice>() {	
				List<Invoice> invList=new ArrayList<Invoice>();
				@Override				
				public Invoice mapRow(ResultSet rs, int arg1) throws SQLException {
					Invoice invoice=new Invoice();					
					invoice.setTxtInvID(rs.getString("sales_Invoice_Id"));
					invoice.setTxtCName(rs.getString("customer_Name"));						
					invoice.setTxtDate(rs.getString("sales_Invoice_Date"));					
					invoice.setTxtDueDate(rs.getString("sales_Invoice_Due_Date"));
					Date dueDate=rs.getDate("sales_Invoice_Due_Date");
					long diff = dt.getTime() - dueDate.getTime();
					long diffDays = diff / (24 * 60 * 60 * 1000);
					invoice.setDateDiff(diffDays);					
					invoice.setBalance(rs.getFloat("sales_Invoice_Balance"));
					invList.add(invoice);
					return invoice;
				}
			});
			}catch(Exception e)
			{
				return null;
			}
	}
	@Override
	public float getOSReceiptsTotal() {
		try{
		float totalBalance=jdbcTemplate.queryForObject("select sum(sales_Invoice_Balance) from sales_invoice_header where sales_Invoice_Status='Active' and sales_Invoice_Balance>0 ",Float.class);
		return totalBalance;
		}catch(Exception e)
		{
			return 0;
		}
	}
	@Override
	public List<ChartCustomerInvoices> showAllInvoices() {		
		List<ChartCustomerInvoices> custInvList=new ArrayList<ChartCustomerInvoices>();
		ChartCustomerInvoices custInvoices=new ChartCustomerInvoices();
		custInvoices.setCustomerName("Customer 1");
		custInvoices.setCompleted(4);
		custInvoices.setIncompleted(5);
		custInvList.add(custInvoices);
		
		ChartCustomerInvoices custInvoices1=new ChartCustomerInvoices();
		custInvoices1.setCustomerName("Customer 2");
		custInvoices1.setCompleted(10);
		custInvoices1.setIncompleted(5);
		custInvList.add(custInvoices1);
		
		ChartCustomerInvoices custInvoices2=new ChartCustomerInvoices();
		custInvoices2.setCustomerName("Customer 3");
		custInvoices2.setCompleted(7);
		custInvoices2.setIncompleted(8);
		custInvList.add(custInvoices2);
		
		ChartCustomerInvoices custInvoices3=new ChartCustomerInvoices();
		custInvoices3.setCustomerName("Customer 4");
		custInvoices3.setCompleted(7);
		custInvoices3.setIncompleted(2);
		custInvList.add(custInvoices3);
		
		ChartCustomerInvoices custInvoices4=new ChartCustomerInvoices();
		custInvoices4.setCustomerName("Customer 5");
		custInvoices4.setCompleted(15);
		custInvoices4.setIncompleted(8);
		custInvList.add(custInvoices4);
		
		return custInvList;
	}
	@Override
	public List<Purchases> outstandingPayments() 
	{
		try{
			final java.sql.Timestamp dt=new java.sql.Timestamp(new java.util.Date().getTime());
			//DATEDIFF('"+dt+"',p.purs_Due_Date) as overdays
			//String sql="select p.purchase_Id,v1.vender_Name,v.payment_Date,p.purs_Due_Date,DATEDIFF('"+dt+"',p.purs_Due_Date) as overdays,p.purs_Amt_Payable from purchases_header p ,purchase_voucher v,vendor_header v1 where p.vendor_Id= v1.vender_ID and  p.purchase_Id = v.purchase_Id and p.purs_Amt_Payable >0  group by p.purchase_Id ";
			String sql="select * from vpurchases where purs_Status='Active' and bal_Amt>0  group by purchase_Id";		
			
			return jdbcTemplate.query(sql, new RowMapper<Purchases>() {		
				List<Purchases> paymentList=new ArrayList<Purchases>();
				@Override
				public Purchases mapRow(ResultSet rs, int arg1) throws SQLException {
					Purchases purchases=new Purchases();
					purchases.setTxtPurchaseNo(rs.getString("purchase_Id"));
					purchases.setSelSupplierName(rs.getString("vender_Name"));
					purchases.setPaymentDate(rs.getString("purs_Date"));
					purchases.setTxtDueDate(rs.getString("purs_Due_Date"));
					purchases.setTxtAmtPayble(rs.getFloat("purs_Amt_Payable"));	
					Date dueDate=rs.getDate("purs_Due_Date");
					long diff = dt.getTime() - dueDate.getTime();
					long diffDays = diff / (24 * 60 * 60 * 1000);
					purchases.setOverduedays(diffDays);
					
					float amt_total = jdbcTemplate.queryForObject("select sum(p.purs_Amt_Payable) as total from purchases_header p  where   p.purs_Amt_Payable >0 ",Float.class);
					purchases.setTotal(amt_total);
					
					paymentList.add(purchases);
					return purchases;
				}
			});
			}catch(Exception e)
			{
				System.out.println(e); 
				return null;
			}
	}
	@Override
	public List<Purchases> retrivePayments(String venderID,String startdate,String enddate) 
	{
		try{
			
			String sql="select p.purchase_Id,v1.vender_Name,v.payment_Date,p.purs_Due_Date,p.purs_Amt_Payable from purchases_header p ,purchase_voucher v,vendor_header v1 where (payment_Date BETWEEN '"+startdate+"' AND '"+enddate+"') AND v1.vender_ID='"+venderID+"' AND p.vendor_Id= v1.vender_ID and  p.purchase_Id = v.purchase_Id and p.purs_Amt_Payable >0  group by p.purchase_Id";
			return jdbcTemplate.query(sql, new RowMapper<Purchases>() {		
				List<Purchases> paymentList=new ArrayList<Purchases>();
				@Override
				public Purchases mapRow(ResultSet rs, int arg1) throws SQLException {
					Purchases purchases=new Purchases();
					purchases.setTxtPurchaseNo(rs.getString("purchase_Id"));
					purchases.setSelSupplierName(rs.getString("vender_Name"));
					purchases.setPaymentDate(rs.getString("payment_Date"));
					purchases.setTxtDueDate(rs.getString("purs_Due_Date"));
					purchases.setTxtAmtPayble(rs.getFloat("purs_Amt_Payable"));
					float amt_total = jdbcTemplate.queryForObject("select sum(p.purs_Amt_Payable) as total from purchases_header p  where   p.purs_Amt_Payable >0 ",Float.class);
					purchases.setTotal(amt_total);
					paymentList.add(purchases);
					return purchases;
				}
			});
			}catch(Exception e)
			{
				System.out.println(e); 
				return null;
			}
	}
	@Override
	public List<Vender> retriveVender() 
	{
		try{
			String sql = "select * from vendor_header where vender_Status = 'Active' order by vender_Name" ;
			final List<Vender> venderList=getJdbcTemplate().query(sql, new RowMapper<Vender>() {
				private List<Vender> vList=new ArrayList<Vender>();
				public Vender mapRow(ResultSet rs,int rowNo)throws SQLException
				{
					Vender vender=new Vender();
					vender.setTxtCustID(rs.getString("vender_ID")); 
					vender.setTxtCustName(rs.getString("vender_Name"));				
					vList.add(vender); 
					return vender;
				}	
			});		
				return venderList;
			}catch(Exception e)
			{
				return null;
			}
	}
	@Override
	public List<BankReports> showbankdetails() {
		String sql="select * from vbanktransaction";	
		final List<BankReports> BankReportsList=getJdbcTemplate().query(sql, new RowMapper<BankReports>() {
			private List<BankReports> depoList=new ArrayList<BankReports>();
			public BankReports mapRow(ResultSet rs,int rowNo)throws SQLException
			{
				BankReports bankReports=new BankReports();
				
				bankReports.setTxtvchno(rs.getString("voucher_No"));
				bankReports.setTxtdate(rs.getString("transaction_Date"));
				bankReports.setTxtfromaccnt(rs.getString("from_Account"));
				bankReports.setTxttoaccnt(rs.getString("to_Account"));
				bankReports.setTransactiontype(rs.getString("transaction_Type"));
				bankReports.setTxtamt(rs.getString("amount"));
				bankReports.setTxtdescr(rs.getString("description"));				
				
				depoList.add(bankReports);
				return bankReports;
			}	
		});
			return BankReportsList;
	}
	
	@Override
	public List<BankReports> showtype(String transactionType) 
	{
		String sql="select * from vbanktransaction where transaction_Type = '"+transactionType+"'";
		final List<BankReports> BankReportsList=getJdbcTemplate().query(sql, new RowMapper<BankReports>() {
			private List<BankReports> depoList=new ArrayList<BankReports>();
			public BankReports mapRow(ResultSet rs,int rowNo)throws SQLException
			{
				BankReports bankReports=new BankReports();
				
				bankReports.setTxtvchno(rs.getString("voucher_No"));
				bankReports.setTxtdate(rs.getString("transaction_Date"));
				bankReports.setTxtfromaccnt(rs.getString("from_Account"));
				bankReports.setTxttoaccnt(rs.getString("to_Account"));
				bankReports.setTransactiontype(rs.getString("transaction_Type"));
				bankReports.setTxtamt(rs.getString("amount"));
				bankReports.setTxtdescr(rs.getString("description"));				
				
				depoList.add(bankReports);
				return bankReports;
			}	
		});
			return BankReportsList;

	}
	@Override
	public List<BankReports> showwaste() {
		String sql="select * from vrecwastage";		
		final List<BankReports> BankReportsList=getJdbcTemplate().query(sql, new RowMapper<BankReports>() {
			private List<BankReports> depoList=new ArrayList<BankReports>();
			public BankReports mapRow(ResultSet rs,int rowNo)throws SQLException
			{
				BankReports bankReports=new BankReports();
				
				bankReports.setVoucherno(rs.getString("voucher_No"));
				bankReports.setVoucherdate(rs.getString("voucher_Date"));
				bankReports.setWarehouse(rs.getString("warehouse_Name"));
				bankReports.setProduct(rs.getString("prod_Name"));
				bankReports.setRemark(rs.getString("remark"));
				bankReports.setQty(rs.getInt("quantity"));								
				
				depoList.add(bankReports);
				return bankReports;
			}	
		});
			return BankReportsList;

	}
	@Override
	public List<ExpenseReports> showexp() {
		String sql="select * from vexpense";		
		final List<ExpenseReports> ExpenseReportsList=getJdbcTemplate().query(sql, new RowMapper<ExpenseReports>() {
			private List<ExpenseReports> depoList=new ArrayList<ExpenseReports>();
			public ExpenseReports mapRow(ResultSet rs,int rowNo)throws SQLException
			{
				ExpenseReports expenseReports=new ExpenseReports();
				
				expenseReports.setExpid(rs.getString("Expense_Id"));
				expenseReports.setPaidfrm(rs.getString("account_Name"));
				expenseReports.setExpdate(rs.getString("Expensedate"));
				expenseReports.setExptype(rs.getString("ExpenseTypeAccount"));
				expenseReports.setTotal(rs.getInt("Total"));
				expenseReports.setDescrption(rs.getString("Narration"));								
				
				depoList.add(expenseReports);
				return expenseReports;
			}	
		});
			return ExpenseReportsList;

	}
	
	
	@Override
	public List<BankReports> retrivestockwaste(String fromdate,String todate) {
		String sql="SELECT * FROM vrecwastage WHERE (voucher_Date BETWEEN '"+fromdate+"'  AND '"+todate+"')";
		
		final List<BankReports> BankReportsList=getJdbcTemplate().query(sql, new RowMapper<BankReports>() {
			private List<BankReports> depoList=new ArrayList<BankReports>();
			public BankReports mapRow(ResultSet rs,int rowNo)throws SQLException
			{
				BankReports bankReports=new BankReports();
				
				bankReports.setVoucherno(rs.getString("voucher_No"));
				bankReports.setVoucherdate(rs.getString("voucher_Date"));
				bankReports.setWarehouse(rs.getString("warehouse_Name"));
				bankReports.setProduct(rs.getString("prod_Name"));
				bankReports.setRemark(rs.getString("remark"));
				bankReports.setQty(rs.getInt("quantity"));
								
				depoList.add(bankReports);
				return bankReports;
			}	
		});
			return BankReportsList;

	}
	@Override
	public List<Stocktransreports> showtransferstk() {
		String sql="select * from recordtransfer";		
		final List<Stocktransreports> StocktransreportsList=getJdbcTemplate().query(sql, new RowMapper<Stocktransreports>() {
			private List<Stocktransreports> depoList=new ArrayList<Stocktransreports>();
			public Stocktransreports mapRow(ResultSet rs,int rowNo)throws SQLException
			{
				Stocktransreports stocktransreports=new Stocktransreports();
				
				stocktransreports.setStktrnvno(rs.getString("voucher_No"));
				stocktransreports.setStktrnvdate(rs.getString("tran_date"));
				stocktransreports.setStktrnproduct(rs.getString("prod_Name"));
				stocktransreports.setStktrnqty(rs.getInt("quantity"));
				stocktransreports.setStktrndestwarehouse(rs.getString("desti_warehouse"));
				stocktransreports.setStktrndesc(rs.getString("description"));
								
				
				depoList.add(stocktransreports);
				return stocktransreports;
			}	
		});
			return StocktransreportsList;

	}
	@Override
	public List<Stocktransreports> retrivestocktransfer(String fromdate,String todate) {
		String sql="SELECT * FROM recordtransfer WHERE (tran_date BETWEEN '"+fromdate+"'  AND '"+todate+"')";		
		final List<Stocktransreports> StocktransreportsList=getJdbcTemplate().query(sql, new RowMapper<Stocktransreports>() {
			private List<Stocktransreports> depoList=new ArrayList<Stocktransreports>();
			public Stocktransreports mapRow(ResultSet rs,int rowNo)throws SQLException
			{
				Stocktransreports stocktransreports=new Stocktransreports();
				
				stocktransreports.setStktrnvno(rs.getString("voucher_No"));
				stocktransreports.setStktrnvdate(rs.getString("tran_date"));
				stocktransreports.setStktrnproduct(rs.getString("prod_Name"));
				stocktransreports.setStktrnqty(rs.getInt("quantity"));
				stocktransreports.setStktrndestwarehouse(rs.getString("desti_warehouse"));
				stocktransreports.setStktrndesc(rs.getString("description"));
								
				
				depoList.add(stocktransreports);
				return stocktransreports;
			}	
		});
			return StocktransreportsList;
	}
	@Override
	public List<CreateNewProduct> retriveProduct() {
		String sql="select * from product_master";	
		final List<CreateNewProduct> prodgrp=getJdbcTemplate().query(sql, new RowMapper<CreateNewProduct>() {
		private List<CreateNewProduct> prodList=new ArrayList<CreateNewProduct>();
		public CreateNewProduct mapRow(ResultSet rs,int rowNo)throws SQLException
		{
			CreateNewProduct createNewProduct=new CreateNewProduct();
			createNewProduct.setProductCode(rs.getString("product_Id"));
			createNewProduct.setTxtName(rs.getString("prod_Name"));	
			prodList.add(createNewProduct);
			return createNewProduct;
		}	
		});	
		return prodgrp;
	}
	@Override
	public List<Invoice> custOutstandingReceipts(String custId,String frmDate,String toDate) {
		try{
			// DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");	     
		    // Date date = new Date();	     
		    // final String dt=dateFormat.format(date);
			String sql=""; 
			
			if((custId !="") && (frmDate !="") && (toDate !=""))
			{ 
				sql="select * from vsalesinvoice where sales_Invoice_Status='Active' AND sales_Invoice_Balance>0 AND customer_ID='"+custId+"' AND (sales_Invoice_Date BETWEEN '"+frmDate+"' AND '"+toDate+"') group by sales_Invoice_Id";
			}
			if((custId =="") && (frmDate !="") && (toDate !=""))
			{
				sql="select * from vsalesinvoice where sales_Invoice_Status='Active' AND sales_Invoice_Balance>0 AND (sales_Invoice_Date BETWEEN '"+frmDate+"' AND '"+toDate+"') group by sales_Invoice_Id";
			} 
			if((custId !="") && (frmDate =="") && (toDate ==""))
			{
				sql="select * from vsalesinvoice where sales_Invoice_Status='Active' AND sales_Invoice_Balance>0 AND customer_ID='"+custId+"' group by sales_Invoice_Id";
			}
			if((custId =="") && (frmDate =="") && (toDate ==""))
			{
				sql="select * from vsalesinvoice where sales_Invoice_Status='Active' AND sales_Invoice_Balance>0 group by sales_Invoice_Id";
			}
				return jdbcTemplate.query(sql, new RowMapper<Invoice>() {	
					List<Invoice> invList=new ArrayList<Invoice>();
					@Override				
					public Invoice mapRow(ResultSet rs, int arg1) throws SQLException {
						Invoice invoice=new Invoice();					
						invoice.setTxtInvID(rs.getString("sales_Invoice_Id"));
						invoice.setTxtCName(rs.getString("customer_Name"));						
						invoice.setTxtDate(rs.getString("sales_Invoice_Date"));					
						invoice.setTxtDueDate(rs.getString("sales_Invoice_Due_Date"));
						//String dueDate=rs.getString("sales_Invoice_Due_Date");
						invoice.setBalance(rs.getFloat("sales_Invoice_Balance"));
						invList.add(invoice);
						return invoice;
					}
				});			
			}catch(Exception e)
			{
				System.out.println(e);
				return null;
			}
	}
	@Override
	public float custOSReceiptsTotal(String custId,String frmDate,String toDate) {
		try{
			float totalBalance=0;
			if(custId !="" && frmDate !="" && toDate !="")
			{
				totalBalance=jdbcTemplate.queryForObject("select sum(sales_Invoice_Balance) from sales_invoice_header where sales_Invoice_Status='Active' and sales_Invoice_Balance>0 AND customer_ID='"+custId+"' AND (sales_Invoice_Date BETWEEN '"+frmDate+"' AND '"+toDate+"')",Float.class);
			}
			if(custId =="" && frmDate !="" && toDate !="")
			{
				totalBalance=jdbcTemplate.queryForObject("select sum(sales_Invoice_Balance) from sales_invoice_header where sales_Invoice_Status='Active' and sales_Invoice_Balance>0 AND (sales_Invoice_Date BETWEEN '"+frmDate+"' AND '"+toDate+"')",Float.class);
			}
			if(custId !="" && frmDate =="" && toDate =="")
			{
				totalBalance=jdbcTemplate.queryForObject("select sum(sales_Invoice_Balance) from sales_invoice_header where sales_Invoice_Status='Active' and sales_Invoice_Balance>0 AND customer_ID='"+custId+"'",Float.class);
			}
			if(custId =="" && frmDate =="" && toDate =="")
			{
				totalBalance=jdbcTemplate.queryForObject("select sum(sales_Invoice_Balance) from sales_invoice_header where sales_Invoice_Status='Active' and sales_Invoice_Balance>0",Float.class);
			}
			
			return totalBalance;
			}catch(Exception e)
			{
				System.out.println(e);
				return 0;
			}
	}
	@Override
	public List<CreateNewProduct> show() {
		String sql = "select * from product_master where status = 'Active'  group by product_Id";
		final List<CreateNewProduct> prodList = getJdbcTemplate().query(sql,
				new RowMapper<CreateNewProduct>() {
					private List<CreateNewProduct> productList = new ArrayList<CreateNewProduct>();

					public CreateNewProduct mapRow(ResultSet rs, int rowNo)
							throws SQLException {
						CreateNewProduct createNewProduct = new CreateNewProduct();
						createNewProduct.setProductCode(rs.getString("product_Id"));
						createNewProduct.setTxtName(rs.getString("prod_Name"));
						createNewProduct.setProductType(rs.getString("prod_Type"));
						createNewProduct.setTxtOpeningStock(rs.getFloat("opening_Stock"));
						createNewProduct.setTxtDes(rs.getString("description"));
						createNewProduct.setTxtUnitOfMeasure(rs.getString("unit_Of_Measure"));
						createNewProduct.setTxtReorderlevel(rs.getString("reorder_Level"));
						createNewProduct.setTxtSalesPrice(rs.getFloat("sales_Price"));
						createNewProduct.setTxtPurchasePrice(rs.getFloat("purchase_Price"));
						
						float op_Stock = createNewProduct.getTxtOpeningStock();
						float sales_Price = createNewProduct.getTxtSalesPrice();
						float purchase_Price = createNewProduct.getTxtPurchasePrice();
						
						String prod_Type = createNewProduct.getProductType();
						if(prod_Type.equalsIgnoreCase("Sale Item"))
						{
							float valuation =  op_Stock * sales_Price ;
							createNewProduct.setInventoryvalue(valuation);
						}
						else if(prod_Type.equalsIgnoreCase("Purchase Item"))
						{
							float valuation =  op_Stock * purchase_Price ;
							createNewProduct.setInventoryvalue(valuation);
						}
						else if(prod_Type.equalsIgnoreCase("Resale Product"))
						{
							float valuation =  op_Stock * sales_Price ;
							createNewProduct.setInventoryvalue(valuation);
						}
						productList.add(createNewProduct);
						return createNewProduct;
					}

				});
		return prodList;
	}
	
	@Override
	public List<Warehouse> retriveWareHouse() {
		    try
		    {
			String sql="select * from warehouse_header";	
			final List<Warehouse> accGroup=getJdbcTemplate().query(sql, new RowMapper<Warehouse>() {
			private List<Warehouse> accountList=new ArrayList<Warehouse>();
			public Warehouse mapRow(ResultSet rs,int rowNo)throws SQLException
			{
			Warehouse warehouse=new Warehouse();
			warehouse.setWarehousrID(rs.getString("warehouse_Id"));
			warehouse.setWareHouseName(rs.getString("warehouse_Name"));
			 
			
			accountList.add(warehouse);

			return warehouse;
			}	
			});	
			return accGroup;
		    }catch(Exception e)
			{
				return null;
			}
	}
	@Override
	public List<CreateNewProduct> showvaluation(String warehouseId) {
		try
		{
		String sql = "select b1.product_id,p1.prod_Name,p1.prod_Type,p1.opening_Stock,p1.description,p1.sales_Price,p1.purchase_Price from warehouse_header a1,warehouse_details b1,product_master p1 where  a1.warehouse_id = b1.warehouse_id AND  b1.product_id = p1.product_id and  a1.warehouse_id = '"+warehouseId+"'";
		final List<CreateNewProduct> prodList = getJdbcTemplate().query(sql,
				new RowMapper<CreateNewProduct>() {
					private List<CreateNewProduct> productList = new ArrayList<CreateNewProduct>();

					public CreateNewProduct mapRow(ResultSet rs, int rowNo)
							throws SQLException {
						CreateNewProduct createNewProduct = new CreateNewProduct();
						createNewProduct.setProductCode(rs.getString("product_Id"));
						createNewProduct.setTxtName(rs.getString("prod_Name"));
						createNewProduct.setProductType(rs.getString("prod_Type"));
						createNewProduct.setTxtOpeningStock(rs.getFloat("opening_Stock"));
						createNewProduct.setTxtDes(rs.getString("description"));
						createNewProduct.setTxtSalesPrice(rs.getFloat("sales_Price"));
						createNewProduct.setTxtPurchasePrice(rs.getFloat("purchase_Price"));
						
						float op_Stock = createNewProduct.getTxtOpeningStock();
						float sales_Price = createNewProduct.getTxtSalesPrice();
						float purchase_Price = createNewProduct.getTxtPurchasePrice();
						
						String prod_Type = createNewProduct.getProductType();
						if(prod_Type.equalsIgnoreCase("Sale Item"))
						{
							float valuation =  op_Stock * sales_Price ;
							createNewProduct.setInventoryvalue(valuation);
						}
						else if(prod_Type.equalsIgnoreCase("Purchase Item"))
						{
							float valuation =  op_Stock * purchase_Price ;
							createNewProduct.setInventoryvalue(valuation);
						}
						else if(prod_Type.equalsIgnoreCase("Resale Product"))
						{
							float valuation =  op_Stock * sales_Price ;
							createNewProduct.setInventoryvalue(valuation);
						}
							
						productList.add(createNewProduct);
						return createNewProduct;
					}

				});
		return prodList;
		}catch(Exception e)
		{
			return null;
		}
}
	@Override
	public List<Order> showsalessorder() {
		try
		{
		String sql = "select * from vsalesorder where oc_status = 'O'  and invoice_Created='No'";
		final List<Order> prodList = getJdbcTemplate().query(sql,
				new RowMapper<Order>() {
					private List<Order> productList = new ArrayList<Order>();

					public Order mapRow(ResultSet rs, int rowNo)
							throws SQLException {
						Order createNewProduct = new Order();
						createNewProduct.setTxtDate(rs.getString("sales_Order_Order_Date"));
						createNewProduct.setTxtCName(rs.getString("customer_Name"));
						createNewProduct.setTxtSOID(rs.getString("sales_Order_Id"));
						createNewProduct.setProduct(rs.getString("prod_Name"));
						createNewProduct.setQuantity(rs.getFloat("sales_Order_Quantity"));
						createNewProduct.setQuantity(rs.getFloat("sales_Order_Quantity"));
						createNewProduct.setQuantity(rs.getFloat("sales_Order_Quantity"));
						productList.add(createNewProduct);
						return createNewProduct;
					}

				});
		return prodList;
		}catch(Exception e)
		{
			return null;
		}
}
	
	@Override
	public List<Order> showcustomer(String custID, String frmdate, String todate) {
		try
		{
		String sql="";
		
		if((custID !="") && (frmdate !="") && (todate !=""))
		{
		sql = "select * from vsalesorder where oc_status = 'O'  and invoice_Created='No' and customer_ID = '"+custID+"' and (sales_Order_Order_Date between '"+frmdate+"' and  '"+todate+"')";
		
		}
		
		if((custID =="") && (frmdate !="") && (todate !=""))
		{
		sql = "select * from vsalesorder where oc_status = 'O'  and invoice_Created='No' and (sales_Order_Order_Date between '"+frmdate+"' and  '"+todate+"')";
		
		}
		
		if((custID !="") && (frmdate =="") && (todate ==""))
		{
		sql = "select * from vsalesorder where oc_status = 'O'  and invoice_Created='No' and customer_ID = '"+custID+"'";
		
		}
		if((custID =="") && (frmdate =="") && (todate ==""))
		{
			sql = "select * from vsalesorder where oc_status = 'O'  and invoice_Created='No'";
			
		}
       return jdbcTemplate.query(sql, new RowMapper<Order>(){
    	   List<Order> productList = new ArrayList<Order>();
		@Override
		public Order mapRow(ResultSet rs, int rrowNo) throws SQLException 
		{
							Order createNewProduct = new Order();
							createNewProduct.setTxtDate(rs.getString("sales_Order_Order_Date"));
							createNewProduct.setTxtCName(rs.getString("customer_Name"));
							createNewProduct.setTxtSOID(rs.getString("sales_Order_Id"));
							createNewProduct.setProduct(rs.getString("prod_Name"));
							createNewProduct.setQuantity(rs.getFloat("sales_Order_Quantity"));
							createNewProduct.setQuantity(rs.getFloat("sales_Order_Quantity"));
							createNewProduct.setQuantity(rs.getFloat("sales_Order_Quantity"));
							productList.add(createNewProduct);
							return createNewProduct;
						}

					});
	}catch(Exception e)
	{
		return null;
	}
}
	/*@Override
	public List<Order> showcustomer(String custID, String frmdate, String todate) {
		String sql = "select * from vsalesorder where oc_status = 'O'  and invoice_Created='No' and customer_ID = '"+custID+"' and (sales_Order_Order_Date between '"+frmdate+"' and  '"+todate+"' )";
		final List<Order> prodList = getJdbcTemplate().query(sql,
				new RowMapper<Order>() {
					private List<Order> productList = new ArrayList<Order>();
					public Order mapRow(ResultSet rs, int rowNo)
							throws SQLException {
						Order createNewProduct = new Order();
						createNewProduct.setTxtDate(rs.getString("sales_Order_Order_Date"));
						createNewProduct.setTxtCName(rs.getString("customer_Name"));
						createNewProduct.setTxtSOID(rs.getString("sales_Order_Id"));
						createNewProduct.setProduct(rs.getString("prod_Name"));
						createNewProduct.setQuantity(rs.getFloat("sales_Order_Quantity"));
						createNewProduct.setQuantity(rs.getFloat("sales_Order_Quantity"));
						createNewProduct.setQuantity(rs.getFloat("sales_Order_Quantity"));
						productList.add(createNewProduct);
						return createNewProduct;
					}

				});
		return prodList;
	}*/
	/*@Override
	public List<Order> showproducts(String productId, String fromdate,
			String todate) {String sql = "select * from vsalesorder where oc_status = 'O'  and invoice_Created='No' and product_Id = '"+productId+"' and (sales_Order_Order_Date between '"+fromdate+"' and  '"+todate+"' )";
			final List<Order> prodList = getJdbcTemplate().query(sql,
					new RowMapper<Order>() {
						private List<Order> productList = new ArrayList<Order>();
						public Order mapRow(ResultSet rs, int rowNo)
								throws SQLException {
							Order createNewProduct = new Order();
							createNewProduct.setTxtDate(rs.getString("sales_Order_Order_Date"));
							createNewProduct.setTxtCName(rs.getString("customer_Name"));
							createNewProduct.setTxtSOID(rs.getString("sales_Order_Id"));
							createNewProduct.setProduct(rs.getString("prod_Name"));
							createNewProduct.setQuantity(rs.getFloat("sales_Order_Quantity"));
							createNewProduct.setQuantity(rs.getFloat("sales_Order_Quantity"));
							createNewProduct.setQuantity(rs.getFloat("sales_Order_Quantity"));
							productList.add(createNewProduct);
							return createNewProduct;
						}

					});
			return prodList;
	}*/
	
	/*public List<Invoice> custOutstandingReceipts(String custId,String frmDate,String toDate) {
	try{
		// DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");	     
	    // Date date = new Date();	     
	    // final String dt=dateFormat.format(date);
		String sql=""; 
		
		if((custId !="") && (frmDate !="") && (toDate !=""))
		{ 
			sql="select * from vsalesinvoice where sales_Invoice_Status='Active' AND sales_Invoice_Balance>0 AND customer_ID='"+custId+"' AND (sales_Invoice_Date BETWEEN '"+frmDate+"' AND '"+toDate+"') group by sales_Invoice_Id";
		}
		if((custId =="") && (frmDate !="") && (toDate !=""))
		{
			sql="select * from vsalesinvoice where sales_Invoice_Status='Active' AND sales_Invoice_Balance>0 AND (sales_Invoice_Date BETWEEN '"+frmDate+"' AND '"+toDate+"') group by sales_Invoice_Id";
		} 
		if((custId !="") && (frmDate =="") && (toDate ==""))
		{
			sql="select * from vsalesinvoice where sales_Invoice_Status='Active' AND sales_Invoice_Balance>0 AND customer_ID='"+custId+"' group by sales_Invoice_Id";
		}
		if((custId =="") && (frmDate =="") && (toDate ==""))
		{
			sql="select * from vsalesinvoice where sales_Invoice_Status='Active' AND sales_Invoice_Balance>0 group by sales_Invoice_Id";
		}
			return jdbcTemplate.query(sql, new RowMapper<Invoice>() {	
				List<Invoice> invList=new ArrayList<Invoice>();
				@Override				
				public Invoice mapRow(ResultSet rs, int arg1) throws SQLException {
					Invoice invoice=new Invoice();					
					invoice.setTxtInvID(rs.getString("sales_Invoice_Id"));
					invoice.setTxtCName(rs.getString("customer_Name"));						
					invoice.setTxtDate(rs.getString("sales_Invoice_Date"));					
					invoice.setTxtDueDate(rs.getString("sales_Invoice_Due_Date"));
					//String dueDate=rs.getString("sales_Invoice_Due_Date");
					invoice.setBalance(rs.getFloat("sales_Invoice_Balance"));
					invList.add(invoice);
					return invoice;
				}
			});			
		}catch(Exception e)
		{
			System.out.println(e);
			return null;
		}
}*/
	@Override
	public List<Order> showproducts(String productId, String fromdate,String todate) {
		try
		{
		String sql="";
		
		if((productId !="") && (fromdate !="") && (todate !=""))
		{ 
		  sql = "select * from vsalesorder where oc_status = 'O'  and invoice_Created='No' and product_Id = '"+productId+"' and (sales_Order_Order_Date between '"+fromdate+"' and  '"+todate+"' )";
		  System.out.println("when all not null");
		}
		if((productId =="") && (fromdate !="") && (todate !=""))
		{
			sql = "select * from vsalesorder where oc_status = 'O'  and invoice_Created='No' and (sales_Order_Order_Date between '"+fromdate+"' and  '"+todate+"' )";
			System.out.println("when prodid null");

		} 
		if((productId !="") && (fromdate =="") && (todate ==""))
		{
			sql = "select * from vsalesorder where oc_status = 'O'  and invoice_Created='No' and product_Id = '"+productId+"'";
			System.out.println("when date null");

		}
		if((productId =="") && (fromdate =="") && (todate ==""))
		{
			sql = "select * from vsalesorder where oc_status = 'O'  and invoice_Created='No'";
			System.out.println("when all null");

		}
		    return jdbcTemplate.query(sql, new RowMapper<Order>(){
					List<Order> productList = new ArrayList<Order>();
					@Override
						public Order mapRow(ResultSet rs, int rowNo)
								throws SQLException {
							Order createNewProduct = new Order();
							createNewProduct.setTxtDate(rs.getString("sales_Order_Order_Date"));
							createNewProduct.setTxtCName(rs.getString("customer_Name"));
							createNewProduct.setTxtSOID(rs.getString("sales_Order_Id"));
							createNewProduct.setProduct(rs.getString("prod_Name"));
							createNewProduct.setQuantity(rs.getFloat("sales_Order_Quantity"));
							createNewProduct.setQuantity(rs.getFloat("sales_Order_Quantity"));
							createNewProduct.setQuantity(rs.getFloat("sales_Order_Quantity"));
							productList.add(createNewProduct);
							return createNewProduct;
						}

					});
		}catch(Exception e)
		{
			return null;
		}


}
	@Override
	public List<CreateNewProduct> showproducts(String productType) {
		try
		{
		String sql = "select * from product_master where status = 'Active' and product_Id='"+productType+"' group by product_Id";
		final List<CreateNewProduct> prodList = getJdbcTemplate().query(sql,
				new RowMapper<CreateNewProduct>() {
					private List<CreateNewProduct> productList = new ArrayList<CreateNewProduct>();

					public CreateNewProduct mapRow(ResultSet rs, int rowNo)
							throws SQLException {
						CreateNewProduct createNewProduct = new CreateNewProduct();
						createNewProduct.setProductCode(rs.getString("product_Id"));
						createNewProduct.setTxtName(rs.getString("prod_Name"));
						createNewProduct.setProductType(rs.getString("prod_Type"));
						createNewProduct.setTxtOpeningStock(rs.getFloat("opening_Stock"));
						createNewProduct.setTxtUnitOfMeasure(rs.getString("unit_Of_Measure"));
						createNewProduct.setTxtReorderlevel(rs.getString("reorder_Level"));
						
						productList.add(createNewProduct);
						return createNewProduct;
					}

				});
		return prodList;
		}catch(Exception e)
		{
			return null;
		}
}
	@Override
	public int sendMail(ComposeMail composeMail) 
	{
		try{
			String sql="select comp_Mail from comp_details";
			final String sendermailid=(String) jdbcTemplate.queryForObject(sql,String.class);
			Properties props = new Properties();
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.host", "smtp.mandrillapp.com");
			props.put("mail.smtp.port", "587");
	 
			Session session = Session.getInstance(props,
			  new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("jelastics.refo1@gmail.com","G3Oa7nuA5ItYeUWpRdbjXg");
				}
			  });
	 
			try {
	 
				MimeMessage message = new MimeMessage(session);		
				MimeMessageHelper helper = new MimeMessageHelper(message, true);
			
				helper.setFrom(sendermailid);	
				message.addRecipients(Message.RecipientType.TO, InternetAddress.parse(composeMail.getMailTo()));
				message.addRecipients(Message.RecipientType.CC, InternetAddress.parse(composeMail.getMailCC()));
				message.addRecipients(Message.RecipientType.BCC, InternetAddress.parse(composeMail.getMailBCC()));
				helper.setSubject(composeMail.getSubject());
				helper.setText(String.format(
					composeMail.getBody()));
				
				String path = System.getProperty("user.dir");
				String attachment = composeMail.getAttachment(); 
				
				helper.addAttachment("Payment Advice",new File(path+"/"+attachment));
				//helper.addAttachment(composeMail.getId(),new File(path+"/"+composeMail.getAttachment()+"/ Payment Advice.pdf"));
				Transport.send(message);
				File file=new File(path+"/"+attachment);
			       file.delete();
	 
			} catch (MessagingException e) {
				throw new RuntimeException(e);
			}
			
			 return 1;    
			}catch(Exception e)
			{
				System.out.println(e); 
				return 0;
			}
	}

}
