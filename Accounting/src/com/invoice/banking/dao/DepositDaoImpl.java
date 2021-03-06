package com.invoice.banking.dao;

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

import com.invoice.accounting.beans.JournalDetails;
import com.invoice.accounting.beans.JournalHeader;

import com.invoice.banking.beans.Deposit;
import com.invoice.company.beans.CompanyDetails;

@Component(value="depositDao")
public class DepositDaoImpl implements DepositDao {
	
	float fromacbal;
	float toacbal;
	
	private JdbcTemplate jdbcTemplate;

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	
@Autowired
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

@Override
public int save(Deposit deposit,JournalHeader journalHeader) {
	
	String Status="Active";
	String source="Deposit";
	int l,iD,iD1=0;
	int srNo=1;
	int srNo1 = 2;
	String type="C";
	String type1="D";
	
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
String sql="insert into bank_transaction value('"+deposit.getTxtdepoVchrNo()+"','"+deposit.getTxtdepodate()+"','"+deposit.getTxtdepoTransType()+"','"+deposit.getTxtdepoFrmAccnt()+"','"+deposit.getTxtdepoToAccnt()+"','"+deposit.getTxtdepoAmount()+"','"+deposit.getTxtdepoDesc()+"','"+Status+"')";
	


	int i=jdbcTemplate.update(sql);
	
	String updatebank="update accounts_chart set opeinig_Balance=opeinig_Balance-'"+deposit.getTxtdepoAmount()+"' where account_No='"+deposit.getTxtdepoFrmAccnt()+"'";
	int j=jdbcTemplate.update(updatebank);
	
	String updatebank1="update accounts_chart set opeinig_Balance=opeinig_Balance+'"+deposit.getTxtdepoAmount()+"' where account_No='"+deposit.getTxtdepoToAccnt()+"'";
    int k=jdbcTemplate.update(updatebank1);
    
    String sql1="insert into journal_header values('"+journal_Id+"','"+source+"','"+deposit.getTxtdepoVchrNo()+"','"+deposit.getTxtdepodate()+"','V','"+deposit.getTxtdepoDesc()+"','2','"+deposit.getTxtdepoAmount()+"','"+deposit.getTxtdepoAmount()+"')";  
	l=jdbcTemplate.update(sql1);
	
	JournalDetails journalDetails=new JournalDetails();
	
	journalDetails.setTxtSrNo(srNo);
	journalDetails.setTxtAccountName(journal_Id);
	journalDetails.setAccno(deposit.getTxtdepoFrmAccnt());
	journalDetails.setTxtType(type1);
	journalDetails.setTxtAmount(deposit.getTxtdepoAmount());

	
	String sqlUpdate="insert into journal_details(sr_No,journal_Id,account_No,type,amount) value('"+journalDetails.getTxtSrNo()+"','"+journalDetails.getTxtAccountName()+"','"+journalDetails.getAccno()+"','"+journalDetails.getTxtType()+"','"+journalDetails.getTxtAmount()+"')";
	
	
	iD= jdbcTemplate.update(sqlUpdate);
	
	JournalDetails journalDetails1=new JournalDetails();
	journalDetails1.setTxtSrNo(srNo1);
	journalDetails1.setTxtAccountName(journal_Id);
	journalDetails1.setAccno(deposit.getTxtdepoToAccnt());
	journalDetails1.setTxtType(type);
	journalDetails1.setTxtAmount(deposit.getTxtdepoAmount());
	
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
public List<Deposit> show() {
	String sql="select * from vbanktransaction where voucher_No LIKE 'vd%' AND status='Active'";	
	final List<Deposit> depositList=getJdbcTemplate().query(sql, new RowMapper<Deposit>() {
		private List<Deposit> depoList=new ArrayList<Deposit>();
		public Deposit mapRow(ResultSet rs,int rowNo)throws SQLException
		{
			Deposit deposit=new Deposit();
			deposit.setTxtdepoVchrNo(rs.getString("voucher_No"));
			deposit.setTxtdepodate(rs.getString("transaction_Date"));
			deposit.setTxtdepoFrmAccnt(rs.getString("from_Account"));
			deposit.setTxtdepoToAccnt(rs.getString("to_Account"));
			deposit.setTxtdepoAmount(rs.getFloat("amount"));
			
			
			
			depoList.add(deposit);
			return deposit;
		}	
	});		
		return depositList;
	}

@Override
public List<Deposit> editDeposit(String voucherNo) {
String sql="select * from vbanktransaction where voucher_No='"+voucherNo+"'";
	
return jdbcTemplate.query(sql, new RowMapper<Deposit>() {

	@Override
	public Deposit mapRow(ResultSet rs, int arg1) throws SQLException {
		
		Deposit deposit=new Deposit();
		
	deposit.setTxtdepoVchrNo(rs.getString("voucher_No"));
	deposit.setTxtdepodate(rs.getString("transaction_Date"));
	deposit.setTxtdepoTransType(rs.getString("transaction_Type"));
	deposit.setTxtdepoFrmAccnt(rs.getString("from_Account"));
	deposit.setTxtdepoToAccnt(rs.getString("to_Account"));
	deposit.setTxtdepoAmount(rs.getFloat("amount"));
	deposit.setTxtdepoDesc(rs.getString("description"));
	deposit.setFromAccountNo(rs.getString("fromAcNo"));
	deposit.setToAccountNo(rs.getString("toAcNo"));	
		
		
		return deposit;
		
		}
	});
}

@Override
public int updateDeposit(Deposit deposit) {
	String sql="update bank_transaction set transaction_Date='"+deposit.getTxtdepodate()+"',"+"transaction_Type='"+deposit.getTxtdepoTransType()+"',"+"from_Account='"+deposit.getTxtdepoFrmAccnt()+"',"+"to_Account='"+deposit.getTxtdepoToAccnt()+"',"+"amount='"+deposit.getTxtdepoAmount()+"',"+"description='"+deposit.getTxtdepoDesc()+"' where voucher_No='"+deposit.getTxtdepoVchrNo()+"' ";
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

@Override
public Deposit autoId() {
	String vchrNo="";
	RowCountCallbackHandler countCallback = new RowCountCallbackHandler();  
	 jdbcTemplate.query("select * from bank_transaction", countCallback);
	 int count = countCallback.getRowCount();
	 count++;
	 //System.out.println("Count="+count);
	 if(count<10)
	 {
		 vchrNo="VD00"+count;
	 }
	 else
	 {
	 if(count<99)
	 {
		 vchrNo = "VD0" + count;
	 }
	 else
	{
		 vchrNo = "VD" + count;
	}
	 }
	 Deposit deposit=new Deposit();
	 deposit.setTxtdepoVchrNo(vchrNo);
	return deposit;
	}

@Override
public int delete(String voucherNo) {
String st="InActive";
String account_No="",type="";
String journal_Id = "";
int j=0;
int k=0;
String desc=jdbcTemplate.queryForObject("Select description from bank_transaction where voucher_No='"+voucherNo+"'",String.class);

String journalId=jdbcTemplate.queryForObject("select journal_Id from journal_header where refrence='"+voucherNo+"'",String.class);		


String  sql1 = "select totalCredit from journal_header where refrence = '"+voucherNo+"' "; 
String depoamount = jdbcTemplate.queryForObject(sql1,String.class);
//System.out.println("depoAmount="+depoamount);

String  sql2 = "select from_Account from bank_transaction where voucher_No = '"+voucherNo+"' "; 
String depofromacc = jdbcTemplate.queryForObject(sql2,String.class);
//System.out.println("depoFrm Acc="+depofromacc);

String  sql3 = "select to_Account from bank_transaction where voucher_No = '"+voucherNo+"' "; 
String depotoacc = jdbcTemplate.queryForObject(sql3,String.class);
//System.out.println("depoTo Acc="+depotoacc);

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
String urlj="insert into journal_header value('"+journal_Id+"','Deposit','"+voucherNo+"','"+dt+"','R','"+desc+"','2','"+depoamount+"','"+depoamount+"')";
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
 String urlLine1="insert into journal_details value('"+x+"','"+journal_Id+"','"+account_No+"','"+type+"','"+depoamount+"')";
	 jdbcTemplate.update(urlLine1);
	 
	 
	 
	 if(x==1)
	 {

	String sql4 = "update accounts_chart set opeinig_Balance = opeinig_Balance + '"+depoamount+"' where account_No = '"+depofromacc+"' ";
	//System.out.println(sql4);
	 j=jdbcTemplate.update(sql4);
	 
	String sql5 = "update accounts_chart set opeinig_Balance = opeinig_Balance - '"+depoamount+"' where account_No = '"+depotoacc+"' ";
	//System.out.println(sql5);
	 k=jdbcTemplate.update(sql5);
	
	 }
	 x++;
}

String sql0="update bank_transaction set status='"+st+"' where voucher_No='"+voucherNo+"'";
int i=jdbcTemplate.update(sql0);
	
	
	
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
	String url1="select account_No,type from journal_details where journal_Id='"+journalId+"'";
	final List<JournalDetails> jList=getJdbcTemplate().query(url1, new RowMapper<JournalDetails>()
		{
		List<JournalDetails> jDList=new ArrayList<JournalDetails>();
			@Override
			public JournalDetails mapRow(ResultSet rs, int arg1)throws SQLException 
			{
				JournalDetails journalDetails=new JournalDetails();
				journalDetails.setAccno(rs.getString("account_No"));
				journalDetails.setTxtType(rs.getString("type"));
				jDList.add(journalDetails);
				return journalDetails;
			}
		
			});
	return jList;		
}
@Override
public List<CompanyDetails> getInfo(CompanyDetails companyDetails) {
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


}


}


