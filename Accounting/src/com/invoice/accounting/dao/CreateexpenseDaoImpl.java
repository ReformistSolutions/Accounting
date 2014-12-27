package com.invoice.accounting.dao;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCountCallbackHandler;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.invoice.accounting.beans.Createnewexpense;
import com.invoice.accounting.beans.CreatenewexpenseDetails;
import com.invoice.accounting.beans.JournalDetails;
import com.invoice.accounting.beans.NewAccount;


@Component(value="createexpenseDao")

public class CreateexpenseDaoImpl implements CreateexpenseDao {
	
		
    private JdbcTemplate jdbcTemplate;
	
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	@Autowired
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	@Override
	public int save(Createnewexpense createnewexpense) {
		String status="Active";
		String source="Record Expense";
		int j=0;
		int z=0;
		int m=0;
		int srNo=0;
		
		String type="C";
		String type1="D";
		 String journal_Id = "";
		 List<CreatenewexpenseDetails> expenselist=createnewexpense.getExpenseDetailsList();
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
		String sql="insert into expense_header value('"+createnewexpense.getExpid()+"','"+createnewexpense.getPaidfrom()+"','"+createnewexpense.getExpdate()+"','"+createnewexpense.getTxttotal()+"','"+createnewexpense.getNarration()+"','"+status+"')";

		int i=jdbcTemplate.update(sql);
		
		int totalNoLine=expenselist.size();		
		totalNoLine=totalNoLine+1;
		String sql2="insert into journal_header values('"+journal_Id+"','"+source+"','"+createnewexpense.getExpid()+"','"+createnewexpense.getExpdate()+"','V','"+createnewexpense.getNarration()+"','"+totalNoLine+"','"+createnewexpense.getTxttotal()+"','"+createnewexpense.getTxttotal()+"')"; 
		int l=jdbcTemplate.update(sql2);
		
		String updatebank="UPDATE accounts_chart set opeinig_Balance=opeinig_Balance+'"+createnewexpense.getTxttotal()+"' where account_No='"+createnewexpense.getPaidfrom()+"'";
		int y=jdbcTemplate.update(updatebank);
		
		String sqlUpdate="insert into journal_details(sr_No,journal_Id,account_No,type,amount) values('"+srNo+"','"+journal_Id+"','"+createnewexpense.getPaidfrom()+"','"+type+"','"+createnewexpense.getTxttotal()+"')";
		int k=jdbcTemplate.update(sqlUpdate);
		
		int y1=1;
		
		for(CreatenewexpenseDetails expensedetaillist : expenselist)
		{
			String updatebank1="UPDATE accounts_chart set opeinig_Balance=opeinig_Balance-'"+expensedetaillist.getTxtamount()+"' where account_No='"+expensedetaillist.getTxttype()+"'";
			z=jdbcTemplate.update(updatebank1);
			
			//System.out.println();
			String sql1="insert into Expense_details value('"+y1+"','"+createnewexpense.getExpid()+"','"+expensedetaillist.getTxttype()+"','"+expensedetaillist.getRemark()+"','"+expensedetaillist.getTxtamount()+"')";
			 j=jdbcTemplate.update(sql1);
			 
				
				String sqlUpdate1="insert into journal_details(sr_No,journal_Id,account_No,type,amount) values('"+expensedetaillist.getTxtSrNo1()+"','"+journal_Id+"','"+expensedetaillist.getTxttype()+"','"+type1+"','"+expensedetaillist.getTxtamount()+"')";
			    m=jdbcTemplate.update(sqlUpdate1);
			 
			    y1++;
	
		}
		
		
		 
	   if(i>=1 && j>=1 && y>=1 && z>=1 && l>=1 && k>=1 && m>=1)
	   {
			return 1;
			}
			else
			{
				return 0;
			}
			}
		
		
		
	@Override
	public List<NewAccount> retriveexpensetype() {
		String sql="select account_No,account_Name,group_Id from accounts_chart where group_Id in (select subgroup_Id from sub_account_group where parentgroup_Id in('GRP005','GRP008'))or group_Id in ( 'GRP005','GRP008');";
		final List<NewAccount> paccGroup=getJdbcTemplate().query(sql, new RowMapper<NewAccount>(){
		    private List<NewAccount> accountList=new ArrayList<NewAccount>();

			@Override
			public NewAccount mapRow(ResultSet rs, int rowNo)throws SQLException {
					
				NewAccount paccntgrp=new NewAccount();
				paccntgrp.setTxtNewAccNo(rs.getInt("account_No"));
				paccntgrp.setTxtAccountName(rs.getString("account_Name"));	
				 
				
				accountList.add(paccntgrp);
				
				return paccntgrp;
			}	
		});		
			return paccGroup;
		}
	@Override
	public List<NewAccount> retrivepaidfrom() {
		String sql="select account_No,account_Name,group_Id from accounts_chart where group_Id in ( 'GRS001','GRS003');";
		final List<NewAccount> paccGroup=getJdbcTemplate().query(sql, new RowMapper<NewAccount>(){
		    private List<NewAccount> accountList=new ArrayList<NewAccount>();

			@Override
			public NewAccount mapRow(ResultSet rs, int rowNo)throws SQLException {
					
				NewAccount paccntgrp=new NewAccount();
				paccntgrp.setTxtNewAccNo(rs.getInt("account_No"));
				paccntgrp.setTxtAccountName(rs.getString("account_Name"));	
				//System.out.println(rs.getString("account_No"));
				
				accountList.add(paccntgrp);
				
				return paccntgrp;
			}	
		});		
			return paccGroup;
		}
	@Override
	public List<Createnewexpense> showexpense() {
		String sql="select * from vexpense where status='Active' group by Expense_Id ";		
		final List<Createnewexpense> groupOfAccountList=getJdbcTemplate().query(sql, new RowMapper<Createnewexpense>() {
		private List<Createnewexpense> grpAccList=new ArrayList<Createnewexpense>();
		public Createnewexpense mapRow(ResultSet rs,int rowNo)throws SQLException
		{
			Createnewexpense groupAcc=new Createnewexpense();
		     
			groupAcc.setExpid(rs.getString("Expense_Id"));
			groupAcc.setPaidfrom(rs.getString("account_Name"));
			groupAcc.setExpdate(rs.getString("Expensedate"));
			groupAcc.setTxttotal(rs.getFloat("Total"));
			groupAcc.setNarration(rs.getString("Narration"));
			
			
			grpAccList.add(groupAcc);
			return groupAcc;
		}
	}
    );		
		return groupOfAccountList;
	
	
	}
	@Override
	public List<Createnewexpense> editexpense(String expid) {
		String sql="select * from vexpense where Expense_Id='"+expid+"'";		
		return jdbcTemplate.query(sql, new RowMapper<Createnewexpense>() {
			List<CreatenewexpenseDetails> createnewexpenseDetailslist =new ArrayList<CreatenewexpenseDetails>();
			@Override
			public Createnewexpense mapRow(ResultSet rs, int arg1) throws SQLException {
				Createnewexpense createnewexpense=new Createnewexpense();
				CreatenewexpenseDetails createnewexpenseDetails=new CreatenewexpenseDetails();
				createnewexpense.setExpid(rs.getString("Expense_Id"));
				createnewexpense.setPaidfrmaccno(rs.getString("account_Name"));
				createnewexpense.setPaidfrom(rs.getString("PaidFrom"));
				createnewexpense.setExpdate(rs.getString("Expensedate"));
				createnewexpense.setTxttotal(rs.getFloat("Total"));
				createnewexpense.setNarration(rs.getString("Narration"));
				
				createnewexpenseDetails.setTxtSrNo1(rs.getInt("Srno"));
				createnewexpenseDetails.setTypefrmaccno(rs.getString("ExpenseTypeAccount"));
				createnewexpenseDetails.setTxttype(rs.getString("ExpenseAccount No"));
				createnewexpenseDetails.setRemark(rs.getString("Description"));	
				createnewexpenseDetails.setTxtamount(rs.getFloat("Amount"));
				
                createnewexpenseDetailslist.add(createnewexpenseDetails);
				createnewexpense.setExpenseDetailsList(createnewexpenseDetailslist);
				return createnewexpense;
			}
		});
	
	}
	@Override
	public int updateexpense(Createnewexpense createnewexpense) {
		int j=0;
		String account_No="";
		float amount=0;
		String type="";
		int k=0;
		String journal_Id="";
		String expid=createnewexpense.getExpid();
		
		
		String source="Record Expense";
		int z=0;
		int m=0;
		int srNo=0;
		String type1="C";
		String type2="D";
		
		String desc=jdbcTemplate.queryForObject("select Narration from expense_header where Expense_Id='"+expid+"'",String.class);
		String journalId=jdbcTemplate.queryForObject("select journal_Id from journal_header where refrence='"+expid+"' and journal_Header_Status='V'",String.class) ; 
		String upd="Update journal_header set journal_Header_Status='D',"+" description='Reversal Journal Deleted' where journal_Id='"+journalId+"'";
		jdbcTemplate.update(upd);
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
		
		String  sql1 = "select totalCredit from journal_header where refrence = '"+expid+"' "; 
		String cramount = jdbcTemplate.queryForObject(sql1,String.class);
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");	     
		Date date = new Date();	     
		String dt=dateFormat.format(date);
		
		List<CreatenewexpenseDetails> expenselist = createnewexpense.getExpenseDetailsList();
		int totalNoLine1=expenselist.size();		
		totalNoLine1=totalNoLine1+1;
		String urlj="insert into journal_header value('"+journal_Id+"','Record Expense','"+expid+"','"+dt+"','R','"+desc+"','"+totalNoLine1+"','"+cramount+"','"+cramount+"')";
		jdbcTemplate.update(urlj); 

		int i=0;
		List<JournalDetails> jList=getAccountDetails(journalId);
		for (JournalDetails journalDetails : jList) {	
			account_No=journalDetails.getAccno();		
			type=journalDetails.getTxtType();
			amount=journalDetails.getTxtAmount();						
			if(type.equals("D"))
			{
				String sql4="UPDATE accounts_chart set opeinig_Balance=opeinig_Balance+'"+amount+"' where account_No='"+account_No+"'";
				
				k=jdbcTemplate.update(sql4);
				type="C";
			}
			else
			{
				type="D";
			}
			 String urlLine1="insert into journal_details value('"+i+"','"+journal_Id+"','"+account_No+"','"+type+"','"+amount+"')";
			 jdbcTemplate.update(urlLine1);
			 
			 i++;
			
		}	
		 
		
		String sql2="select PaidFrom from expense_header where Expense_Id='"+expid+"'";
		String paidacc=jdbcTemplate.queryForObject(sql2,String.class);
		
		String sql3="UPDATE accounts_chart set opeinig_Balance = opeinig_Balance-'"+cramount+"' where account_No='"+paidacc+"'";
		int j1=jdbcTemplate.update(sql3);		
		
		String sql="UPDATE expense_header SET PaidFrom='"+createnewexpense.getPaidfrom()+"',"+"Expensedate='"+createnewexpense.getExpdate()+"',"+"Total='"+createnewexpense.getTxttotal()+"',"+"Narration='"+createnewexpense.getNarration()+"' WHERE Expense_Id='"+createnewexpense.getExpid()+"'";
		int i1=jdbcTemplate.update(sql);
		String Expense_Id = createnewexpense.getExpid();
		deleteList(Expense_Id);
		for(CreatenewexpenseDetails detailList : expenselist)
		{
			String sql4="insert into expense_details value('"+detailList.getTxtSrNo1()+"','"+createnewexpense.getExpid()+"','"+detailList.getTxttype()+"','"+detailList.getRemark()+"','"+detailList.getTxtamount()+"')";
			j= jdbcTemplate.update(sql4);			
		}
		
		String journal_Id1=generateJournalId();
		
		String sql5="insert into journal_header values('"+journal_Id1+"','"+source+"','"+createnewexpense.getExpid()+"','"+createnewexpense.getExpdate()+"','V','"+createnewexpense.getNarration()+"','"+totalNoLine1+"','"+createnewexpense.getTxttotal()+"','"+createnewexpense.getTxttotal()+"')"; 
		int l=jdbcTemplate.update(sql5);

		
		String updatebank="UPDATE accounts_chart set opeinig_Balance=opeinig_Balance+'"+createnewexpense.getTxttotal()+"' where account_No='"+createnewexpense.getPaidfrom()+"'";
		int y=jdbcTemplate.update(updatebank);
		
		String sqlUpdate="insert into journal_details(sr_No,journal_Id,account_No,type,amount) values('"+srNo+"','"+journal_Id1+"','"+createnewexpense.getPaidfrom()+"','"+type1+"','"+createnewexpense.getTxttotal()+"')";
		int k1=jdbcTemplate.update(sqlUpdate);
		
		
		List<CreatenewexpenseDetails> expenselist1=createnewexpense.getExpenseDetailsList();
		for(CreatenewexpenseDetails expensedetaillist : expenselist1)
		{
			String updatebank1="UPDATE accounts_chart set opeinig_Balance=opeinig_Balance-'"+expensedetaillist.getTxtamount()+"' where account_No='"+expensedetaillist.getTxttype()+"'";
			z=jdbcTemplate.update(updatebank1);
			
				String sqlUpdate1="insert into journal_details(sr_No,journal_Id,account_No,type,amount) values('"+expensedetaillist.getTxtSrNo1()+"','"+journal_Id1+"','"+expensedetaillist.getTxttype()+"','"+type2+"','"+expensedetaillist.getTxtamount()+"')";
			    m=jdbcTemplate.update(sqlUpdate1);
			 
	
		}
		
		if(i>0 && j>0 && j1>0 && i1>0 && k>0 && k1>0 && y>0 && l>0 && m>0 && z>0)
		{
		return 1;
		}
		else
		{
			return 0;
		}
	}
	private void deleteList(String expense_Id)
	{		
		String deleteListUrl="DELETE FROM expense_details WHERE Expense_Id= '"+expense_Id+"'";	
		jdbcTemplate.update(deleteListUrl);
	}
	private String generateJournalId()
	{
		String journal_Id1="";
		RowCountCallbackHandler countCallback1 = new RowCountCallbackHandler();
		jdbcTemplate.query("select * from journal_header", countCallback1);
		int count1 = countCallback1.getRowCount();
		count1++; 		
		if (count1 < 10) {
			journal_Id1 = "JID00" + count1;
		} else 
		{
			if (count1 < 99) {
				journal_Id1 = "JID0" + count1;
			} else 
			{
				journal_Id1 = "JID" + count1;
			}
		}	
		return journal_Id1;
	}
	
	@Override
	public int delete(String expid) {
		String status="Inactive";
		String account_No="";
		float amount=0;
		String type="";
		int k=0;
		String journal_Id="";
		
		String desc=jdbcTemplate.queryForObject("select Narration from expense_header where Expense_Id='"+expid+"'",String.class);
		String journalId=jdbcTemplate.queryForObject("select journal_Id from journal_header where refrence='"+expid+"' and journal_Header_Status='V'",String.class);
		
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
		
		String  sql1 = "select totalCredit from journal_header where refrence = '"+expid+"' and journal_Header_Status='V' "; 
		String cramount = jdbcTemplate.queryForObject(sql1,String.class);
		//System.out.println("CRAmount="+cramount);
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");	     
		Date date = new Date();	     
		String dt=dateFormat.format(date);

		List<JournalDetails> jList=getAccountDetails(journalId);
		int totalline=jList.size();
		String urlj="insert into journal_header value('"+journal_Id+"','Record Expense','"+expid+"','"+dt+"','V','"+desc+"','"+totalline+"','"+cramount+"','"+cramount+"')";
		jdbcTemplate.update(urlj);

		int i=0;
		for (JournalDetails journalDetails : jList) {	
			account_No=journalDetails.getAccno();		
			type=journalDetails.getTxtType();
			amount=journalDetails.getTxtAmount();						
			if(type.equals("D"))
			{
				String sql4="UPDATE accounts_chart set opeinig_Balance=opeinig_Balance+'"+amount+"' where account_No='"+account_No+"'";
				k=jdbcTemplate.update(sql4);
				type="C";
			}
			else
			{
				type="D";
			}
			 String urlLine1="insert into journal_details value('"+i+"','"+journal_Id+"','"+account_No+"','"+type+"','"+amount+"')";
			 jdbcTemplate.update(urlLine1);
			 
			 i++;
			
		}	
		 
		String upd="Update journal_header set journal_Header_Status='D',"+" description='Reversal Journal Deleted' where journal_Id='"+journalId+"'";
		jdbcTemplate.update(upd);
		
		String sql2="select PaidFrom from expense_header where Expense_Id='"+expid+"'";
		String paidacc=jdbcTemplate.queryForObject(sql2,String.class);
	//	System.out.println("Paid From Account="+paidacc);
		
		String sql3="UPDATE accounts_chart set opeinig_Balance = opeinig_Balance-'"+cramount+"' where account_No='"+paidacc+"'";
		//System.out.println(sql3);
		int j=jdbcTemplate.update(sql3);		
		
		String sql="UPDATE expense_header set status='"+status+"' where Expense_Id='"+expid+"'";
		int x=jdbcTemplate.update(sql);
		
		if(x>0 && j>0 && k>0)
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
	public Createnewexpense generateExpID() {
		String expid="";
		RowCountCallbackHandler countCallback=new RowCountCallbackHandler();
		jdbcTemplate.query("select * from expense_header",countCallback);
		int count=countCallback.getRowCount();
		count++;
		if(count<10)
		{
			expid="EXP00"+count;
		}
		else
		{
			if(count<99)
			{
				expid="EXP0"+count;
			}
			else
			{
				expid="EXP"+count;
			}
		}
		Createnewexpense createnewexpense=new Createnewexpense();
		createnewexpense.setExpid(expid);
		return createnewexpense;
	}
	
}