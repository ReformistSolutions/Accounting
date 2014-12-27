package com.invoice.purchase.dao;

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
import com.invoice.company.beans.CompanyDetails;
import com.invoice.purchase.beans.PurchaseVoucher;
import com.invoice.purchase.beans.Purchases;
import com.invoice.purchase.beans.Vender;

@Component(value="voucherDoa")
public class VoucherDaoImpl implements VoucherDao{

	JdbcTemplate jdbcTemplate;
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}@Autowired
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Override
	public int saveVoucher(PurchaseVoucher purchaseVoucher) {
		
		int i=0,i1=0,i2=0,i3=0,i4=0,i5=0,i6=0;
		try{
		String sql = "insert into purchase_voucher values('"+purchaseVoucher.getVoucherNo()+"','"+purchaseVoucher.getOrderId()+"','"+purchaseVoucher.getAccountNo()+"','"+purchaseVoucher.getDate()+"','"+purchaseVoucher.getAmount()+"','"+purchaseVoucher.getTds()+"','"+purchaseVoucher.getPayMode()+"','"+purchaseVoucher.getDescription()+"','"+purchaseVoucher.getCreadtedBy()+"','"+purchaseVoucher.getCreadtedBy()+"','Active')";
		i=jdbcTemplate.update(sql);
		
		 String journal_Id=genrateJId();	
		 String urlj="insert into journal_header value('"+journal_Id+"','Purchase','"+purchaseVoucher.getVoucherNo()+"','"+purchaseVoucher.getDate()+"','V','Being Payment Made On Purchase','2','"+purchaseVoucher.getAmount()+"','"+purchaseVoucher.getAmount()+"')";
		 i1=jdbcTemplate.update(urlj); 
		
		 String urlLine1="insert into journal_details value('1','"+journal_Id+"','105','D','"+purchaseVoucher.getAmount()+"')";
		 i2=jdbcTemplate.update(urlLine1);
		 
		 String updateBalUrl1="UPDATE accounts_chart SET opeinig_Balance=opeinig_Balance+'"+purchaseVoucher.getAmount()+"' where account_No='105'";
		 i3=jdbcTemplate.update(updateBalUrl1);
		 
		 String urlLine2="insert into journal_details value('2','"+journal_Id+"','"+purchaseVoucher.getAccountNo()+"','C','"+purchaseVoucher.getAmount()+"')";
		 i4=jdbcTemplate.update(urlLine2);
		 
		 String updateBalUrl2="UPDATE accounts_chart SET opeinig_Balance = opeinig_Balance - '"+purchaseVoucher.getAmount()+"' where account_No='"+purchaseVoucher.getAccountNo()+"'";
		 i5=jdbcTemplate.update(updateBalUrl2);
		
		 String updatepayamt = "update purchases_header set bal_Amt = bal_Amt - '"+purchaseVoucher.getAmount()+"' where purchase_Id = '"+purchaseVoucher.getOrderId()+"' " ;
		 i6=jdbcTemplate.update(updatepayamt);
		 
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
			return 0;
		}
	}
	@Override
	public List<PurchaseVoucher> showVoucher() {
		try{
		String sql = "select DISTINCT * from vvoucher where status = 'Active'";
		final List<PurchaseVoucher> voucherList=getJdbcTemplate().query(sql, new RowMapper<PurchaseVoucher>(){
			private List<PurchaseVoucher> purchaseVoucherList = new ArrayList<PurchaseVoucher>();	
			public PurchaseVoucher mapRow(ResultSet rs, int rowNo) throws SQLException {
				
				PurchaseVoucher purchaseVoucher = new PurchaseVoucher();
				purchaseVoucher.setVoucherNo(rs.getString("voucher_No"));
				purchaseVoucher.setAccName((rs.getString("account_Name")));
				purchaseVoucher.setDate(rs.getString("payment_Date")); 
				purchaseVoucher.setAmount(rs.getFloat("amount"));
				purchaseVoucherList.add(purchaseVoucher);
				return purchaseVoucher;
			}
		}); 
		return voucherList;
		}catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public List<PurchaseVoucher> viewVoucher(String voucherNo) {
		try{
		String sql = "select * from vvoucher where voucher_No='"+voucherNo+"' ";
		return jdbcTemplate.query(sql, new RowMapper<PurchaseVoucher>(){
			List<PurchaseVoucher> voucherList = new ArrayList<PurchaseVoucher>();
			@Override
			public PurchaseVoucher mapRow(ResultSet rs, int rowNo)throws SQLException {
				PurchaseVoucher purchaseVoucher = new PurchaseVoucher();
				purchaseVoucher.setVoucherNo(rs.getString("voucher_No"));
				purchaseVoucher.setOrderId(rs.getString("purchase_Id"));
				purchaseVoucher.setAccountNo((rs.getInt("from_Account_No")));
				purchaseVoucher.setAccName(rs.getString("account_Name"));
				purchaseVoucher.setDate(rs.getString("payment_Date")); 
				purchaseVoucher.setAmount(rs.getFloat("amount"));
				float amount1 = purchaseVoucher.getAmount();
				purchaseVoucher.setTds(rs.getFloat("tds"));
				purchaseVoucher.setPayMode(rs.getString("payment_Mode"));
				purchaseVoucher.setDescription(rs.getString("description"));
				purchaseVoucher.setVenderId(rs.getString("vendor_Id"));	
				String purchaseID = purchaseVoucher.getOrderId();
				float avlBalance = jdbcTemplate.queryForObject("select bal_Amt from purchases_header where purchase_Id = '"+purchaseID+"' ",Float.class);
				float amount = avlBalance + amount1 ;
				purchaseVoucher.setAvlBalance(amount);
				voucherList.add(purchaseVoucher);
				return purchaseVoucher;
			}			
		});		
		}catch(Exception e)
		{
			return null;
		}
	}
	
	@Override
	public List<NewAccount> showAccountNo() {
		try{
		String sql = "select * from accounts_chart" ;
		final List<NewAccount> accList=getJdbcTemplate().query(sql, new RowMapper<NewAccount>() {
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
		}catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public PurchaseVoucher autoId() {
		try{
		String voucherId="";
		RowCountCallbackHandler countCallback = new RowCountCallbackHandler();  // not reusable
		 jdbcTemplate.query("select * from purchase_voucher", countCallback);
		 int count = countCallback.getRowCount();
		 count++;
		 //System.out.println("Count="+count);
		 if(count<10)
		 {
		 voucherId="VCH00"+count;
		 }
		 else
		 {
		 if(count<99)
		 {
		 voucherId = "VCH0" + count;
		 }
		 else
		{
		voucherId = "VCH" + count;
		}
		 }
		 PurchaseVoucher voucher=new PurchaseVoucher();
		 voucher.setVoucherNo(voucherId);
		return voucher;
		}catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public int updateVoucher(PurchaseVoucher purchaseVoucher) {
		
		String account_No="",type="";
		float amount=0;
		try{
		String journalId=jdbcTemplate.queryForObject("select journal_Id from journal_header where refrence='"+purchaseVoucher.getVoucherNo()+"' and journal_Header_Status='V'",String.class);		
		
		float amt=jdbcTemplate.queryForObject("select totalDebit from journal_header where refrence='"+purchaseVoucher.getVoucherNo()+"' and journal_Header_Status='V'",Float.class);
		
		String up="update journal_header set journal_Header_Status='D',"+"description='Being Updated Voucher Journal Deleted' where journal_Id='"+journalId+"'";
		jdbcTemplate.update(up);
		
		String journal_Id=genrateJId();	
		int k=1;
		 DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");	     
	     Date date = new Date();	     
	     String dt=dateFormat.format(date);
		String urlj="insert into journal_header value('"+journal_Id+"','Purchase','"+purchaseVoucher.getVoucherNo()+"','"+dt+"','R','Being Deleted Updated Voucher Journal Reversed','2','"+amt+"','"+amt+"')";
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
						 String updateBalUrl1="UPDATE accounts_chart SET opeinig_Balance=opeinig_Balance+'"+amount+"' where account_No='"+account_No+"'";
						 jdbcTemplate.update(updateBalUrl1);
				 }
				 if(type.equals("C"))
				 {
						 String updateBalUrl2="UPDATE accounts_chart SET opeinig_Balance=opeinig_Balance-'"+amount+"' where account_No='"+account_No+"'";
						 jdbcTemplate.update(updateBalUrl2);					
				 }
		k++;
		}
		 String prevAmt = jdbcTemplate.queryForObject("select amount from purchase_voucher where voucher_No = '"+purchaseVoucher.getVoucherNo()+"'",String.class);

		int i1=0,i2=0,i3=0,i4=0,i5=0,i6=0,i7=0,u=0;
		String sql = "update purchase_voucher set from_Account_No='"+purchaseVoucher.getAccountNo()+"',"+"payment_Date='"+purchaseVoucher.getDate()+"',"+"amount='"+purchaseVoucher.getAmount()+"',"+"tds='"+purchaseVoucher.getTds()+"',"+"payment_Mode='"+purchaseVoucher.getPayMode()+"',"+"description='"+purchaseVoucher.getDescription()+"' where voucher_No='"+purchaseVoucher.getVoucherNo()+"'";
		u=jdbcTemplate.update(sql);
		
		 String journal_Id1=genrateJId();	
		 String urlj1="insert into journal_header value('"+journal_Id1+"','Purchase','"+purchaseVoucher.getVoucherNo()+"','"+purchaseVoucher.getDate()+"','V','Being Payment Made On Purchase','2','"+purchaseVoucher.getAmount()+"','"+purchaseVoucher.getAmount()+"')";
		 i1=jdbcTemplate.update(urlj1); 
		
		 String urlLine1="insert into journal_details value('1','"+journal_Id1+"','105','D','"+purchaseVoucher.getAmount()+"')";
		 i2=jdbcTemplate.update(urlLine1);
		 
		 String updateBalUrl1="UPDATE accounts_chart SET opeinig_Balance=opeinig_Balance+'"+purchaseVoucher.getAmount()+"' where account_No='105'";
		 i3=jdbcTemplate.update(updateBalUrl1);
		 
		 String urlLine2="insert into journal_details value('2','"+journal_Id1+"','"+purchaseVoucher.getAccountNo()+"','C','"+purchaseVoucher.getAmount()+"')";
		 i4=jdbcTemplate.update(urlLine2);
		 
		 String updateBalUrl2="UPDATE accounts_chart SET opeinig_Balance=opeinig_Balance-'"+purchaseVoucher.getAmount()+"' where account_No='"+purchaseVoucher.getAccountNo()+"'";
		 i5=jdbcTemplate.update(updateBalUrl2);
		
		 float currentAmt = purchaseVoucher.getAmount();
		 
		 String sqlprvAmt = "update purchases_header set bal_Amt = bal_Amt + '"+prevAmt+"' where purchase_Id = '"+purchaseVoucher.getOrderId()+"'  ";
		 i6 = jdbcTemplate.update(sqlprvAmt);
		 
		 String sqlcurrntAmt = "update purchases_header set bal_Amt = bal_Amt - '"+currentAmt+"' where purchase_Id = '"+purchaseVoucher.getOrderId()+"'  ";
		 i7=jdbcTemplate.update(sqlcurrntAmt);
		 
		 if(i1>0 && i2>0 && i3>0 && i4>0 && i5>0 && u>0 && i6>0 && i7>0)
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
	public List<Purchases> showPurchaseId() {
		try{
		String sql = "select * from purchases_header where purs_Status='Active'" ;
		final List<Purchases> purList=getJdbcTemplate().query(sql, new RowMapper<Purchases>() {
			private List<Purchases> oList=new ArrayList<Purchases>();
			public Purchases mapRow(ResultSet rs,int rowNo)throws SQLException
			{
				Purchases order=new Purchases();
				order.setTxtPurchaseNo(rs.getString("purchase_Id"));								
				oList.add(order);
				return order;
			}	
		});		
			return purList;
		}catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public List<CompanyDetails> getInfo(CompanyDetails companyDetails) {
		try{

		 String sql="select comp_Name,comp_Address,comp_Contact,comp_Mail,comp_Website,vatNo,cstNo,comp_desc,terms from comp_details";		
			final List<CompanyDetails> comList=getJdbcTemplate().query(sql, new RowMapper<CompanyDetails>() {
			private List<CompanyDetails> companyList=new ArrayList<CompanyDetails>();
			public CompanyDetails mapRow(ResultSet rs,int rowNo)throws SQLException
			{
				CompanyDetails enq=new CompanyDetails();
				enq.setCompName(rs.getString("comp_Name"));
				enq.setCompAddress(rs.getString("comp_Address"));
				enq.setContactNo(rs.getString("comp_Contact"));
				enq.setEmail(rs.getString("comp_Mail")); 
				enq.setWebsite(rs.getString("comp_Website"));
				enq.setCstNo(rs.getString("vatNo"));
				enq.setVatNo(rs.getString("cstNo"));
				enq.setCompDesc(rs.getString("comp_desc"));
				enq.setCompTerms(rs.getString("terms"));
				companyList.add(enq);				
				return enq;
			}	
		});		
			return comList;
		}catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public int delete(String voucherId,float amt) {

		String account_No="",type="";
		float amount=0;
		try{
		String journalId=jdbcTemplate.queryForObject("select journal_Id from journal_header where refrence='"+voucherId+"' and journal_Header_Status='V'",String.class);		
		String up="update journal_header set journal_Header_Status='R' where journal_Id='"+journalId+"'";
		jdbcTemplate.update(up);
		String journal_Id=genrateJId();	
		int i=1;
		 DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");	     
	     Date date = new Date();	     
	     String dt=dateFormat.format(date);
		String urlj="insert into journal_header value('"+journal_Id+"','Purchase','"+voucherId+"','"+dt+"','V','Being Deleted Voucher Reversed','2','"+amt+"','"+amt+"')";
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
						 String updateBalUrl1="UPDATE accounts_chart SET opeinig_Balance=opeinig_Balance+'"+amount+"' where account_No='"+account_No+"'";
						 jdbcTemplate.update(updateBalUrl1);
				 }
				 if(type.equals("C"))
				 {
						 String updateBalUrl2="UPDATE accounts_chart SET opeinig_Balance=opeinig_Balance-'"+amount+"' where account_No='"+account_No+"'";
						 jdbcTemplate.update(updateBalUrl2);					
				 }
		i++;
		}
		
		 String prodid = jdbcTemplate.queryForObject("select purchase_Id from purchase_voucher where voucher_No = '"+voucherId+"'",String.class);
		 String currentAmt = jdbcTemplate.queryForObject("select amount from purchase_voucher where voucher_No = '"+voucherId+"'",String.class);
		 String sqlprvAmt = "update purchases_header set bal_Amt = bal_Amt + '"+currentAmt+"' where purchase_Id = '"+prodid+"'  ";
		 jdbcTemplate.update(sqlprvAmt);
		
		String sql = "update purchase_voucher set status = 'Inactive' where voucher_No='"+voucherId+"'";
		int s = jdbcTemplate.update(sql) ;
		return s;
		
		
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
	public List<Vender> retrriveVenderInfo(String vendId,String id)
	{
		final String path = "Purchase Voucher.pdf";	
		final String id1=id;
		try{
		String sql="select vender_ID,vender_Name,vender_Email from vendor_header where vender_ID='"+vendId+"'";
		final List<Vender> vendInfo=getJdbcTemplate().query(sql, new RowMapper<Vender>() {
		public Vender mapRow(ResultSet rs,int rowNo)throws SQLException
			{
				Vender venderInfo=new Vender();
				venderInfo.setTxtCustID(rs.getString("vender_ID"));
				venderInfo.setTxtCustName(rs.getString("vender_Name"));
				venderInfo.setTxtMail1(rs.getString("vender_Email"));
				venderInfo.setAttachment(path);
				venderInfo.setId(id1);
				venderInfo.setSubject("Purchase Voucher");
				String regards=jdbcTemplate.queryForObject("select comp_Name from comp_details",String.class);
				venderInfo.setRegards(regards);	
				venderInfo.setBodyPart("\t New Purchase Voucher is Generated For More Details\n Please Find The Attached PDF File.\n\nThank You..");
				return venderInfo;
			}
		});
			return vendInfo;
		}catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public List<NewAccount> retriveAccount(String paymode) 
	{
		try{
			List<NewAccount> accList=new ArrayList<NewAccount>();
			if(paymode.equalsIgnoreCase("Cash"))
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
			else if(paymode.equalsIgnoreCase("Cheque"))
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
				return null;
			}
	}
	@Override
	public String avlBalance(String orderId) 
	{
		String sql = "select bal_Amt from purchases_header where purchase_Id = '"+orderId+"'";
		String avlBalance = jdbcTemplate.queryForObject(sql, String.class);
		return avlBalance;
	}
}