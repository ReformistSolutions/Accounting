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
import com.invoice.accounting.beans.NewAccount;
import com.invoice.customer.beans.Customer;
import com.invoice.sales.beans.Invoice;
import com.invoice.sales.beans.Receipts;


@Component(value="receiptDao")
public class ReceiptDaoImpl implements ReceiptDao{
	
	JdbcTemplate jdbcTemplate;
	
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	@Autowired
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Override
	public int save(Receipts receipts) {
		 String status="Active";
		try{
		 String url="insert into sales_receipts value('"+receipts.getReceiptsNo()+"','"+receipts.getInvoiceId()+"','"+receipts.getFromaccount()+"','"+receipts.getToaccount()+"','"+receipts.getDate()+"','"+receipts.getPayMode()+"','"+receipts.getDescription()+"','"+receipts.getAmount()+"','"+receipts.getTds()+"','"+receipts.getCreatedBy()+"','"+receipts.getCreatedBy()+"','"+status+"')";
		 int i=jdbcTemplate.update(url); 
		
		 String url1="UPDATE sales_invoice_header SET sales_Invoice_Balance=sales_Invoice_Balance-'"+receipts.getAmount()+"' where sales_Invoice_Id='"+receipts.getInvoiceId()+"'";
		 int i1=jdbcTemplate.update(url1);
				
		 	String journal_Id =genrateJId();			
			String source="Sales";
			String urljournal="insert into journal_header value('"+journal_Id+"','"+source+"','"+receipts.getReceiptsNo()+"','"+receipts.getDate()+"','V','Being Payment Received','2','"+receipts.getAmount()+"','"+receipts.getAmount()+"')";
			int i2=jdbcTemplate.update(urljournal);
		 
			String urlLine1="insert into journal_details value('1','"+journal_Id+"','"+receipts.getFromaccount()+"','D','"+receipts.getAmount()+"')";
			int i3=jdbcTemplate.update(urlLine1);
			String updateBalUrl1="UPDATE accounts_chart SET opeinig_Balance=opeinig_Balance-'"+receipts.getAmount()+"' where account_No='"+receipts.getFromaccount()+"'";
			int i4=jdbcTemplate.update(updateBalUrl1);
			String urlLine2="insert into journal_details value('2','"+journal_Id+"','"+receipts.getToaccount()+"','C','"+receipts.getAmount()+"')";
			int i5=jdbcTemplate.update(urlLine2);
			String updateBalUrl2="UPDATE accounts_chart SET opeinig_Balance=opeinig_Balance+'"+receipts.getAmount()+"' where account_No='"+receipts.getToaccount()+"'";
			int i6=jdbcTemplate.update(updateBalUrl2);
			
		 if(i>0 && i1>0 && i2>0 && i3>0 && i4>0 && i5>0 && i6>0)
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

	@Override
	public List<Receipts> show() {
		try{
		String sql="select * from sales_receipts where status='Active'";		
		final List<Receipts> receList=getJdbcTemplate().query(sql, new RowMapper<Receipts>() {
		private List<Receipts> receiptList=new ArrayList<Receipts>();
		public Receipts mapRow(ResultSet rs,int rowNo)throws SQLException
		{
			Receipts receipt=new Receipts();
			receipt.setReceiptsNo(rs.getString("receipts_Id"));
			receipt.setInvoiceId(rs.getString("invoice_Id"));
			receipt.setDate(rs.getString("receipts_date"));
			receipt.setAmount(rs.getString("amount"));	
			receiptList.add(receipt);
			return receipt;
		}	
	});		
		return receList;
		}catch(Exception e)
		{
			return null;
		}
	}

	@Override
	public List<Receipts> editReceipt(String receiptId) {
		try{
		String sql="select * from vreceipt where receipts_Id='"+receiptId+"'";		
		return jdbcTemplate.query(sql, new RowMapper<Receipts>() {
		//	List<EnquiryDetails> enquiryDetails =new ArrayList<EnquiryDetails>();
			@Override
			public Receipts mapRow(ResultSet rs, int arg1) throws SQLException {
				Receipts receipts=new Receipts();				
				receipts.setReceiptsNo(rs.getString("receipts_Id"));
				receipts.setInvoiceId(rs.getString("invoice_Id"));	
				String invId=rs.getString("invoice_Id");				
				receipts.setFromaccount(rs.getString("from_Account_No"));
				receipts.setToaccount(rs.getString("to_Account_No"));
				receipts.setDate(rs.getString("receipts_date"));
				receipts.setPayMode(rs.getString("payment_Mode"));
				receipts.setDescription(rs.getString("description"));
				receipts.setAmount(rs.getString("amount"));	
				float receiptAmt=Float.parseFloat(rs.getString("amount"));
				float balAmt=jdbcTemplate.queryForObject("select sales_Invoice_Balance from sales_invoice_header where sales_Invoice_Id='"+invId+"'", Float.class);
				receipts.setBalAmt(receiptAmt+balAmt);
				receipts.setAmountDue(balAmt);
				receipts.setTds(rs.getString("tds"));
				receipts.setFromAcNo(rs.getString("fromAcNo"));
				receipts.setToAcNo(rs.getString("toAcNo"));
				receipts.setCustId(rs.getString("customer_ID"));
				receipts.setCustomer_Name(rs.getString("customer_Name"));		
				receipts.setCustomer_Addr(rs.getString("billing_Address"));
				receipts.setCustVatNo(rs.getString("vat_No"));
				return receipts;
			}
		});
		}catch(Exception e)
		{
			System.out.println(e);
			return null;
		}
	}

	@Override
	public int updateReceipt(Receipts receipts) {		
		String account_No="",type="";
		float amount=0;
		try{
		String journalId=jdbcTemplate.queryForObject("select journal_Id from journal_header where refrence='"+receipts.getReceiptsNo()+"' and journal_Header_Status='V'",String.class);
		float amt=jdbcTemplate.queryForObject("select totalDebit from journal_header where refrence='"+receipts.getReceiptsNo()+"' and journal_Header_Status='V'",Float.class);
		String up="update journal_header set journal_Header_Status='D',"+"description='Being Updated Receipts Journal Deleted' where journal_Id='"+journalId+"'";
		jdbcTemplate.update(up);
		String journal_Id = genrateJId();
		
		int k=1;
		 DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");	     
	     Date date = new Date();	     
	     String dt=dateFormat.format(date);
		String urlj="insert into journal_header value('"+journal_Id+"','Sales','"+receipts.getReceiptsNo()+"','"+dt+"','R','Updated Receipts Journal Reversed','2','"+amt+"','"+amt+"')";
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
		
		float receiptPAmt=jdbcTemplate.queryForObject("select amount from sales_receipts where receipts_Id='"+receipts.getReceiptsNo()+"'", Float.class);
		String updatePrevInvBalUrl="UPDATE sales_invoice_header SET sales_Invoice_Balance=sales_Invoice_Balance+'"+receiptPAmt+"' where sales_Invoice_Id='"+receipts.getInvoiceId()+"'";
		int upPInv=jdbcTemplate.update(updatePrevInvBalUrl);	
		
		String updateEnqHeaderUrl="UPDATE sales_receipts SET payment_Mode='"+receipts.getPayMode()+"',"+"description='"+receipts.getDescription()+"',"+"amount='"+receipts.getAmount()+"',"+"tds='"+receipts.getTds()+"',"+"updated_By='"+receipts.getUpdatedBy()+"' WHERE receipts_Id='"+receipts.getReceiptsNo()+"'";
		int i=jdbcTemplate.update(updateEnqHeaderUrl);
		
		String updatecInvBalUrl="UPDATE sales_invoice_header SET sales_Invoice_Balance=sales_Invoice_Balance-'"+receipts.getAmount()+"' where sales_Invoice_Id='"+receipts.getInvoiceId()+"'";
		int upcInv=jdbcTemplate.update(updatecInvBalUrl);
			
		String journal_Id1 =genrateJId();	
		String urljournal="insert into journal_header value('"+journal_Id1+"','Sales','"+receipts.getReceiptsNo()+"','"+receipts.getDate()+"','V','Being Payment Received','2','"+receipts.getAmount()+"','"+receipts.getAmount()+"')";
		int iD=jdbcTemplate.update(urljournal); 
	 
		String urlLine1="insert into journal_details value('1','"+journal_Id1+"','"+receipts.getFromaccount()+"','D','"+receipts.getAmount()+"')";
		int i3=jdbcTemplate.update(urlLine1);
		String updateBalUrl1="UPDATE accounts_chart SET opeinig_Balance=opeinig_Balance-'"+receipts.getAmount()+"' where account_No='"+receipts.getFromaccount()+"'";
		int i7=jdbcTemplate.update(updateBalUrl1);
		String urlLine2="insert into journal_details value('2','"+journal_Id1+"','"+receipts.getToaccount()+"','C','"+receipts.getAmount()+"')";
		int i4=jdbcTemplate.update(urlLine2);
		String updateBalUrl2="UPDATE accounts_chart SET opeinig_Balance=opeinig_Balance+'"+receipts.getAmount()+"' where account_No='"+receipts.getToaccount()+"'";
		int i8=jdbcTemplate.update(updateBalUrl2);
		
		
		if(i>0 && iD>0 && i3>0 && i7>0 && i4>0 && i8>0 && upPInv>0 && upcInv>0)
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
	@Override
	public Receipts generateRcptId() {
		try{
		String rcptId="";
		RowCountCallbackHandler countCallback = new RowCountCallbackHandler();  // not reusable
		 jdbcTemplate.query("select * from sales_receipts", countCallback);
		 int count = countCallback.getRowCount();
		 count++;		
		 if(count<10)
		 {
			 rcptId="RCP00"+count;
		 }
		 else
		 {
			 if(count<99)
			 {
				 rcptId = "RCP/0" + count;
			 }
			 else
				{
				 rcptId = "RCP/" + count;
				}
		 }
		 Receipts receipts=new Receipts();
		 receipts.setReceiptsNo(rcptId);
		return receipts;
		}catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public List<NewAccount> retriveAcList() {
		try{
		String sql="select account_No,account_Name from accounts_chart where group_Id in ('GRS001','GRS003')";/*"select account_No,account_Name from accounts_chart where ";		*/
		final List<NewAccount> acList=getJdbcTemplate().query(sql, new RowMapper<NewAccount>() {
		private List<NewAccount> accountList=new ArrayList<NewAccount>();
		public NewAccount mapRow(ResultSet rs,int rowNo)throws SQLException
		{
			NewAccount newAccount=new NewAccount();
			newAccount.setTxtNewAccNo(rs.getInt("account_No"));
			newAccount.setTxtAccountName(rs.getString("account_Name"));			
			accountList.add(newAccount);
			return newAccount;
		}	
	});		
		return acList;
		}catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public List<Invoice> retriveInvList() {
		try{
		String sql="select sales_Invoice_Id from sales_invoice_header where sales_Invoice_Status='Active' and sales_Invoice_Balance > 0";		
		final List<Invoice> invList=getJdbcTemplate().query(sql, new RowMapper<Invoice>() {
		private List<Invoice> invoiceList=new ArrayList<Invoice>();
		public Invoice mapRow(ResultSet rs,int rowNo)throws SQLException
		{
			Invoice invoice=new Invoice();
			invoice.setTxtInvID(rs.getString("sales_Invoice_Id"));						
			invoiceList.add(invoice);
			return invoice;
		}	
	});		
		return invList;
		}catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public int deleteReceipt(String receiptId) {
		try{
		String account_No="",type="";
		float amount=0;
		
		String invoiceId=jdbcTemplate.queryForObject("select invoice_Id from sales_receipts where receipts_Id='"+receiptId+"'", String.class);
		float receiptPAmt=jdbcTemplate.queryForObject("select amount from sales_receipts where receipts_Id='"+receiptId+"'", Float.class);
	
		String updatePrevInvBalUrl="UPDATE sales_invoice_header SET sales_Invoice_Balance=sales_Invoice_Balance+'"+receiptPAmt+"' where sales_Invoice_Id='"+invoiceId+"'";
		jdbcTemplate.update(updatePrevInvBalUrl);
		
		String journalId=jdbcTemplate.queryForObject("select journal_Id from journal_header where refrence='"+receiptId+"' and journal_Header_Status='V'",String.class);
		
		String journal_Id = genrateJId();
		
		int i=1;
		 DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");	     
	     Date date = new Date();	     
	     String dt=dateFormat.format(date);
		String urlj="insert into journal_header value('"+journal_Id+"','Sales','"+receiptId+"','"+dt+"','R','Deleted Receipt Amount Reversed','2','"+receiptPAmt+"','"+receiptPAmt+"')";
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
		
	
		//String updateInvHeaderUrl="UPDATE sales_invoice_header SET sales_Invoice_Balance=sales_Invoice_Balance+'"+receiptPAmt+"' WHERE sales_Invoice_Id='"+invoiceId+"'";
		//jdbcTemplate.update(updateInvHeaderUrl);
		String updateEnqHeaderUrl="UPDATE sales_receipts SET status='Inactive' WHERE receipts_Id='"+receiptId+"'";
		int s=jdbcTemplate.update(updateEnqHeaderUrl);
		return s;
		}catch(Exception e)
		{
			System.out.println(e);
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
	public List<Customer> retriveCustInfo(String custId,String id) {
		final String path = "Sales Receipt.pdf";		
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
			custoInfo.setSubject("Sales Receipt");
			String regards=jdbcTemplate.queryForObject("select comp_Name from comp_details",String.class);
			custoInfo.setRegards(regards);	
			custoInfo.setBodyPart("\t New Sales Receipt is Generated For More Details\n Please Find The Attached PDF File.\n\nThank You..");
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
	public float retriveInvBal(String invoiceId) {
		float balAmt=jdbcTemplate.queryForObject("select sales_Invoice_Balance from sales_invoice_header where sales_Invoice_Id='"+invoiceId+"'", Float.class);
		return balAmt;
	}
	@Override
	public List<NewAccount> retriveAccount(String invoiceId) {
		try{
		String custId=getCustId(invoiceId);
		int acNo=getAcNo(custId);
		String sql="select account_No,account_Name from accounts_chart where account_No='"+acNo+"'";		
		final List<NewAccount> accList=getJdbcTemplate().query(sql, new RowMapper<NewAccount>() {
		private List<NewAccount> acList=new ArrayList<NewAccount>();
		public NewAccount mapRow(ResultSet rs,int rowNo)throws SQLException
		{
			NewAccount newAccount=new NewAccount();
			newAccount.setTxtNewAccNo(rs.getInt("account_No"));
			newAccount.setTxtAccountName(rs.getString("account_Name"));			
			acList.add(newAccount);
			return newAccount;
		}	
	});	
		return accList;
		}catch (Exception e)
		{
			System.out.println(e);
			return null;
		}
	}
	
	private String getCustId(String invoiceId)
	{
		String custId=jdbcTemplate.queryForObject("select customer_ID from sales_invoice_header where sales_Invoice_Id='"+invoiceId+"'", String.class);
		return custId;
	}
	private int getAcNo(String custId)
	{
		int acNo=jdbcTemplate.queryForObject("select account_No from customer_header where customer_ID='"+custId+"'", Integer.class);
		return acNo;
	}
	@Override
	public List<NewAccount> retriveToAccount(String paymentMode) {

		try{
			List<NewAccount> accList=new ArrayList<NewAccount>();
			if(paymentMode.equalsIgnoreCase("Cash"))
			{
				String sql = "select account_No,account_Name,group_Id from accounts_chart where group_Id in ('GRS003')";
				accList=getJdbcTemplate().query(sql, new RowMapper<NewAccount>() {
					private List<NewAccount> accountList=new ArrayList<NewAccount>();
					public NewAccount mapRow(ResultSet rs,int rowNo)throws SQLException
					{
						NewAccount account=new NewAccount();
						account.setTxtNewAccNo(rs.getInt("account_No"));				
						account.setTxtAccountName(rs.getString("account_Name"));
						accountList.add(account);
						return account;
					}	
				});
				return accList;
			}
			else if(paymentMode.equalsIgnoreCase("Cheque"))
			{
				String sql = "select account_No,account_Name,group_Id from accounts_chart where group_Id in ('GRS001')";
			 accList=getJdbcTemplate().query(sql, new RowMapper<NewAccount>() {
					private List<NewAccount> accountList=new ArrayList<NewAccount>();
					public NewAccount mapRow(ResultSet rs,int rowNo)throws SQLException
					{
						NewAccount account=new NewAccount();
						account.setTxtNewAccNo(rs.getInt("account_No"));				
						account.setTxtAccountName(rs.getString("account_Name"));
						accountList.add(account);
						return account;
					}	
				});
				return accList;
			}
			return accList;
			}catch(Exception e)
			{
				System.out.println(e);
				return null;
			}
	}

}
