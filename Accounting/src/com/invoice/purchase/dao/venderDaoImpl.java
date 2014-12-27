package com.invoice.purchase.dao;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCountCallbackHandler;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;
import com.invoice.purchase.beans.Vender;
import com.invoice.purchase.beans.VenderDetails;

@Component("venderDao")
public class venderDaoImpl implements venderDao{

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
	public List<Vender> shwoDao() {
		try{
		sql = "select * from vendor_header" ;
		final List<Vender> venderList=getJdbcTemplate().query(sql, new RowMapper<Vender>(){
			private List<Vender> vList = new ArrayList<Vender>();	
			public Vender mapRow(ResultSet rs, int rowNo) throws SQLException {
				
				Vender vender = new Vender();
				vender.setTxtCustID(rs.getString("vender_ID"));
				vender.setTxtCustName(rs.getString("vender_Name"));
				vender.setSlctRegion(rs.getString("region")); 
				vender.setStatus(rs.getString("vender_Status"));
				vList.add(vender);
				return vender;
			}
		}); 
		return venderList;
		}catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public int saveVender(Vender vender) 
	{
		int iD=0,i=0,i3=0;
		String status = "Active";
		try{
			String sq = "select max(account_No)as acno from accounts_chart" ;
		 	int accountNo = jdbcTemplate.queryForInt(sq);
		 	accountNo++; 
		 	
			/*String accountId="";
			RowCountCallbackHandler countCallback = new RowCountCallbackHandler(); // not reusable
			 jdbcTemplate.query("select * from accounts_chart", countCallback);
			 int count = countCallback.getRowCount();
			 System.out.println("before count ++ ="+count); 
			 count++;
			System.out.println("Count="+count);
			 if(count<10)
			 	{
				 	accountId="10"+count;
			 	}
			 else
			 	{
				 if(count<99)
				  	{
					 	accountId = "1" + count;
				  	}
				 else
				 	{
					 	accountId = "" + count;
 				 	}
			 	}*/
		sql = "insert into vendor_header value('"+vender.getTxtCustID()+"','"+vender.getTxtCustName()+"','"+accountNo+"','"+vender.getSlctRegion()+"','"+vender.getTxtDate()+"','"+vender.getTxtBillingAdd()+"','"+vender.getTxtBillingCity()+"','"+vender.getTxtBillingState()+"','"+vender.getTxtBillingCountry()+"','"+vender.getTxtBillingPinCode()+"','"+vender.getTxtShippingAdd()+"','"+vender.getTxtShippingCity()+"','"+vender.getTxtShippingState()+"','"+vender.getTxtShippingCountry()+"','"+vender.getTxtShippingPinCode()+"','"+vender.getTxtAcNo()+"','"+vender.getTxtBankNm()+"','"+vender.getTxtIfscCode()+"','"+vender.getTxtPanNo()+"','"+vender.getTxtCstNo()+"','"+vender.getTxtVatNo()+"','"+vender.getTxtLbtNo()+"','"+vender.getTxtExcNo()+"','"+vender.getTxtServiceTaxNo()+"','"+vender.getTxtMail1()+"','"+vender.getTxtMob()+"','"+vender.getTxtTel()+"','"+vender.getTxtFax()+"','"+vender.getTxtWeb()+"','"+status+"')";
		i=jdbcTemplate.update(sql);
		List<VenderDetails> venderList=vender.getVenderDetails();
		for(VenderDetails dList : venderList)
		{
			String sql1="insert into vender_details value('"+dList.getTxtSrNo()+"','"+vender.getTxtCustID()+"','"+dList.getTxtName()+"','"+dList.getTxtCon()+"','"+dList.getTxtMail()+"','"+dList.getTxtDes()+"')";
			 iD= jdbcTemplate.update(sql1);
		}	
		
		String url1="insert into accounts_chart value('"+accountNo+"','"+vender.getTxtCustName()+"','GRS011','0','Active')";
		i3=jdbcTemplate.update(url1);		
		 if(i>0 && iD>0 && i3>0)
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
	public Vender auto() {
		try{
		String venderId="";
		RowCountCallbackHandler countCallback = new RowCountCallbackHandler();  // not reusable
		 jdbcTemplate.query("select * from vendor_header", countCallback);
		 int count = countCallback.getRowCount();
		 count++;
		 
		 if(count<10)
		 {
		 venderId="VND00"+count;
		 }
		 else
		 {
		 if(count<99)
		 {
		 venderId = "VND0" + count;
		 }
		 else
		{
		venderId = "VND" + count;
		}
		 }
		 Vender vender=new Vender();
		 vender.setTxtCustID(venderId);
		return vender;
		}catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public List<Vender> viewVender(String venderId) {
		try{
		sql = "select * from vvenders where vender_ID='"+venderId+"' " ;
		return jdbcTemplate.query(sql, new RowMapper<Vender>(){ 
			List<VenderDetails> detailList = new ArrayList<VenderDetails>();
			@Override
			public Vender mapRow(ResultSet rs, int rowNo) throws SQLException 
			{				
				Vender vender = new Vender();
				VenderDetails dList = new VenderDetails();
				vender.setTxtCustID(rs.getString("vender_ID"));
				vender.setTxtCustName(rs.getString("vender_Name"));
				vender.setSlctRegion(rs.getString("region"));
				vender.setTxtDate(rs.getString("date"));
				vender.setTxtBillingAdd(rs.getString("billing_Address"));
				vender.setTxtBillingCity(rs.getString("billing_City"));
				vender.setTxtBillingCountry(rs.getString("billing_Country"));
				vender.setTxtBillingState(rs.getString("billing_State"));
				vender.setTxtBillingPinCode(rs.getInt("billing_Pin"));
				vender.setTxtShippingAdd(rs.getString("shipping_Address"));
				vender.setTxtShippingCity(rs.getString("shipping_City"));
				vender.setTxtShippingState(rs.getString("shipping_State"));
				vender.setTxtShippingCountry(rs.getString("shipping_Country"));
				vender.setTxtShippingPinCode(rs.getInt("shipping_Pin"));
				vender.setTxtMail1(rs.getString("vender_Email"));
				vender.setTxtMob(rs.getString("vender_Mobile_No"));
				vender.setTxtTel(rs.getString("vender_Telephone_No"));
				vender.setTxtFax(rs.getString("vender_Fax_No"));
				vender.setTxtWeb(rs.getString("vender_Web_Site"));
				vender.setTxtAcNo(rs.getString("bank_Account_No"));
				vender.setTxtBankNm(rs.getString("bank_Name"));
				/*vender.setTxtCurrency(rs.getString("currency"));
				vender.setTxtCreditLimit(rs.getInt("credit_Limit"));*/
				vender.setTxtIfscCode(rs.getString("ifsc_Code"));
				vender.setTxtPanNo(rs.getString("pan_No"));
				vender.setTxtCstNo(rs.getString("cst_code"));
				vender.setTxtVatNo(rs.getString("vat_No"));
				vender.setTxtLbtNo(rs.getString("lbt_No"));
				vender.setTxtExcNo(rs.getString("excise_No"));
				vender.setTxtServiceTaxNo(rs.getString("service_Tax_No"));
				
				dList.setTxtSrNo(rs.getInt("sr_No")); 
				dList.setTxtName(rs.getString("person_Name"));
				dList.setTxtCon(rs.getString("contactNo"));
				dList.setTxtMail(rs.getString("email_Id"));
				dList.setTxtDes(rs.getString("designation"));
				
				detailList.add(dList);
				vender.setVenderDetails(detailList);
				
				return vender;
			}			
		});
		}catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public int updateVender(Vender vender) {
		
		int iD=0;
		String vStatus="Active";
		try{
		sql = "update vendor_header set vender_Name='"+vender.getTxtCustName()+"',"+"region='"+vender.getSlctRegion()+"',"+"date='"+vender.getTxtDate()+"',"+"billing_Address='"+vender.getTxtBillingAdd()+"',"+"billing_City='"+vender.getTxtBillingCity()+"',"+"billing_State='"+vender.getTxtBillingState()+"',"+"billing_Country='"+vender.getTxtBillingCountry()+"',"+"billing_Pin='"+vender.getTxtBillingPinCode()+"',"+"shipping_Address='"+vender.getTxtShippingAdd()+"',"+"shipping_City='"+vender.getTxtShippingCity()+"',"+"shipping_State='"+vender.getTxtShippingState()+"',"+"shipping_Country='"+vender.getTxtShippingCountry()+"',"+"shipping_Pin='"+vender.getTxtShippingPinCode()+"',"+"bank_Account_No='"+vender.getTxtAcNo()+"',"+"bank_Name='"+vender.getTxtBankNm()+"',"+"ifsc_Code='"+vender.getTxtIfscCode()+"',"+"pan_No='"+vender.getTxtPanNo()+"',"+"cst_code='"+vender.getTxtCstNo()+"',"+"vat_No='"+vender.getTxtVatNo()+"',"+"lbt_No='"+vender.getTxtLbtNo()+"',"+"excise_No='"+vender.getTxtExcNo()+"',"+"service_Tax_No='"+vender.getTxtServiceTaxNo()+"',"+"vender_Email='"+vender.getTxtMail1()+"',"+"vender_Mobile_No='"+vender.getTxtMob()+"',"+"vender_Telephone_No='"+vender.getTxtTel()+"',"+"vender_Fax_No='"+vender.getTxtFax()+"',"+"vender_Web_Site='"+vender.getTxtWeb()+"',"+"vender_Status='"+vStatus+"' where vender_ID='"+vender.getTxtCustID()+"' ";
		int i=jdbcTemplate.update(sql);			
				
		String venderId = vender.getTxtCustID();
		deleteList(venderId);
		List<VenderDetails> venderList=vender.getVenderDetails();
		for(VenderDetails dList : venderList)
		{
			String sql1="insert into vender_details value('"+dList.getTxtSrNo()+"','"+vender.getTxtCustID()+"','"+dList.getTxtName()+"','"+dList.getTxtCon()+"','"+dList.getTxtMail()+"','"+dList.getTxtDes()+"')";
			 iD= jdbcTemplate.update(sql1);
		}
				 
		String acNo = jdbcTemplate.queryForObject("select account_No from vendor_header where vender_ID ='"+vender.getTxtCustID()+"'", String.class);
		String acName = "update accounts_chart set account_Name = '"+vender.getTxtCustName()+"' where account_No = '"+acNo+"' ";
		int j=jdbcTemplate.update(acName);
		
		if(i>=1 && iD>=1 && j>=1)
	    {
			return 1; 
	    }
	    else
	    {
    	   return 0;
	    }
		}catch(Exception e)
		{
			return 0;
		}
	}
	private void deleteList(String venderId) 
	{
		String deleteListUrl="DELETE FROM vender_details WHERE vender_ID='"+venderId+"' ";
		jdbcTemplate.update(deleteListUrl);
	}
	@Override
	public int delete(String venderId) {
		try{
		String st = "InActive";
		sql = "update vendor_header set vender_Status = '"+st+"' where vender_ID='"+venderId+"'";	
		return jdbcTemplate.update(sql);
		}catch(Exception e)
		{
			return 0;
		}
	}
	@Override
	public int activeDelete(String venderId) 
	{
		try{
			String st = "Active";
			sql = "update vendor_header set vender_Status = '"+st+"' where vender_ID='"+venderId+"'";	
			return jdbcTemplate.update(sql);
			}catch(Exception e)
			{
				return 0;
			}
	}
}
