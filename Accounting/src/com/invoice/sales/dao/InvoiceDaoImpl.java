package com.invoice.sales.dao;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCountCallbackHandler;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.invoice.accounting.beans.JournalDetails;
import com.invoice.accounting.beans.Taxes;
import com.invoice.customer.beans.Customer;
import com.invoice.inventory.beans.CreateNewProduct;
import com.invoice.sales.beans.DeliveryChallan;
import com.invoice.sales.beans.DeliveryChallanDetails;
import com.invoice.sales.beans.Details;
import com.invoice.sales.beans.Invoice;
import com.invoice.sales.beans.LinkedTaxDetails;
import com.invoice.sales.beans.Order;
import com.invoice.sales.beans.Receipts;
import com.invoice.sales.beans.TaxDetailsList;


@Component(value="invoiceDao")
public class InvoiceDaoImpl implements InvoiceDao {

	private JdbcTemplate jdbcTemplate;
	
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	@Autowired
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	@Override
	public List<Invoice> show() {
		try{
		String sql="select * from vsalesinvoice where sales_Invoice_Status='Active' group by sales_Invoice_Id ASC";		
		final List<Invoice> invoiceList=getJdbcTemplate().query(sql, new RowMapper<Invoice>() {
		private List<Invoice> salesInvoiceList=new ArrayList<Invoice>();
		public Invoice mapRow(ResultSet rs,int rowNo)throws SQLException
		{
			Invoice invoice=new Invoice();
			invoice.setTxtInvID(rs.getString("sales_Invoice_Id"));
			invoice.setOrderId(rs.getString("sales_order_Id"));
			invoice.setTxtCName(rs.getString("customer_Name"));
			DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy"); 
		    String inv_Date=dateFormat.format(rs.getDate("sales_Invoice_Date"));
			invoice.setTxtDate(inv_Date);
			String inv_Due_Date=dateFormat.format(rs.getDate("sales_Invoice_Due_Date"));
			invoice.setTxtDueDate(inv_Due_Date);
			invoice.setTxtAmtPayble(rs.getFloat("sales_Invoice_Amt_Payable"));
			float invBal=rs.getFloat("sales_Invoice_Balance");
			if(invBal==0)
			{
				invoice.setOc_status("C");
			}
			else
			{
				invoice.setOc_status("O");
			}
			java.sql.Timestamp effdate=new java.sql.Timestamp(new java.util.Date().getTime());
			String dt=(effdate).toString();
			invoice.setCurrDate(dt.substring(0,10));
			salesInvoiceList.add(invoice);
			return invoice;
		}	
	});		
		return invoiceList;	
		}catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public int save(Invoice invoice) {		
		int i=0,i1=0,i2=0,i3=0,i4=0,i5=0,i6=0,ip=0,i7=0,i8=0;
		String status="Active";		
		String taxId="";
		java.sql.Timestamp updateDate=new java.sql.Timestamp(new java.util.Date().getTime());	 
		try{
		
		String productID="";
		float avalQty = 0;
		float qty = 0;
		List<Details> productList1=invoice.getProductList();
		for (Details details : productList1)
		{
			productID = details.getItemCode();
			qty = details.getQuantity();
			avalQty = jdbcTemplate.queryForObject("select opening_Stock from product_master where product_Id = '"+productID+"'", Float.class);
		}
		if(qty > avalQty)
		{
			return 0;
		}
		else
		{
			String url="insert into sales_invoice_header value('"+invoice.getTxtInvID()+"','"+invoice.getTxtCName()+"','"+invoice.getOrderId()+"','"+invoice.getTxtDate()+"','"+invoice.getTxtDueDate()+"','"+invoice.getTxtBillAddr()+"','"+invoice.getTxtShipAddr()+"','"+invoice.getTxtCPONo()+"','"+invoice.getTxtTransCost()+"','"+invoice.getTxtSubTotal()+"','"+invoice.getRadio()+"','"+invoice.getTxtDiscount()+"','"+invoice.getTxtDisTotal()+"','"+invoice.getTxtTaxTotal()+"','"+invoice.getTxtRoundOff()+"','"+invoice.getTxtAmtPayble()+"','"+invoice.getTxtAmtPayble()+"','"+invoice.getTxtpubNotes()+"','"+invoice.getTxtpvtNotes()+"','"+invoice.getCreatedBy()+"','"+invoice.getCreatedBy()+"','"+status+"','"+updateDate+"')";		
			i=jdbcTemplate.update(url); 
			
			if(invoice.getApplyTax() != null)
			{
				List<TaxDetailsList> taxList=invoice.getTaxList();
				if(taxList!=null)
				{
					taxList.remove(0);			
					for (TaxDetailsList inv_taxList : taxList)			
					{	
						String taxID=inv_taxList.getTaxType();
						taxId=taxID.substring((taxID.indexOf("^"))+1, taxID.length());				
						String sql1="insert into sales_invoice_tax_details value('"+invoice.getTxtInvID()+"','"+taxId+"','"+inv_taxList.getTxtTaxValue()+"','"+inv_taxList.getTxtprevLinkTax()+"')";
						i1= jdbcTemplate.update(sql1);
					}
				}
				List<LinkedTaxDetails> linkedTaxList=invoice.getLinkedTaxList();
				if(!(linkedTaxList.isEmpty()))
				{
					linkedTaxList.remove(0);		
					for (LinkedTaxDetails linkedTaxDetails : linkedTaxList) 
					{				
						String sql4="insert into sales_inv_linked_tax_details value('"+invoice.getTxtInvID()+"','"+linkedTaxDetails.getmTaxID()+"','"+linkedTaxDetails.getLinkedTaxId()+"','"+linkedTaxDetails.getSerLinkedTax()+"')";
						ip= jdbcTemplate.update(sql4);
					}
				}
			}
	       List<Details> productList=invoice.getProductList();
			for (Details details : productList)
			{
				String sql1="insert into sales_invoice_details value('"+details.getSrNo()+"','"+invoice.getTxtInvID()+"','"+details.getItemCode()+"','"+details.getQuantity()+"','"+details.getUnitPrice()+"','"+details.getItemTotal()+"')";
				 i2= jdbcTemplate.update(sql1);
				 String updateEstHeaderUrl="UPDATE sales_order_details SET dispatch_Quantity='"+details.getQuantity()+"' WHERE sales_Order_Id='"+invoice.getOrderId()+"'";
				 i3=jdbcTemplate.update(updateEstHeaderUrl);
			}
			 String journal_Id=genrateJId();		
			 String source="Sales";
			 String urlj="insert into journal_header value('"+journal_Id+"','"+source+"','"+invoice.getTxtInvID()+"','"+invoice.getTxtDate()+"','V','Being Goods Sale on Credit','2','"+invoice.getTxtAmtPayble()+"','"+invoice.getTxtAmtPayble()+"')";
			 i4=jdbcTemplate.update(urlj); 		
			 String accountNo=jdbcTemplate.queryForObject("select account_No from customer_header where customer_ID='"+invoice.getTxtCName()+"'",String.class);
			 String urlLine1="insert into journal_details value('1','"+journal_Id+"','"+accountNo+"','D','"+invoice.getTxtAmtPayble()+"')";
			 i5=jdbcTemplate.update(urlLine1);
			 String updateBalUrl1="UPDATE accounts_chart SET opeinig_Balance=opeinig_Balance+'"+invoice.getTxtAmtPayble()+"' where account_No='"+accountNo+"'";
			 i7=jdbcTemplate.update(updateBalUrl1);
			 String urlLine2="insert into journal_details value('2','"+journal_Id+"','107','C','"+invoice.getTxtAmtPayble()+"')";
			 i6=jdbcTemplate.update(urlLine2);
			 String updateBalUrl2="UPDATE accounts_chart SET opeinig_Balance=opeinig_Balance-'"+invoice.getTxtAmtPayble()+"' where account_No='107'";
			 i8=jdbcTemplate.update(updateBalUrl2);
			 
			 String updateOrderStatus="update sales_order_header set invoice_Created='Yes',"+"oc_status='C' where sales_Order_Id='"+invoice.getOrderId()+"'";
			 jdbcTemplate.update(updateOrderStatus);
			 
			if(i>=1 && i2>=1 && i3>=1 && i4>=1 && i5>=1 && i6>=1 && i7>=1 && i8>=1)
			{
				return 1;
			}
			else if(i1>0)
			{
				return 1;
			}
			else if(ip > 0)
			{
				return 1;
			}
	      else
	      	{
	    	    return 0;
	      	}
		}
	
		
		}catch(Exception e)
		{
			System.out.println(e);
			return 0;
		}
	}
	@Override
	public List<Invoice> editInvoice(String invoiceId) {
		final String invId=invoiceId;
				try{
		String sql="select * from vsalesinvoice where sales_Invoice_Id='"+invoiceId+"'  group by sales_Invoice_Sr_No";		
		return jdbcTemplate.query(sql, new RowMapper<Invoice>() {
			List<Details> invoiceDetails =new ArrayList<Details>();
			@Override
			public Invoice mapRow(ResultSet rs, int arg1) throws SQLException {
				Invoice invoice=new Invoice();
				Details invDetails=new Details();
				invoice.setTxtInvID(rs.getString("sales_Invoice_Id"));
				invoice.setTxtCName(rs.getString("customer_Name"));	
				invoice.setOrderId(rs.getString("sales_order_Id"));	
				invoice.setTxtBillAddr(rs.getString("bill_To"));
				invoice.setTxtShipAddr(rs.getString("ship_To"));
				invoice.setTxtDate(rs.getString("sales_Invoice_Date"));
				invoice.setTxtDueDate(rs.getString("sales_Invoice_Due_Date"));
				invoice.setTxtCPONo(rs.getString("cust_PO_No"));
				invoice.setTxtTransCost(rs.getFloat("sales_Invoice_Charges"));				
				invoice.setTxtSubTotal(rs.getFloat("sales_Invoice_sub_Total"));	
				invoice.setRadio(rs.getString("discount_Type"));
				invoice.setTxtDiscount(rs.getFloat("discount_Value"));
				invoice.setTxtDisTotal(rs.getFloat("sales_Invoice_Discounted_Total"));
				invoice.setTxtTaxTotal(rs.getFloat("total_Tax"));
				invoice.setTxtRoundOff(rs.getString("round_Off"));
				invoice.setTxtAmtPayble(rs.getFloat("sales_Invoice_Amt_Payable"));
				invoice.setTxtpubNotes(rs.getString("sales_Invoice_PublicNote"));
				invoice.setTxtpvtNotes(rs.getString("sales_Invoice_PrivateNote"));
				float invBal=rs.getFloat("sales_Invoice_Balance");
				if(invBal==0)
				{
					invoice.setOc_status("C");
				}
				else
				{
					invoice.setOc_status("O");
				}
				invDetails.setSrNo(rs.getInt("sales_Invoice_Sr_No"));
				invDetails.setProdId(rs.getString("product_Id"));
				String prodId=rs.getString("product_Id");
				float aQty=jdbcTemplate.queryForObject("select opening_Stock from product_master where product_Id='"+prodId+"'", Float.class);
				invDetails.setItemCode(rs.getString("prod_Name"));
				invDetails.setDes(rs.getString("description"));
				invDetails.setQuantity(rs.getInt("sales_Invoice_Quantity"));
				invDetails.setUnitPrice(rs.getFloat("sales_Invoice_UnitPrice"));				
				invDetails.setItemTotal(rs.getFloat("sales_Invoice_Total"));
				invoice.setCustId(rs.getString("customer_ID"));	
				invoice.setCustVatNo(rs.getString("vat_No"));
				invDetails.setUnit(rs.getString("unit_Of_Measure"));			
				invDetails.setaQty(aQty);
				int count=jdbcTemplate.queryForObject("select count(invoice_Id) from delivery_challan_header where invoice_Id='"+invId+"'", Integer.class);
				String productId="";
				int qty=0;
				if(count>0)
				{
					for (Details pList : (invProductList(invId))) 
					{
						productId=pList.getItemCode();
						qty=pList.getQuantity();
						for (DeliveryChallanDetails dPList : (challProductList(invId))) {
							String pid=dPList.getItemCode();
							int quantity=dPList.getQuantity();
							if(productId.equals(pid) && qty==quantity)
							{
								invoice.setDstatus("Completed");
							}
							else
							{
								invoice.setDstatus("Partially Completed");
							}
						}
					}		
					int totalQty=0;
					totalQty=jdbcTemplate.queryForObject("select sum(deli_Ch_Quantity) from vdeliverychallan where product_Id='"+prodId+"' and invoice_Id='"+invId+"'", Integer.class);
					if(rs.getInt("sales_Invoice_Quantity")<totalQty)
					{
						for (DeliveryChallanDetails dPList : (challProductList(invId))) 
						{
							int remainingQty=(rs.getInt("sales_Invoice_Quantity")-(dPList.getQuantity()));
							invDetails.setrQty(remainingQty);
							invDetails.setdQty(dPList.getQuantity());					
						}
					}
					else
					{
						invDetails.setrQty(0);
						invDetails.setdQty(totalQty);
					}
				}
				else
				{
					invoice.setDstatus("Pending");
				}
				invoiceDetails.add(invDetails);
				invoice.setProductList(invoiceDetails);				
				return invoice;
			}
		});
		}catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public List<Invoice> editInvoiceTaxDetails(String invoiceId) {
		try{
			final String invId=invoiceId;
			RowCountCallbackHandler countCallback1 = new RowCountCallbackHandler();
			 jdbcTemplate.query("select * FROM vsalesinvtaxdetails where sales_Invoice_Id='"+invId+"'", countCallback1);
			 int counter1= countCallback1.getRowCount();
			 if(counter1!=0)
			 {			
			String sql="select * from vsalesinvtaxdetails where sales_Invoice_Id='"+invoiceId+"'";		
			return jdbcTemplate.query(sql, new RowMapper<Invoice>() {			
			List<TaxDetailsList> taxesList=new ArrayList<TaxDetailsList>();
			@Override
			public Invoice mapRow(ResultSet rs, int arg1) throws SQLException {
				Invoice invoice=new Invoice();				
				TaxDetailsList taxDetailsList=new TaxDetailsList();
				taxDetailsList.setTaxId(rs.getString("tax_Id"));
				String taxId=rs.getString("tax_Id");
				taxDetailsList.setTaxType(rs.getString("tax_Name"));
				taxDetailsList.setTaxRate(rs.getString("sales_tax_rate"));
				taxDetailsList.setTxtTaxValue(rs.getFloat("tax_Amount"));
				taxDetailsList.setTxtprevLinkTax(rs.getFloat("linked_Tax_Amt"));
				RowCountCallbackHandler countCallback = new RowCountCallbackHandler();
				 jdbcTemplate.query("select * FROM linkedtax where taxID='"+taxId+"'", countCallback);
				int counter= countCallback.getRowCount();
				taxDetailsList.setCounter(counter);
				taxesList.add(taxDetailsList);				
				invoice.setTaxList(taxesList);
				return invoice;
			}
		});
			 }
			 else
			 {
				 return null;
			 }
		}catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public List<Invoice> editInvoiceLinkedTaxDetails(String invoiceId) {
		try{
		String sql="select * from vsalesinvlinkedtaxdetails where sales_Inv_Id='"+invoiceId+"'";		
		return jdbcTemplate.query(sql, new RowMapper<Invoice>() {			
			List<LinkedTaxDetails> linkedTaxesList=new ArrayList<LinkedTaxDetails>();
			@Override
			public Invoice mapRow(ResultSet rs, int arg1) throws SQLException {
				Invoice invoice=new Invoice();				
				LinkedTaxDetails linkedTaxDetailsList=new LinkedTaxDetails();
				linkedTaxDetailsList.setmTaxID(rs.getString("tax_Id"));				
				linkedTaxDetailsList.setmTaxAmt(rs.getFloat("tax_Amount"));
				linkedTaxDetailsList.setLinkedTaxId(rs.getString("linked_Tax_Id"));
				linkedTaxDetailsList.setLinkedTaxName(rs.getString("taxName"));
				linkedTaxDetailsList.setLinkedTaxRate(rs.getFloat("linked_Tax_Rate"));
				linkedTaxDetailsList.setSerLinkedTax(rs.getFloat("linked_Tax_Amt"));				
				linkedTaxesList.add(linkedTaxDetailsList);				
				invoice.setLinkedTaxList(linkedTaxesList);
				
				return invoice;
			}
		});
		}catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public int updateInvoice(Invoice invoice) {	
		
		String account_No="",type="";
		float amount=0;
		try{
		String journalId=jdbcTemplate.queryForObject("select journal_Id from journal_header where refrence='"+invoice.getTxtInvID()+"' and journal_Header_Status='V'",String.class);		
		float amt=jdbcTemplate.queryForObject("select totalDebit from journal_header where refrence='"+invoice.getTxtInvID()+"' and journal_Header_Status='V'",Float.class);
		String up="update journal_header set journal_Header_Status='D',"+"description='Being Updated Invoice Journal Deleted' where journal_Id='"+journalId+"'";
		jdbcTemplate.update(up);
		String journal_Id=genrateJId();	
		int k=1;
		 DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");	     
	     Date date = new Date();	     
	     String dt=dateFormat.format(date);
		String urlj="insert into journal_header value('"+journal_Id+"','Sales','"+invoice.getTxtInvID()+"','"+dt+"','R','Being Updated Invoice Journal Reversed','2','"+amt+"','"+amt+"')";
		jdbcTemplate.update(urlj); 
		List<JournalDetails> jList=getAccountDetails(journalId);
		for (JournalDetails journalDetails : jList) {			
			account_No=journalDetails.getAccno();
			type=journalDetails.getTxtType();
			if(type.equals("D"))
			{
				type="C";
			}
			else
			{
				type="D";
			}
			amount=journalDetails.getTxtAmount();	

				 String urlLine1="insert into journal_details value('"+k+"','"+journal_Id+"','"+account_No+"','"+type+"','"+amount+"')";
				 jdbcTemplate.update(urlLine1);
				 if(type.equals("D"))
				 {
						 String updateBalUrl1="UPDATE accounts_chart SET opeinig_Balance=opeinig_Balance-'"+amount+"' where account_No='"+account_No+"'";
						 jdbcTemplate.update(updateBalUrl1);
				 }
				 if(type.equals("C"))
				 {
						 String updateBalUrl2="UPDATE accounts_chart SET opeinig_Balance=opeinig_Balance+'"+amount+"' where account_No='"+account_No+"'";
						 jdbcTemplate.update(updateBalUrl2);					
				 }
		k++;
		}
		
		int i=0,i1=0,ip=0,i3=0,i4=0,i5=0,i6=0,i7=0,i8=0;
		java.sql.Timestamp updateDate=new java.sql.Timestamp(new java.util.Date().getTime());
		String updateEstHeaderUrl="UPDATE sales_invoice_header SET sales_Invoice_Date='"+invoice.getTxtDate()+"',"+"sales_Invoice_Due_Date='"+invoice.getTxtDueDate()+"',"+"bill_To='"+invoice.getTxtBillAddr()+"',"+"ship_To='"+invoice.getTxtShipAddr()+"',"+"cust_PO_No='"+invoice.getTxtCPONo()+"',"+"sales_Invoice_Charges='"+invoice.getTxtTransCost()+"',"+"sales_Invoice_Sub_Total='"+invoice.getTxtSubTotal()+"',"+"discount_Type='"+invoice.getRadio()+"',"+"discount_Value='"+invoice.getTxtDiscount()+"',"+"sales_Invoice_Discounted_Total='"+invoice.getTxtDisTotal()+"',"+"total_Tax='"+invoice.getTxtTaxTotal()+"',"+"round_Off='"+invoice.getTxtRoundOff()+"',"+"sales_Invoice_Amt_Payable='"+invoice.getTxtAmtPayble()+"',"+"sales_Invoice_Balance='"+invoice.getTxtAmtPayble()+"',"+"sales_Invoice_PublicNote='"+invoice.getTxtpubNotes()+"',"+"sales_Invoice_PrivateNote='"+invoice.getTxtpvtNotes()+"',"+"sales_Invoice_Updated_By='"+invoice.getUpdatedBy()+"',"+"sales_Invoice_Update_Date='"+updateDate+"' WHERE sales_Invoice_Id='"+invoice.getTxtInvID()+"'";
		i=jdbcTemplate.update(updateEstHeaderUrl);
		String taxId="";
		deleteList(invoice.getTxtInvID());
		deleteTaxDetailsList(invoice.getTxtInvID());
		deleteLinkedTaxDetailsList(invoice.getTxtInvID());
		if(invoice.getApplyTax() != null)
		{
			List<TaxDetailsList> taxList=invoice.getTaxList();	
			taxList.remove(0);		
			for (TaxDetailsList inv_taxList : taxList)			
			{	
				String taxID=inv_taxList.getTaxType();
				taxId=taxID.substring((taxID.indexOf("^"))+1, taxID.length());				
				String sql1="insert into sales_invoice_tax_details value('"+invoice.getTxtInvID()+"','"+taxId+"','"+inv_taxList.getTxtTaxValue()+"','"+inv_taxList.getTxtprevLinkTax()+"')";
				i1= jdbcTemplate.update(sql1);
			}			
			List<LinkedTaxDetails> linkedTaxList=invoice.getLinkedTaxList();
			if(!(linkedTaxList.isEmpty()))
			{
				linkedTaxList.remove(0);		
				for (LinkedTaxDetails linkedTaxDetails : linkedTaxList) 
				{					
					String sql4="insert into sales_inv_linked_tax_details value('"+invoice.getTxtInvID()+"','"+linkedTaxDetails.getmTaxID()+"','"+linkedTaxDetails.getLinkedTaxId()+"','"+linkedTaxDetails.getSerLinkedTax()+"')";
					ip= jdbcTemplate.update(sql4);
				}
			}
		}
       List<Details> productList=invoice.getProductList();
		for (Details details : productList)			
		{
			String sql1="insert into sales_invoice_details value('"+details.getSrNo()+"','"+invoice.getTxtInvID()+"','"+details.getItemCode()+"','"+details.getQuantity()+"','"+details.getUnitPrice()+"','"+details.getItemTotal()+"')";
			 i3= jdbcTemplate.update(sql1);
			 String detailsUrl="UPDATE sales_order_details SET dispatch_Quantity='"+details.getQuantity()+"' WHERE sales_Order_Id='"+invoice.getOrderId()+"'";
			 i4=jdbcTemplate.update(detailsUrl);
		}
		 String journal_Id1=genrateJId();		
		 String source="Sales";
		 String urlj1="insert into journal_header value('"+journal_Id1+"','"+source+"','"+invoice.getTxtInvID()+"','"+invoice.getTxtDate()+"','V','Being Goods Sale on Credit','2','"+invoice.getTxtAmtPayble()+"','"+invoice.getTxtAmtPayble()+"')";
		 int i41=jdbcTemplate.update(urlj1);
		 String accountNo=jdbcTemplate.queryForObject("select account_No from customer_header where customer_ID='"+invoice.getTxtCName()+"'",String.class);
		 String urlLine1="insert into journal_details value('1','"+journal_Id1+"','"+accountNo+"','D','"+invoice.getTxtAmtPayble()+"')";
		 i5=jdbcTemplate.update(urlLine1);
		 String updateBalUrl1="UPDATE accounts_chart SET opeinig_Balance=opeinig_Balance+'"+invoice.getTxtAmtPayble()+"' where account_No='"+accountNo+"'";
		 i7=jdbcTemplate.update(updateBalUrl1);
		 String urlLine2="insert into journal_details value('2','"+journal_Id1+"','107','C','"+invoice.getTxtAmtPayble()+"')";
		 i6=jdbcTemplate.update(urlLine2);
		 String updateBalUrl2="UPDATE accounts_chart SET opeinig_Balance=opeinig_Balance-'"+invoice.getTxtAmtPayble()+"' where account_No='107'";
		 i8=jdbcTemplate.update(updateBalUrl2);
		
		
		if(i>=1 && i3>=1 && i4>=1 && i41>=1 && i5>=1 && i6>=1 && i7>=1 && i8>=1)
	       {
			return 1;
	      }
		else if(i1 > 0)
		{
			return 1;
		}
		else if(ip > 0)
		{
			return 1;
		}
	       else
	       {
	    	   return 0;
	       }
		}catch(Exception e)
		{
			System.out.println(e);
			return 0;
		}
	}	
	private void deleteList(String invoiceId){
		String deleteListUrl="DELETE FROM sales_invoice_details WHERE sales_Invoice_Id= '"+invoiceId+"'";
		jdbcTemplate.update(deleteListUrl);
	}
	private void deleteTaxDetailsList(String invoiceId){
		String deleteListUrl="DELETE FROM sales_invoice_tax_details WHERE sales_Inv_Id= '"+invoiceId+"'";
		jdbcTemplate.update(deleteListUrl);
	}
	private void deleteLinkedTaxDetailsList(String invoiceId){
		String deleteListUrl="DELETE FROM sales_inv_linked_tax_details WHERE sales_Inv_Id= '"+invoiceId+"'";
		jdbcTemplate.update(deleteListUrl);
	}
	
	@Override
	public List<CreateNewProduct> retriveProductList() {
		try{
		String sql="select * from product_master where prod_Type='Resale Product' or prod_Type='Sale Item' and status='Active' ";		
		final List<CreateNewProduct> invProdList=getJdbcTemplate().query(sql, new RowMapper<CreateNewProduct>() {
		private List<CreateNewProduct> invoiceProdList=new ArrayList<CreateNewProduct>();
		public CreateNewProduct mapRow(ResultSet rs,int rowNo)throws SQLException
		{
			CreateNewProduct createNewProduct=new CreateNewProduct();
			createNewProduct.setProductId(rs.getString("product_Id"));
			createNewProduct.setTxtName(rs.getString("prod_Name"));			
			invoiceProdList.add(createNewProduct);
			return createNewProduct;
		}	
	});		
		return invProdList;
		}catch(Exception e)
		{
			return null;
		}
}
	@Override
	public List<Customer> retriveCustomerList() {
		try{
		String sql="select customer_ID,customer_Name from customer_header where customer_Status='Active' order by customer_Name ASC";		
		final List<Customer> custList=getJdbcTemplate().query(sql, new RowMapper<Customer>() {
		private List<Customer> customerList=new ArrayList<Customer>();
		public Customer mapRow(ResultSet rs,int rowNo)throws SQLException
		{
			Customer customer=new Customer();
			customer.setTxtCustID(rs.getString("customer_ID"));
			customer.setTxtCustName(rs.getString("customer_Name"));			
			customerList.add(customer);
			return customer; 
		}	
	});		
		return custList;
		}catch(Exception e)
		{
			return null;
		}
}
	@Override
	public Invoice generateInvId() {
		String invId="";
		try{
		RowCountCallbackHandler countCallback = new RowCountCallbackHandler();  // not reusable
		 jdbcTemplate.query("select * from sales_invoice_header", countCallback);
		 int count = countCallback.getRowCount();
		 count++;		
		 if(count<10)
		 {
			 invId="INV00"+count;
		 }
		 else
		 {
			 if(count<99)
			 {
				 invId = "INV0" + count;
			 }
			 else
				{
				 invId = "INV" + count;
				}
		 }
		 Invoice invoice=new Invoice();
		 invoice.setTxtInvID(invId);
		return invoice;
		}catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public List<DeliveryChallan> retriveChlList() {
		try{
		String sql="select deli_Ch_Id from delivery_challan_header";		
		final List<DeliveryChallan> chlList=getJdbcTemplate().query(sql, new RowMapper<DeliveryChallan>() {
		private List<DeliveryChallan> challanList=new ArrayList<DeliveryChallan>();
		public DeliveryChallan mapRow(ResultSet rs,int rowNo)throws SQLException
		{
			DeliveryChallan deliveryChallan=new DeliveryChallan();
			deliveryChallan.setChallanID(rs.getString("deli_Ch_Id"));					
			challanList.add(deliveryChallan);
			return deliveryChallan; 
		}	
	});		
		return chlList;
		}catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public List<Taxes> retriveTaxList() {
		try{
		String sql="select * from taxes where tax_apply_to='S' OR tax_apply_to='S,P' OR tax_apply_to='B'";		
		final List<Taxes> txList=getJdbcTemplate().query(sql, new RowMapper<Taxes>() {
		private List<Taxes> taxList=new ArrayList<Taxes>();
		public Taxes mapRow(ResultSet rs,int rowNo)throws SQLException
		{
			Taxes taxes=new Taxes();
			taxes.setTaxId(rs.getString("tax_id"));
			taxes.setTaxRate(rs.getFloat("sales_tax_rate"));
			taxes.setTaxName(rs.getString("tax_Name"));			
			taxList.add(taxes);
			return taxes; 
		}	
	});		
		return txList;
		}catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public int deleteInvoice(String invoiceId,float amt) {			
		//int j=0,jd=0,d=0,c=0;
		String account_No="",type="";
		float amount=0;
		try{
		String journalId=jdbcTemplate.queryForObject("select journal_Id from journal_header where refrence='"+invoiceId+"' and journal_Header_Status='V'",String.class);		
		String journal_Id=genrateJId();	
		int i=1;
		 DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");	     
	     Date date = new Date();	     
	     String dt=dateFormat.format(date);
		String urlj="insert into journal_header value('"+journal_Id+"','Sales','"+invoiceId+"','"+dt+"','R','Being Deleted Invoice Reversed','2','"+amt+"','"+amt+"')";
		jdbcTemplate.update(urlj); 
		List<JournalDetails> jList=getAccountDetails(journalId);
		for (JournalDetails journalDetails : jList) {			
			account_No=journalDetails.getAccno();
			type=journalDetails.getTxtType();
			if(type.equals("D"))
			{
				type="C";
			}
			else
			{
				type="D";
			}
			amount=journalDetails.getTxtAmount();	

				 String urlLine1="insert into journal_details value('"+i+"','"+journal_Id+"','"+account_No+"','"+type+"','"+amount+"')";
				 jdbcTemplate.update(urlLine1);
				 if(type.equals("D"))
				 {
						 String updateBalUrl1="UPDATE accounts_chart SET opeinig_Balance=opeinig_Balance-'"+amount+"' where account_No='"+account_No+"'";
						 jdbcTemplate.update(updateBalUrl1);
				 }
				 if(type.equals("C"))
				 {
						 String updateBalUrl2="UPDATE accounts_chart SET opeinig_Balance=opeinig_Balance+'"+amount+"' where account_No='"+account_No+"'";
						 jdbcTemplate.update(updateBalUrl2);					
				 }
		i++;
		}
		
		String updateEstHeaderUrl="UPDATE sales_invoice_header SET sales_Invoice_Status='Inactive' WHERE sales_Invoice_Id='"+invoiceId+"'";
		int k=jdbcTemplate.update(updateEstHeaderUrl);
		if(k > 0)//if(k > 0 && j>0 && jd>0 && d>0 && c>0)
		{
			return 1;
		}
		else
		{
			return 0;
		}
		}catch(Exception e)
		{
			return 0;
		}
	}
	private List<JournalDetails> getAccountDetails(String journalId)
	{
		try{
		String url1="select account_No,type,amount from journal_details where journal_Id='"+journalId+"'";
		final List<JournalDetails> jList=getJdbcTemplate().query(url1, new RowMapper<JournalDetails>()
			{
			List<JournalDetails> jDList=new ArrayList<JournalDetails>();
				@Override
				public JournalDetails mapRow(ResultSet rs, int arg1)throws SQLException 
				{
					JournalDetails journalDetails=new JournalDetails();
					journalDetails.setAccno(rs.getString("account_No"));
					journalDetails.setTxtType(rs.getString("type"));
					journalDetails.setTxtAmount(rs.getFloat("amount"));
					jDList.add(journalDetails);
					return journalDetails;
				}
			
				});
		return jList;		
		}catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public List<Order> retriveOrderList() {
		try{
		String sql="select sales_Order_Id from sales_order_header";		
		final List<Order> OrdList=getJdbcTemplate().query(sql, new RowMapper<Order>() {
		private List<Order> OrderList=new ArrayList<Order>();
		public Order mapRow(ResultSet rs,int rowNo)throws SQLException
		{
			Order order=new Order();
			order.setTxtSOID(rs.getString("sales_Order_Id"));						
			OrderList.add(order);
			return order;
		}	
	});		
		return OrdList;
		}catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public List<Customer> retriveCustInfo(String custId,String id) {
		final String path = "Sales Invoice.pdf";		
		final String id1=id;
		try{
		String sql="select customer_ID,customer_Email,customer_Name from customer_header where customer_ID='"+custId+"'";
		final List<Customer> custInfo=getJdbcTemplate().query(sql, new RowMapper<Customer>() {
		public Customer mapRow(ResultSet rs,int rowNo)throws SQLException
			{
			Customer custoInfo=new Customer();
			custoInfo.setTxtCustID(rs.getString("customer_ID"));
			custoInfo.setTxtMail1(rs.getString("customer_Email"));
			custoInfo.setTxtCustName(rs.getString("customer_Name"));
			custoInfo.setAttachment(path);
			custoInfo.setId(id1);
			custoInfo.setSubject("Sales Invoice");
			String regards=jdbcTemplate.queryForObject("select comp_Name from comp_details",String.class);
			custoInfo.setRegards(regards);	
			custoInfo.setBodyPart("\t New Sales Invoice is Generated For More Details\n Please Find The Attached PDF File.\n\nThank You..");
				return custoInfo;
			}	
		});		
			return custInfo;
		}catch(Exception e)
		{
			return null;
		}
	}
	private String genrateJId()
	{
		try{
		String journal_Id = "";
		RowCountCallbackHandler countCallback = new RowCountCallbackHandler();
		jdbcTemplate.query("select * from journal_header", countCallback);
		int count = countCallback.getRowCount();
		count++; 		
		if (count < 10) {
			journal_Id = "JID00" + count;
		} else 
		{
			if (count < 99) {
				journal_Id = "JID0" + count;
			} else 
			{
				journal_Id = "JID" + count;
			}
		}
		return journal_Id;
	
	}catch(Exception e)
	{
		return null;
	}
	}
	@Override
	public List<Receipts> showReceipts(String invoiceId) {
		try{
			int cnt=jdbcTemplate.queryForObject("select count(*) from vreceipt where invoice_Id='"+invoiceId+"' and status='Active'", Integer.class);
			if(cnt>0)
			{
				String sql="select * from vreceipt where invoice_Id='"+invoiceId+"' and status='Active'";		
				final List<Receipts> rList=getJdbcTemplate().query(sql, new RowMapper<Receipts>() {
				private List<Receipts> salesReceiptsList=new ArrayList<Receipts>();
				public Receipts mapRow(ResultSet rs,int rowNo)throws SQLException
				{
					Receipts receipts=new Receipts();
					receipts.setReceiptsNo(rs.getString("receipts_Id"));
					receipts.setInvoiceId(rs.getString("invoice_Id"));
					if(rs.getDate("receipts_date") != null)
					{
						DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy"); 
					    String rece_Date=dateFormat.format(rs.getDate("receipts_date"));
					    receipts.setDate(rece_Date);
					}
				    receipts.setPayMode(rs.getString("payment_Mode"));
				    receipts.setAmount(rs.getString("amount"));
				    receipts.setCustomer_Name(rs.getString("customer_Name"));			   
				    salesReceiptsList.add(receipts);
					return receipts;
				}				
				});	
				return rList;
			}			
			else
			{
				return null;
			}			
			}catch(Exception e)
			{
				System.out.println(e);
				return null;
			}
	}
	private List<Details> invProductList(String invoiceId)
	{
		try{
			String sql="select product_Id,sales_Invoice_Quantity from sales_invoice_details where sales_Invoice_Id='"+invoiceId+"'";		
			final List<Details> pList=getJdbcTemplate().query(sql, new RowMapper<Details>() {
			private List<Details> invPList=new ArrayList<Details>();
			public Details mapRow(ResultSet rs,int rowNo)throws SQLException
			{
				Details details=new Details();
				details.setItemCode(rs.getString("product_Id"));
				details.setQuantity(rs.getInt("sales_Invoice_Quantity"));
				invPList.add(details);
				return details;
			}	
		});		
			return pList;
			}catch(Exception e)
			{
				return null;
			}
	}
	private List<DeliveryChallanDetails> challProductList(String invoiceId) 
	{
		String chId="";		
		try{
			int count=jdbcTemplate.queryForObject("Select count(deli_Ch_Id) from delivery_challan_header where invoice_Id='"+invoiceId+"'",Integer.class);
			List<DeliveryChallanDetails> pList=new ArrayList<DeliveryChallanDetails>();
			if(count==1)
			{				
				String challanId=jdbcTemplate.queryForObject("select deli_Ch_Id from delivery_challan_header where invoice_Id='"+invoiceId+"'", String.class);
				String sql="select product_Id,deli_Ch_Quantity from delivery_challan_details where deli_Ch_Id='"+challanId+"'";		
				pList=getJdbcTemplate().query(sql, new RowMapper<DeliveryChallanDetails>() {
				private List<DeliveryChallanDetails> invPList=new ArrayList<DeliveryChallanDetails>();
				public DeliveryChallanDetails mapRow(ResultSet rs,int rowNo)throws SQLException
				{
					DeliveryChallanDetails details=new DeliveryChallanDetails();
					details.setItemCode(rs.getString("product_Id"));
					details.setQuantity(rs.getInt("deli_Ch_Quantity"));
					invPList.add(details);
					return details;
				}	
				});			
			}
			else
			{	
				for (DeliveryChallan challanList : (challanId(invoiceId))) {
					chId=challanList.getChallanID();				
					String sql="select product_Id,deli_Ch_Quantity from delivery_challan_details where deli_Ch_Id='"+chId+"'";		
					pList=getJdbcTemplate().query(sql, new RowMapper<DeliveryChallanDetails>() {
					DeliveryChallanDetails details=new DeliveryChallanDetails();
					private List<DeliveryChallanDetails> invPList=new ArrayList<DeliveryChallanDetails>();
					public DeliveryChallanDetails mapRow(ResultSet rs,int rowNo)throws SQLException
					{						
						details.setItemCode(rs.getString("product_Id"));
						details.setQuantity(rs.getInt("deli_Ch_Quantity"));
						invPList.add(details);
						return details;
					}						
					});	
				}
			}
			return pList;
			}catch(Exception e)
			{
				return null;
			}
	}
	private List<DeliveryChallan> challanId(String invoiceId)
	{
		try{
			String sql="select deli_Ch_Id from delivery_challan_header where invoice_Id='"+invoiceId+"'";		
			final List<DeliveryChallan> chList=getJdbcTemplate().query(sql, new RowMapper<DeliveryChallan>() {
			private List<DeliveryChallan> challanList=new ArrayList<DeliveryChallan>();
			public DeliveryChallan mapRow(ResultSet rs,int rowNo)throws SQLException
			{
				DeliveryChallan deliveryChallan=new DeliveryChallan();
				deliveryChallan.setChallanID(rs.getString("deli_Ch_Id"));				
				challanList.add(deliveryChallan);
				return deliveryChallan;
			}	
		});		
			return chList;
			}catch(Exception e)
			{
				return null;
			}
	}
	@Override
	public List<Details> retriveInvDetails(String invoiceId) {		
		try{
			final String invId=invoiceId;
			String sql="select sales_Invoice_Sr_No,product_Id,prod_Name,unit_Of_Measure,sales_Invoice_Quantity from vsalesinvoice where sales_Invoice_Id='"+invoiceId+"'  group by sales_Invoice_Sr_No";
			final List<Details> invoicePList=getJdbcTemplate().query(sql, new RowMapper<Details>() {
			private List<Details> invPList=new ArrayList<Details>();
			public Details mapRow(ResultSet rs,int rowNo)throws SQLException
			{
				Details invoiceDetails=new Details();
				invoiceDetails.setSrNo(rs.getInt("sales_Invoice_Sr_No"));
				invoiceDetails.setProdId(rs.getString("product_Id"));
				invoiceDetails.setItemCode(rs.getString("prod_Name"));
				invoiceDetails.setUnit(rs.getString("unit_Of_Measure"));
				invoiceDetails.setQuantity(rs.getInt("sales_Invoice_Quantity"));
				int count=jdbcTemplate.queryForObject("select count(invoice_Id) from delivery_challan_header where invoice_Id='"+invId+"'", Integer.class);
				if(count>0)
				{				
					for (DeliveryChallanDetails dPList : (challProductList(invId))) 
					{					
							int remainingQty=(rs.getInt("sales_Invoice_Quantity")-(dPList.getQuantity()));
							invoiceDetails.setrQty(remainingQty);
							invoiceDetails.setdQty(dPList.getQuantity());					
					}
				}
				else
				{
					invoiceDetails.setrQty(rs.getInt("sales_Invoice_Quantity"));
					invoiceDetails.setdQty(0);	
				}
				invPList.add(invoiceDetails);
				return invoiceDetails;
			}	
			});		
			return invoicePList;	
			}catch(Exception e)
			{
				return null;
			}
		}
	@Override
	public List<Invoice> retriveCustomerName(String invoiceId) {
		try{
			String sql="select customer_ID,customer_Name from vsalesinvoice where sales_Invoice_Id='"+invoiceId+"' group by sales_Invoice_Id";
			final List<Invoice> invoiceCName=getJdbcTemplate().query(sql, new RowMapper<Invoice>() {
			private List<Invoice> invCName=new ArrayList<Invoice>();
			public Invoice mapRow(ResultSet rs,int rowNo)throws SQLException
			{
				Invoice invoice=new Invoice();
				invoice.setCustId(rs.getString("customer_ID"));
				invoice.setTxtCName(rs.getString("customer_Name"));
				invCName.add(invoice);
				return invoice;
			}	
			});		
			return invoiceCName;	
			}catch(Exception e)
			{
				return null;
			}
		}
}
