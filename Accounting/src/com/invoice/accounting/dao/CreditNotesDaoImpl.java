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
import com.invoice.accounting.beans.NewCreditNote;
import com.invoice.company.beans.CompanyDetails;

@Component(value="creditNotesDao")
public class CreditNotesDaoImpl implements CreditNotesDao{
    
	private static String sql;	
    private JdbcTemplate jdbcTemplate;	


	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	@Autowired
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Override
	public int save(NewCreditNote newCreditNote,JournalHeader journalHeader) {
		String Status="Active";
		String source="Credit";
		/*int i,j,k,l,iD,iD1=0;
		int srNo=1;
		int srNo1 = 2;*/
		int iD,iD1=0;
		String debittype="D";
		String credittype="C";
		int srNo=1;
		int srNo1 = 2;
		
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

		 
		sql="insert into notes_voucher values('"+newCreditNote.getTxtVoucherNo()+"','"+newCreditNote.getTxtTransactionDate()+"','"+newCreditNote.getTxtFromAcnt()+"','"+newCreditNote.getTxtToAcnt()+"','"+newCreditNote.getTxtAmount()+"','"+newCreditNote.getTxtAmounthidden()+"','"+newCreditNote.getTxtDescription()+"','"+Status+"')";
		int i=jdbcTemplate.update(sql);
		 
		String updatebank="update accounts_chart set opeinig_Balance=opeinig_Balance-'"+newCreditNote.getTxtAmount()+"' where account_No='"+newCreditNote.getTxtFromAcnt()+"'";
		int j=jdbcTemplate.update(updatebank);
		
		String updatebank1="update accounts_chart set opeinig_Balance=opeinig_Balance+'"+newCreditNote.getTxtAmount()+"' where account_No='"+newCreditNote.getTxtToAcnt()+"'";
	    int k=jdbcTemplate.update(updatebank1);
		
		 String sql1="insert into journal_header values('"+journal_Id+"','"+source+"','"+newCreditNote.getTxtVoucherNo()+"','"+newCreditNote.getTxtTransactionDate()+"','V','"+newCreditNote.getTxtDescription()+"','2','"+newCreditNote.getTxtAmount()+"','"+newCreditNote.getTxtAmount()+"')"; 
	     int l=jdbcTemplate.update(sql1);
	
		
		JournalDetails journalDetails=new JournalDetails();
		
		journalDetails.setTxtSrNo(srNo);
		journalDetails.setTxtAccountName(journal_Id);
		journalDetails.setAccno(newCreditNote.getTxtFromAcnt());
		journalDetails.setTxtType(debittype);
		journalDetails.setTxtAmount(newCreditNote.getTxtAmount());
	    
		
		String sqlUpdate="insert into journal_details(sr_No,journal_Id,account_No,type,amount) value('"+journalDetails.getTxtSrNo()+"','"+journalDetails.getTxtAccountName()+"','"+journalDetails.getAccno()+"','"+journalDetails.getTxtType()+"','"+journalDetails.getTxtAmount()+"')";
		
		
		iD= jdbcTemplate.update(sqlUpdate);
		
		JournalDetails journalDetails1=new JournalDetails();
		journalDetails1.setTxtSrNo(srNo1);
		journalDetails1.setTxtAccountName(journal_Id);
		journalDetails1.setAccno(newCreditNote.getTxtToAcnt());
		journalDetails1.setTxtType(credittype);
		journalDetails1.setTxtAmount(newCreditNote.getTxtAmount());
		
		String sqlUpdate1="insert into journal_details(sr_No,journal_Id,account_No,type,amount) value('"+journalDetails1.getTxtSrNo()+"','"+journalDetails1.getTxtAccountName()+"','"+journalDetails1.getAccno()+"','"+journalDetails1.getTxtType()+"','"+journalDetails1.getTxtAmount()+"')";
	    iD1=jdbcTemplate.update(sqlUpdate1);
		
		if(i>=1 && j>=1 && k>=1 && iD>=1 && iD1>=1 && l>=1)
		{
		return 1;
		}
		else
		{
			return 0;
		}
		}
		 



	@Override
	public List<NewCreditNote> showCredit() {
		sql="select * from vdebitcredit where voucher_no LIKE 'CRN%'  AND status='Active'";				
		final List<NewCreditNote> creditNotesList=getJdbcTemplate().query(sql, new RowMapper<NewCreditNote>() {
		private List<NewCreditNote> creditList=new ArrayList<NewCreditNote>();
		public NewCreditNote mapRow(ResultSet rs,int rowNo)throws SQLException
		{
			NewCreditNote CND=new NewCreditNote();
			
			CND.setTxtVoucherNo(rs.getString("voucher_No"));
			CND.setTxtTransactionDate(rs.getString("transaction_Date"));
			CND.setTxtFromAcnt(rs.getString("from_Account"));
			CND.setTxtToAcnt(rs.getString("to_Account"));
			CND.setTxtAmount(rs.getFloat("amount"));
			CND.setTxtDescription(rs.getString("description"));
			creditList.add(CND);
			return CND;
		}			
	});		
		return creditNotesList;
	}

	@Override
	public List<NewCreditNote> viewCredit(String voucherID) {
		sql = "select * from vdebitcredit where voucher_No='"+voucherID+"'";
		return jdbcTemplate.query(sql, new RowMapper<NewCreditNote>(){
			List<NewCreditNote> creditDetailsList = new ArrayList<NewCreditNote>();
			public NewCreditNote mapRow(ResultSet rs, int rowNo) throws SQLException {
				NewCreditNote credit = new NewCreditNote();
				
				credit.setTxtVoucherNo(rs.getString("voucher_no"));
				credit.setTxtTransactionDate(rs.getString("transaction_date"));
				credit.setTxtFromAcnt(rs.getString("from_Account"));
				credit.setTxtToAcnt(rs.getString("to_Account"));
				credit.setTxtAmount(rs.getFloat("amount"));
				credit.setFromAccount(rs.getString("frmAccno"));
				credit.setToAccount(rs.getString("toAccNo"));
				credit.setTxtDescription(rs.getString("description"));
				credit.setTxtAmounthidden(rs.getFloat("amountHidden"));
				
				creditDetailsList.add(credit);
				
				return credit;
			}			
		});}

	@Override
	public List<NewAccount> retriveAccountNo() {
		String sql="select * from accounts_chart";		
		final List<NewAccount> accList=getJdbcTemplate().query(sql, new RowMapper<NewAccount>() {
		private List<NewAccount> accountList=new ArrayList<NewAccount>();
		public NewAccount mapRow(ResultSet rs,int rowNo)throws SQLException
		{
			NewAccount newAcc=new NewAccount();
			
			newAcc.setTxtNewAccNo(rs.getInt("account_No"));
			newAcc.setTxtAccountName(rs.getString("account_Name"));			
			accountList.add(newAcc);
			return newAcc;
		}	
		
	});		
		return accList;


	}
	@Override
	public NewCreditNote genrateID() {
		String auditId="";
		RowCountCallbackHandler countCallback = new RowCountCallbackHandler(); 
		 jdbcTemplate.query("select * from notes_voucher", countCallback);
		 int count = countCallback.getRowCount();
		 count++;
		// System.out.println("Count="+count);
		 if(count<10)
		 {
			 auditId="CRN00"+count;
		 }
		 else
		 {
		 if(count<99)
		 {
			 auditId = "CRN0" + count;
		 }
		 else
		{
			 auditId = "CRN" + count;
		}
		 }
		 NewCreditNote newCreditNote=new NewCreditNote();
		 newCreditNote.setTxtVoucherNo(auditId);
		 return newCreditNote;
	}

	
	@Override
	public int updateCreditNotes(NewCreditNote newCreditNote) {
		
		String updateEnqHeaderUrl1="UPDATE account_list SET opeinig_Balance=opeinig_Balance+'"+newCreditNote.getTxtAmounthidden()+"' WHERE account_No='"+newCreditNote.getTxtFromAcnt()+"'";
		int j=jdbcTemplate.update(updateEnqHeaderUrl1);
		
		String update1="UPDATE account_list SET opeinig_Balance=opeinig_Balance-'"+newCreditNote.getTxtAmounthidden()+"' WHERE account_No='"+newCreditNote.getTxtToAcnt()+"'";
		int m=jdbcTemplate.update(update1);
		
		String updateEnqHeaderUrl2="UPDATE account_list SET opeinig_Balance=opeinig_Balance-'"+newCreditNote.getTxtAmount()+"' WHERE account_No='"+newCreditNote.getTxtFromAcnt()+"'";
		int k=jdbcTemplate.update(updateEnqHeaderUrl2);
		
		String update2="UPDATE account_list SET opeinig_Balance=opeinig_Balance+'"+newCreditNote.getTxtAmount()+"' WHERE account_No='"+newCreditNote.getTxtToAcnt()+"'";
		int l=jdbcTemplate.update(update2);
		
		
		String updateEnqHeaderUrl="UPDATE notes_voucher SET transaction_Date='"+newCreditNote.getTxtTransactionDate()+"',"+"from_Account='"+newCreditNote.getTxtFromAcnt()+"',"+"to_Account='"+newCreditNote.getTxtToAcnt()+"',"+"amount='"+newCreditNote.getTxtAmount()+"', "+"amountHidden='"+newCreditNote.getTxtAmount()+"',"+"description='"+newCreditNote.getTxtDescription()+"' WHERE voucher_No='"+newCreditNote.getTxtVoucherNo()+"'";
		int i=jdbcTemplate.update(updateEnqHeaderUrl);

		if(i>=1&&j>=1&&k>=1&&m>=1&&l>=1)
		       {
					return 1;
		       }
		       else
		       {
		    	   	return 0;
		       }
	}

	@Override
	public int deleteCredit(String voucherID) {
		
		String Status="Inactive";
		String account_No="",type="";
		String journal_Id = "";
		int j=0;
		int k=0;
		String desc=jdbcTemplate.queryForObject("Select description from notes_voucher where voucher_No='"+voucherID+"'",String.class);
		
		String journalId=jdbcTemplate.queryForObject("select journal_Id from journal_header where refrence='"+voucherID+"'",String.class);	
		
		String  sql = "select totalDebit from journal_header where refrence = '"+voucherID+"' "; 
		String amount = jdbcTemplate.queryForObject(sql,String.class);
		//System.out.println("Amount="+amount);
		
		String  sql2 = "select from_Account from notes_voucher where voucher_No = '"+voucherID+"' "; 
		String fromacc = jdbcTemplate.queryForObject(sql2,String.class);
		//System.out.println("Frm Acc="+fromacc);
		
		String  sql3 = "select to_Account from notes_voucher where voucher_No = '"+voucherID+"' "; 
		String toacc = jdbcTemplate.queryForObject(sql3,String.class);
		//System.out.println("To Acc="+toacc);
		
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
		int x=1;
		
		
		 DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");	     
	    Date date = new Date();	     
	    String dt=dateFormat.format(date);
		String urlj="insert into journal_header value('"+journal_Id+"','Credit','"+voucherID+"','"+dt+"','R','"+desc+"','2','"+amount+"','"+amount+"')";
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
		 String urlLine1="insert into journal_details value('"+x+"','"+journal_Id+"','"+account_No+"','"+type+"','"+amount+"')";
			 jdbcTemplate.update(urlLine1);
		
			 if(x==1)
			 {
		         
		
		          String sql4 = "update accounts_chart set opeinig_Balance = opeinig_Balance + '"+amount+"' where account_No = '"+fromacc+"' ";
		         // System.out.println(sql4);
		          j=jdbcTemplate.update(sql4);
		
		          String sql5 = "update accounts_chart set opeinig_Balance = opeinig_Balance - '"+amount+"' where account_No = '"+toacc+"' ";
		       //   System.out.println(sql5);
	              k=jdbcTemplate.update(sql5);
	              
			 }
			 x++;
	}
		String updateEnqHeaderUrl="UPDATE notes_voucher SET status='"+Status+"' WHERE voucher_No='"+voucherID+"'";
        int i=jdbcTemplate.update(updateEnqHeaderUrl);
        
		if (i>0 && j>0 && k>0)
		{
			return 1;
		}
		else
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

	@Override
	public List<CompanyDetails> getInfo(CompanyDetails companyDetails) {
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

			/*System.out.println(composeMail.getMailTo()+"\n");
			System.out.println(composeMail.getSubject()+"\n");
			System.out.println(composeMail.getBody()+"\n");
			System.out.println(composeMail.getAttachment()+"\n");*/
			
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

	
}