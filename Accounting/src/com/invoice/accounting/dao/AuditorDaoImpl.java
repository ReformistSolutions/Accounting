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

import com.invoice.accounting.beans.AddNewAuditor;
import com.invoice.accounting.beans.ComposeMail;
import com.invoice.company.beans.CompanyDetails;
import com.invoice.newuser.beans.NewUserBean;
@Component(value="auditor")
public class AuditorDaoImpl implements AuditorDao
{
	String sql;
	JdbcTemplate jdbcTemplate;
	
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	@Autowired
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Override
	public int addnewAuditor(AddNewAuditor addnewAuditor) 
	{
		String status="Active";
		String sql="insert into auditor value('"+addnewAuditor.getTxtAuditNo()+"','"+addnewAuditor.getTxtName()+"','"+addnewAuditor.getTxtEmail()+"','"+status+"')";
		int  i=jdbcTemplate.update(sql);
		
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
	public List<AddNewAuditor> show()
	{
		String sql="select * from auditor where status='Active'";	
		final List<AddNewAuditor> auditorList=getJdbcTemplate().query(sql, new RowMapper<AddNewAuditor>() {
			private List<AddNewAuditor> audiList=new ArrayList<AddNewAuditor>();
			public AddNewAuditor mapRow(ResultSet rs,int rowNo)throws SQLException
			{
				AddNewAuditor addNewAuditor=new AddNewAuditor();
				
				addNewAuditor.setTxtAuditNo(rs.getString("audit_no"));
				addNewAuditor.setTxtName(rs.getString("name"));
				addNewAuditor.setTxtEmail(rs.getString("email"));
				
				audiList.add(addNewAuditor);
				return addNewAuditor;
			}	
		});		
			return auditorList;
		
	}
	@Override
	public List<AddNewAuditor> viewAuditors(String auditID) {
		sql = "select * from auditor where audit_no='"+auditID+"'";
		return jdbcTemplate.query(sql, new RowMapper<AddNewAuditor>(){
			List<AddNewAuditor> creditDetailsList = new ArrayList<AddNewAuditor>();
			public AddNewAuditor mapRow(ResultSet rs, int rowNo) throws SQLException {
				AddNewAuditor audit = new AddNewAuditor();
				
				audit.setTxtAuditNo(rs.getString("audit_no"));
				audit.setTxtEmail(rs.getString("email"));
				audit.setTxtName(rs.getString("name"));
								
				creditDetailsList.add(audit);
				
				return audit;
			}			
		});
	}
	@Override
	public AddNewAuditor generateID() {
		String auditId="";
		RowCountCallbackHandler countCallback = new RowCountCallbackHandler(); 
		 jdbcTemplate.query("select * from auditor", countCallback);
		 int count = countCallback.getRowCount();
		 count++;
		 System.out.println("Count="+count);
		 if(count<10)
		 {
			 auditId="Aud/00"+count;
		 }
		 else
		 {
		 if(count<99)
		 {
			 auditId = "Aud/0" + count;
		 }
		 else
		{
			 auditId = "Aud/" + count;
		}
		 }
		 AddNewAuditor auditor=new AddNewAuditor();
		 auditor.setTxtAuditNo(auditId);
		return auditor;
	}
	@Override
	public int update(AddNewAuditor addNewAuditor) {
		String status="Active";
		String updateEnqHeaderUrl="UPDATE auditor SET audit_no='"+addNewAuditor.getTxtAuditNo()+"',"+"name='"+addNewAuditor.getTxtName()+"',"+"email='"+addNewAuditor.getTxtEmail()+"',"+"status='"+status+"' WHERE audit_no='"+addNewAuditor.getTxtAuditNo()+"'";
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
	public int deleteaAuditor(String auditID) {
	String aStatus="Inactive";
	
		String updateEnqHeaderUrl="UPDATE auditor SET status='"+aStatus+"' WHERE audit_no='"+auditID+"'";
		int i=jdbcTemplate.update(updateEnqHeaderUrl);
		return i;
}
	@Override
	public List<NewUserBean> ViewNewUser() {
		sql = "select * from add_newuser where userFName ='Ranjit' ";
		return jdbcTemplate.query(sql, new RowMapper<NewUserBean>(){
			List<NewUserBean> ListofAccount = new ArrayList<NewUserBean>();
			public NewUserBean mapRow(ResultSet rs, int rowNo) throws SQLException {
				NewUserBean user = new NewUserBean();
				
				user.setTxtFName(rs.getString("userFName"));
				user.setTxtLName(rs.getString("userLName"));
				user.setTxtAddress(rs.getString("address"));
				user.setTxtEmailId(rs.getString("emailId"));
				user.setTxtMobileNo(rs.getString("mobileNo"));
				user.setTxtCompanyName(rs.getString("companyName"));
				user.setTxtWebSite(rs.getString("websiteName"));
				
				System.out.println("First Name"+user.getTxtFName());
				System.out.println("last Name"+user.getTxtLName());
				System.out.println("Comoany Name"+user.getTxtCompanyName());
			    ListofAccount.add(user);
				
				return user;
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

			System.out.println(composeMail.getMailTo()+"\n");
			System.out.println(composeMail.getSubject()+"\n");
			System.out.println(composeMail.getBody()+"\n");
			System.out.println(composeMail.getAttachment()+"\n");
			
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