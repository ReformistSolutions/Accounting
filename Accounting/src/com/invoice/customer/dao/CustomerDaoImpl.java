package com.invoice.customer.dao;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCountCallbackHandler;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.invoice.customer.beans.Customer;
import com.invoice.customer.beans.CustomerDetails;

@Component(value="customerDao")
public class CustomerDaoImpl implements customerDao{
	
	private static String sql,sql1;	
	private JdbcTemplate jdbcTemplate;
	
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	@Autowired
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	public int save(Customer customer) {		
		 int i2=0;		 
		 String customer_Status="Active";
		 java.sql.Timestamp effDate=new java.sql.Timestamp(new java.util.Date().getTime());		
		 try{
		 	//String accountId = "";
		 	String sq = "select max(account_No)as acno from accounts_chart" ;
		 	int accountNo = jdbcTemplate.queryForInt(sq);
		 	accountNo++; 
		 	/*RowCountCallbackHandler countCallback = new RowCountCallbackHandler(); // not reusable
			 jdbcTemplate.query("select * from accounts_chart", countCallback);
			 int count = countCallback.getRowCount();
			 count++;
			 if(count<10)
			 	{
				 	accountId="10"+count;
			 	}
			 else
			 	{
				 if(count <= 99)
				  	{					 
					 	accountId = "1" + count;
				  	}
				 else
				 	{
					 	accountId = "" + count;
 				 	}
			 	}*/
		 String url="insert into customer_header value('"+customer.getTxtCustID()+"','"+accountNo+"','"+customer.getTxtCustName()+"','"+customer.getSlctRegion()+"','"+customer.getTxtDate()+"','"+customer.getBillingAddress()+"','"+customer.getBillingcity()+"','"+customer.getBillingstate()+"','"+customer.getBillingcountry()+"','"+customer.getBillingppincode()+"','"+customer.getShippingAddrLine()+"','"+customer.getShippingcity()+"','"+customer.getShippingstate()+"','"+customer.getShippingcountry()+"','"+customer.getShippingpincode()+"','"+customer.getTxtAcNo()+"','"+customer.getTxtBankNm()+"','"+customer.getTxtIfscCode()+"','"+customer.getTxtPanNo()+"','"+customer.getTxtCstNo()+"','"+customer.getTxtVatNo()+"','"+customer.getTxtLbtNo()+"','"+customer.getTxtExcNo()+"','"+customer.getTxtservicetax()+"','"+customer.getTxtMail1()+"','"+customer.getTxtMob()+"','"+customer.getTxtTel()+"','"+customer.getTxtFax()
				 +"','"+customer.getTxtWeb()+"','"+customer_Status+"','"+effDate+"')";
		 int i=jdbcTemplate.update(url); 
		 List<CustomerDetails> cDList=customer.getCustomerDetails();
			for (CustomerDetails cd : cDList)			
			{
				sql1="insert into customer_details value('"+cd.getTxtSrNo()+"','"+customer.getTxtCustID()+"','"+cd.getTxtName()+"','"+cd.getTxtCon()+"','"+cd.getTxtMail()+"','"+cd.getTxtDes()+"')";
				 i2= jdbcTemplate.update(sql1);
			}
			
		String url1="insert into accounts_chart value('"+accountNo+"','"+customer.getTxtCustName()+"','GRS012','0','Active')";
		int i3=jdbcTemplate.update(url1);
		if(i>=1 && i2>=1 && i3>=1)
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
	public List<Customer> show() {
		try{
		sql="select * from customer_header";		
		final List<Customer> customerList=getJdbcTemplate().query(sql, new RowMapper<Customer>() {
		private List<Customer> customerAddList=new ArrayList<Customer>();		
		@Override
		public Customer mapRow(java.sql.ResultSet rs, int rowNo)throws SQLException {
			Customer cust=new Customer();
			cust.setTxtCustID(rs.getString("customer_ID"));
			cust.setTxtCustName(rs.getString("customer_Name"));
			cust.setSlctRegion(rs.getString("region"));
			cust.setStatus(rs.getString("customer_Status"));
			customerAddList.add(cust);
			return cust;			
		}
		});		
		return customerList;
		}catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public List<Customer> editCustomer(String customerID) {
		try{
		sql="select * from vcustomer where customer_ID='"+customerID+"'";		
		return jdbcTemplate.query(sql, new RowMapper<Customer>() {
			List< CustomerDetails> customerDetails =new ArrayList<CustomerDetails>();
			@Override
			public Customer mapRow(ResultSet rs, int arg1) throws SQLException {
				Customer cust=new Customer();
				CustomerDetails custDetails=new CustomerDetails();
				cust.setTxtCustID(rs.getString("customer_ID"));
				cust.setTxtCustName(rs.getString("customer_Name"));
				cust.setSlctRegion(rs.getString("region"));
				cust.setTxtDate(rs.getString("date"));
				cust.setBillingAddress(rs.getString("billing_Address"));
				cust.setBillingcity(rs.getString("billing_City"));
				cust.setBillingstate(rs.getString("billing_State"));
				cust.setBillingcountry(rs.getString("billing_Country"));
				cust.setBillingppincode(rs.getString("billing_Pin"));
				cust.setShippingAddrLine(rs.getString("shipping_Address"));
				cust.setShippingcity(rs.getString("shipping_City"));
				cust.setShippingstate(rs.getString("shipping_State"));
				cust.setShippingcountry(rs.getString("shipping_Country"));
				cust.setShippingpincode(rs.getString("shipping_Pin"));
				cust.setTxtMail1(rs.getString("customer_Email"));
				cust.setTxtMob(rs.getString("customer_Mobile_No"));
				cust.setTxtTel(rs.getString("customer_Telephone_No"));
				cust.setTxtFax(rs.getString("customer_Fax_No"));
				cust.setTxtWeb(rs.getString("customer_Web_Site"));
				cust.setTxtStatus(rs.getString("customer_Status"));
				cust.setTxtAcNo(rs.getString("bank_Account_No"));
				cust.setTxtBankNm(rs.getString("bank_Name"));
				cust.setTxtIfscCode(rs.getString("ifsc_Code"));
				cust.setTxtPanNo(rs.getString("pan_No"));
				cust.setTxtCstNo(rs.getString("cst_code"));
				cust.setTxtVatNo(rs.getString("vat_No"));
				cust.setTxtLbtNo(rs.getString("lbt_No"));
				cust.setTxtExcNo(rs.getString("excise_No"));
				cust.setTxtservicetax(rs.getString("service_Tax_No"));				
				cust.setTxtStatus(rs.getString("customer_Status"));				
				custDetails.setTxtSrNo(rs.getString("sr_No"));				
				custDetails.setTxtName(rs.getString("contact_person_Name"));
				custDetails.setTxtCon(rs.getString("contact_No"));
				custDetails.setTxtMail(rs.getString("email_Id"));	
				custDetails.setTxtDes(rs.getString("designation"));
				customerDetails.add(custDetails);
				cust.setCustomerDetails(customerDetails);
				return cust;
			}
		});
		}catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public List<Customer> view(String customerID) {
		try{
		sql = "select * from vCustomer where customer_ID='"+customerID+"'";
		return jdbcTemplate.query(sql, new RowMapper<Customer>(){
			List<CustomerDetails> customerDetails = new ArrayList<CustomerDetails>();
			public Customer mapRow(ResultSet rs, int rowNo) throws SQLException {
				Customer cust=new Customer();
				CustomerDetails custDetails=new CustomerDetails();				
				cust.setTxtCustID(rs.getString("customer_ID"));
				cust.setTxtCustName(rs.getString("customer_Name"));
				cust.setSlctRegion(rs.getString("region"));
				cust.setTxtDate(rs.getString("date"));
				cust.setBillingAddress(rs.getString("billing_Address"));
				cust.setBillingcity(rs.getString("billing_City"));
				cust.setBillingstate(rs.getString("billing_State"));
				cust.setBillingcountry(rs.getString("billing_Country"));
				cust.setBillingppincode(rs.getString("billing_Pin"));
				cust.setShippingAddrLine(rs.getString("shipping_Address"));
				cust.setShippingcity(rs.getString("shipping_City"));
				cust.setShippingstate(rs.getString("shipping_State"));
				cust.setShippingcountry(rs.getString("shipping_Country"));
				cust.setShippingpincode(rs.getString("shipping_Pin"));
				cust.setTxtMail1(rs.getString("customer_Email"));
				cust.setTxtMob(rs.getString("customer_Mobile_No"));
				cust.setTxtTel(rs.getString("customer_Telephone_No"));
				cust.setTxtFax(rs.getString("customer_Fax_No"));
				cust.setTxtWeb(rs.getString("customer_Web_Site"));
				cust.setTxtStatus(rs.getString("customer_Status"));
				cust.setTxtAcNo(rs.getString("bank_Account_No"));
				cust.setTxtBankNm(rs.getString("bank_Name"));
				cust.setTxtIfscCode(rs.getString("ifsc_Code"));
				cust.setTxtPanNo(rs.getString("pan_No"));
				cust.setTxtCstNo(rs.getString("cst_code"));
				cust.setTxtVatNo(rs.getString("vat_No"));
				cust.setTxtLbtNo(rs.getString("lbt_No"));
				cust.setTxtExcNo(rs.getString("excise_No"));
				cust.setTxtservicetax(rs.getString("service_Tax_No"));								
				custDetails.setTxtSrNo(rs.getString("sr_No"));
				//custDetails.setTxtName(rs.getString("customer_ID"));
				custDetails.setTxtName(rs.getString("contact_person_Name"));
				custDetails.setTxtCon(rs.getString("contact_No"));	
				custDetails.setTxtMail(rs.getString("email_Id"));				
				custDetails.setTxtDes(rs.getString("designation"));
				
				customerDetails.add(custDetails);
				cust.setCustomerDetails(customerDetails);
				return cust;
			}			
		});
		}catch(Exception e)
		{
			return null;
		}
	
	}
	@Override
	public int update(Customer customer) {
		try{		
		int iD=0;
		//sql = "update vendor_header set customer_Name='"+customer.getTxtCustName()+"',"+"region='"+customer.getSlctRegion()+"',"+"date='"+customer.getTxtDate()+"',"+"billing_Address='"+customer.getTxtBillingAdd()+"',"+"billing_City='"+customer.getTxtBillingCity()+"',"+"billing_State='"+customer.getTxtBillingState()+"',"+"billing_Country='"+customer.getTxtBillingCountry()+"',"+"billing_Pin='"+customer.getTxtBillingPinCode()+"',"+"shipping_Address='"+customer.getTxtShippingAdd()+"',"+"shipping_City='"+customer.getTxtShippingCity()+"',"+"shipping_State='"+customer.getTxtShippingState()+"',"+"shipping_Country='"+customer.getTxtShippingCountry()+"',"+"shipping_Pin='"+customer.getTxtShippingPinCode()+"',"+"bank_Account_No='"+customer.getTxtAcNo()+"',"+"bank_Name='"+customer.getTxtBankNm()+"',"+"currency='"+customer.getTxtCurrency()+"',"+"credit_Limit='"+customer.getTxtCreditLimit()+"',"+"ifsc_Code='"+customer.getTxtIfscCode()+"',"+"pan_No='"+customer.getTxtPanNo()+"',"+"cst_code='"+customer.getTxtCstNo()+"',"+"vat_No='"+customer.getTxtVatNo()+"',"+"lbt_No='"+customer.getTxtLbtNo()+"',"+"excise_No='"+customer.getTxtExcNo()+"',"+"service_Tax_No='"+customer.getTxtServiceTaxNo()+"',"+"customer_Email='"+customer.getTxtMail1()+"',"+"customer_Mobile_No='"+customer.getTxtMob()+"',"+"customer_Telephone_No='"+customer.getTxtTel()+"',"+"customer_Fax_No='"+customer.getTxtFax()+"',"+"customer_Web_Site='"+customer.getTxtWeb()+"',"+"customer_Status='"+vStatus+"' where customer_ID='"+customer.getTxtCustID()+"' ";

		sql = "UPDATE customer_header SET customer_Name='"+customer.getTxtCustName()+"',"+"region='"+customer.getSlctRegion()+"',"+"date='"+customer.getTxtDate()+"',"+"billing_Address='"+customer.getBillingAddress()+"',"+"billing_City='"+customer.getBillingcity()+"',"+"billing_State='"+customer.getBillingstate()+"',"+"billing_Country='"+customer.getBillingcountry()+"',"+"billing_Pin='"+customer.getBillingppincode()+"',"+"shipping_Address='"+customer.getShippingAddrLine()+"',"+"shipping_City='"+customer.getShippingcity()+"',"+"shipping_State='"+customer.getShippingstate()+"',"+"shipping_Country='"+customer.getShippingcountry()+"',"+"shipping_Pin='"+customer.getShippingpincode()+"',"+"bank_Account_No='"+customer.getTxtAcNo()+"',"+"bank_Name='"+customer.getTxtBankNm()+"',"+"ifsc_Code='"+customer.getTxtIfscCode()+"',"+"pan_No='"+customer.getTxtPanNo()+"',"+"cst_code='"+customer.getTxtCstNo()+"',"+"vat_No='"+customer.getTxtVatNo()+"',"+"lbt_No='"+customer.getTxtLbtNo()+"',"+"excise_No='"+customer.getTxtExcNo()+"',"+"service_Tax_No='"+customer.getTxtservicetax()+"',"+"customer_Email='"+customer.getTxtMail1()+"',"+"customer_Mobile_No='"+customer.getTxtMob()+"',"+"customer_Telephone_No='"+customer.getTxtTel()+"',"+"customer_Fax_No='"+customer.getTxtFax()+"',"+"customer_Web_Site='"+customer.getTxtWeb()+"' WHERE customer_ID='"+customer.getTxtCustID()+"'";
		
		int i=jdbcTemplate.update(sql);
		String customerID1 = customer.getTxtCustID();
		deleteList(customerID1);
		List<CustomerDetails> cDList=customer.getCustomerDetails();
		for (CustomerDetails cd : cDList)	
		{	
			sql1="insert into customer_details value('"+cd.getTxtSrNo()+"','"+customer.getTxtCustID()+"','"+cd.getTxtName()+"','"+cd.getTxtCon()+"','"+cd.getTxtMail()+"','"+cd.getTxtDes()+"')";	   
			iD= jdbcTemplate.update(sql1);			
		}		
		String acNo = jdbcTemplate.queryForObject("select account_No from customer_header where customer_ID ='"+customer.getTxtCustID()+"'", String.class);
		String acName = "update accounts_chart set account_Name = '"+customer.getTxtCustName()+"' where account_No = '"+acNo+"' ";
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
			System.out.println(e);
			return 0;
		}
	}
	private void deleteList(String customerID1) {
		String deleteListUrl="DELETE FROM customer_details WHERE customer_ID= '"+customerID1+"'";
		jdbcTemplate.update(deleteListUrl);
	}
	@Override
	public Customer generateId() {
		try{
		String custId="";
		RowCountCallbackHandler countCallback = new RowCountCallbackHandler();  // not reusable
		 jdbcTemplate.query("select * from customer_header", countCallback);
		 int count = countCallback.getRowCount();
		 count++;
		 if(count<10)
		 {
			 custId="CST00"+count;
		 }
		 else
		 {
		 if(count<99)
		 {
			 custId = "CST0" + count;
		 }
		 else
		{
			 custId = "CST" + count;
		}
		 }
		 Customer customer=new Customer();
		 customer.setTxtCustID(custId);
		return customer;
		}catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public int deleteCustomer(String custId) {
		try{
		sql = "UPDATE customer_header SET customer_Status='Inactive' WHERE customer_ID='"+custId+"'";		
		int i=jdbcTemplate.update(sql);
		return i;
		}catch(Exception e)
		{
			return 0;
		}
	}
	@Override
	public int inactiveCustomer(String custId) 
	{
		try{
			sql = "UPDATE customer_header SET customer_Status='Active' WHERE customer_ID='"+custId+"'";		
			int i=jdbcTemplate.update(sql);
			return i;
			}catch(Exception e)
			{
				return 0;
			}
	}
	
}
		
	

		
		
	


