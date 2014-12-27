package com.invoice.accounting.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
import org.springframework.jdbc.core.RowMapper;


import org.springframework.stereotype.Component;

import com.invoice.accounting.beans.ComposeMail;
import com.invoice.accounting.beans.NewAccount;
import com.invoice.accounting.beans.NewAccountGroup;


import com.invoice.company.beans.CompanyDetails;

@Component(value="addNewAccountDao")
public class AddNewAccountDaoImpl  implements AddNewAccountDao{
  	
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
	public int save(NewAccount newAccount) {
		int i=0;
		String status="Active";
		sql="insert into accounts_chart values('"+newAccount.getTxtNewAccNo()+"','"+newAccount.getTxtAccountName()+"','"+newAccount.getTxtAccountGroup()+"','"+newAccount.getTxtOpeningBalance()+"','"+status+"')";
		 
		i=jdbcTemplate.update(sql);
		
	if(i>=1)
    {
		return 1;
   }
    else
    {
 	   return 0;
    }
	
	}
	@Override
	public List<NewAccount> showAccount() {
		sql="select * from vprimaccchart where status='Active'";		
		final List<NewAccount> accountList=getJdbcTemplate().query(sql, new RowMapper<NewAccount>() {
		private List<NewAccount> accList=new ArrayList<NewAccount>();
		public NewAccount mapRow(ResultSet rs,int rowNo)throws SQLException
		{
			NewAccount newacc=new NewAccount();
		     
			newacc.setTxtNewAccNo(rs.getInt("account_No"));
			newacc.setTxtAccountName(rs.getString("account_Name"));
			newacc.setGroupID(rs.getString("group_Name"));
			newacc.setAccnttype(rs.getString("group_Name"));
			newacc.setTxtOpeningBalance(rs.getFloat("opeinig_Balance"));
			
			accList.add(newacc);
			return newacc;
		}
	}
    );		
		return accountList;
	}
	
	@Override
	public NewAccount genrateAccID() {
		String sq = "select max(account_No)as acno from accounts_chart" ;
	 	int accountId = jdbcTemplate.queryForInt(sq);
	 	accountId++;
		/*String accountId="";
		RowCountCallbackHandler countCallback = new RowCountCallbackHandler();
		 jdbcTemplate.query("select * from accounts_chart", countCallback);
		 int count = countCallback.getRowCount();
		 count++;
		 System.out.println("Count="+count);
		 if(count<10)
		 {
			 accountId="10"+count;
		 }
		 else
		 {
		 if(count<99)
		 {
			 accountId = "1" + count;
		 }
		 else
		{
			 accountId = "" + count;
		}
		 }*/
		 NewAccount newAccount=new NewAccount();
		 newAccount.setTxtNewAccNo(accountId);
		 return newAccount;
		
	}
	
	@Override
	public List<NewAccount> viewAccountList(int accountID) {
		sql = "select * from vprimaccchart where account_No ='"+accountID+"'";
		return jdbcTemplate.query(sql, new RowMapper<NewAccount>(){
			List<NewAccount> ListofAccount = new ArrayList<NewAccount>();
			public NewAccount mapRow(ResultSet rs, int rowNo) throws SQLException {
				NewAccount newAccount = new NewAccount();
				
				newAccount.setTxtNewAccNo(rs.getInt("account_No"));
				newAccount.setTxtAccountName(rs.getString("account_Name"));
				newAccount.setGroupID(rs.getString("group_Id"));
				newAccount.setTxtAccountGroup(rs.getString("group_Name"));
				newAccount.setTxtOpeningBalance(rs.getFloat("opeinig_Balance"));
			    
			    ListofAccount.add(newAccount);
				
				return newAccount;
			}			
		});
	}
	
	@Override
	public List<NewAccount> viewsAccountList(int accountID) {
		sql = "select * from vsubaccchart where account_No ='"+accountID+"'";
		return jdbcTemplate.query(sql, new RowMapper<NewAccount>(){
			List<NewAccount> ListofAccount = new ArrayList<NewAccount>();
			public NewAccount mapRow(ResultSet rs, int rowNo) throws SQLException {
				NewAccount newAccount = new NewAccount();
				
				newAccount.setTxtNewAccNo(rs.getInt("account_No"));
				newAccount.setTxtAccountName(rs.getString("account_Name"));
				newAccount.setGroupID(rs.getString("subgroup_Id"));
				newAccount.setTxtAccountGroup(rs.getString("subgroup_Name"));
				newAccount.setTxtOpeningBalance(rs.getFloat("opeinig_Balance"));
			    
			    ListofAccount.add(newAccount);
				
				return newAccount;
			}			
		});
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
	@Override
	public List<NewAccountGroup> retrivepGroupName() {
		sql="select * from primary_account_group";
		final List<NewAccountGroup> paccGroup=getJdbcTemplate().query(sql, new RowMapper<NewAccountGroup>(){
	    private List<NewAccountGroup> accountList=new ArrayList<NewAccountGroup>();

		@Override
		public NewAccountGroup mapRow(ResultSet rs, int rowNo)throws SQLException {
				
			NewAccountGroup paccntgrp=new NewAccountGroup();
			paccntgrp.setTxtAccGrpNo(rs.getString("group_Id"));
			paccntgrp.setTxtName(rs.getString("group_Name"));	
			 
			
			accountList.add(paccntgrp);
			
			return paccntgrp;
		}	
	});		
		return paccGroup;
	}
	@Override
	public List<NewAccountGroup> retrivesGroupName() {
		
		sql="select * from sub_account_group";
		final List<NewAccountGroup> saccGroup=getJdbcTemplate().query(sql, new RowMapper<NewAccountGroup>(){
	    private List<NewAccountGroup> accountList=new ArrayList<NewAccountGroup>();

		@Override
		public NewAccountGroup mapRow(ResultSet rs, int rowNo)throws SQLException {
				
			NewAccountGroup saccntgrp=new NewAccountGroup();
			saccntgrp.setTxtsAccGrpNo(rs.getString("subgroup_Id"));
			saccntgrp.setTxtName(rs.getString("subgroup_Name"));	
			 
			
			accountList.add(saccntgrp);
			
			return saccntgrp;
		}	
	});		
		return saccGroup;
	}
	@Override
	public List<NewAccount> showsAccount() {
		sql="select * from vsubaccchart where status='Active'";		
		final List<NewAccount> accountList=getJdbcTemplate().query(sql, new RowMapper<NewAccount>() {
		private List<NewAccount> accList=new ArrayList<NewAccount>();
		public NewAccount mapRow(ResultSet rs,int rowNo)throws SQLException
		{
			NewAccount newacc=new NewAccount();
		     
			newacc.setTxtNewAccNo(rs.getInt("account_No"));
			newacc.setTxtAccountName(rs.getString("account_Name"));
			newacc.setGroupID(rs.getString("subgroup_Name"));
			newacc.setAccnttype(rs.getString("group_Name"));
			
			accList.add(newacc);
			return newacc;
		}
	}
    );		
		return accountList;
	}
	@Override
	public int updatepaccount(NewAccount newAccount) {
		String updateEnqHeaderUrl="UPDATE accounts_chart SET account_Name='"+newAccount.getTxtAccountName()+"',opeinig_Balance='"+newAccount.getTxtOpeningBalance()+"' WHERE account_No='"+newAccount.getTxtNewAccNo()+"'";
		int i=jdbcTemplate.update(updateEnqHeaderUrl);

		if(i>=1)
		       {
		return 1;
		      }
		       else
		       {
		    	   return 0;
		       }
	}
	@Override
	public int updatesaccount(NewAccount newAccount) {
		String updateEnqHeaderUrl="UPDATE accounts_chart SET account_Name='"+newAccount.getTxtAccountName()+"',opeinig_Balance='"+newAccount.getTxtOpeningBalance()+"' WHERE account_No='"+newAccount.getTxtNewAccNo()+"'"; 
		int i=jdbcTemplate.update(updateEnqHeaderUrl);

		if(i>=1)
		       {
		return 1;
		      }
		       else
		       {
		    	   return 0;
		       }
	}
	@Override
	public int deletepAccount(int accountID) {
		String Status="Inactive";
		String updateEnqHeaderUrl="UPDATE accounts_chart SET status='"+Status+"' WHERE account_No='"+accountID+"'";
		int i=jdbcTemplate.update(updateEnqHeaderUrl);
		return i;
		
	}
	@Override
	public int deletesAccount(int accountID) {
		String Status="Inactive";
		String updateEnqHeaderUrl="UPDATE accounts_chart SET status='"+Status+"' WHERE account_No='"+accountID+"'";
		int i=jdbcTemplate.update(updateEnqHeaderUrl);
		return i;
	}
	
}
	
