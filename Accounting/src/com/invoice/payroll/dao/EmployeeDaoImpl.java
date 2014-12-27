package com.invoice.payroll.dao;
import java.io.File;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCountCallbackHandler;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import com.invoice.payroll.beans.BreakupByEmployee;
import com.invoice.payroll.beans.ComposeMail;
import com.invoice.payroll.beans.EmployeeBeans;
import com.invoice.payroll.beans.EmployeeLeave;
import com.invoice.payroll.beans.Leave;
import com.invoice.payroll.beans.Payhead;
import com.invoice.payroll.beans.ProcessPayroll;
import com.invoice.payroll.beans.SalaryBeans;
import com.invoice.payroll.service.GenPassword;


@Component(value="empDao")
public class EmployeeDaoImpl extends HttpServlet implements EmployeeDao
{
	private  String UPLOAD_DIRECTORY = "d:/uploads";
		protected static final EmployeeBeans EmployeeBeans = null;
		int i=0;
		int iD=0;
		String sql1="";
		int id=0;
		
		private GenPassword gn;
	   
	 public GenPassword getGn() {
			return gn;
		}
	   @Autowired
		public void setGn(GenPassword gn) {
			this.gn = gn;
		}
	String status="Active";	
	 java.sql.Timestamp effdate=new java.sql.Timestamp(new java.util.Date().getTime());
	private JdbcTemplate jdbcTemplate;
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	@Autowired
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate)
	{
		this.jdbcTemplate = jdbcTemplate;
	}
	
	@Override
	public EmployeeBeans generateId() 
	{
		try{
		String EMP_ID="";
		RowCountCallbackHandler countCallback = new RowCountCallbackHandler();  // not reusable
		 jdbcTemplate.query("select * from employee_registration", countCallback);
		 int count = countCallback.getRowCount();
		 count++;
			 if(count<10)
		 {
			 EMP_ID="EID00"+count;
		 }
		 else
		 {
		 if(count<99)
		 {
			 EMP_ID = "EID0" + count;
		 }
		 else
		{
			 EMP_ID = "EID" + count;
		}
		 }
		 EmployeeBeans employeeBeans=new EmployeeBeans();
		 employeeBeans.setTxtEmpId(EMP_ID);
		return employeeBeans;	
		}catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public int saveEmployeedtls(EmployeeBeans employeeBeans,SalaryBeans salaryBeans,String Pass)
	{
		try{
		int em=0,k=0,l=0;		
		String str="";
		if(employeeBeans.getUserrole()==null)
		{
			str = "NA";
		}
		else
		{
			String [] roleArr=employeeBeans.getUserrole();
			 for(int temp=0;temp<roleArr.length;temp++)
			 {
				 str=str+roleArr[temp]+"/";
			 }
		}
		/*userName = employeeBeans.getTxtUserName();
		int UN = jdbcTemplate.queryForObject("select count(user_Name) from employee_registration where user_Name = '"+userName+"'", Integer.class);
		if(UN == 1)
		{
			return 0;
		}
		else
		{*/
			String url="insert into employee_registration value('"+employeeBeans.getTxtEmpId()+"','"+employeeBeans.getNameSal()+"','"+employeeBeans.getTxtfname()+"','"+employeeBeans.getTxtmname()+"','"+employeeBeans.getTxtlname()+"','"+employeeBeans.getTxtEmail()+"','"+employeeBeans.getTxtUserName()+"','"+str+"','"+employeeBeans.getGender()+"','"+employeeBeans.getBloodgrp()+"','"+employeeBeans.getTxtContact()+"','"+employeeBeans.getBirthdt()+"','"+employeeBeans.getTxtPA()+"','"+employeeBeans.getTxtPermAdd()+"','"+employeeBeans.getJDdt()+"','"+employeeBeans.getDesignation()+"','"+employeeBeans.getWorktype()+"','"+employeeBeans.getPayType()+"','"+employeeBeans.getDept()+"','"+employeeBeans.getTxtPAN()+"','"+employeeBeans.getTxtPFNo()+"','"+employeeBeans.getTxtBankNo()+"','"+employeeBeans.getTxtBankName()+"','"+employeeBeans.getTxtBankBranch()+"','"+employeeBeans.getTxtIFSCCode()+"','"+employeeBeans.getTxtLeavingdt()+"','"+employeeBeans.getTxtEsi()+"','"+effdate+"','"+status+"','"+employeeBeans.getPayheadtotal()+"','"+employeeBeans.getEffectiveDate()+"')";
			 i=jdbcTemplate.update(url);
			 
			 String applicable_type = employeeBeans.getPayrollType(); 
			 List<SalaryBeans> salList = employeeBeans.getSalaryBeans(); 
			 for(SalaryBeans ed : salList)
			 {
			 	String sql1="insert into salary_details(emp_id,payhead_name,payhead_type,payhead_amt,applicable_type)value('"+employeeBeans.getTxtEmpId()+"','"+ed.getPayheadname()+"','"+ed.getPayheadtype()+"','"+ed.getPayamt()+"','"+applicable_type+"')";
			 	iD= jdbcTemplate.update(sql1);
			 }
			if(applicable_type.equalsIgnoreCase("S"))
			{
				String sqlEmpl = "insert into employee_leave(leave_id,emp_id,leave_balance,leave_taken,total)select leave_id,'"+employeeBeans.getTxtEmpId()+"',no_leaves,0,no_leaves from comp_leave;" ;
				l=jdbcTemplate.update(sqlEmpl);
				
				  String sql2="insert into login value('"+employeeBeans.getTxtUserName()+"','"+Pass+"','"+str+"','"+status+"','"+employeeBeans.getTxtEmpId()+"') ";
				  k=jdbcTemplate.update(sql2);
				
				  String sql="select comp_Mail from comp_details";
				  final String sendermailid=(String) jdbcTemplate.queryForObject(sql,String.class);
				  
				  String empid=employeeBeans.getTxtEmpId();
				  String eid="select  email_Id from viewforpassword where empId='"+employeeBeans.getTxtEmpId()+"'"; 
				  final String sendtomailid=(String) jdbcTemplate.queryForObject(eid,String.class);
				  				
						String username="select  username from viewforpassword where empId='"+empid+"'";
						final String usernm=(String) jdbcTemplate.queryForObject(username,String.class);
						String pass="select  password from viewforpassword where  empId='"+empid+"'"; 
						final String passs=(String) jdbcTemplate.queryForObject(pass,String.class);
						
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
							
							helper.setTo(sendtomailid);
							helper.setSubject("User Name And Password");
							helper.setText("Welcome  "+employeeBeans.getTxtfname()+"\nYour Username and Password As   "+"\nUserName="+usernm+"\nPassword="+passs +"\n For login visit www.acceptancetest.in\n\nThank You.");
						    Transport.send(message);
					  	} 
						catch (MessagingException e)
						{
							throw new RuntimeException(e);
						}
			}
			else if(applicable_type.equalsIgnoreCase("W"))
			{
				String sqlEmpl = "insert into employee_leave(leave_id,emp_id,leave_balance,leave_taken,total)select leave_id,'"+employeeBeans.getTxtEmpId()+"',no_leaves,0,no_leaves from comp_leave;" ;
				em=jdbcTemplate.update(sqlEmpl);
				
			}
				if(i >= 0 && iD >= 0 && k >= 0 && l >= 0) 
				{
					return 1;
				}
				if(em >= 0) 
				{
					return 1;
				}
				else
				{
					return 0;
				}
		//}
		 
		}catch(Exception e)
		{
			System.out.println(e);
			return 0;
		}
	}
	@Override
	public List<EmployeeBeans> show() 
	{
		try{
		String sql="select emp_ID,f_Name,m_Name,l_Name from employee_registration where status='Active' AND SUBSTRING_INDEX(role, '/',1) != 'Admin'" ;	
		final List<EmployeeBeans> employeeList=getJdbcTemplate().query(sql, new RowMapper<EmployeeBeans>() {
			private List<EmployeeBeans> empList=new ArrayList<EmployeeBeans>();
			public EmployeeBeans mapRow(ResultSet rs,int rowNo)throws SQLException
			{
				EmployeeBeans empbeans=new EmployeeBeans();
				
				empbeans.setTxtfname(rs.getString("f_Name"));
				empbeans.setTxtmname(rs.getString("m_Name"));
				empbeans.setTxtlname(rs.getString("l_Name"));
				empbeans.setTxtEmpId(rs.getString("emp_ID"));
				empList.add(empbeans);
				return empbeans;
			}
		});		
			return employeeList;
		}catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public List<EmployeeBeans> showEmployee(String emp_ID) 
	{
		try{
			int cnt=jdbcTemplate.queryForObject("select count(*) from vemployeedetails where emp_ID = '"+emp_ID+"' ", Integer.class);
		if(cnt > 0)
		{
		String sql = "select * from vemployeedetails where emp_ID = '"+emp_ID+"'";
		return jdbcTemplate.query(sql, new RowMapper<EmployeeBeans>(){
			List<SalaryBeans> salaryDetailsList = new ArrayList<SalaryBeans>();
			public EmployeeBeans mapRow(ResultSet rs, int rowNo) throws SQLException {
				EmployeeBeans empbns = new EmployeeBeans();
				SalaryBeans salaryBeans = new SalaryBeans();
				
				empbns.setTxtEmpId(rs.getString("emp_ID"));
				empbns.setNameSal(rs.getString("salitation"));
				empbns.setTxtfname(rs.getString("f_Name"));
				empbns.setTxtmname(rs.getString("m_Name"));
				empbns.setTxtlname(rs.getString("l_Name"));
				empbns.setTxtEmpId(rs.getString("emp_ID"));
				empbns.setTxtEmail(rs.getString("email_Id"));
				empbns.setTxtUserName(rs.getString("user_Name"));
				empbns.setTxtContact(rs.getString("contact_No")); 
				empbns.setGender(rs.getString("gender"));
				empbns.setBloodgrp(rs.getString("blood_Group"));
				empbns.setBirthdt(rs.getString("date_Of_Birth"));
				empbns.setTxtPermAdd(rs.getString("permantent_Address"));
				empbns.setTxtPA(rs.getString("current_Address"));
				empbns.setJDdt(rs.getString("join_Date"));
				empbns.setDesignation(rs.getString("desName"));
				empbns.setWorktype(rs.getString("work_Type"));
				empbns.setPayType(rs.getString("payment_Type"));
				empbns.setDept(rs.getString("deptName"));
				empbns.setPayheadtotal(rs.getFloat("payhead_total")); 
				empbns.setTxtPAN(rs.getString("pan_No"));
				empbns.setTxtPFNo(rs.getString("pf_Account_No"));
				empbns.setTxtBankNo(rs.getString("bank_Account_No"));
				empbns.setTxtBankName(rs.getString("bank_Name"));
				empbns.setTxtBankBranch(rs.getString("bank_Branch"));
				empbns.setTxtIFSCCode(rs.getString("ifse_Code"));
				empbns.setTxtLeavingdt(rs.getString("leaving_Date"));
				empbns.setTxtEsi(rs.getString("esi_No"));
				empbns.setTotalSalary(rs.getFloat("payhead_total"));
				empbns.setEffectiveDate(rs.getString("effective_date")); 
				empbns.setPayrollType(rs.getString("applicable_type")); 
				
				salaryBeans.setPayheadid(rs.getString("pay_id"));
				salaryBeans.setApplicable_type(rs.getString("applicable_type")); 
				salaryBeans.setPayheadname(rs.getString("pay_name"));
				salaryBeans.setPayheadtype(rs.getString("payhead_type"));
				salaryBeans.setPayamt(rs.getFloat("payhead_amt"));
				
				
				
				String str=rs.getString("role");
				String s="";
				int len=1;
				for(int i=0;i<str.length();i++)
				{
					char ch=str.charAt(i);
					if(ch=='/')
					{
						len++;
					}   
				}
				String rollarr[]= new  String [len];
				   int j=0;		  
				   j++;
				   for(int i=0;i<str.length();i++)
				   {   
					   char ch=str.charAt(i);
					   
					   if(ch!='/')
					   {
						   s=s+ch;
						 }
					   else
					   {
						   rollarr[j]=s; 
							s="";
							
							j++;
						 }
				   }
				int x=rollarr.length;
				rollarr[0]=""+x;
				empbns.setUserrole(rollarr);
				
				salaryDetailsList.add(salaryBeans);
				empbns.setSalaryBeans(salaryDetailsList);
				return empbns;
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
	public int updateEmployeedtl(EmployeeBeans employeeBeans) 
	{
		try {
			int ip = 0, q = 0;
			String str1="";
			if(employeeBeans.getUserrole()==null)
			{
				str1 = "NA";
			}
			else
			{
				String [] roleArr=employeeBeans.getUserrole();
				 for(int temp=0;temp<roleArr.length;temp++)
				 {
					 str1=str1+roleArr[temp]+"/";
				 }
			}
			String sql = "UPDATE employee_registration SET salitation='"
					+ employeeBeans.getNameSal() + "'," + "f_Name='"
					+ employeeBeans.getTxtfname() + "'," + "m_Name='"
					+ employeeBeans.getTxtmname() + "'," + "l_Name='"
					+ employeeBeans.getTxtlname() + "'," + "email_Id='"
					+ employeeBeans.getTxtEmail() + "'," + "user_Name='"
					+ employeeBeans.getTxtUserName() + "'," + "role='" + str1
					+ "'," + "gender='" + employeeBeans.getGender() + "',"
					+ "blood_Group='" + employeeBeans.getBloodgrp() + "',"
					+ "date_Of_Birth='" + employeeBeans.getBirthdt() + "',"
					+ "current_Address='" + employeeBeans.getTxtPA() + "',"
					+ "permantent_Address='" + employeeBeans.getTxtPermAdd()
					+ "'," + "payhead_total='"
					+ employeeBeans.getPayheadtotal() + "' WHERE emp_ID='"
					+ employeeBeans.getTxtEmpId() + "'";
			ip = jdbcTemplate.update(sql);
			
			String emp_id = employeeBeans.getTxtEmpId();
			deleteList(emp_id);
			
			List<SalaryBeans> salaryList = employeeBeans.getSalaryBeans();
			for (SalaryBeans salaryBeans : salaryList) 
			{
				String s1 = "insert into salary_details(emp_id,payhead_name,payhead_type,payhead_amt,applicable_type) value('"+employeeBeans.getTxtEmpId()+"','"+salaryBeans.getPayheadname()+"','"+salaryBeans.getPayheadtype()+"','"+salaryBeans.getPayamt()+"','"+salaryBeans.getApplicable_type()+"')";
				q = jdbcTemplate.update(s1);
			}
			
			if (ip >= 1 && q >= 1) 
			{
				return 1;
			}
			else 
			{
				return 0;
			}
		}
		catch (Exception e) 
		{
			System.out.println(e); 
			return 0;
		}
	}
	
	private void deleteList(String emp_id)
	{
		try
		{
			String del = "delete from salary_details where emp_id = '"+emp_id+"' ";
			jdbcTemplate.update(del);
		}catch(Exception e)
		{
			return ; 
		}
	}
	@Override
	public int delete(String emp_ID) 
	{
		try{
		String sql="UPDATE employee_registration SET status='Inactive' WHERE emp_ID='"+emp_ID+"'";
		int i=jdbcTemplate.update(sql);
		return i;
		}catch(Exception e)
		{
			return 0;
		}
	}
	@Override
	public int restoreEmp(String emp_ID) 
	{
		try{
		String sql="UPDATE employee_registration SET status='Active' WHERE emp_ID='"+emp_ID+"'";
		int i=jdbcTemplate.update(sql);
		return i;
		}catch(Exception e)
		{
			return 0;
		}
	}
	@Override
	public List<EmployeeBeans> inactiveshow() 
	{
		try{
		String sql="select emp_ID,f_Name,m_Name,l_Name from employee_registration where status='Inactive' AND SUBSTRING_INDEX(role, '/',1) != 'Admin'";	
		final List<EmployeeBeans> employeeList=getJdbcTemplate().query(sql, new RowMapper<EmployeeBeans>() {
			private List<EmployeeBeans> empList=new ArrayList<EmployeeBeans>();
			public EmployeeBeans mapRow(ResultSet rs,int rowNo)throws SQLException
			{
				EmployeeBeans empbeans=new EmployeeBeans();
				
				empbeans.setTxtfname(rs.getString("f_Name"));
				empbeans.setTxtmname(rs.getString("m_Name"));
				empbeans.setTxtlname(rs.getString("l_Name"));
				empbeans.setTxtEmpId(rs.getString("emp_ID"));
				empList.add(empbeans);
				return empbeans;
			}
		});		
			return employeeList;
		}
		catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public List<EmployeeBeans> showAdmin() 
	{
		try{
		String sql="select f_Name,email_Id from employee_registration where SUBSTRING_INDEX(role, '/',1)= 'Admin'  ";	
		final List<EmployeeBeans> employeeList=getJdbcTemplate().query(sql, new RowMapper<EmployeeBeans>() 
		{
			private List<EmployeeBeans> empList=new ArrayList<EmployeeBeans>();
			public EmployeeBeans mapRow(ResultSet rs,int rowNo)throws SQLException
			{
				EmployeeBeans empbeans=new EmployeeBeans();
				
				empbeans.setTxtfname(rs.getString("f_Name"));				
				empbeans.setTxtEmail(rs.getString("email_Id"));  
				empList.add(empbeans);
				return empbeans;
			}
		});		
			return employeeList;
		}
		catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public int cntactive() 
	{
		try{
		int statuscnt = this.jdbcTemplate.queryForInt("select count(*) from employee_registration where status = ?", "Active");
		return statuscnt;
		}
		catch(Exception e)
		{
			return 0;
		}
	}
	@Override
	public int cntinactive() 
	{
		try{
		int inactivecnt = this.jdbcTemplate.queryForInt("select count(*) from employee_registration where status = ?", "Inactive");
		return inactivecnt;
		}
		catch(Exception e)
		{
			return 0;
		}
	}
	@Override
	public int cnttotal()
	{
		try{
		int totalcnt = this.jdbcTemplate.queryForInt("select count(*) from employee_registration");
		return totalcnt;
		}
		catch(Exception e)
		{
			return 0;
		}
	}
	@Override
	public EmployeeBeans showEmployeeEmpIdDao(String txtEmpId) 
	{
		try{
		String sql = "select * from vemployeedetails where emp_ID ='"+txtEmpId+"'";
		return (com.invoice.payroll.beans.EmployeeBeans) jdbcTemplate.query(sql, new RowMapper<EmployeeBeans>(){
		public EmployeeBeans mapRow(ResultSet rs, int rowNo) throws SQLException {
			EmployeeBeans empbns = new EmployeeBeans();
			empbns.setNameSal(rs.getString("salitation"));
			empbns.setTxtfname(rs.getString("f_Name"));
			empbns.setTxtmname(rs.getString("m_Name"));
			empbns.setTxtlname(rs.getString("l_Name"));
			empbns.setTxtEmpId(rs.getString("emp_ID"));
			empbns.setTxtEmail(rs.getString("email_Id"));
			empbns.setTxtUserName(rs.getString("user_Name"));
			
		   String str=rs.getString("role");
		   String s="";
		   int len=1;
		   for(int i=0;i<str.length();i++)
		   {			   
			   char ch=str.charAt(i);			  
			   if(ch=='/')
			   {
				   len++;				
			   }			   
		   }
		   String rollarr[]= new  String [len];
		   int j=0;		  
		   j++;
		   for(int i=0;i<str.length();i++)
		   {			   
			   char ch=str.charAt(i);			  
			   if(ch!='/')
			   {
				   s=s+ch;
			   }
			   else
			   {
				   rollarr[j]=s; 
					s="";					
					j++;
			   }
		   }
		   int x=rollarr.length;
		   rollarr[0]=""+x;
		   empbns.setUserrole(rollarr);
			
			empbns.setGender(rs.getString("gender"));
			empbns.setBloodgrp(rs.getString("blood_Group"));
			empbns.setTxtContact(rs.getString("contact_No"));
			empbns.setBirthdt(rs.getString("date_Of_Birth"));
			empbns.setTxtPA(rs.getString("current_Address"));
			empbns.setTxtPermAdd(rs.getString("permantent_Address"));
			empbns.setJDdt(rs.getString("join_Date"));
			empbns.setDesignation(rs.getString("designation"));
			empbns.setWorktype(rs.getString("work_Type"));
			empbns.setPayType(rs.getString("payment_Type"));
			empbns.setDept(rs.getString("department"));
			
			return empbns;
		}			
	});
		}
		catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public int sendMail(String loginEmpId,ComposeMail composeMail) 
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
			
			
			/*helper.setTo(composeMail.getMailTo());
			helper.setCc(composeMail.getMailCC());
			helper.setBcc(composeMail.getMailBCC());
			helper.setSubject(composeMail.getSubject());
			helper.setText(String.format(String.format(composeMail.getBody())));*/
			
			String path=System.getProperty("user.dir");
			String attachment=composeMail.getAttachment();
			helper.addAttachment("Salary Slip",new File(path+"/"+attachment));
			Transport.send(message);
			       File file=new File(path+"/"+attachment);
			       file.delete();
			       
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	
		 return 1; 
		}
		catch(Exception e)
		{
			System.out.println(e); 
			return 0;
		}
		 }
	@Override
	public int addEmployeeDao(com.invoice.payroll.beans.EmployeeBeans emp,
			String pass) { 
		return 0;
	}
	@Override
	public List<Payhead> showPayhead(String type) 
	{
		try
		{
			List<Payhead> payheadlist = new ArrayList<Payhead>();
			if(type.equalsIgnoreCase("S"))
			{
				String sql = "select pay_id,pay_name,payhead_type,applicable_type,applicable from payhead where applicable = 'Mandatory' AND applicable_type in( '"+type+"', 'B') AND  payhead_type !='Direct Expenses' ";
				payheadlist = getJdbcTemplate().query(sql, new RowMapper<Payhead>()
				{
					private List<Payhead> payList = new ArrayList<Payhead>();
					@Override
					public Payhead mapRow(ResultSet rs, int rowNo) throws SQLException {
						
						Payhead payhead = new Payhead();
						payhead.setTxtPayId(rs.getString("pay_id"));
						payhead.setTxtPayheadName(rs.getString("pay_name"));
						payhead.setTxtPayheadType(rs.getString("payhead_type")); 
						payhead.setApplicable_type(rs.getString("applicable_type")); 
						payhead.setApplicable(rs.getString("applicable"));
						payList.add(payhead);
						return payhead;
					}			 
				});
			}
			else if(type.equalsIgnoreCase("W"))
			{
				String sql = "select pay_id,pay_name,payhead_type,applicable_type,applicable from payhead where applicable = 'Mandatory' AND applicable_type in( '"+type+"', 'B') AND  payhead_type !='Indirect Expenses' ";
				payheadlist = getJdbcTemplate().query(sql, new RowMapper<Payhead>()
				{
					private List<Payhead> payList = new ArrayList<Payhead>();
					@Override
					public Payhead mapRow(ResultSet rs, int rowNo) throws SQLException {
						
						Payhead payhead = new Payhead();
						payhead.setTxtPayId(rs.getString("pay_id"));
						payhead.setTxtPayheadName(rs.getString("pay_name"));
						payhead.setTxtPayheadType(rs.getString("payhead_type")); 
						payhead.setApplicable_type(rs.getString("applicable_type"));
						payhead.setApplicable(rs.getString("applicable"));
						payList.add(payhead);
						return payhead;
					}			 
				});
			}
			
		return payheadlist;
		}
		catch(Exception e)
		{
			System.out.println(e);
 			return null;
		}
	}
	
	@Override
	public List<EmployeeLeave> showLeaves(String emp_ID)
	{
		try{
		String sql = "select * from vemployeeleaves where emp_id = '"+emp_ID+"'  ";
		final List<EmployeeLeave> payheadlist = getJdbcTemplate().query(sql, new RowMapper<EmployeeLeave>()
		{
			private List<EmployeeLeave> payList = new ArrayList<EmployeeLeave>();
			@Override
			public EmployeeLeave mapRow(ResultSet rs, int rowNo) throws SQLException {
				
				EmployeeLeave leave = new EmployeeLeave();
				leave.setLeaveid(rs.getString("leave_id"));
				leave.setLeaveName(rs.getString("leave_name"));
				leave.setTotal(rs.getInt("total")); 
				leave.setLeavetaken(rs.getInt("leave_taken"));
				leave.setLeavebal(rs.getInt("leave_balance"));
				
				payList.add(leave);
				return leave;
			}			
		});
		return payheadlist;
		}
		catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public List<SalaryBeans> showSal(String emp_ID) 
	{
		try{
		String sql = "select s1.payhead_name,s1.payhead_type ,s1.payhead_amt,p1.pay_name from salary_details s1,payhead p1 where s1.emp_id = '"+emp_ID+"' AND s1.payhead_name = p1.pay_id;";
		final List<SalaryBeans> payheadlist = getJdbcTemplate().query(sql, new RowMapper<SalaryBeans>()
		{
			private List<SalaryBeans> payList = new ArrayList<SalaryBeans>();
			@Override
			public SalaryBeans mapRow(ResultSet rs, int rowNo) throws SQLException {
				
				SalaryBeans sal = new SalaryBeans();
				sal.setPayheadid(rs.getString("pay_name"));
				sal.setPayheadtype(rs.getString("payhead_type"));
				sal.setPayamt(rs.getFloat("payhead_amt"));
				payList.add(sal);
				return sal;
			}
		});
		return payheadlist;
		}
		catch(Exception e)
		{
			return null;
		}
	}
	
	@Override
	public List<EmployeeBeans> salaryProcess() 
	{
		try{
		/*String sql = "select e.emp_ID,e.salitation, e.f_name,e.m_name,e.l_name,e.payhead_total, sum(emp.leave_balance) as leave_balance,sum(emp.total) as total,emp.emp_id from employee_registration e,employee_leave emp where e.emp_ID = emp.emp_id group by e.emp_ID ";*/
		String sql = "select e.emp_ID,e.salitation, e.f_name,e.m_name,e.l_name,e.payhead_total, sum(emp.leave_taken) as leave_balance,sum(emp.total) as total,emp.emp_id from employee_registration e,employee_leave emp where e.emp_ID = emp.emp_id AND SUBSTRING_INDEX(e.role, '/',1) != 'Admin' OR e.role ='NA' group by e.emp_ID " ;
		final List<EmployeeBeans> payheadlist = getJdbcTemplate().query(sql, new RowMapper<EmployeeBeans>()
		{	
			private List<EmployeeBeans> payList = new ArrayList<EmployeeBeans>();
			@Override
			public EmployeeBeans mapRow(ResultSet rs, int rowNo) throws SQLException
			{
				EmployeeBeans employeeBeans = new EmployeeBeans();
				employeeBeans.setEmpId(rs.getString("emp_ID"));
				employeeBeans.setNameSal(rs.getString("salitation"));
				employeeBeans.setTxtfname(rs.getString("f_Name"));
				employeeBeans.setTxtmname(rs.getString("m_Name"));
				employeeBeans.setTxtlname(rs.getString("l_Name"));
				employeeBeans.setPayheadtotal(rs.getFloat("payhead_total"));
				employeeBeans.setLeavesUsed(rs.getInt("leave_balance"));
				employeeBeans.setLeavesTotal(rs.getInt("total"));
				String empid = rs.getString("emp_ID");
				int UN = jdbcTemplate.queryForObject("select count(emp_id) from variablename_temp where emp_id = '"+empid+"'", Integer.class);
				employeeBeans.setCount(UN);
				payList.add(employeeBeans);
				return employeeBeans;
			}
		});
		return payheadlist;
		}
		catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public List<Payhead> showVeriableName()
	{
	try{
		String sql = "select pay_id,pay_name,payhead_type from payhead where applicable = 'Optional' ";
		final List<Payhead> payheadlist = getJdbcTemplate().query(sql, new RowMapper<Payhead>()
		{
			private List<Payhead> payList = new ArrayList<Payhead>();
			@Override
			public Payhead mapRow(ResultSet rs, int rowNo) throws SQLException
			{
				Payhead payhead = new Payhead();
				payhead.setTxtPayId(rs.getString("pay_id"));
				payhead.setTxtPayheadName(rs.getString("pay_name"));
				payhead.setTxtPayheadType(rs.getString("payhead_type"));
				
				payList.add(payhead);
				return payhead;
			}
		});
		return payheadlist;
		}
		catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public List<EmployeeBeans> processPayroll() {

		try{
		String sql = "select * from vprocesspayroll group by emp_ID";
		final List<EmployeeBeans> payheadlist = getJdbcTemplate().query(sql, new RowMapper<EmployeeBeans>()
		{
			private List<EmployeeBeans> payList = new ArrayList<EmployeeBeans>();
			@Override
			public EmployeeBeans mapRow(ResultSet rs, int rowNo) throws SQLException 	
			{	
				EmployeeBeans employeeBeans = new EmployeeBeans();
				employeeBeans.setEmpId(rs.getString("emp_ID"));
				employeeBeans.setTxtfname(rs.getString("f_Name"));
				employeeBeans.setTxtmname(rs.getString("m_Name"));
				employeeBeans.setTxtlname(rs.getString("l_Name"));
				employeeBeans.setDaysAbsent(rs.getInt("days_absent"));
				employeeBeans.setTotalSalary(rs.getFloat("amount"));
				employeeBeans.setPayName(rs.getString("pay_name"));
				
				payList.add(employeeBeans);
				return employeeBeans;
			}
		});
		return payheadlist;
		}
		catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public List<SalaryBeans> showEarning(String emp_ID,int month,int year) 
	{			
		try
		{
		List<SalaryBeans> sallist = new ArrayList<SalaryBeans>();	
		String applicable_type = "";
		List<SalaryBeans> salaryBeans = getApplicable_Type(emp_ID);
		for (SalaryBeans salaryBeans2 : salaryBeans) 
		{
			applicable_type = salaryBeans2.getApplicable_type();
		}		
		if(applicable_type.equalsIgnoreCase("S"))
		{
			String sql = "select s.emp_id, s.payhead_id,p.pay_name,s.payhead_type,s.amount from salarypayment_details s,salary_payment sp,payhead p where s.applicable_type = '"+applicable_type+"' AND  sp.pay_id = s.pay_id AND emp_id = '"+emp_ID+"' AND sp.month='"+month+"' AND sp.year='"+year+"' AND s.payhead_type = 'Indirect Expenses' AND s.payhead_id = p.pay_id";
			sallist = getJdbcTemplate().query(sql, new RowMapper<SalaryBeans>()
			{	
				private List<SalaryBeans> sList = new ArrayList<SalaryBeans>();		
				@Override		
				public SalaryBeans mapRow(ResultSet rs, int rowNo) throws SQLException 	
				{	
					SalaryBeans salaryBeans = new SalaryBeans(); 
					salaryBeans.setPayheadname(rs.getString("pay_name"));
					salaryBeans.setPayamt(rs.getFloat("amount"));
					sList.add(salaryBeans);
					return salaryBeans;
				}
			});
			return sallist;
		}
		else if(applicable_type.equalsIgnoreCase("W"))
		{
			String sql = "select s.emp_id, s.payhead_id,p.pay_name,s.payhead_type,s.amount from salarypayment_details s,salary_payment sp,payhead p where s.applicable_type = '"+applicable_type+"' AND  sp.pay_id = s.pay_id AND emp_id = '"+emp_ID+"' AND sp.month='"+month+"' AND sp.year='"+year+"' AND s.payhead_type = 'Direct Expenses' AND s.payhead_id = p.pay_id";
			sallist = getJdbcTemplate().query(sql, new RowMapper<SalaryBeans>()
			{	
				private List<SalaryBeans> sList = new ArrayList<SalaryBeans>();		
				@Override		
				public SalaryBeans mapRow(ResultSet rs, int rowNo) throws SQLException 	
				{	
					SalaryBeans salaryBeans = new SalaryBeans(); 
					salaryBeans.setPayheadname(rs.getString("pay_name"));
					salaryBeans.setPayamt(rs.getFloat("amount"));
					sList.add(salaryBeans);
					return salaryBeans;
				}
			});
			return sallist;
		}
		return sallist;
		}
		catch(Exception e)
		{
			return null;
		}
	}
	
	@Override
	public List<SalaryBeans> showDeduction(String emp_ID,int month,int year) 
	{
		try
		{
			List<SalaryBeans> sallist = new ArrayList<SalaryBeans>();	
			String applicable_type = "";
			List<SalaryBeans> salaryBeans = getApplicable_Type(emp_ID);
			for (SalaryBeans salaryBeans2 : salaryBeans) 
			{
				applicable_type = salaryBeans2.getApplicable_type();
			}
			if(applicable_type.equalsIgnoreCase("S"))
			{
				String sql = "select s.emp_id, s.payhead_id,p.pay_name,s.payhead_type,s.amount from salarypayment_details s,salary_payment sp,payhead p where s.applicable_type = '"+applicable_type+"' AND  sp.pay_id = s.pay_id AND emp_id = '"+emp_ID+"' AND sp.month='"+month+"' AND sp.year='"+year+"' AND s.payhead_type = 'Duties and Taxes' AND s.payhead_id = p.pay_id";
				sallist = getJdbcTemplate().query(sql, new RowMapper<SalaryBeans>()	
				{
					private List<SalaryBeans> sList = new ArrayList<SalaryBeans>();
					@Override
					public SalaryBeans mapRow(ResultSet rs, int rowNo) throws SQLException
					{	
						SalaryBeans salaryBeans = new SalaryBeans();
						salaryBeans.setPayheadname(rs.getString("pay_name"));
						salaryBeans.setPayamt(rs.getFloat("amount"));
						
						sList.add(salaryBeans);
						return salaryBeans;
					}	
				});
				return sallist;
			}
			else if(applicable_type.equalsIgnoreCase("W"))
			{
				String sql = "select s.emp_id, s.payhead_id,p.pay_name,s.payhead_type,s.amount from salarypayment_details s,salary_payment sp,payhead p where s.applicable_type = '"+applicable_type+"' AND  sp.pay_id = s.pay_id AND emp_id = '"+emp_ID+"' AND sp.month='"+month+"' AND sp.year='"+year+"' AND s.payhead_type = 'Duties and Taxes' AND s.payhead_id = p.pay_id";
				sallist = getJdbcTemplate().query(sql, new RowMapper<SalaryBeans>()
				{
					private List<SalaryBeans> sList = new ArrayList<SalaryBeans>();
					@Override
					public SalaryBeans mapRow(ResultSet rs, int rowNo) throws SQLException
					{	
						SalaryBeans salaryBeans = new SalaryBeans();
						salaryBeans.setPayheadname(rs.getString("pay_name"));
						salaryBeans.setPayamt(rs.getFloat("amount"));
						
						sList.add(salaryBeans);
						return salaryBeans;
					}	
				});
				return sallist;
			}
			return sallist;
		}
		catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public String showNetSalary(String emp_ID,int month,int year) 
	{
		try
		{
			String sql = "select s1.net_salary from salarypayment_header s1, salary_payment s2 where s1.pay_id = s2.pay_id AND s2.month = '"+month+"' AND s2.year = '"+year+"' AND s1.emp_id = '"+emp_ID+"'";
			String netSalary = jdbcTemplate.queryForObject(sql, String.class);
			return netSalary;
		}
		catch(Exception e)
		{
			return null;
		}
	}	
		
	@Override
	public String showEarningAmount(String emp_ID,int month,int year) 
	{
		try
		{
			String earningAmt = "";
			String applicable_type = "";
			List<SalaryBeans> salaryBeans = getApplicable_Type(emp_ID);
			for (SalaryBeans salaryBeans2 : salaryBeans) 
			{
				applicable_type = salaryBeans2.getApplicable_type();
			}
			if(applicable_type.equalsIgnoreCase("S"))
			{
				String sql = "select sum(s.amount) as total from salarypayment_details s,salary_payment s3 where s.pay_id = s3.pay_id AND s3.month = '"+month+"' AND s3.year = '"+year+"' AND s.applicable_type= '"+applicable_type+"' AND s.emp_id = '"+emp_ID+"' AND s.payhead_type = 'Indirect Expenses'";
				earningAmt = jdbcTemplate.queryForObject(sql, String.class);
				return earningAmt;
			}
			else if(applicable_type.equalsIgnoreCase("W"))
			{
				String sql = "select sum(s.amount) as total from salarypayment_details s,salary_payment s3 where s.pay_id = s3.pay_id AND s3.month = '"+month+"' AND s3.year = '"+year+"' AND s.applicable_type= '"+applicable_type+"' AND s.emp_id = '"+emp_ID+"' AND s.payhead_type = 'Direct Expenses'";
				earningAmt = jdbcTemplate.queryForObject(sql, String.class);
				return earningAmt;
			} 
			return earningAmt;
		}
		catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public float showDeductionAmount(String emp_ID,int month,int year) 
	{
		try
		{
			float deductionAmt = 0 ,deduction = 0 ,deductionTotal = 0;
			String applicable_type = "";
			List<SalaryBeans> salaryBeans = getApplicable_Type(emp_ID);
			for (SalaryBeans salaryBeans2 : salaryBeans)
			{
				applicable_type = salaryBeans2.getApplicable_type();
			}
			if(applicable_type.equalsIgnoreCase("S"))
			{
				String sql1 = "select s1.deduction from salarypayment_header s1,salary_payment s2  where s1.pay_id = s2.pay_id AND s2.month = '"+month+"' AND s2.year = '"+year+"' and s1.emp_id='"+emp_ID+"'";
				deduction = jdbcTemplate.queryForObject(sql1, Float.class);
				
				//String sql =  "select sum(s1.amount + s2.deduction) as total1 from salarypayment_details s1,salarypayment_header s2,salary_payment s3 where s1.pay_id = s3.pay_id AND s3.month = '"+month+"' AND s3.year = '"+year+"' AND s1.applicable_type = '"+applicable_type+"' AND s1.emp_id = '"+emp_ID+"' AND s1.emp_id = s2.emp_id AND s1.payhead_type = 'Duties and Taxes' ";
				String sql = "select sum(s1.amount) as amount from salarypayment_details s1,salary_payment s2  where s1.pay_id = s2.pay_id AND s2.month = '"+month+"' AND s2.year = '"+year+"' and s1.emp_id='"+emp_ID+"' and s1.payhead_type = 'Duties and Taxes'";
				deductionAmt = jdbcTemplate.queryForObject(sql, Float.class);

				deductionTotal = deduction + deductionAmt;
				
				double number= deductionTotal;
				number = Math.round(number * 100); 
				number = number/100;
				deductionAmt =  (float) number;
				return deductionAmt;
			}
			else if(applicable_type.equalsIgnoreCase("W"))
			{
				//float deductionAMT = getDeductionAmt(applicable_type,emp_ID);
				String sql1 = "select s1.deduction from salarypayment_header s1,salary_payment s2  where s1.pay_id = s2.pay_id AND s2.month = '"+month+"' AND s2.year = '"+year+"' and s1.emp_id='"+emp_ID+"'";
				deduction = jdbcTemplate.queryForObject(sql1, Float.class);
				
				//String sql =  "select sum( '"+deductionAMT+"' + s2.deduction) as total1 from salarypayment_details s1,salarypayment_header s2,salary_payment s3 where s1.pay_id = s3.pay_id AND s3.month = '"+month+"' AND s3.year = '"+year+"' AND s1.applicable_type = '"+applicable_type+"' AND s1.emp_id = '"+emp_ID+"' AND s1.emp_id = s2.emp_id AND s1.payhead_type = 'Duties and Taxes' ";
				String sql = "select sum(s1.amount) as amount from salarypayment_details s1,salary_payment s2  where s1.pay_id = s2.pay_id AND s2.month = '"+month+"' AND s2.year = '"+year+"' and s1.emp_id='"+emp_ID+"' and s1.payhead_type = 'Duties and Taxes' and  s1.applicable_type = '"+applicable_type+"'";
				deductionAmt = jdbcTemplate.queryForObject(sql, Float.class);

				deductionTotal = deduction + deductionAmt;
				
				double number= deductionTotal;
				number = Math.round(number * 100);
				number = number/100;
				deductionAmt =  (float) number;
				return deductionAmt;
			}
			return deductionAmt;
		}
		catch(Exception e)
		{
			System.out.println(e);
			return 0;
		}
	}
	/*private float getDeductionAmt(String applicable_type, String emp_ID) 
	{
		Calendar cal = Calendar.getInstance();
		int month = cal.get(Calendar.MONTH)+1;				
		int year = cal.get(Calendar.YEAR);
		if(month == 0)
		{
			month = 12;
			year--;
		}
		else
		{
			//month--;
		}
		float deductionAmt = jdbcTemplate.queryForObject("select sum(s.amount) from salarypayment_details s,salary_payment s1 where s.applicable_type = '"+applicable_type+"' and s.emp_id = '"+emp_ID+"' and s.payhead_type = 'Duties and Taxes' and s.pay_id = s1.pay_id and s1.month = '"+month+"' and year= '"+year+"'", Float.class);
		return deductionAmt;
	}*/
	private List<SalaryBeans> getApplicable_Type(String emp_ID) 
	{
		try
		{
		String sql = "select applicable_type from salarypayment_details where emp_id = '"+emp_ID+"' ";
		final List<SalaryBeans> sallist = getJdbcTemplate().query(sql, new RowMapper<SalaryBeans>()
		{
			private List<SalaryBeans> sList = new ArrayList<SalaryBeans>();		
			@Override		
			public SalaryBeans mapRow(ResultSet rs, int rowNo) throws SQLException 	
			{	
				SalaryBeans salaryBeans = new SalaryBeans(); 
				salaryBeans.setApplicable_type(rs.getString("applicable_type"));
				sList.add(salaryBeans);
				return salaryBeans;
			}
		});
		return sallist;
		}
		catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public List<EmployeeBeans> viewSalary(String emp_ID) 
	{
		try{
		String sql = "select e.emp_ID,e.f_Name,e.m_Name,e.l_Name,e.join_date,e.department,e.designation,e.pf_Account_No,e.esi_No,e.bank_Account_No,s.payhead_id,s.payhead_type,s.applicable_type,s.amount,p.pay_name,e1.deduction_name,e1.deduction, e1.absenttype from employee_registration e,salarypayment_details s,payhead p,salarypayment_header e1 where e.emp_ID = '"+emp_ID+"' AND e.emp_ID = s.emp_id AND e1.emp_id = e.emp_ID AND s.payhead_id = p.pay_id";
		return jdbcTemplate.query(sql, new RowMapper<EmployeeBeans>(){
			List<SalaryBeans> salList = new ArrayList<SalaryBeans>();
			public EmployeeBeans mapRow(ResultSet rs, int rowNo) throws SQLException {
				EmployeeBeans empbean = new EmployeeBeans();
				SalaryBeans salbean = new SalaryBeans();

				empbean.setEmpId(rs.getString("emp_ID"));
				empbean.setTxtfname(rs.getString("f_Name"));
				empbean.setTxtmname(rs.getString("m_Name"));
				empbean.setTxtlname(rs.getString("l_Name"));
				empbean.setDept(rs.getString("department"));
				empbean.setDesignation(rs.getString("designation"));
				empbean.setTxtPFNo(rs.getString("pf_Account_No"));
				empbean.setJDdt(rs.getString("join_Date"));
				empbean.setTxtEsi(rs.getString("esi_No"));
				empbean.setTxtBankNo(rs.getString("bank_Account_No"));
				
				salbean.setPayheadname(rs.getString("pay_name"));
				salbean.setPayamt(rs.getFloat("amount")); 
				salbean.setPayheadtype(rs.getString("payhead_type"));
				salbean.setApplicable_type(rs.getString("applicable_type"));
				salbean.setDaysname(rs.getString("deduction_name"));
				salbean.setDaysamt(rs.getFloat("deduction"));
				salbean.setDaytype(rs.getString("absenttype"));
				
				salList.add(salbean); 
				empbean.setSalaryBeans(salList);
				return empbean;
			}			
		});
		}
		catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public List<EmployeeBeans> retriveSalarySlip(String month, String year,String empid) 
	{
		try{
		String sql = "select s1.pay_id,s1.month,s1.year,s2.emp_id,s2.payhead_id,s2.amount,p.payhead_type,s3.days_absent,s3.deduction,s3.net_salary,e.emp_ID,e.f_Name,e.m_Name,e.l_Name,e.department,e.designation,e.pf_Account_No,e.join_date,e.esi_no,e.bank_Account_No,p.pay_name from employee_registration e, salary_payment s1, salarypayment_details s2, salarypayment_header s3,payhead p where s1.pay_id = s2.pay_id AND s2.emp_id= s3.emp_id AND s2.emp_id = '"+empid+"' AND s2.emp_id = e.emp_ID AND s1.month = '"+month+"' AND s1.year='"+year+"' AND p.pay_id = payhead_id group by s2.emp_id" ;
		return jdbcTemplate.query(sql, new RowMapper<EmployeeBeans>(){
			List<SalaryBeans> salList = new ArrayList<SalaryBeans>();
			public EmployeeBeans mapRow(ResultSet rs, int rowNo) throws SQLException {
				EmployeeBeans empbean = new EmployeeBeans();
				SalaryBeans salbean = new SalaryBeans();
				if(!rs.isBeforeFirst())
				{
				}
				else
				{ 
				}
				empbean.setEmpId(rs.getString("emp_ID"));
				empbean.setTxtfname(rs.getString("f_Name"));
				empbean.setTxtmname(rs.getString("m_Name"));
				empbean.setTxtlname(rs.getString("l_Name"));
				empbean.setDept(rs.getString("department"));
				empbean.setDesignation(rs.getString("designation"));
				empbean.setTxtPFNo(rs.getString("pf_Account_No"));
				empbean.setJDdt(rs.getString("join_Date"));
				empbean.setTxtEsi(rs.getString("esi_No"));
				empbean.setTxtBankNo(rs.getString("bank_Account_No"));
				
				salbean.setPayheadname(rs.getString("pay_name"));
				salbean.setPayamt(rs.getFloat("amount")); 
				salbean.setPayheadtype(rs.getString("payhead_type"));
				
				
				salList.add(salbean); 
				empbean.setSalaryBeans(salList);
				return empbean;
				}
						
		});
		}
		catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public List<ProcessPayroll> processDate()
	{ 
		try{
		String sql = "select process_date from salary_payment";
		final List<ProcessPayroll> leaveList=getJdbcTemplate().query(sql, new RowMapper<ProcessPayroll>() {
			private List<ProcessPayroll> lList=new ArrayList<ProcessPayroll>();
			public ProcessPayroll mapRow(ResultSet rs,int rowNo)throws SQLException
			{
				ProcessPayroll leave=new ProcessPayroll();
				leave.setSchuduleDate(rs.getString("process_date"));
				lList.add(leave);
				return leave;
			}	 
		});
			return leaveList; 
		}
		catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public List<ProcessPayroll> showConfirmPayroll() {

		try{
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
	    Date date = new Date();
	    String dt=dateFormat.format(date);
	     String procM=(dt.substring(0,7)).toString();
	    String sql = "select e.f_Name,e.m_Name,e.l_Name,s1.process_Date,s1.account_no,c.account_Name,s1.pay_id,s2.pay_id,s2.emp_id,s2.days_absent,s2.net_salary from employee_registration e,accounts_chart c,salary_payment s1, salarypayment_header s2 where s1.pay_id=s2.pay_id AND c.account_NO = s1.account_no  AND s2.emp_id=e.emp_ID AND SUBSTRING_INDEX(s1.process_Date, '/',2) = '"+procM+"' ";
		final List<ProcessPayroll> prolist = getJdbcTemplate().query(sql, new RowMapper<ProcessPayroll>()
		{	
			private List<ProcessPayroll> pList = new ArrayList<ProcessPayroll>();
			@Override
			public ProcessPayroll mapRow(ResultSet rs, int rowNo) throws SQLException 	
			{	
				ProcessPayroll processPayroll = new ProcessPayroll();
				processPayroll.setAccounttoPay(rs.getString("account_Name"));
				processPayroll.setSchuduleDate(rs.getString("process_Date"));
				processPayroll.setTxtfname(rs.getString("f_Name"));
				processPayroll.setTxtmname(rs.getString("m_Name"));
				processPayroll.setTxtlname(rs.getString("l_Name"));
				processPayroll.setDaysAbsent(rs.getInt("days_absent"));
				processPayroll.setTotalSalary(rs.getFloat("net_salary"));
				pList.add(processPayroll);
				return processPayroll;
			}	
		});
		return prolist;
		}
		catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public List<ProcessPayroll> showDaysDeduction(String emp_ID, int month,int year) {

		try{
		String sql = "select s1.pay_id,s2.month,s2.year,s1.emp_id,s1.deduction,s1.deduction_name,s1.absenttype,s2.pay_id from salarypayment_header s1,salary_payment s2 where emp_id = '"+emp_ID+"' AND s2.month='"+month+"' AND s2.year='"+year+"' AND s1.pay_id=s2.pay_id";
		final List<ProcessPayroll> sallist = getJdbcTemplate().query(sql, new RowMapper<ProcessPayroll>()	
		{	
			private List<ProcessPayroll> sList = new ArrayList<ProcessPayroll>();
			@Override
			public ProcessPayroll mapRow(ResultSet rs, int rowNo) throws SQLException 	
			{	
				ProcessPayroll processPayroll = new ProcessPayroll();
				processPayroll.setDeductionNamee(rs.getString("deduction_name"));
				processPayroll.setDeductionAmt(rs.getFloat("deduction"));
				processPayroll.setDeductionType(rs.getString("absenttype"));
				sList.add(processPayroll);
				return processPayroll;
			}	
		});
		return sallist;
		}
		catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public int saveLeaves(Leave leave) 
	{
		try{
		int em=0,cm=0;
		String leaveid = "";
		RowCountCallbackHandler countCallback = new RowCountCallbackHandler();
		jdbcTemplate.query("select * from comp_leave", countCallback);
		int count = countCallback.getRowCount();
		count++;
		if (count < 10) 
		{
			leaveid = "Leave00" + count;
		} else 
		{
			if (count < 99) {
				leaveid = "Leave0" + count;
			} else {
				leaveid = "Leave" + count;
			}
		}
		int taken = 0;
		
		String cpmpsql = "insert into comp_leave(leave_id,leave_name,no_leaves)value('"+leaveid+"','"+leave.getLeaveName()+"','"+leave.getNoLeaves()+"')" ;
		cm=jdbcTemplate.update(cpmpsql);
		String sqlEmpl = "insert into employee_leave(leave_id,emp_id,leave_balance,leave_taken,total)value('"+leaveid+"','"+leave.getTxtEmpId()+"','"+leave.getNoLeaves()+"','"+taken+"','"+leave.getNoLeaves()+"')" ;
	    em=jdbcTemplate.update(sqlEmpl);
		if(em>0 && cm>0)
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
	@Override
	public List<Leave> editLeave(String empid, String leaveid) 
	{
		try{
		String sql = "select * from vemployeeleaves where emp_id = '"+empid+"' AND leave_id = '"+leaveid+"' " ;
		final List<Leave> lList=getJdbcTemplate().query(sql, new RowMapper<Leave>(){
			private List<Leave> leaveList = new ArrayList<Leave>();	
			public Leave mapRow(ResultSet rs, int rowNo) throws SQLException {
				
				Leave leave = new Leave();
				leave.setLeaveId(rs.getString("leave_id"));
				leave.setLeaveName(rs.getString("leave_name"));
				leave.setTxtEmpId(rs.getString("emp_id"));
				leave.setNoLeaves(rs.getInt("total"));
				
				leaveList.add(leave);
				return leave;
			}
		}); 
		return lList; 
		}
		catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public int updateLeave(Leave leave) 
	{
		try{
		String sql = "update employee_leave set total='"+leave.getNoLeaves()+"',"+"leave_balance='"+leave.getNoLeaves()+"' where leave_id='"+leave.getLeaveId()+"' AND emp_id = '"+leave.getTxtEmpId()+"' ";
		int i=jdbcTemplate.update(sql);
		if(i>=1)
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
	@Override
	public List<BreakupByEmployee> showBreakByEmp() {
		
		try{
		String sql = " select f_Name,pay_name,amount from vsalaryslip";
		final List<BreakupByEmployee> payheadlist = getJdbcTemplate().query(sql, new RowMapper<BreakupByEmployee>()
		{
			private List<BreakupByEmployee> payList = new ArrayList<BreakupByEmployee>();
			@Override	
			public BreakupByEmployee mapRow(ResultSet rs, int rowNo) throws SQLException
			{
				BreakupByEmployee sal = new BreakupByEmployee();
				sal.setEmp_Name(rs.getString("f_Name"));
				sal.setPayhead_name(rs.getString("pay_name"));
 				sal.setPayamt(rs.getFloat("amount"));
				payList.add(sal);
				return sal;
			}
		});
		return payheadlist;
		}
		catch(Exception e)
		{
			return null;
		}
	}
	
	@Override
	public List<ComposeMail> composeMail(String emp_ID) 
	{
		try{
		String sql = "select f_Name,email_id from employee_registration where emp_ID = '"+emp_ID+"' ";
		final List<ComposeMail> sendmail = getJdbcTemplate().query(sql, new RowMapper<ComposeMail>()
		{
			private List<ComposeMail> cmail = new ArrayList<ComposeMail>();
			@Override
			public ComposeMail mapRow(ResultSet rs, int rowNo) throws SQLException
			{
				ComposeMail compose = new ComposeMail();
				compose.setMailTo(rs.getString("email_id"));				
				compose.setBody(rs.getString("f_Name"));
				compose.setSubject("Salary Slip");
				compose.setAttachment("Salary Slip.pdf");
				String regards=jdbcTemplate.queryForObject("select comp_Name from comp_details",String.class);
				compose.setRegards(regards);
				compose.setBodyPart("\n Your Salary Slip is Paid For More Details\nPlease Find Attachment\n\nBest Regards,\n");
				cmail.add(compose);
				return compose;
			}
		});
		return sendmail;
		}
		catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public String shwoCompdate() 
	{
		String sql = "select join_Date from employee_registration where SUBSTRING_INDEX(role, '/',1) = 'Admin'" ;
		String date = jdbcTemplate.queryForObject(sql,String.class);
		
		/*DateFormat dateFormat = new SimpleDateFormat("DD/MM/yyyy");
	    date = new Date();
	    String dt=dateFormat.format(date);*/
		return date;
	}
	
	@Override
	public int changePassword(EmployeeBeans employeeBeans) {
		int k=0;
		try
		{
			String oldPass=jdbcTemplate.queryForObject("select password from login where empId='"+employeeBeans.getEmpId()+"'", String.class);
			if(employeeBeans.getOldPass().equals(oldPass))
			{
				String updatePassUrl="UPDATE login SET password='"+employeeBeans.getConfPass()+"' where empId='"+employeeBeans.getEmpId()+"'";
				k=jdbcTemplate.update(updatePassUrl);
			}
			else
			{
				return 0;
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
			return 0;
		}
		if(k>0)
		{
			return 1;
		}
		else
		{
			return 0;
		}
	}
	@Override
	public String ShowAdd() 
	{
		String add = jdbcTemplate.queryForObject("select msgName from messages where msgID='MSG001'", String.class);
		return add;
	}
	@Override
	public String ShowDelete() 
	{
		String delete = jdbcTemplate.queryForObject("select msgName from messages where msgID='MSG003'", String.class);
		return delete;
	}
	@Override
	public String ShowUpdate() 
	{
		String update = jdbcTemplate.queryForObject("select msgName from messages where msgID='MSG002'", String.class);
		return update;
	}
	@Override
	public String ShowRestore() 
	{
		String restore = jdbcTemplate.queryForObject("select msgName from messages where msgID='MSG004'", String.class);
		return restore;
	}
	@Override
	public String ShowNotAdd() 
	{
		String notAdd = jdbcTemplate.queryForObject("select msgName from messages where msgID='MSG006'", String.class);
		return notAdd;
	}
	@Override
	public String ShowNotDelete()
	{
		String notDelete = jdbcTemplate.queryForObject("select msgName from messages where msgID='MSG008'", String.class);
		return notDelete;
	}
	@Override
	public String ShowNotUpdate() 
	{
		String notUpdate = jdbcTemplate.queryForObject("select msgName from messages where msgID='MSG007'", String.class);
		return notUpdate;
	}
	@Override
	public String ShowNotRestore() 
	{
		String notRestore = jdbcTemplate.queryForObject("select msgName from messages where msgID='MSG009", String.class);
		return notRestore;
	}
	@Override
	public String ShowApproved() 
	{
		String approve = jdbcTemplate.queryForObject("select msgName from messages where msgID='MSG011'", String.class);
		return approve;
	}
	@Override
	public String ShowRejected() 
	{
		String reject = jdbcTemplate.queryForObject("select msgName from messages where msgID='MSG012'", String.class);
		return reject;
	}
	@Override
	public String ShowNotApproved() 
	{
		String notApproved = jdbcTemplate.queryForObject("select msgName from messages where msgID='MSG013'", String.class);
		return notApproved;
	}
	@Override
	public String ShowNotRejected() 
	{
		String notReject = jdbcTemplate.queryForObject("select msgName from messages where msgID='MSG014'", String.class);
		return notReject;
	}
	@Override
	public int saveDepartment(String deptName,String deptDesc) 
	{
		try
		{
			int i=0;
			String sql = "insert into department(deptName,description,status)value('"+deptName+"','"+deptDesc+"','Active') ";
			i = jdbcTemplate.update(sql);
			if(i>0)
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
	public List<com.invoice.payroll.beans.EmployeeBeans> retriveDept() 
	{
		try{
			String sql="select deptId,deptName from department where status='Active'";		
			final List<EmployeeBeans> empList=getJdbcTemplate().query(sql, new RowMapper<EmployeeBeans>() {
			private List<EmployeeBeans> employeeList=new ArrayList<EmployeeBeans>();
			public EmployeeBeans mapRow(ResultSet rs,int rowNo)throws SQLException
			{
				EmployeeBeans employeeBeans=new EmployeeBeans();
				employeeBeans.setTxtDeptId(rs.getInt("deptId"));
				employeeBeans.setTxtDeptName(rs.getString("deptName"));
				employeeList.add(employeeBeans);
				return employeeBeans;
			}	
		});		
			return empList;
			}catch(Exception e)
			{
				return null;
			}
	}
	@Override
	public int saveDesignation(String desigName, String desigDesc) 
	{
		try
		{
			int i=0;
			String sql = "insert into designation(desName,desDesc,status)value('"+desigName+"','"+desigDesc+"','Active')";
			i = jdbcTemplate.update(sql);
			if(i>0)
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
	public List<com.invoice.payroll.beans.EmployeeBeans> retriveDesig() 
	{
		try{
			String sql="select desId,desName from designation where status='Active'";		
			final List<EmployeeBeans> empList=getJdbcTemplate().query(sql, new RowMapper<EmployeeBeans>() {
			private List<EmployeeBeans> employeeList=new ArrayList<EmployeeBeans>();
			public EmployeeBeans mapRow(ResultSet rs,int rowNo)throws SQLException
			{
				EmployeeBeans employeeBeans=new EmployeeBeans();
				employeeBeans.setTxtDesigId(rs.getInt("desId"));				
				employeeBeans.setTxtDesigName(rs.getString("desName"));				
				employeeList.add(employeeBeans);
				return employeeBeans;
			}	
		});		
			return empList;
			}catch(Exception e)
			{
				return null;
			}
	}
	@Override
	public int retriveUserName(String userName) 
	{
		try
		{
		int UN = jdbcTemplate.queryForObject("select count(user_Name) from employee_registration where user_Name = '"+userName+"'", Integer.class);
		if(UN == 1)
		{
			return 0;
		}
		else
		{
			return 1;
		}
		}catch(Exception e)
		{
			System.out.println(e);
			return 0;
		}
	}
	@Override
	public int retriveVeriables(String empid) 
	{
		try
		{
		int UN = jdbcTemplate.queryForObject("select count(emp_id) from variablename_temp where emp_id = '"+empid+"'", Integer.class);
		System.out.println(UN); 
		if(UN == 1)
		{
			return 0;
		}
		else
		{
			return 1;
		}
		}catch(Exception e)
		{
			System.out.println(e);
			return 0;
		}
	}
	@Override
	public List<EmployeeBeans> empList() 
	{
		try
		{
			//String sql="select emp_ID,f_Name from employee_registration where status='Active'";
			String sql ="select e1.emp_ID,e1.f_Name from employee_registration e1,salary_details e2 where e1.emp_ID=e2.emp_id and e2.applicable_type='S' and e1.status='Active' group by e1.emp_ID";
			final List<EmployeeBeans> empList=getJdbcTemplate().query(sql, new RowMapper<EmployeeBeans>() {
			private List<EmployeeBeans> employeeList=new ArrayList<EmployeeBeans>();
			public EmployeeBeans mapRow(ResultSet rs,int rowNo)throws SQLException
			{
				EmployeeBeans employeeBeans=new EmployeeBeans();
				employeeBeans.setEmpId(rs.getString("emp_ID"));
				employeeBeans.setTxtfname(rs.getString("f_Name"));			
				employeeList.add(employeeBeans);
				return employeeBeans;
			}	
		});		
			return empList;
			}catch(Exception e)
			{
				System.out.println(e); 
				return null;
			}
	}
	@Override
	public List<SalaryBeans> showBreakupheadList() 
	{
		try
		{
		String sql = "select p.pay_name from payhead p where p.applicable_type = 'S' or  p.applicable_type = 'B' and payhead_type='Indirect Expenses'";
		final List<SalaryBeans> payheadlist = getJdbcTemplate().query(sql, new RowMapper<SalaryBeans>()
		{
			private List<SalaryBeans> payList = new ArrayList<SalaryBeans>();
			@Override	
			public SalaryBeans mapRow(ResultSet rs, int rowNo) throws SQLException
			{
				SalaryBeans sal = new SalaryBeans();
				sal.setPayheadid(rs.getString("pay_name"));
				payList.add(sal);
				return sal;
			}
		});
		return payheadlist;
		}
		catch(Exception e)
		{
			System.out.println(e);
			return null;
		} 
	}
	@Override
	public List<SalaryBeans> showBreakupamtList() 
	{				
		try{/*
		Calendar cal = Calendar.getInstance();
		int month = cal.get(Calendar.MONTH)+1;
		
		int year = cal.get(Calendar.YEAR);
		if(month == 0)
		{
			month = 12;
			year--;
		}
		else
		{
			//month--;
		}*/
		//String sql = " select s2.f_Name,s1.payhead_id,s1.amount from salarypayment_details s1,salary_payment s3,employee_registration s2 where s2.emp_id = s1.emp_id  AND s3.month='"+month+"' AND s3.year='"+year+"'";
		String sql="select emp_id,f_Name,amount from vsalarypayhead where applicable_type = 'S'";
		final List<SalaryBeans> payheadlist = getJdbcTemplate().query(sql, new RowMapper<SalaryBeans>()
		{
			private List<SalaryBeans> payList = new ArrayList<SalaryBeans>();
			@Override
			public SalaryBeans mapRow(ResultSet rs, int rowNo) throws SQLException
			{
				SalaryBeans sal = new SalaryBeans();
				sal.setEmpid(rs.getString("emp_id"));
				sal.setEmpName(rs.getString("f_Name"));
				//sal.setPayheadid(rs.getString("pay_name"));
				sal.setPayamt(rs.getFloat("amount"));
				payList.add(sal);
				return sal;
			}
		});
		return payheadlist;
		}
		catch(Exception e)
		{
			System.out.println(e);
			return null;
		}
	}
	@Override
	public List<SalaryBeans> showBreakupheadListW() 
	{
		try
		{
		String sql = "select p.pay_name from payhead p where p.applicable_type = 'W' or  p.applicable_type = 'B' and payhead_type='Direct Expenses'";
		final List<SalaryBeans> payheadlist = getJdbcTemplate().query(sql, new RowMapper<SalaryBeans>()
		{
			private List<SalaryBeans> payList = new ArrayList<SalaryBeans>();
			@Override	
			public SalaryBeans mapRow(ResultSet rs, int rowNo) throws SQLException
			{
				SalaryBeans sal = new SalaryBeans();
				sal.setPayheadid(rs.getString("pay_name"));
				payList.add(sal);
				return sal;
			}
		});
		return payheadlist;
		}
		catch(Exception e)
		{
			System.out.println(e);
			return null;
		} 
	}
	@Override
	public List<SalaryBeans> showBreakupamtListW() 
	{
		try{/*
			Calendar cal = Calendar.getInstance();
			int month = cal.get(Calendar.MONTH)+1;
			
			int year = cal.get(Calendar.YEAR);
			if(month == 0)
			{
				month = 12;
				year--;
			}
			else
			{
				//month--;
			}*/
			//String sql = " select s2.f_Name,s1.payhead_id,s1.amount from salarypayment_details s1,salary_payment s3,employee_registration s2 where s2.emp_id = s1.emp_id  AND s3.month='"+month+"' AND s3.year='"+year+"'";
			String sql="select emp_id,f_Name,amount from vsalarypayhead where applicable_type = 'W'";
			final List<SalaryBeans> payheadlist = getJdbcTemplate().query(sql, new RowMapper<SalaryBeans>()
			{
				private List<SalaryBeans> payList = new ArrayList<SalaryBeans>();
				@Override
				public SalaryBeans mapRow(ResultSet rs, int rowNo) throws SQLException
				{
					SalaryBeans sal = new SalaryBeans();
					sal.setEmpid(rs.getString("emp_id"));
					sal.setEmpName(rs.getString("f_Name"));
					//sal.setPayheadid(rs.getString("pay_name"));
					sal.setPayamt(rs.getFloat("amount"));
					payList.add(sal);
					return sal;
				}
			});
			return payheadlist;
			}
			catch(Exception e)
			{
				System.out.println(e);
				return null;
			}
	}
	@Override
	public List<com.invoice.payroll.beans.EmployeeBeans> empListW()
	{
		try
		{
		String sql ="select e1.emp_ID,e1.f_Name from employee_registration e1,salary_details e2 where e1.emp_ID=e2.emp_id and e2.applicable_type='W' and e1.status='Active' group by e1.emp_ID";
		final List<EmployeeBeans> empList=getJdbcTemplate().query(sql, new RowMapper<EmployeeBeans>() {
		private List<EmployeeBeans> employeeList=new ArrayList<EmployeeBeans>();
		public EmployeeBeans mapRow(ResultSet rs,int rowNo)throws SQLException
		{
			EmployeeBeans employeeBeans=new EmployeeBeans();
			employeeBeans.setEmpId(rs.getString("emp_ID"));
			employeeBeans.setTxtfname(rs.getString("f_Name"));
			employeeList.add(employeeBeans);
			return employeeBeans;
		}	
	});		
		return empList;
		}catch(Exception e)
		{
			System.out.println(e);
			return null;
		}
	}
	
}
	/*@Override
	public int uploadFile(EmployeeBeans uploadFile,HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
	{
		
		int j=0;
		
			System.out.println("in dao");
			String root = getServletContext().getRealPath("/");	
			System.out.println(root); 
	    	 UPLOAD_DIRECTORY=root+"pdf"; 
	    	 System.out.println(UPLOAD_DIRECTORY); 
	    	 System.out.println("IN DO POST"); 
	    	 byte [] b = null; 
	    	 if(ServletFileUpload.isMultipartContent(request)) 
	 		{
	             try 
	 			{
	             	
	                 List<FileItem> multiparts = new ServletFileUpload(
	                                          new DiskFileItemFactory()).parseRequest(request);
	               for(int i=0;i<multiparts.size();i++)
	               {
	             	  System.out.println("OK");
	             	  System.out.println(""+multiparts.get(i));
	               }
	                 for(FileItem item : multiparts)
	 				{
	                     if(!item.isFormField())
	 					{
	                     	System.out.println("item.getName()="+item.getName());
	                         String name = new File(item.getName()).getName();
	                        b=item.get();
	                         FileOutputStream fileOuputStream = 
	                                 new FileOutputStream("D:\\testing2.txt"); 
	               	    fileOuputStream.write(b);
	               	    fileOuputStream.close();
	                         System.out.println("file name="+name);
	                         System.out.println(new File(UPLOAD_DIRECTORY + File.separator + name));
	                         item.write( new File(UPLOAD_DIRECTORY + File.separator + name));
	                     }
	                 }
	            
	                //File uploaded successfully
	                //request.setAttribute("message", "File Uploaded Successfully");
	                j=1;
	                
	             } catch (Exception ex) {
	                request.setAttribute("message", "File Upload Failed due to " + ex);
	             }          
	          
	         }
	    	 else
	    	 {
	             //request.setAttribute("message","Sorry this Servlet only handles file upload request");
	             j=0;
	         }
			BufferedReader br = new BufferedReader(new FileReader(uploadFile.getFile().getOriginalFilename())); 
			System.out.println(br);	
			String strLine = ",",line=""; 
			StringTokenizer st = null; 
			int i=1; 
			//int lineNumber = 0,tokanNumber = 0;	
			while((line = br.readLine())!=null)
			{
				System.out.println("In while");
				String[] data = line.split(strLine);
				String sql = "insert into employeer value('"+data[0]+"','"+data[1]+"')";
				i=jdbcTemplate.update(sql);
			}
			if(j>1)
			{
				return 1;
			}
			else
			{
				return 0;
			}
		
	}
	
}
*/
/*lineNumber++;
st = new StringTokenizer(strLine,",");
while(st.hasMoreTokens())
{
	tokanNumber++;
	String sql = "insert into employeeR value('"+st.nextToken()+"')";
	i=jdbcTemplate.update(sql);
}
tokanNumber = 0;*/
/*String line = br.readLine();
while ((line = br.readLine()) !=null) 
{
	String []b = line.split(splitBy);
	System.out.println(b[0]);
}
br.close();*/