package com.invoice.sales.dao;

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
import com.invoice.inventory.beans.CreateNewProduct;
import com.invoice.sales.beans.DeliveryChallan;
import com.invoice.sales.beans.DeliveryChallanDetails;
import com.invoice.sales.beans.Invoice;



@Component(value="deliveryChallanDao")
public class DeliveryChallanDaoImpl implements DeliveryChallanDao{

	private JdbcTemplate jdbcTemplate;
		
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	@Autowired
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}


	@Override
	public int save(DeliveryChallan deliveryChallan) {
		 int iD=0,i1=0;			
		 String status="Active";
		 try{
		 System.out.println(deliveryChallan.getChType());
		 String url="insert into delivery_challan_header value('"+deliveryChallan.getChallanID()+"','"+deliveryChallan.getInvoiceID()+"','"+deliveryChallan.getChType()+"','"+deliveryChallan.getDate()+"','"+deliveryChallan.getCustomerName()+"','"+deliveryChallan.getBillingAdd()+"','"+deliveryChallan.getCreatedBy()+"','"+deliveryChallan.getCreatedBy()+"','"+status+"')";
		 int i=jdbcTemplate.update(url); 
		 List<DeliveryChallanDetails> chDetailsList=deliveryChallan.getDeliveryChallandetails();
		 for (DeliveryChallanDetails deChDet : chDetailsList)			
		{		
			String sql1="insert into delivery_challan_details value('"+deChDet.getSrNo()+"','"+deliveryChallan.getChallanID()+"','"+deChDet.getItemCode()+"','"+deChDet.getQuantity()+"')";
			iD= jdbcTemplate.update(sql1);
			String updateProductUrl="UPDATE product_master SET opening_Stock=opening_Stock-'"+deChDet.getQuantity()+"' where product_Id='"+deChDet.getItemCode()+"'";
			i1= jdbcTemplate.update(updateProductUrl);
		}
		 
       
	if(i>=1 && iD>=1 && i1>=1)
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
	@Override
	public List<DeliveryChallan> show() {
		try{
		String sql="select * from vdeliverychallan where status='Active' group by deli_Ch_Id";		
		final List<DeliveryChallan> challanList=getJdbcTemplate().query(sql, new RowMapper<DeliveryChallan>() {
		private List<DeliveryChallan> challenList=new ArrayList<DeliveryChallan>();
		public DeliveryChallan mapRow(ResultSet rs,int rowNo)throws SQLException
		{
			DeliveryChallan deliCh=new DeliveryChallan();
			deliCh.setChallanID(rs.getString("deli_Ch_Id"));
			deliCh.setInvoiceID(rs.getString("invoice_Id"));
			deliCh.setDate(rs.getString("deli_Ch_Date"));
			deliCh.setChType(rs.getString("challanType"));
			challenList.add(deliCh);
			return deliCh;
		}	
	});		
		return challanList;
	}
		catch(Exception e)
		{
			return null;
		}
}
	@Override
	public List<DeliveryChallan> editChallan(String challanId) {
		try{
		String sql="select * from vdeliverychallan where deli_Ch_Id='"+challanId+"' group by deli_Ch_Sr_No";		
		return jdbcTemplate.query(sql, new RowMapper<DeliveryChallan>() {
			List<DeliveryChallanDetails> challanDetails =new ArrayList<DeliveryChallanDetails>();
			@Override
			public DeliveryChallan mapRow(ResultSet rs, int arg1) throws SQLException {
				DeliveryChallan deliChallan=new DeliveryChallan();
				DeliveryChallanDetails deliChallanDet=new DeliveryChallanDetails();
				deliChallan.setChallanID(rs.getString("deli_Ch_Id"));
				deliChallan.setInvoiceID(rs.getString("invoice_Id"));
				deliChallan.setChType(rs.getString("challanType"));
				deliChallan.setDate(rs.getString("deli_Ch_Date"));
				deliChallan.setCustomerName(rs.getString("customer_Name"));
				deliChallan.setBillingAdd(rs.getString("billing_Address"));
				deliChallanDet.setSrNo(rs.getInt("deli_Ch_Sr_No"));
				deliChallanDet.setProdID(rs.getString("product_Id"));
				deliChallanDet.setItemCode(rs.getString("prod_Name"));				
				deliChallanDet.setQuantity(rs.getInt("deli_Ch_Quantity"));
				deliChallanDet.setUnit(rs.getString("unit_Of_Measure"));
				deliChallan.setCustId(rs.getString("customer_ID"));
				deliChallan.setCustVatNo(rs.getString("vat_No"));
				challanDetails.add(deliChallanDet);
				deliChallan.setDeliveryChallandetails(challanDetails);
				return deliChallan;
			}
		});

	}catch(Exception e)
	{
		return null;
	}
	}
	@Override
	public int updateChallan(DeliveryChallan deliveryChallan) {		
		int iD=0,i1=0,i2=0;
		//java.sql.Timestamp updateDate=new java.sql.Timestamp(new java.util.Date().getTime());
		try{
		String updateEnqHeaderUrl="UPDATE delivery_challan_header SET billing_Address='"+deliveryChallan.getBillingAdd()+"',"+" updated_By='"+deliveryChallan.getUpdatedBy()+"' WHERE deli_Ch_Id='"+deliveryChallan.getChallanID()+"'";
		int i=jdbcTemplate.update(updateEnqHeaderUrl);
		
		for (DeliveryChallanDetails pList : (getProductQuantity(deliveryChallan.getChallanID())))
		{
			String prodcutCode=pList.getProdID();
			int qty=pList.getQuantity(); 
			String updateProductUrl="UPDATE product_master SET opening_Stock=opening_Stock+'"+qty+"' where product_Id='"+prodcutCode+"'";
			i1= jdbcTemplate.update(updateProductUrl);
		}
		
		deleteList(deliveryChallan.getChallanID());		
		List<DeliveryChallanDetails> eDList=deliveryChallan.getDeliveryChallandetails();
		for (DeliveryChallanDetails ed : eDList)			
		{
			
			String sql1="insert into delivery_challan_details value('"+ed.getSrNo()+"','"+deliveryChallan.getChallanID()+"','"+ed.getItemCode()+"','"+ed.getQuantity()+"')";
			iD= jdbcTemplate.update(sql1);
			String updateProductUrl="UPDATE product_master SET opening_Stock=opening_Stock-'"+ed.getQuantity()+"' where product_Id='"+ed.getItemCode()+"'";
			i2= jdbcTemplate.update(updateProductUrl);
		}
		
		if(i>=1 && iD>=1 && i1>=1 && i2>=1)
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
	
	private void deleteList(String challanId){
		
			String deleteListUrl="DELETE FROM delivery_challan_details WHERE deli_Ch_Id= '"+challanId+"'";
			jdbcTemplate.update(deleteListUrl);
	}
	private List<DeliveryChallanDetails> getProductQuantity(String challanId)
	{
		try{
			String sql="select product_Id,deli_Ch_Quantity from vdeliverychallan where deli_Ch_Id='"+challanId+"'";		
			final List<DeliveryChallanDetails> deliProdList=getJdbcTemplate().query(sql, new RowMapper<DeliveryChallanDetails>() {
			private List<DeliveryChallanDetails> deliveryPList=new ArrayList<DeliveryChallanDetails>();
			public DeliveryChallanDetails mapRow(ResultSet rs,int rowNo)throws SQLException
			{
				DeliveryChallanDetails deliveryChallanDetails=new DeliveryChallanDetails();
				deliveryChallanDetails.setProdID(rs.getString("product_Id"));
				deliveryChallanDetails.setQuantity(rs.getInt("deli_Ch_Quantity"));			
				deliveryPList.add(deliveryChallanDetails);
				return deliveryChallanDetails;
			}	
			});		
			return deliProdList;
			}catch(Exception e)
			{
				System.out.println(e);
				return null;
			}
	}
	@Override
	public List<CreateNewProduct> retriveProductList() {
		try{
		String sql="select * from product_master where prod_Type='Resale Product' or prod_Type='Sale Item' and status='Active' ";		
		final List<CreateNewProduct> deliProdList=getJdbcTemplate().query(sql, new RowMapper<CreateNewProduct>() {
		private List<CreateNewProduct> deliveryList=new ArrayList<CreateNewProduct>();
		public CreateNewProduct mapRow(ResultSet rs,int rowNo)throws SQLException
		{
			CreateNewProduct createNewProduct=new CreateNewProduct();
			createNewProduct.setProductId(rs.getString("product_Id"));
			createNewProduct.setTxtName(rs.getString("prod_Name"));			
			deliveryList.add(createNewProduct);
			return createNewProduct;
		}	
		});		
		return deliProdList;
		}catch(Exception e)
		{
			return null;
		}
	}

	@Override
	public List<Customer> retriveCustomerList() {
		try{
		String sql="select customer_ID,customer_Name from customer_header where customer_Status='Active' order by customer_Name ASC";		
		final List<Customer> custList=getJdbcTemplate().query(sql, new RowMapper<Customer>() {
		private List<Customer> customerList=new ArrayList<Customer>();
		public Customer mapRow(ResultSet rs,int rowNo)throws SQLException
		{
			Customer customer=new Customer();
			customer.setTxtCustID(rs.getString("customer_ID"));
			customer.setTxtCustName(rs.getString("customer_Name"));			
			customerList.add(customer);
			return customer;
		}	
		});		
		return custList;
		}catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public DeliveryChallan generateChId() {
		String chlId="";
		try{
		RowCountCallbackHandler countCallback = new RowCountCallbackHandler();  // not reusable
		 jdbcTemplate.query("select * from delivery_challan_header", countCallback);
		 int count = countCallback.getRowCount();
		 count++;		
		 if(count<10)
		 {
			 chlId="DCH00"+count;
		 }
		 else
		 {
			 if(count<99)
			 {
				 chlId = "DCH0" + count;
			 }
			 else
				{
				 chlId = "DCH" + count;
				}
		 }		
		 DeliveryChallan deliveryChallan=new DeliveryChallan();
		 deliveryChallan.setChallanID(chlId);
		return deliveryChallan;
	}catch(Exception e)
	{
		return null;
	}
	}
	@Override
	public List<Invoice> retriveInvList() {
		try{
		String sql="select sales_Invoice_Id from sales_invoice_header";		
		final List<Invoice> invList=getJdbcTemplate().query(sql, new RowMapper<Invoice>() {
		private List<Invoice> InvoiceList=new ArrayList<Invoice>();
		public Invoice mapRow(ResultSet rs,int rowNo)throws SQLException
		{
			Invoice invoice=new Invoice();
			invoice.setTxtInvID(rs.getString("sales_Invoice_Id"));					
			InvoiceList.add(invoice);
			return invoice;
		}	
	});		
		return invList;
		}catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public int deleteChallan(String challanId) {
		try{
		String status="Inactive";		
		for (DeliveryChallanDetails pList : (getProductQuantity(challanId)))
		{
			String prodcutCode=pList.getProdID();
			int qty=pList.getQuantity(); 
			String updateProductUrl="UPDATE product_master SET opening_Stock=opening_Stock+'"+qty+"' where product_Id='"+prodcutCode+"'";
			jdbcTemplate.update(updateProductUrl);
		}
		
		
		String updateEnqHeaderUrl="UPDATE delivery_challan_header SET status='"+status+"' WHERE deli_Ch_Id='"+challanId+"'";
		int i=jdbcTemplate.update(updateEnqHeaderUrl);
		if(i > 0)
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
	@Override
	public List<Customer> retriveCustInfo(String custId,String id) {
		final String path = "Delivery Challan.pdf";		
		final String id1=id;
		try{
		String sql="select customer_ID,customer_Email,customer_Name from customer_header where customer_ID='"+custId+"'";
		final List<Customer> custInfo=getJdbcTemplate().query(sql, new RowMapper<Customer>() {
		public Customer mapRow(ResultSet rs,int rowNo)throws SQLException
			{
			Customer custoInfo=new Customer();
			custoInfo.setTxtCustID(rs.getString("customer_ID"));
			custoInfo.setTxtMail1(rs.getString("customer_Email"));
			custoInfo.setTxtCustName(rs.getString("customer_Name"));
			custoInfo.setAttachment(path);
			custoInfo.setId(id1);
			custoInfo.setSubject("Sales Delivery Challan");
			String regards=jdbcTemplate.queryForObject("select comp_Name from comp_details",String.class);
			custoInfo.setRegards(regards);	
			custoInfo.setBodyPart("\t New Sales Delivery Challan is Generated For More Details\n Please Find The Attached PDF File.\n\nThank You..");
				return custoInfo;
			}	
		});		
			return custInfo;
	
	}catch(Exception e)
	{
		return null;
	}
	}
}
