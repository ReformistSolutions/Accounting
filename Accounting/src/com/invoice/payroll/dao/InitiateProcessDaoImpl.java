package com.invoice.payroll.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCountCallbackHandler;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.invoice.accounting.beans.NewAccount;
import com.invoice.payroll.beans.Payhead;
import com.invoice.payroll.beans.ProcessPayroll;
import com.invoice.payroll.beans.ProcessPayrollList;
import com.invoice.payroll.beans.SalaryBeans;
import com.invoice.payroll.beans.VeriableList;
import com.invoice.payroll.beans.VeriableTemp;

@Component("initiateProcessDao")
public class InitiateProcessDaoImpl implements InitiateProcessDao
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
	public int save(VeriableTemp veriableTemp) {
		
		try{
		int  i=0,iD=0;
		sql = "insert into variablename_temp value('"+veriableTemp.getEmp_id()+"') ";
		i=jdbcTemplate.update(sql);
		
		List<VeriableList> eDList=veriableTemp.getVeriableList();
		for (VeriableList ed : eDList)
		{
			String sql1="insert into variablename_tempD(emp_id,payhead_id,payhead_type,applicable_type,amount) value('"+veriableTemp.getEmp_id()+"','"+ed.getPayhead_id()+"','"+ed.getPayhead_type()+"','"+ed.getApplicable_type()+"','"+ed.getAmount()+"')";
			 iD= jdbcTemplate.update(sql1);
		}
		if(i>0 && iD>0)
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
	public int saveSProcess(ProcessPayroll processPayroll) 
	{
		try
		{
		Calendar cal = Calendar.getInstance();
		int month = cal.get(Calendar.MONTH)+1;
		int year = cal.get(Calendar.YEAR);
		int  i=0 ,j=0,k=0,l=0,m=0,n=0,p=0,q=0,r=0,s=0,t=0,u=0;
		
		String pay_id = "";
		RowCountCallbackHandler countCallback = new RowCountCallbackHandler();
		jdbcTemplate.query("select * from salary_payment", countCallback);
		int count = countCallback.getRowCount();
		count++;
		if (count < 10) 
		{
			pay_id = "PAY00" + count;
		} else 
		{ 
			if (count < 99) {
				pay_id = "PAY0" + count;
			} else {
				pay_id = "PAY" + count;
			}
		}
		sql = "insert into salary_payment(pay_id,month,year,process_date,amount,account_no) value('"+pay_id+"','"+month+"','"+year+"','"+processPayroll.getSchuduleDate()+"','"+processPayroll.getTotalSalary()+"','"+processPayroll.getAccounttoPay()+"')";
		i=jdbcTemplate.update(sql);
		
		List<ProcessPayrollList> pList = processPayroll.getProcesspayrolllist();
	    for(ProcessPayrollList processList : pList)
	    {
	    	sql = "insert into salarypayment_header(pay_id,emp_id,days_absent,deduction,absenttype,deduction_name,net_salary) select '"+pay_id+"','"+processList.getEmpId()+"','"+processList.getDaysAbsent()+"','"+processList.getAbsentValue()+"','"+processList.getAbsenttype()+"','"+processList.getAbsentName()+"','"+processList.getTotalSalary()+"' from salary_payment";
	    	i=jdbcTemplate.update(sql);	 
	    	String empid=processList.getEmpId();
	    	
	    	String sql1 = "insert into salarypayment_details(pay_id,emp_id,payhead_id,payhead_type,applicable_type,amount) select '"+pay_id+"','"+empid+"',payhead_id,payhead_type,applicable_type,amount from variablename_tempd where emp_id = '"+empid+"'";
	    	j=jdbcTemplate.update(sql1);
	    	
	    	String sql8= "select sum(deduction) from salarypayment_header where emp_id='"+processList.getEmpId()+"'";
			String DD = jdbcTemplate.queryForObject(sql8, String.class);
			
			
	    	String sql= "select sum(payhead_amt) from salary_details where emp_id='"+processList.getEmpId()+"' and payhead_type = 'Indirect Expenses'";
			String E = jdbcTemplate.queryForObject(sql, String.class);
			
			String sq= "select sum(payhead_amt) from salary_details where emp_id='"+processList.getEmpId()+"' and payhead_type = 'Direct Expenses'";
			String amte2 = jdbcTemplate.queryForObject(sq, String.class);
			String E2 = "";
			if(amte2!=null)
			{
				E2 = amte2;
			}
			else
			{
				E2="0";
			}
			
			String sql3= "select sum(payhead_amt) from salary_details where emp_id='"+processList.getEmpId()+"' and payhead_type = 'Duties and Taxes'";
			String amt = jdbcTemplate.queryForObject(sql3, String.class);
			String D = "";
			if(amt!=null)
			{
				D = amt;
			}
			else
			{
				D="0";
			}
			
			String sql4= "select sum(amount) from variablename_tempd where emp_id='"+processList.getEmpId()+"' and payhead_type = 'Duties and Taxes'";
			String amtvd = jdbcTemplate.queryForObject(sql4, String.class);
			String VD = "";
			if(amtvd!=null)
			{
				VD = amtvd;
			}
			else
			{
				VD="0";
			}
			
			//String sql4= "select sum(amount) from variablename_tempd where emp_id='"+processList.getEmpId()+"' and payhead_type = 'Deduction'";
			//String D1 = jdbcTemplate.queryForObject(sql4, String.class);
			
			String sql5= "select sum(amount) from variablename_tempd where emp_id='"+processList.getEmpId()+"' and payhead_type = 'Indirect Expenses'";
			String amt1 = jdbcTemplate.queryForObject(sql5, String.class);
			String E1 = "";
			if(amt1!=null)
			{
				E1 = amt1;
			}
			else
			{
				E1="0";
			}
			String sq1= "select sum(amount) from variablename_tempd where emp_id='"+processList.getEmpId()+"' and payhead_type = 'Direct Expenses'";
			String amt2 = jdbcTemplate.queryForObject(sq1, String.class);
			String E3 = "";
			if(amt2!=null)
			{
				E3 = amt2;
			}
			else
			{
				E3="0";
			}
			
			
	    	String sql2 = "insert into salarypayment_details(pay_id,emp_id,payhead_id,payhead_type,applicable_type,amount) select '"+pay_id+"','"+empid+"',payhead_name,payhead_type,applicable_type,payhead_amt from salary_details where emp_id = '"+empid+"' ";
	    	k=jdbcTemplate.update(sql2);

	    	String applicableType = "";
	    	List<ProcessPayroll> processPayrolls = getApplicableType(empid);
	    	for (ProcessPayroll processPayroll2 : processPayrolls) 
	    	{
	    		applicableType = processPayroll2.getApplicable_type(); 
			}
	    	if(applicableType.equalsIgnoreCase("S"))
	    	{
		    	String sql6 = "update salarypayment_header set net_salary = ('"+E+"' + '"+E1+"') - ('"+D+"' + '"+DD+"' + '"+VD+"')  where emp_id = '"+processList.getEmpId()+"' ";
		    	l=jdbcTemplate.update(sql6);
	    	}
	    	else if(applicableType.equalsIgnoreCase("W"))
	    	{
		    	String sqlw = "update salarypayment_header set net_salary = ('"+E2+"' + '"+E3+"') - ('"+D+"' + '"+DD+"' + '"+VD+"')  where emp_id = '"+processList.getEmpId()+"' ";
		    	t=jdbcTemplate.update(sqlw);
	    	}
			
			String sql7 = "update salary_payment set amount = (select sum(net_salary) from salarypayment_header)";
			m=jdbcTemplate.update(sql7);
			
			String type = "";
			List<SalaryBeans> paytype = getapplicableType(processList.getEmpId());
			for (SalaryBeans salaryBeans : paytype) 
			{
				type=salaryBeans.getApplicable_type();
			}
			//select payhead_id,amount from salarypayment_details where emp_id = '"+processList.getEmpId()+"'
			String payid = "select payhead_id,applicable_type,amount from salarypayment_details where emp_id = '"+processList.getEmpId()+"' and applicable_type = '"+type+"' ";
			final List<ProcessPayroll> sallist = getJdbcTemplate().query(payid, new RowMapper<ProcessPayroll>()
			{
				private List<ProcessPayroll> sList = new ArrayList<ProcessPayroll>();
				@Override
				public ProcessPayroll mapRow(ResultSet rs, int rowNo) throws SQLException 	
				{
					ProcessPayroll payhead = new ProcessPayroll();
					payhead.setPayid(rs.getString("payhead_id"));
					payhead.setApplicable_type(rs.getString("applicable_type"));
					payhead.setPayheadamt(rs.getFloat("amount"));
					sList.add(payhead);
					return payhead;
				}
			});
			
			for (ProcessPayroll processPayroll2 : sallist)
			{
				String payid1 = processPayroll2.getPayid();
				String applicable_type = processPayroll2.getApplicable_type();
				float payamnt = processPayroll2.getPayheadamt();
				
				String payhead_type = "";
				String payhead_Name = "";
				List<Payhead> sList = showPayhead_Type(payid1);
				for (Payhead payhead : sList) 
				{
					payhead_type = payhead.getTxtPayheadType();
					payhead_Name = payhead.getTxtPayheadName();
				}
				String groupid = showGroupId(payhead_type);
				String acNo = showAccountNo(groupid,payhead_Name);
				
				if(applicable_type.equalsIgnoreCase("S"))
				{
					String s1 = "update accounts_chart set opeinig_Balance = opeinig_Balance + '"+payamnt+"' where account_No='"+acNo+"'" ;
					n=jdbcTemplate.update(s1);
				}
				else if(applicable_type.equalsIgnoreCase("W"))
				{
					String s2 = "update accounts_chart set opeinig_Balance = opeinig_Balance + '"+payamnt+"' where account_No='"+acNo+"'" ;
					u=jdbcTemplate.update(s2);
				}
			}
		}
		String sq= "select sum(amount) from salarypayment_details";
		String op = jdbcTemplate.queryForObject(sq, String.class);
		
		String journal_Id = "";
		
		int srno = 1;
		RowCountCallbackHandler countCallback1 = new RowCountCallbackHandler();
		jdbcTemplate.query("select * from journal_header", countCallback);
		int count1 = countCallback1.getRowCount();
		count1++;
		if (count1 < 10)
		{
			journal_Id = "JID00" + count1;
		}
		else
		{
			if (count1 < 99)
			{
				journal_Id = "JID0" + count1;
			}
			else
			{
				journal_Id = "JID" + count1;
			}
		}
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
	    Date date = new Date();
	    String dt=dateFormat.format(date);
	    String currdtM=(dt.substring(0,7)).toString();
		String payid = "select b.pay_id, b.payhead_id,sum(b.amount) as amount from salary_payment  a, salarypayment_details b where SUBSTRING_INDEX(a.process_date, '/',2) ='"+currdtM+"'  group by b.payhead_id";
		final List<ProcessPayroll> sallist = getJdbcTemplate().query(payid, new RowMapper<ProcessPayroll>()
		{
			private List<ProcessPayroll> sList = new ArrayList<ProcessPayroll>();
			@Override
			public ProcessPayroll mapRow(ResultSet rs, int rowNo) throws SQLException 	
			{
				ProcessPayroll payhead = new ProcessPayroll();
				payhead.setPayid(rs.getString("payhead_id"));
				payhead.setPayheadamt(rs.getFloat("amount"));
				sList.add(payhead);
				return payhead;
			}
		});
		int totalLinecnt = sallist.size();
		totalLinecnt = totalLinecnt + 1 ;
		String s2 = "insert into journal_header value('"+journal_Id+"','Salary','"+pay_id+"','"+processPayroll.getSchuduleDate()+"','V','Being Salary Paid','"+totalLinecnt+"','"+op+"','"+op+"') ";
		p=jdbcTemplate.update(s2);
		
		/*for (ProcessPayroll processPayroll2 : sallist)
		{
			String payid2 = processPayroll2.getPayid();
			float payamt = processPayroll2.getPayheadamt();
			List<Payhead> sList = showPayhead(payid2);
			for (Payhead payhead : sList)
			{
				int acNo = payhead.getAccId();
				String sd = "insert into journal_details(sr_No,journal_Id,account_No,type,amount) value('"+srno+"','"+journal_Id+"','"+acNo+"','D','"+payamt+"')";
				q=jdbcTemplate.update(sd);
			}
			srno++;
		}*/
		for (ProcessPayroll processPayroll2 : sallist)
		{
			String payid1 = processPayroll2.getPayid();
			float payamnt = processPayroll2.getPayheadamt();
			
			String payhead_type = "";
			String payhead_Name = "";
			List<Payhead> sList = showPayhead_Type(payid1);
			for (Payhead payhead : sList) 
			{
				payhead_type = payhead.getTxtPayheadType();
				payhead_Name = payhead.getTxtPayheadName();
			}
			String groupid = showGroupId(payhead_type);
			String acNo = showAccountNo(groupid,payhead_Name);
			
			String sd = "insert into journal_details(sr_No,journal_Id,account_No,type,amount) value('"+srno+"','"+journal_Id+"','"+acNo+"','D','"+payamnt+"')";
			q=jdbcTemplate.update(sd);
			srno++;
		}
		String sd0 = "select sum(amount) as amount from journal_details where journal_Id='"+journal_Id+"' AND type = 'D'";
		String payamnt = jdbcTemplate.queryForObject(sd0, String.class);
		
		String acno1 = processPayroll.getAccounttoPay();
		String sd1 = "insert into journal_details(sr_No,journal_Id,account_No,type,amount) value('"+srno+"','"+journal_Id+"','"+acno1+"','C','"+payamnt+"') ";
		r=jdbcTemplate.update(sd1);
		
		String sd2 = "update accounts_chart set opeinig_Balance = opeinig_Balance - '"+payamnt+"' where account_No = '"+acno1+"'" ;
		s=jdbcTemplate.update(sd2);
		
		if(i>0 && j>0 && k>0 && l>0 && m>0 && n>0 && p>0 && q>0 && r>0 && s>0 && t>0 && u>0)
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
	private List<ProcessPayroll> getApplicableType(String empid)
	{
		String payid = "select applicable_type from salary_details where emp_id = '"+empid+"' ";
		final List<ProcessPayroll> sallist = getJdbcTemplate().query(payid, new RowMapper<ProcessPayroll>()
		{
			private List<ProcessPayroll> sList = new ArrayList<ProcessPayroll>();
			@Override
			public ProcessPayroll mapRow(ResultSet rs, int rowNo) throws SQLException 	
			{
				ProcessPayroll payhead = new ProcessPayroll();
				payhead.setApplicable_type(rs.getString("applicable_type"));
				sList.add(payhead);
				return payhead;
			}
		});
		return sallist;
	}
	private List<Payhead> showPayhead_Type(String payid1)
	{
		try{
			String accName = "select payhead_type,pay_name from payhead where pay_id = '"+payid1+"'" ;
			final List<Payhead> type_list = getJdbcTemplate().query(accName, new RowMapper<Payhead>()
			{
				private List<Payhead> sList = new ArrayList<Payhead>();
				@Override
				public Payhead mapRow(ResultSet rs, int rowNo) throws SQLException 
				{
					Payhead payhead = new Payhead();
					payhead.setTxtPayheadType(rs.getString("payhead_type"));
					payhead.setTxtPayheadName(rs.getString("pay_name"));
					sList.add(payhead);
					return payhead;
				}
			});
			return type_list;
			}catch(Exception e)
			{ 
				return null;
			}
	}
	private String showGroupId(String type)
	{
		try
		{
			if(type.equalsIgnoreCase("Duties and Taxes"))
			{
				String groupId = jdbcTemplate.queryForObject("select parentgroup_Id from sub_account_group where subgroup_Name='"+type+"'", String.class);
				return groupId;
			}
			else
			{	
				String groupId = jdbcTemplate.queryForObject("select group_Id from primary_account_group where group_Name='"+type+"'", String.class);
				return groupId;
			}
		}catch(Exception e)
		{ 
			return null;
		}
	}
	private String showAccountNo(String groupid1,String payhead_Name)
	{
		try
		{
		String accNo = jdbcTemplate.queryForObject("select account_No from accounts_chart where group_Id = '"+groupid1+"' and account_Name = '"+payhead_Name+"' ;", String.class);
		return accNo;
		}catch(Exception e)
		{ 
			return null;
		}
	}
	
	@Override
	public List<ProcessPayroll> showPayrollprocess() 
	{
		try{
		String sql = "select * from vprocesspayroll group by emp_id";
		return jdbcTemplate.query(sql, new RowMapper<ProcessPayroll>(){
			List<ProcessPayrollList> payrollDetailsList = new ArrayList<ProcessPayrollList>();
			public ProcessPayroll mapRow(ResultSet rs, int rowNo) throws SQLException {
				ProcessPayroll processPayroll = new ProcessPayroll();
				ProcessPayrollList payrollDetails = new ProcessPayrollList();
				
				processPayroll.setAccounttoPay(rs.getString("accountto_pay"));
				processPayroll.setSchuduleDate(rs.getString("schedule_date"));
				
				payrollDetails.setEmpId(rs.getString("emp_id"));
				payrollDetails.setTxtfname(rs.getString("f_Name"));
				payrollDetails.setTxtmname(rs.getString("m_Name"));
				payrollDetails.setTxtlname(rs.getString("l_Name"));
				payrollDetails.setDaysAbsent(rs.getInt("days_absent"));
				payrollDetails.setTotalSalary(rs.getFloat("amount"));
				
				payrollDetailsList.add(payrollDetails);
				processPayroll.setProcesspayrolllist(payrollDetailsList);
				return processPayroll;
			}
		});
		}catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public List<NewAccount> showAccountList()
	{
		try{
		String sql = "select account_No,account_Name,group_Id from accounts_chart where group_Id in ('GRS001','GRS003')";/*select subgroup_Id from sub_account_group where parentgroup_Id in('GRP003'))or group_Id in ( */
		final List<NewAccount> aclist = getJdbcTemplate().query(sql, new RowMapper<NewAccount>()
		{
			private List<NewAccount> aList = new ArrayList<NewAccount>();
			@Override
			public NewAccount mapRow(ResultSet rs, int rowNo) throws SQLException
			{
				NewAccount account = new NewAccount();
				account.setTxtNewAccNo(rs.getInt("account_No"));
				account.setTxtAccountName(rs.getString("account_Name"));
				aList.add(account);
				return account;
			}
		});
		return aclist;	
		}catch(Exception e)
		{
			return null;
		}
		}
	@Override
	public List<Payhead> showVeriableName(String empid)
	{
		try{
			String type = "";
			List<SalaryBeans> paytype = getapplicableType(empid);
			for (SalaryBeans salaryBeans : paytype) 
			{
				type=salaryBeans.getApplicable_type();
			}
			//select p.pay_id,p.pay_name,p.payhead_type,p.applicable_type from payhead p where p.applicable_type = '"+type+"' and p.applicable = 'Optional'
			//
			String sql = "select p.pay_id,p.pay_name,p.payhead_type,p.applicable_type from payhead p where p.applicable_type in( '"+type+"', 'B') and p.applicable = 'Optional'";
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
					payhead.setApplicable_type(rs.getString("applicable_type")); 
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
	private List<SalaryBeans> getapplicableType(String empid) 
	{
		String sql = "select applicable_type from salary_details where emp_id = '"+empid+"'";
		final List<SalaryBeans> payheadlist = getJdbcTemplate().query(sql, new RowMapper<SalaryBeans>()
		{
			private List<SalaryBeans> payList = new ArrayList<SalaryBeans>();
			@Override
			public SalaryBeans mapRow(ResultSet rs, int rowNo) throws SQLException
			{
				SalaryBeans salList = new SalaryBeans();
				salList.setApplicable_type(rs.getString("applicable_type"));
				payList.add(salList);
				return salList;
			}
		});
		return payheadlist;
	}
	
		
}