package com.invoice.payroll.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCountCallbackHandler;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.invoice.payroll.beans.Payhead;

@Component(value="payheadDao")
public class PayheadDaoImpl implements PayheadDao
{

	private String sql;
	JdbcTemplate jdbcTemplate;		
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	@Autowired
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Override
	public Payhead generateID() 
	{
		try{
		String payheadId = "";
		RowCountCallbackHandler countCallback = new RowCountCallbackHandler();  // not reusable
		jdbcTemplate.query("select * from payhead", countCallback);
		int count = countCallback.getRowCount();
		count++;
		
		if(count<10)
		{
			payheadId="Pay00"+count;
		}
		else
		{
			if(count<99)
			{
				payheadId = "Pay0" + count;
			}
			else
			{
				payheadId = "Pay" + count;
			}
		}
		Payhead payhead=new Payhead();
		payhead.setTxtPayId(payheadId);
		return payhead;
		}catch(Exception e)
		{
			return null;
		}
	}

	@Override
	public int save(Payhead payhead) {
		
		try{
		int  i=0,j=0,k=0,l=0,m=0;
		
		if(payhead.getApplicable_type().equalsIgnoreCase("B"))
		{
			if(payhead.getTxtPayheadType().equalsIgnoreCase("Indirect Expenses"))
			{
				sql = "insert into payhead value('"+payhead.getTxtPayId()+"','"+payhead.getTxtPayheadName()+"','"+payhead.getPrevPayheadName()+"','"+payhead.getTxtPayslipName()+"','Indirect Expenses','"+payhead.getGetvalue()+"','"+payhead.getApplicable_type()+"','"+payhead.getGetyesno()+"','Active') ";
				i=jdbcTemplate.update(sql);
				
				String payheadId = "";
				RowCountCallbackHandler countCallback = new RowCountCallbackHandler();  // not reusable
				jdbcTemplate.query("select * from payhead", countCallback);
				int count = countCallback.getRowCount();
				count++; 
				if(count<10)
				{
					payheadId="Pay00"+count;
				}
				else
				{
					if(count<99)
					{
						payheadId = "Pay0" + count;
					}
					else
					{
						payheadId = "Pay" + count;
					}
				}
				
			 	sql = "insert into payhead value('"+payheadId+"','"+payhead.getTxtPayheadName()+"','"+payhead.getPrevPayheadName()+"','"+payhead.getTxtPayslipName()+"','Direct Expenses','"+payhead.getGetvalue()+"','"+payhead.getApplicable_type()+"','"+payhead.getGetyesno()+"','Active') ";
				i=jdbcTemplate.update(sql);							
			}
			else if(payhead.getTxtPayheadType().equalsIgnoreCase("Duties and Taxes"))
			{
				sql = "insert into payhead value('"+payhead.getTxtPayId()+"','"+payhead.getTxtPayheadName()+"','"+payhead.getPrevPayheadName()+"','"+payhead.getTxtPayslipName()+"','Duties and Taxes','"+payhead.getGetvalue()+"','"+payhead.getApplicable_type()+"','"+payhead.getGetyesno()+"','Active') ";
				i=jdbcTemplate.update(sql);
			}
		}
		else if(payhead.getApplicable_type().equalsIgnoreCase("S"))
		{
			if(payhead.getTxtPayheadType().equalsIgnoreCase("Indirect Expenses"))
			{
				sql = "insert into payhead value('"+payhead.getTxtPayId()+"','"+payhead.getTxtPayheadName()+"','"+payhead.getPrevPayheadName()+"','"+payhead.getTxtPayslipName()+"','Indirect Expenses','"+payhead.getGetvalue()+"','"+payhead.getApplicable_type()+"','"+payhead.getGetyesno()+"','Active') ";
				j=jdbcTemplate.update(sql);
			}
			else if(payhead.getTxtPayheadType().equalsIgnoreCase("Duties and Taxes"))
			{
				sql = "insert into payhead value('"+payhead.getTxtPayId()+"','"+payhead.getTxtPayheadName()+"','"+payhead.getPrevPayheadName()+"','"+payhead.getTxtPayslipName()+"','Duties and Taxes','"+payhead.getGetvalue()+"','"+payhead.getApplicable_type()+"','"+payhead.getGetyesno()+"','Active') ";
				j=jdbcTemplate.update(sql);
			}
		}
		else if(payhead.getApplicable_type().equalsIgnoreCase("W"))
		{
			if(payhead.getTxtPayheadType().equalsIgnoreCase("Indirect Expenses"))
			{
				sql = "insert into payhead value('"+payhead.getTxtPayId()+"','"+payhead.getTxtPayheadName()+"','"+payhead.getPrevPayheadName()+"','"+payhead.getTxtPayslipName()+"','Direct Expenses','"+payhead.getGetvalue()+"','"+payhead.getApplicable_type()+"','"+payhead.getGetyesno()+"','Active') ";
				k=jdbcTemplate.update(sql);
			}
			else if(payhead.getTxtPayheadType().equalsIgnoreCase("Duties and Taxes"))
			{
				sql = "insert into payhead value('"+payhead.getTxtPayId()+"','"+payhead.getTxtPayheadName()+"','"+payhead.getPrevPayheadName()+"','"+payhead.getTxtPayslipName()+"','Duties and Taxes','"+payhead.getGetvalue()+"','"+payhead.getApplicable_type()+"','"+payhead.getGetyesno()+"','Active') ";
				k=jdbcTemplate.update(sql);
			}
		}
		
		String sq = "select max(account_No)as acno from accounts_chart" ;
	 	int accountId = jdbcTemplate.queryForInt(sq) ;
	 	accountId++ ;
		
	 	if(payhead.getApplicable_type().equalsIgnoreCase("S"))
		{
	 		if(payhead.getTxtPayheadType().equalsIgnoreCase("Indirect Expenses"))
			{
	 			String salsql = "insert into accounts_chart value('"+accountId+"','"+payhead.getTxtPayheadName()+"','GRP008','0','Active')" ;
	 			j = jdbcTemplate.update(salsql);
			}
	 		else if(payhead.getTxtPayheadType().equalsIgnoreCase("Duties and Taxes"))
	 		{
	 			String salsql = "insert into accounts_chart value('"+accountId+"','"+payhead.getTxtPayheadName()+"','GRP004','0','Active')" ;
	 			j = jdbcTemplate.update(salsql);
	 		}
		}
		else if(payhead.getApplicable_type().equalsIgnoreCase("W"))
		{
			if(payhead.getTxtPayheadType().equalsIgnoreCase("Indirect Expenses"))
			{
	 			String salsql = "insert into accounts_chart value('"+accountId+"','"+payhead.getTxtPayheadName()+"','GRP005','0','Active')" ;
	 			k = jdbcTemplate.update(salsql);
			}
	 		else if(payhead.getTxtPayheadType().equalsIgnoreCase("Duties and Taxes"))
	 		{
	 			String salsql = "insert into accounts_chart value('"+accountId+"','"+payhead.getTxtPayheadName()+"','GRP004','0','Active')" ;
	 			k = jdbcTemplate.update(salsql);
	 		}
		}
		else if(payhead.getApplicable_type().equalsIgnoreCase("B"))
		{
			if(payhead.getTxtPayheadType().equalsIgnoreCase("Indirect Expenses"))
			{
				String indirectsql = "insert into accounts_chart value('"+accountId+"','"+payhead.getTxtPayheadName()+"','GRP008','0','Active')" ;
				l = jdbcTemplate.update(indirectsql);
				
				accountId++;
				String directsql = "insert into accounts_chart value('"+accountId+"','"+payhead.getTxtPayheadName()+"','GRP005','0','Active')" ;
				m = jdbcTemplate.update(directsql);
			}
	 		else if(payhead.getTxtPayheadType().equalsIgnoreCase("Duties and Taxes"))
	 		{
	 			String indirectsql = "insert into accounts_chart value('"+accountId+"','"+payhead.getTxtPayheadName()+"','GRP004','0','Active')" ;
				l = jdbcTemplate.update(indirectsql);
	 		}
		}
	 	
		if(i>0)
		{
			return 1;
		}
		if(j>0)
		{
			return 1;
		}
		if(k>0)
		{
			return 1;
		}
		if(l>0 && m>0)
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
	public List<Payhead> show() {
		
		try{
		String sql = "select * from payhead where status = 'Active'" ;
		final List<Payhead> payList=getJdbcTemplate().query(sql, new RowMapper<Payhead>(){
			private List<Payhead> payheadList = new ArrayList<Payhead>();	
			public Payhead mapRow(ResultSet rs, int rowNo) throws SQLException {
				
				Payhead payhead = new Payhead();
				payhead.setTxtPayId(rs.getString("pay_id"));
				payhead.setTxtPayheadName(rs.getString("pay_name"));
				payhead.setTxtPayslipName(rs.getString("payslip_name"));
				payhead.setTxtPayheadType(rs.getString("payhead_type"));
				payhead.setGetvalue(rs.getString("applicable"));
				payheadList.add(payhead);
				return payhead;
			}
		}); 
		return payList;
		}catch(Exception e)
		{
			return null;
		}
	}

	@Override
	public List<Payhead> view(String payheadId) {
		
		try{
		String sql = "select applicable_type,pay_id,pay_name,prev_payname,payslip_name,payhead_type,applicable,affectnet_salary from payhead where pay_id = '"+payheadId+"'";
		final List<Payhead> payList=getJdbcTemplate().query(sql, new RowMapper<Payhead>()
		{
			private List<Payhead> payheadList = new ArrayList<Payhead>();	
			public Payhead mapRow(ResultSet rs, int rowNo) throws SQLException {
				
				Payhead payhead = new Payhead();
				payhead.setTxtPayId(rs.getString("pay_id"));
				payhead.setTxtPayheadName(rs.getString("pay_name"));
				payhead.setTxtPayslipName(rs.getString("payslip_name"));
				payhead.setPrevPayheadName(rs.getString("prev_payname")); 
				payhead.setTxtPayheadType(rs.getString("payhead_type"));
				payhead.setGetvalue(rs.getString("applicable"));
				payhead.setApplicable_type(rs.getString("applicable_type"));
				payhead.setGetyesno(rs.getString("affectnet_salary"));
				payheadList.add(payhead);
				return payhead;
			}
		}); 
		return payList;
		}catch(Exception e)
		{
			return null;
		}
	}

	@Override
	public int updatePayHead(Payhead payhead) 
	{	
		try{
		String payname = payhead.getPrevPayheadName();
		String sql = "update payhead set  pay_name='"+payhead.getTxtPayheadName()+"',"+"payslip_name='"+payhead.getTxtPayslipName()+"',"+"payhead_type='"+payhead.getTxtPayheadType()+"',"+"applicable='"+payhead.getGetvalue()+"',"+"applicable_type='"+payhead.getApplicable_type()+"',"+"affectnet_salary='"+payhead.getGetyesno()+"','Active' where pay_id='"+payhead.getTxtPayId()+"'";
		int i=jdbcTemplate.update(sql);
		
		String sql1 = "update accounts_chart set account_Name='"+payhead.getTxtPayheadName()+"' where account_Name = '"+payname+"' ";
		int j=jdbcTemplate.update(sql1);
		
		String sql2 = "update payhead set prev_payname = '"+payhead.getTxtPayheadName()+"' where pay_id='"+payhead.getTxtPayId()+"'";
		int k=jdbcTemplate.update(sql2);
		
		if(i>=1 && j>=1 && k>=1)
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
	public int delete(String payheadId) 
	{
		try
		{
		sql = "update payhead set status = 'Inactive' where pay_id='"+payheadId+"'";
		int i = jdbcTemplate.update(sql) ;
		return i;
		}catch(Exception e)
		{
			return 0;
		}
	}
	@Override
	public List<Payhead> retriveAccountName(String paytype) 
	{
		try{
		String sql= "SELECT group_Id FROM primary_account_group where group_Name = '"+paytype+"' ";
		String group_Id = jdbcTemplate.queryForObject(sql, String.class);

		sql = "select account_No,account_Name from accounts_chart where group_Id = '"+group_Id+"' " ;
		final List<Payhead> leaveList=getJdbcTemplate().query(sql, new RowMapper<Payhead>() 
		{
			private List<Payhead> lList=new ArrayList<Payhead>();
			public Payhead mapRow(ResultSet rs,int rowNo)throws SQLException
			{
				Payhead leave=new Payhead();
				leave.setAccId(rs.getInt("account_No"));
				leave.setTxtAccountName(rs.getString("account_Name"));
				lList.add(leave);
				return leave;
			}	
		});		
			return leaveList;
		}catch(Exception e)
		{
			return null;
		}
	}		
}
