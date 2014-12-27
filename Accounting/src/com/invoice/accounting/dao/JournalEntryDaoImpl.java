package com.invoice.accounting.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCountCallbackHandler;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;




import com.invoice.accounting.beans.ComposeMail;
import com.invoice.accounting.beans.JournalDetails;
import com.invoice.accounting.beans.JournalHeader;
import com.invoice.accounting.beans.NewAccount;
import com.invoice.company.beans.CompanyDetails;
import com.invoice.purchase.beans.PurchaseVoucher;
import com.invoice.sales.beans.Receipts;


@Component(value="journalEntryDao")
public class JournalEntryDaoImpl implements JournalEntryDao 
{
	private JdbcTemplate jdbcTemplate;
	//int k,j,iD=0;
	
	
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	@Autowired
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Override
	public int saveJournalEntry(JournalHeader journalheader)
	{
		try
		{
		int count = 0,count1=0;
		String status="active";
		int i=1,j=1,k=1,l=1;
		
		List<JournalDetails> jeList=journalheader.getJournalDetails();
		float cr=journalheader.getTxtCreditAmount();
		float dr=journalheader.getTxtDebitAmount();
		if(cr==dr)
		{			
			
			int totalNoLine=jeList.size();		
			totalNoLine=totalNoLine+1;
		String sql="insert into journal_header(journal_Id,source,refrence,journal_Date,journal_Header_Status,description,total_Line_No,totalDebit,totalCredit) value('"+journalheader.getTxtjourid()+"','"+journalheader.getTxtSource()+"','"+journalheader.getTxtjourid()+"','"+journalheader.getTxtDate()+"','V','"+journalheader.getTxtDescription()+"','"+totalNoLine+"','"+journalheader.getTxtDebitAmount()+"','"+journalheader.getTxtCreditAmount()+"')";
		 i=jdbcTemplate.update(sql);
		for (JournalDetails je : jeList)			
		{
			
			String sql1="insert into journal_details(sr_No,journal_Id,account_No,type,amount) value('"+je.getTxtSrNo()+"','"+journalheader.getTxtjourid()+"','"+je.getTxtAccountName()+"','"+je.getTxtType()+"','"+je.getTxtAmount()+"')";
			l= jdbcTemplate.update(sql1);
			
			String types=je.getTxtType();
			
			if(types.equals("D"))
			{
			String updateJouranlUrl="UPDATE accounts_chart SET opeinig_Balance=opeinig_Balance -'"+je.getTxtAmount()+"' WHERE account_No='"+je.getTxtAccountName()+"' ";
	       
			j=jdbcTemplate.update(updateJouranlUrl);
			count++;
			}
			else if(types.equals("C"))
			{
			String updateJouranlUrl1="UPDATE accounts_chart SET opeinig_Balance=opeinig_Balance +'"+je.getTxtAmount()+"' WHERE account_No='"+je.getTxtAccountName()+"' ";
		    k=jdbcTemplate.update(updateJouranlUrl1);
		    count1++;
		    }
		}
		if(i>=1 && l>=1&& j>=1 && k>=1)
	       {
			return 1;
	      }
	       else
	       {
	    	   return 0;
	       }
		}
		else
		{
			return 0;
		}
		}
		catch(Exception e)
		{
			return 0;
		}
	}
	@Override
	public List<JournalHeader> show() 
	{
		try
		{	
		String sql="select * from vjournalentry  where journal_Header_Status='V' group by journal_Id";
		return jdbcTemplate.query(sql, new RowMapper<JournalHeader>() {
				List<JournalDetails> journalDetailsList =new ArrayList<JournalDetails>();
				@Override
				public JournalHeader mapRow(ResultSet rs, int arg1) throws SQLException {
					JournalHeader journalHeader=new JournalHeader();
					JournalDetails journalDetails=new JournalDetails();	
					journalHeader.setTxtjourid(rs.getString("journal_Id"));
					journalHeader.setTxtDate(rs.getString("journal_Date"));
					journalHeader.setAccount_Name(rs.getString("account_Name"));
					journalHeader.setAmount(rs.getFloat("amount"));
					
					
					journalDetailsList.add(journalDetails);
					journalHeader.setJournalDetails(journalDetailsList);
					return journalHeader;
				}
			});	
		}
		catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public List<JournalHeader> viewjournal(String voucher_No) {
		
			try
			{
			 String sql = "select * from vjournalentry  where journal_Id ='"+voucher_No+"'";
			 return jdbcTemplate.query(sql, new RowMapper<JournalHeader>() {
					List<JournalDetails> journalDetailsList =new ArrayList<JournalDetails>();
					@Override
					public JournalHeader mapRow(ResultSet rs, int arg1) throws SQLException {
						
						JournalHeader journalHeader=new JournalHeader();
						JournalDetails journalDetails=new JournalDetails();					
						
						journalHeader.setTxtjourid(rs.getString("journal_Id"));
						journalHeader.setTxtDate(rs.getString("journal_Date"));
						journalHeader.setTxtSource(rs.getString("source"));
						journalHeader.setTxtDescription(rs.getString("description"));
						journalHeader.setTxtCreditAmount(rs.getFloat("totalDebit"));
						journalHeader.setTxtDebitAmount(rs.getFloat("totalCredit"));
					
						journalDetails.setTxtSrNo(rs.getInt("sr_No"));
						journalDetails.setTxtAccountName(rs.getString("account_Name"));
						journalDetails.setTxtType(rs.getString("type"));
						journalDetails.setTxtAmount(rs.getFloat("amount"));
						journalDetails.setAccno(rs.getString("account_No"));
						
						
						journalDetailsList.add(journalDetails);
						journalHeader.setJournalDetails(journalDetailsList);
						return journalHeader;
					}
				});	
		}
		
		catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public List<PurchaseVoucher> retrivevoucher() {
		try
		{
		String sql="select * from purchase_voucher";	
		 final List<PurchaseVoucher> voulist=getJdbcTemplate().query(sql, new RowMapper<PurchaseVoucher>() {
		 private List<PurchaseVoucher> voucherList=new ArrayList<PurchaseVoucher>();
		 public PurchaseVoucher mapRow(ResultSet rs,int rowNo)throws SQLException
		 {
			 PurchaseVoucher purchasevouche=new PurchaseVoucher();
			 purchasevouche.setVoucherNo(rs.getString("voucher_No"));
			 voucherList.add(purchasevouche);
		 return purchasevouche;
		 }	
		 });	
		 return voulist;
}
		
		catch(Exception e)
		{
			return null;
		}
		 }


	@Override
	public List<Receipts> retrivereceipt() {
		try
		{
		String sql="select * from sales_receipts";	
		 final List<Receipts> recptlist=getJdbcTemplate().query(sql, new RowMapper<Receipts>() {
		 private List<Receipts> receiptList=new ArrayList<Receipts>();
		 public Receipts mapRow(ResultSet rs,int rowNo)throws SQLException
		 {
			 Receipts recept=new Receipts();
			 recept.setReceiptsNo(rs.getString("receipts_Id"));
			 receiptList.add(recept);
		 return recept;
		 }	
		 });	
		 return recptlist;
}
		
		catch(Exception e)
		{
			return null;
		}
		 }
	@Override
	public List<NewAccount> retriveaccount()
	{
		try
		{
		String sql="select * from accounts_chart";	
		 final List<NewAccount> accnamelist=getJdbcTemplate().query(sql, new RowMapper<NewAccount>() {
		 private List<NewAccount> accountnameList=new ArrayList<NewAccount>();
		 public NewAccount mapRow(ResultSet rs,int rowNo)throws SQLException
		 {
			 NewAccount account=new NewAccount();
			 account.setTxtNewAccNo(rs.getInt("account_No"));
			 account.setTxtAccountName(rs.getString("account_Name"));
			 accountnameList.add(account);
		 return account;
		 }	
		 });	
		 return accnamelist;
        }
		
		catch(Exception e)
		{
			return null;
		}
		 }
	
	@Override
	public JournalHeader generateId() {
		 
		try
		{
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
		 } else {
		 journal_Id = "JID" + count;
		 }
		 }
		 JournalHeader journalHeader=new JournalHeader();
		 journalHeader.setTxtjourid(journal_Id);
		return journalHeader;
        }
		
		catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public int updatejournal(JournalHeader journalHeader) 
	{
			
		try
		{
		int iD=0;
		
		String updateJouranlUrl="UPDATE journal_header SET source='"+journalHeader.getTxtSource()+"',"+"description ='"+journalHeader.getTxtDescription()+"' WHERE journal_Id='"+journalHeader.getTxtjourid()+"'";
		int i=jdbcTemplate.update(updateJouranlUrl);
		deleteList(journalHeader.getTxtjourid());
		
		List<JournalDetails> jeList=journalHeader.getJournalDetails();
		for (JournalDetails je : jeList)			
		{
			
			
			String sql1="insert into journal_details value('"+je.getTxtSrNo()+"','"+journalHeader.getTxtjourid()+"','"+je.getTxtAccountName()+"','"+je.getTxtType()+"','"+je.getTxtAmount()+"')";
			 iD= jdbcTemplate.update(sql1);
		}
		if(i>=1 && iD>=1)
	       {
			return 1;
	      }
	       else
	       {
	    	   return 0;
	       }
}
		
		catch(Exception e)
		{
			return 0;
		}

	}
	private void deleteList(String journal_Id){
		
		String deleteListUrl="DELETE FROM journal_details WHERE journal_Id= '"+journal_Id+"'";
		jdbcTemplate.update(deleteListUrl);

}
	
	
	
	@Override
	public List<JournalHeader> staticshow() {
		return null;
		
		
	}
	@Override
	public List<CompanyDetails> getInfo(CompanyDetails companyDetails) {
		try 
		{
		 String sql="select comp_Name,comp_Address,comp_Contact,comp_Mail,comp_Website from comp_details";		
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
				companyList.add(enq);				
				return enq;
			}	
		});		
			return comList;
		}
		catch(Exception e)
		{
			return null;
		}

	}
	@Override
	public int sendMail(ComposeMail composeMail) {
		final String username = "ranjithange28@gmail.com";
		final String password = "ranjitjica";

		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "25");

		Session session = Session.getInstance(props,
		  new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		  });

		try {

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("rhange28@gmail.com"));
			message.setRecipients(Message.RecipientType.TO,
				InternetAddress.parse(composeMail.getMailTo()));
			message.setSubject(composeMail.getSubject());
			message.setText(composeMail.getBody());

			
			
			BodyPart messageBodyPart = new MimeBodyPart();

	         messageBodyPart.setText(composeMail.getBody());
	         
	         Multipart multipart = new MimeMultipart();

	         multipart.addBodyPart(messageBodyPart);

	         
	         messageBodyPart = new MimeBodyPart();
	         String filename = "C:/Users/Reformist/Documents/Received Files/CYMERA_20140804_111133.jpg";
	         DataSource source = new FileDataSource(filename);
	         messageBodyPart.setDataHandler(new DataHandler(source));
	         messageBodyPart.setFileName(filename);
	         multipart.addBodyPart(messageBodyPart);
	         
	         message.setContent(multipart );

	         Transport.send(message);
	      

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
		return 1;
	}
	@Override
	public int delete(String Jid) {
		try
		{
		String status="Inactive";
		String account_No="";
		float amount=0;
		String type="";
		
       String journal_Id="";
		
		String desc=jdbcTemplate.queryForObject("select description from journal_header where journal_Id='"+Jid+"'",String.class);
		String journalId=jdbcTemplate.queryForObject("select journal_Id from journal_header where refrence='"+Jid+"' and journal_Header_Status='V'",String.class);
		String source=jdbcTemplate.queryForObject("select source from journal_header where refrence='"+Jid+"' and journal_Header_Status='V'",String.class);
		
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
		
		String  sql1 = "select totalCredit from journal_header where refrence = '"+Jid+"' and journal_Header_Status='V' "; 
		String cramount = jdbcTemplate.queryForObject(sql1,String.class);
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");	     
		Date date = new Date();	     
		String dt=dateFormat.format(date);
		
		List<JournalDetails> jList=getAccountDetails(journalId);
		int totalline=jList.size();
		String urlj="insert into journal_header value('"+journal_Id+"','"+source+"','"+Jid+"','"+dt+"','V','"+desc+"','"+totalline+"','"+cramount+"','"+cramount+"')";
		jdbcTemplate.update(urlj);
		
		
		int i=1, k=0;
		for (JournalDetails journalDetails : jList) 
		{
			account_No=journalDetails.getAccno();		
			type=journalDetails.getTxtType();
			amount=journalDetails.getTxtAmount();
			
			if(type.equals("D"))
			{
				String sql4="UPDATE accounts_chart set opeinig_Balance=opeinig_Balance+'"+amount+"' where account_No='"+account_No+"'";
				k=jdbcTemplate.update(sql4);
				type="C";
			}
			else if(type.equals("C"))
			{
				String sql4="UPDATE accounts_chart set opeinig_Balance=opeinig_Balance-'"+amount+"' where account_No='"+account_No+"'";
				k=jdbcTemplate.update(sql4);
				type="D";
			}
			String urlLine1="insert into journal_details value('"+i+"','"+journal_Id+"','"+account_No+"','"+type+"','"+amount+"')";
			 jdbcTemplate.update(urlLine1);
			 
			 i++;
		}
		
		
		String sql="Update journal_header set journal_Header_Status='D',"+" description='Reversal Journal Deleted' where journal_Id='"+journalId+"'";
		int x=jdbcTemplate.update(sql);
		if(k>0 && x>0)
		{
			return 1;
		}
		else
		{
			return 0;
		}
		}
		catch(Exception e)
		{
			return 0;
		}
	}	

private List<JournalDetails> getAccountDetails(String journalId)
{
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
}
}
	

