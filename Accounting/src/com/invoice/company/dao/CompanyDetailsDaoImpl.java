package com.invoice.company.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCountCallbackHandler;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.invoice.company.beans.CompanyDetails;
import com.invoice.login.service.LoginUserService;



/**
 * @author Reformist
 *
 */
@Component(value="companyDetailsDao")
public class CompanyDetailsDaoImpl implements CompanyDetailsDao{

	
	JdbcTemplate jdbcTemplate;

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	@Autowired
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) 
	{
		this.jdbcTemplate = jdbcTemplate;
	}
	@Autowired
	LoginUserService lus;
	@Override
	public int save(CompanyDetails companyDetails) {
		String userRole = "Admin/Sales/Purchase/Inventory/Payroll/Banking/Accounting/Reports/";
		 String url="insert into comp_details(comp_Name,date,comp_Address,comp_Contact,comp_Mail,comp_Website,vatNo,cstNo,comp_desc,terms,userName) value('"+companyDetails.getCompName()+"','"+companyDetails.getTxtdate()+"','"+companyDetails.getCompAddress()+"','"+companyDetails.getContactNo()+"','"+companyDetails.getEmail()+"','"+companyDetails.getWebsite()+"','"+companyDetails.getVatNo()+"','"+companyDetails.getCstNo()+"','"+companyDetails.getCompDesc()+"','"+companyDetails.getCompTerms()+"','"+companyDetails.getAusername()+"')";
		 int i=jdbcTemplate.update(url);		 
		 
		 java.sql.Timestamp effdate=new java.sql.Timestamp(new java.util.Date().getTime());
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
		 String sql1 = "insert into employee_registration(emp_ID,f_Name,email_Id,user_Name,role,join_Date,effective_date) value('"+EMP_ID+"','"+companyDetails.getCompName()+"','"+companyDetails.getEmail()+"','"+companyDetails.getAusername()+"','"+userRole+"','"+companyDetails.getTxtdate()+"','"+effdate+"')";
		 int k=jdbcTemplate.update(sql1);
		 
		 String url1 = "insert into login(username,password,userrole,status,empId) value('"+companyDetails.getAusername()+"','"+companyDetails.getApassword()+"','"+userRole+"','Active','"+EMP_ID+"') ";
		 int j=jdbcTemplate.update(url1);
		 
		if(i>0 && j>0 && k>0)
		{
			return 1;
		}
		else
		{
			return 0;
		}
	}
	@Override
	public List<CompanyDetails> view(CompanyDetails companyDetails) {
		
		String sql = "select * from comp_details ";
		return jdbcTemplate.query(sql, new RowMapper<CompanyDetails>(){
		List<CompanyDetails> compList = new ArrayList<CompanyDetails>();
			@Override
			public CompanyDetails mapRow(ResultSet rs, int rowNo)throws SQLException {
				CompanyDetails companyDetails = new CompanyDetails();
				companyDetails.setCompName(rs.getString("comp_Name"));
				companyDetails.setTxtdate(rs.getString("date"));
				companyDetails.setCompAddress(rs.getString("comp_Address"));
				companyDetails.setCompDesc(rs.getString("comp_desc"));
				companyDetails.setCompTerms(rs.getString("terms"));
				companyDetails.setContactNo(rs.getString("comp_Contact"));
				companyDetails.setEmail(rs.getString("comp_Mail"));
				companyDetails.setVatNo(rs.getString("vatNo"));
				companyDetails.setCstNo(rs.getString("cstNo"));
				companyDetails.setWebsite(rs.getString("comp_Website"));
				compList.add(companyDetails);
				return companyDetails;
			}			
		});
	}
	@Override
	public int updateCompanyInfo(CompanyDetails companyDetails) 
	{
		
		String sql = "update comp_details set comp_Name='"+companyDetails.getCompName()+"',"+"comp_Address='"+companyDetails.getCompAddress()+"',"+"comp_Contact='"+companyDetails.getContactNo()+"',"+"comp_Mail='"+companyDetails.getEmail()+"',"+"comp_Website='"+companyDetails.getWebsite()+"',"+"vatNo='"+companyDetails.getVatNo()+"',"+"cstNo='"+companyDetails.getCstNo()+"',"+"comp_desc='"+companyDetails.getCompDesc()+"',"+"terms='"+companyDetails.getCompTerms()+"' ";
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
/*	@Override
	public int getRegCount() {
		int count=0;
		try{
			 count=jdbcTemplate.queryForObject("select count(*) from comp_details", Integer.class);
		}
		catch(Exception e)
		{
			System.out.println(e);
			return 0;
		}
		return count;
	}	*/
}