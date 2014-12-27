package com.invoice.reports.dao;

import java.io.File;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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

import com.invoice.company.beans.CompanyDetails;
import com.invoice.purchase.beans.ComposeMail;
import com.invoice.reports.beans.PaymentAdvice;
import com.invoice.reports.beans.PaymentAdviceDetails;

@Component(value="paymentAdviceDao")
public class paymentAdviceDaoImpl implements paymentAdviceDao
{
	JdbcTemplate jdbcTemplate;
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	@Autowired
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	@Override
	public List<PaymentAdvice> showPaymentAdvice(int month,int year) 
	{
		try{			
			String sql="select e.emp_ID,e.salitation,e.f_Name,e.m_Name,l_Name,s1.account_No,a1.account_Name,s2.net_salary,s1.amount from employee_registration e,salary_payment s1,accounts_chart a1,salarypayment_header s2 where s1.month = '"+month+"' AND s1.year = '"+year+"' AND e.emp_ID = s2.emp_id AND s1.pay_id = s2.pay_id AND s1.account_No = a1.account_No AND SUBSTRING_INDEX(e.role, '/',1) != 'Admin'" ;
			final List<PaymentAdvice> paymentList=getJdbcTemplate().query(sql, new RowMapper<PaymentAdvice>() {
				private List<PaymentAdvice> payList=new ArrayList<PaymentAdvice>();
				public PaymentAdvice mapRow(ResultSet rs,int rowNo)throws SQLException
				{
					PaymentAdvice paymentAdvice=new PaymentAdvice();
					
					paymentAdvice.setEmp_Id(rs.getString("emp_ID")); 
					paymentAdvice.setSalitation(rs.getString("salitation"));
					paymentAdvice.setF_Name(rs.getString("f_Name"));
					paymentAdvice.setM_Name(rs.getString("m_Name"));
					paymentAdvice.setlName(rs.getString("l_Name"));
					paymentAdvice.setAccNo(rs.getString("account_No"));
					paymentAdvice.setBank_name(rs.getString("account_Name"));
					paymentAdvice.setAmount(rs.getFloat("net_salary")); 
					paymentAdvice.setTotal(rs.getFloat("amount")); 
					
					payList.add(paymentAdvice);
					return paymentAdvice;
				}
			});		
				return paymentList;
			}catch(Exception e)
			{
				return null;
			}
	}
	@Override
	public List<PaymentAdvice> retriveAdviceDetails(int month, int year)
	{
		try
		{
			String sql="select e.emp_ID,e.salitation,e.f_Name,e.m_Name,l_Name,s1.account_No,a1.account_Name,s2.net_salary,s1.amount from employee_registration e,salary_payment s1,accounts_chart a1,salarypayment_header s2 where s1.month = '"+month+"' AND s1.year = '"+year+"' AND e.emp_ID = s2.emp_id AND s1.pay_id = s2.pay_id AND s1.account_No = a1.account_No AND SUBSTRING_INDEX(e.role, '/',1) != 'Admin'" ;
		return jdbcTemplate.query(sql, new RowMapper<PaymentAdvice>(){
			List<PaymentAdviceDetails> details = new ArrayList<PaymentAdviceDetails>();
			public PaymentAdvice mapRow(ResultSet rs, int rowNo) throws SQLException {
				PaymentAdvice advice = new PaymentAdvice();
				PaymentAdviceDetails adviceDetails = new PaymentAdviceDetails();
				
				adviceDetails.setEmp_Id(rs.getString("emp_ID")); 
				adviceDetails.setSalitation(rs.getString("salitation"));
				adviceDetails.setF_Name(rs.getString("f_Name"));
				adviceDetails.setM_Name(rs.getString("m_Name"));
				adviceDetails.setlName(rs.getString("l_Name"));
				adviceDetails.setAccNo(rs.getString("account_No"));
				adviceDetails.setBank_name(rs.getString("account_Name"));
				adviceDetails.setAmount(rs.getFloat("net_salary")); 
				adviceDetails.setTotal(rs.getFloat("amount")); 
				details.add(adviceDetails);
				advice.setAdviceList(details);
				return advice;
			}			
		});
		}catch(Exception e)
		{
			System.out.println(e);
			return null;
		}
	}
	@Override
	public List<PaymentAdvice> retrivePaymentAdvice(String month,String year) 
	{
		try{
			String sql="select e.emp_ID,e.salitation,e.f_Name,e.m_Name,l_Name,s1.account_No,a1.account_Name,s2.net_salary,s1.amount from employee_registration e,salary_payment s1,accounts_chart a1,salarypayment_header s2 where s1.month = '"+month+"' AND s1.year = '"+year+"' AND e.emp_ID = s2.emp_id AND s1.pay_id = s2.pay_id AND s1.account_No = a1.account_No AND SUBSTRING_INDEX(e.role, '/',1) != 'Admin'" ;
			final List<PaymentAdvice> paymentList=getJdbcTemplate().query(sql, new RowMapper<PaymentAdvice>() {
				private List<PaymentAdvice> payList=new ArrayList<PaymentAdvice>();
				public PaymentAdvice mapRow(ResultSet rs,int rowNo)throws SQLException
				{
					PaymentAdvice paymentAdvice=new PaymentAdvice();
					
					paymentAdvice.setEmp_Id(rs.getString("emp_ID")); 
					paymentAdvice.setSalitation(rs.getString("salitation"));
					paymentAdvice.setF_Name(rs.getString("f_Name"));
					paymentAdvice.setM_Name(rs.getString("m_Name"));
					paymentAdvice.setlName(rs.getString("l_Name"));
					paymentAdvice.setAccNo(rs.getString("account_No"));
					paymentAdvice.setBank_name(rs.getString("account_Name"));
					paymentAdvice.setAmount(rs.getFloat("net_salary")); 
					paymentAdvice.setTotal(rs.getFloat("amount")); 
					
					payList.add(paymentAdvice);
					return paymentAdvice;
				}
			});		
				return paymentList;
			}catch(Exception e)
			{
				return null;
			}
	}
	@Override
	public String showCompanyName() 
	{
		String sql = "select comp_Name from comp_details";
		String compName = jdbcTemplate.queryForObject(sql, String.class);
		
		return compName;
	}
	@Override
	public List<CompanyDetails> getInfo(CompanyDetails companyDetails) {

		try{
		 String sql="select comp_Name,comp_Address,comp_Contact,comp_Mail,comp_Website,comp_desc,terms from comp_details";		
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
	public int sendMail(final ComposeMail composeMail)
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
		
			helper.addAttachment(composeMail.getId(),new File(System.getProperty("user.dir")+"/"+composeMail.getAttachment()));
			Transport.send(message);
	       File file=new File(System.getProperty("user.dir")+"/"+composeMail.getAttachment());
	      
	       file.delete();	      
 
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
		
		 return 1;    
		}catch(Exception e)
		{
			return 0;
		}
	}
	
}