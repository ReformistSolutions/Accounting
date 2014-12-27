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
import org.springframework.jdbc.core.RowCountCallbackHandler;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.invoice.accounting.beans.ComposeMail;
import com.invoice.accounting.beans.NewAccountGroup;
import com.invoice.company.beans.CompanyDetails;

@Component(value="accountGroupDao")
public class AccountGroupDaoImpl  implements AccountGroupDao{

	
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
	public int save(NewAccountGroup accountGroup) {
       
		String status="Active";
		int i=0,i1=0;
		String selVal=accountGroup.getTxtParentacntgrp();
		if(selVal.equals("p"))
		{
			sql="insert into primary_account_group values('"+accountGroup.getTxtAccGrpNo()+"','"+accountGroup.getTxtName()+"','"+accountGroup.getTxtDescription()+"','"+status+"')";
     		i=jdbcTemplate.update(sql);
		}
		else
		{
	     	String sql1="insert into sub_account_group values('"+accountGroup.getTxtsAccGrpNo()+"','"+accountGroup.getTxtName()+"','"+accountGroup.getTxtParentacntgrp()+"','"+accountGroup.getTxtDescription()+"','"+status+"')";
	     	i1=jdbcTemplate.update(sql1);
		}

		
		
	if(i>=0 && i1>=0)
    {
		return 1;
   }
    else
    {
 	   return 0;
    }
		}
		
	

	@Override
	public List<NewAccountGroup> showgroupAccount() {
		sql="select * from primary_account_group where status='Active' ";		
		final List<NewAccountGroup> groupOfAccountList=getJdbcTemplate().query(sql, new RowMapper<NewAccountGroup>() {
		private List<NewAccountGroup> grpAccList=new ArrayList<NewAccountGroup>();
		public NewAccountGroup mapRow(ResultSet rs,int rowNo)throws SQLException
		{
			NewAccountGroup groupAcc=new NewAccountGroup();
		     
			groupAcc.setTxtAccGrpNo(rs.getString("group_Id"));
			groupAcc.setTxtName(rs.getString("group_Name"));
			
			grpAccList.add(groupAcc);
			return groupAcc;
		}
	}
    );		
		return groupOfAccountList;
	}
	@Override
	public List<NewAccountGroup> showgroupsAccount() {
		sql="select * from vaccountgroup where status='Active' ";		
		final List<NewAccountGroup> groupOfAccountList=getJdbcTemplate().query(sql, new RowMapper<NewAccountGroup>() {
		private List<NewAccountGroup> grpAccList=new ArrayList<NewAccountGroup>();
		public NewAccountGroup mapRow(ResultSet rs,int rowNo)throws SQLException
		{
			NewAccountGroup groupAcc=new NewAccountGroup();
		     
			groupAcc.setTxtsAccGrpNo(rs.getString("subgroup_Id"));
			groupAcc.setTxtName(rs.getString("subgroup_Name"));
			groupAcc.setTxtParentacntgrp(rs.getString("group_Name"));
			
			grpAccList.add(groupAcc);
			return groupAcc;
		}
	}
    );		
		return groupOfAccountList;
	}


	@Override
	public List<NewAccountGroup> viewAccountGrop(String groupID) {
		sql = "select * from primary_account_group where group_Id='"+groupID+"'";
		return jdbcTemplate.query(sql, new RowMapper<NewAccountGroup>(){
			List<NewAccountGroup> creditDetailsList = new ArrayList<NewAccountGroup>();
			public NewAccountGroup mapRow(ResultSet rs, int rowNo) throws SQLException {
				NewAccountGroup newgroup = new NewAccountGroup();
				
				newgroup.setTxtAccGrpNo(rs.getString("group_Id"));
				newgroup.setTxtName(rs.getString("group_Name"));
				newgroup.setTxtDescription(rs.getString("description"));
			    			
				creditDetailsList.add(newgroup);
				return newgroup;
				
			}			
		});
	}
			
	
	@Override
	public List<NewAccountGroup> viewsAccountGrop(String groupID) {
		sql = "select * from vaccountgroup where subgroup_Id='"+groupID+"'";
		return jdbcTemplate.query(sql, new RowMapper<NewAccountGroup>(){
			List<NewAccountGroup> creditDetailsList = new ArrayList<NewAccountGroup>();
			public NewAccountGroup mapRow(ResultSet rs, int rowNo) throws SQLException {
				NewAccountGroup newgroup = new NewAccountGroup();
				
				newgroup.setTxtsAccGrpNo(rs.getString("subgroup_Id"));
				newgroup.setTxtName(rs.getString("subgroup_Name"));
				newgroup.setTxtAccGrpNo(rs.getString("group_Id"));
				newgroup.setTxtParentacntgrp(rs.getString("group_Name"));
				newgroup.setTxtDescription(rs.getString("description"));
				
				creditDetailsList.add(newgroup);
				return newgroup;
			}			
		});
	}

	@Override
	public NewAccountGroup genrateAccID() {
		String groupId="";
		RowCountCallbackHandler countCallback = new RowCountCallbackHandler(); // not reusable
		 jdbcTemplate.query("select * from primary_account_group", countCallback);
		 int count = countCallback.getRowCount();
		 count++;
		 //System.out.println("Count="+count);
		 if(count<10)
		 {
			 groupId="GRP00"+count;
		 }
		 else
		 {
		 if(count<99)
		 {
			 groupId = "GRP0" + count;
		 }
		 else
		{
			 groupId = "GRP/" + count;
		}
		 }
		 NewAccountGroup newAccountGroup=new NewAccountGroup();
		 newAccountGroup.setTxtAccGrpNo(groupId);
		// System.out.println(groupId);
		 return newAccountGroup;
	}

	@Override
	public int updateGroupAccount(NewAccountGroup newAccountGroup) {
		String updateEnqHeaderUrl="UPDATE primary_account_group SET group_Name='"+newAccountGroup.getTxtName()+"',"+"description='"+newAccountGroup.getTxtDescription()+"' WHERE group_Id='"+newAccountGroup.getTxtAccGrpNo()+"'";
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
	
	public int updatesGroupAccount(NewAccountGroup newAccountGroup) {
		String updateEnqHeaderUrl="UPDATE sub_account_group SET subgroup_Name='"+newAccountGroup.getTxtName()+"',parentgroup_Id='"+newAccountGroup.getTxtParentacntgrp()+"',"+"description='"+newAccountGroup.getTxtDescription()+"' WHERE subgroup_Id='"+newAccountGroup.getTxtsAccGrpNo()+"'";
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
	public int deletegroup(String groupID) {
		
		String Status="Inactive";
		String updateEnqHeaderUrl="UPDATE primary_account_group SET status='"+Status+"' WHERE group_Id='"+groupID+"'";
		int i=jdbcTemplate.update(updateEnqHeaderUrl);
		return i;
	}
	
	@Override
	public int deletesgroup(String groupID) {
		String Status="Inactive";
		String updateEnqHeaderUrl="UPDATE sub_account_group SET status='"+Status+"' WHERE subgroup_Id='"+groupID+"'";
		int i=jdbcTemplate.update(updateEnqHeaderUrl);
		return i;
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
	public NewAccountGroup genratesAccID() {
		String sgroupId="";
		RowCountCallbackHandler countCallback = new RowCountCallbackHandler();
		jdbcTemplate.query("select * from sub_account_group",countCallback);
		int count = countCallback.getRowCount();
		 count++;
		// System.out.println("Count="+count);
		 if(count<10)
		 {
			 sgroupId="GRS00"+count;
		 }
		 else
		 {
		 if(count<99)
		 {
			 sgroupId = "GRS0" + count;
		 }
		 else
		{
			 sgroupId = "GRS/" + count;
		}
		 }
		 NewAccountGroup newAccountGroup=new NewAccountGroup();
		 newAccountGroup.setTxtsAccGrpNo(sgroupId);
		// System.out.println(sgroupId);
		 return newAccountGroup;
	}
}