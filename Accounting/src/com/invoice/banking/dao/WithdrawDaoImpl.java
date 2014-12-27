
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
import com.invoice.accounting.beans.NewAccount;


import com.invoice.banking.beans.Withdraw;
import com.invoice.company.beans.CompanyDetails;

@Component(value="withdrawDao")
public class WithdrawDaoImpl implements WithdrawDao{
	
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
public int save(Withdraw withdraw,JournalHeader journalHeader) {
	
	String Status="Active";
	String source="Withdraw";
	int iD,iD1=0;
	String type="D";
	String type1="C";
	int srNo=1;
	int srNo1 = 2;
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
	String sql="insert into bank_transaction value('"+withdraw.getTxtwithVchrNo()+"','"+withdraw.getTxtwithdate()+"','"+withdraw.getTxtwithTransType()+"','"+withdraw.getTxtwithFrmAccnt()+"','"+withdraw.getTxtwithToAccnt()+"','"+withdraw.getTxtwithAmount()+"','"+withdraw.getTxtwithDesc()+"','"+Status+"')";
	int i=jdbcTemplate.update(sql);
	
	String updatebank="update accounts_chart set opeinig_Balance=opeinig_Balance-'"+withdraw.getTxtwithAmount()+"' where account_No='"+withdraw.getTxtwithFrmAccnt()+"'";
	int j=jdbcTemplate.update(updatebank);
	
	String updatebank1="update accounts_chart set opeinig_Balance=opeinig_Balance+'"+withdraw.getTxtwithAmount()+"' where account_No='"+withdraw.getTxtwithToAccnt()+"'";
    int k=jdbcTemplate.update(updatebank1);
    
    String sql1="insert into journal_header values('"+journal_Id+"','"+source+"','"+withdraw.getTxtwithVchrNo()+"','"+withdraw.getTxtwithdate()+"','V','"+withdraw.getTxtwithDesc()+"','2','"+withdraw.getTxtwithAmount()+"','"+withdraw.getTxtwithAmount()+"')"; 
	int l=jdbcTemplate.update(sql1);
	
	JournalDetails journalDetails=new JournalDetails();
	
	journalDetails.setTxtSrNo(srNo);
	journalDetails.setTxtAccountName(journal_Id);
	journalDetails.setAccno(withdraw.getTxtwithFrmAccnt());
	journalDetails.setTxtType(type);
	journalDetails.setTxtAmount(withdraw.getTxtwithAmount());
    
	
	String sqlUpdate="insert into journal_details(sr_No,journal_Id,account_No,type,amount) value('"+journalDetails.getTxtSrNo()+"','"+journalDetails.getTxtAccountName()+"','"+journalDetails.getAccno()+"','"+journalDetails.getTxtType()+"','"+journalDetails.getTxtAmount()+"')";
	
	
	iD= jdbcTemplate.update(sqlUpdate);
	
	JournalDetails journalDetails1=new JournalDetails();
	journalDetails1.setTxtSrNo(srNo1);
	journalDetails1.setTxtAccountName(journal_Id);
	journalDetails1.setAccno(withdraw.getTxtwithToAccnt());
	journalDetails1.setTxtType(type1);
	journalDetails1.setTxtAmount(withdraw.getTxtwithAmount());
	
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
public List<Withdraw> show() {
	String sql="select * from vbanktransaction where voucher_No LIKE 'vw%' AND status='Active'";
	final List<Withdraw> withdrawList=getJdbcTemplate().query(sql, new RowMapper<Withdraw>() {
		private List<Withdraw> withList=new ArrayList<Withdraw>();
		public Withdraw mapRow(ResultSet rs,int rowNo)throws SQLException
		{
			Withdraw withdraw=new Withdraw();
			withdraw.setTxtwithVchrNo(rs.getString("voucher_No"));
			withdraw.setTxtwithdate(rs.getString("transaction_date"));
			withdraw.setTxtwithFrmAccnt(rs.getString("from_Account"));
			withdraw.setTxtwithToAccnt(rs.getString("to_Account"));
			withdraw.setTxtwithAmount(rs.getFloat("amount"));
			
			
			withList.add(withdraw);
			return withdraw;
		}	
	});		
		return withdrawList;
	}

@Override
public List<Withdraw> editWithdraw(String voucherNo) {
	String sql="select * from vbanktransaction where voucher_No='"+voucherNo+"'";
	
	return jdbcTemplate.query(sql, new RowMapper<Withdraw>() {
		
		@Override
		public Withdraw mapRow(ResultSet rs, int arg1) throws SQLException {
			Withdraw withdraw=new Withdraw();
			
			withdraw.setTxtwithVchrNo(rs.getString("voucher_No"));
			withdraw.setTxtwithdate(rs.getString("transaction_Date"));
			withdraw.setTxtwithTransType(rs.getString("transaction_Type"));
			withdraw.setTxtwithFrmAccnt(rs.getString("from_Account"));
			withdraw.setTxtwithToAccnt(rs.getString("to_Account"));
			withdraw.setTxtwithAmount(rs.getFloat("amount"));
			withdraw.setTxtwithDesc(rs.getString("description"));
			withdraw.setFromAccountNo(rs.getString("fromAcNo"));
			withdraw.setToAccountNo(rs.getString("toAcNo"));
			
			
			
			
			
			return withdraw;
		}
	});
}
@Override
public int updateWithdraw(Withdraw withdraw) {
	
	
	String sql="update bank_transaction set transaction_Date='"+withdraw.getTxtwithdate()+"',"+"transaction_Type='"+withdraw.getTxtwithTransType()+"',"+"from_Account='"+withdraw.getTxtwithFrmAccnt()+"',"+"to_Account='"+withdraw.getTxtwithToAccnt()+"',"+"amount='"+withdraw.getTxtwithAmount()+"',"+"description='"+withdraw.getTxtwithDesc()+"' where voucher_No='"+withdraw.getTxtwithVchrNo()+"' ";
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
public Withdraw autoId() {
	
	String vchrNo="";
	RowCountCallbackHandler countCallback = new RowCountCallbackHandler();  // not reusable
	 jdbcTemplate.query("select * from bank_transaction", countCallback);
	 int count = countCallback.getRowCount();
	 count++;
	 //System.out.println("Count="+count);
	 if(count<10)
	 {
		 vchrNo="VW00"+count;
	 }
	 else
	 {
	 if(count<99)
	 {
		 vchrNo = "VW0" + count;
	 }
	 else
	{
		 vchrNo = "VW" + count;
	}
	 }
	 Withdraw withdraw=new Withdraw();
	 withdraw.setTxtwithVchrNo(vchrNo);
	return withdraw;
	}
@Override
public List<NewAccount> retriveAccountNos() {
	String sql="select * from accounts_chart";		
	final List<NewAccount> accList=getJdbcTemplate().query(sql, new RowMapper<NewAccount>() {
	private List<NewAccount> accountList=new ArrayList<NewAccount>();
	public NewAccount mapRow(ResultSet rs,int rowNo)throws SQLException
	{
		NewAccount newAcc=new NewAccount();
		
		newAcc.setTxtNewAccNo(rs.getInt("account_No"));
		newAcc.setTxtAccountName(rs.getString("account_Name"));			
		accountList.add(newAcc);
		return newAcc;
	}	
	
});		
	return accList;


}
@Override
public int delete(String voucherNo) {
	String st="InActive";
	String account_No="",type="";
	String journal_Id = "";
	int j=0;
	int k=0;
	String desc=jdbcTemplate.queryForObject("Select description from bank_transaction where voucher_No='"+voucherNo+"'",String.class);
	String  sql = "select totalDebit from journal_header where refrence = '"+voucherNo+"' "; 
	String amount = jdbcTemplate.queryForObject(sql,String.class);
	String journalId=jdbcTemplate.queryForObject("select journal_Id from journal_header where refrence='"+voucherNo+"'",String.class);		
	//System.out.println("Amount="+amount);
	
	 String  sql2 = "select from_Account from bank_transaction where voucher_No = '"+voucherNo+"' "; 
		String fromacc = jdbcTemplate.queryForObject(sql2,String.class);
		//System.out.println("Frm Acc="+fromacc);
		
		String  sql3 = "select to_Account from bank_transaction where voucher_No = '"+voucherNo+"' "; 
		String toacc = jdbcTemplate.queryForObject(sql3,String.class);
		//System.out.println("To Acc="+toacc);
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
	String urlj="insert into journal_header value('"+journal_Id+"','Withdraw','"+voucherNo+"','"+dt+"','R','"+desc+"','2','"+amount+"','"+amount+"')";
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
	 String urlLine1="insert into journal_details value('"+x+"','"+journal_Id+"','"+account_No+"','"+type+"','"+amount+"')";
		 jdbcTemplate.update(urlLine1);
		 
		 
		 
		 if(x==1)
		 {
						String sql4 = "update accounts_chart set opeinig_Balance = opeinig_Balance + '"+amount+"' where account_No = '"+fromacc+"' ";
						//System.out.println(sql4);
						 j=jdbcTemplate.update(sql4);
						
						String sql5 = "update accounts_chart set opeinig_Balance = opeinig_Balance - '"+amount+"' where account_No = '"+toacc+"' ";
						//System.out.println(sql5);
						 k=jdbcTemplate.update(sql5);		
	
						
		 }
		 x++;
}
	
	String sql1="update bank_transaction set status='"+st+"' where voucher_No='"+voucherNo+"'";
	int i=jdbcTemplate.update(sql1);

	
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
