package com.invoice.sales.dao;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCountCallbackHandler;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.invoice.accounting.beans.Taxes;
import com.invoice.customer.beans.Customer;
import com.invoice.inventory.beans.CreateNewProduct;
import com.invoice.sales.beans.Details;
import com.invoice.sales.beans.LinkedTaxDetails;
import com.invoice.sales.beans.Order;
import com.invoice.sales.beans.TaxDetailsList;


@Component(value="orderDao")
public class OrderDaoImpl implements OrderDao{


	private JdbcTemplate jdbcTemplate;
	
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	@Autowired
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Override
	public List<Order> show() {
		try{
		String sql="select * from vsalesorder where sales_Order_Status='Active'	group by sales_Order_Id";	//where sales_Order_Status='Active'	
		final List<Order> orderList=getJdbcTemplate().query(sql, new RowMapper<Order>() {
		private List<Order> salesOrderList=new ArrayList<Order>();
		public Order mapRow(ResultSet rs,int rowNo)throws SQLException
		{
			Order order=new Order();
			order.setTxtSOID(rs.getString("sales_Order_Id"));
			order.setTxtCName(rs.getString("customer_Name"));
			DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy"); 
		    String ord_Date=dateFormat.format(rs.getDate("sales_Order_Order_Date"));
			order.setTxtDate(ord_Date);
			order.setTxtAmtPayble(rs.getFloat("sales_Order_Amt_Payable"));
			String ord_Due_Date=dateFormat.format(rs.getDate("sales_Order_Due_Date"));
			order.setTxtDueDate(ord_Due_Date);			
			java.sql.Timestamp effdate=new java.sql.Timestamp(new java.util.Date().getTime());
			String dt=(effdate).toString();
			order.setCurrDate(dt.substring(0,10));
			order.setInvCreated(rs.getString("invoice_Created"));
			order.setOc_status(rs.getString("oc_status"));
			salesOrderList.add(order);
			return order;
		}	
	});		
		return orderList;
		}catch(Exception e)
		{
			System.out.println(e);
			return null;
		}
	}
	@Override
	public int save(Order order) {
		int i1=0,i2=0,i3=0,ipl=0,ip=0;
		String status="Active";	
		String taxId="";
		int disQuantity=0;		
	    java.sql.Timestamp updateDate=new java.sql.Timestamp(new java.util.Date().getTime());
	   try{
	    String url="insert into sales_order_header value('"+order.getTxtSOID()+"','"+order.getTxtCName()+"','"+order.getTxtEstID()+"','"+order.getTxtDate()+"','"+order.getTxtDueDate()+"','"+order.getTxtBillAddr()+"','"+order.getTxtShipAddr()+"','"+order.getTxtCPONo()+"','"+order.getTxtTransCost()+"','"+order.getTxtSubTotal()+"','"+order.getRadio()+"','"+order.getTxtDiscount()+"','"+order.getTxtDisTotal()+"','"+order.getTxtTaxTotal()+"','"+order.getTxtRoundOff()+"','"+order.getTxtAmtPayble()+"','"+order.getTxtpubNotes()+"','"+order.getTxtpvtNotes()+"','"+order.getCreatedBy()+"','"+order.getCreatedBy()+"','"+updateDate+"','"+status+"','No','O')";
		i1=jdbcTemplate.update(url); 
		
		if(order.getApplyTax() != null)
		{
			List<TaxDetailsList> taxList=order.getTaxList();
			taxList.remove(0);			
			for (TaxDetailsList ord_taxList : taxList)			
			{	
				String taxID=ord_taxList.getTaxType();
				taxId=taxID.substring((taxID.indexOf("^"))+1, taxID.length());				
				String sql1="insert into sales_order_tax_details value('"+order.getTxtSOID()+"','"+taxId+"','"+ord_taxList.getTxtTaxValue()+"','"+ord_taxList.getTxtprevLinkTax()+"')";
				i2= jdbcTemplate.update(sql1);
			}		
			List<LinkedTaxDetails> linkedTaxList=order.getLinkedTaxList();
			if(!(linkedTaxList.isEmpty()))
			{
				linkedTaxList.remove(0);		
				for (LinkedTaxDetails linkedTaxDetails : linkedTaxList) 
				{					
					String sql4="insert into sales_order_linked_tax_details value('"+order.getTxtSOID()+"','"+linkedTaxDetails.getmTaxID()+"','"+linkedTaxDetails.getLinkedTaxId()+"','"+linkedTaxDetails.getSerLinkedTax()+"')";
					ip= jdbcTemplate.update(sql4);
				}
			}
		}		
        List<Details> productList=order.getProductList(); 
		for (Details details : productList)			
		{		
			String sql1="insert into sales_order_details value('"+details.getSrNo()+"','"+order.getTxtSOID()+"','"+details.getItemCode()+"','"+details.getQuantity()+"','"+details.getUnitPrice()+"','"+details.getItemTotal()+"','"+disQuantity+"')";
			 i3= jdbcTemplate.update(sql1);
		}
		 if(order.getTxtEstID()!=null)
		 {
			 String urlUpdate="UPDATE sales_est_header SET sales_Order_Creadted='Yes' where sales_Est_Id='"+order.getTxtEstID()+"'";
			ipl = jdbcTemplate.update(urlUpdate);			 
		 }
       
	if(i1>=1 && i3>=1)
       {
		return 1;
      }
	else if(i2>=1)
	{
		return 1;
	}
	else if(ip>=1)
	{
		return 1;
	}
	else if(ipl>=1)
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
	public List<Order> editOrder(String orderId) {
		final String ordId=orderId;
		try{
		String sql="select * from vsalesorder where sales_Order_Id='"+orderId+"' group by sr_No";		
		return jdbcTemplate.query(sql, new RowMapper<Order>() {
			List<Details> orderDetails =new ArrayList<Details>();
			@Override
			public Order mapRow(ResultSet rs, int arg1) throws SQLException {
				Order order=new Order();
				Details ordDetails=new Details();
				order.setTxtSOID(rs.getString("sales_Order_Id"));
				order.setCustId(rs.getString("customer_ID"));
				order.setTxtCName(rs.getString("customer_Name"));
				order.setTxtBillAddr(rs.getString("bill_To"));
				order.setTxtShipAddr(rs.getString("ship_To"));				
				order.setCustVatNo(rs.getString("vat_No"));
				order.setTxtEstID(rs.getString("estimateID"));
				order.setTxtDate(rs.getString("sales_Order_Order_Date"));
				order.setTxtDueDate(rs.getString("sales_Order_Due_Date"));
				order.setTxtCPONo(rs.getString("customer_PO_No"));
				order.setTxtTransCost(rs.getFloat("sales_Order_Charges"));				
				order.setTxtSubTotal(rs.getFloat("sales_Order_sub_Total"));	
				order.setRadio(rs.getString("discount_Type"));
				order.setTxtDiscount(rs.getFloat("discount_Value"));
				order.setTxtDisTotal(rs.getFloat("sales_Ord_Discounted_Total"));
				order.setTxtTaxTotal(rs.getFloat("total_Tax"));
				order.setTxtRoundOff(rs.getString("round_Off"));
				order.setTxtAmtPayble(rs.getFloat("sales_Order_Amt_Payable"));
				order.setTxtpubNotes(rs.getString("sales_Order_PublicNotes"));
				order.setTxtpvtNotes(rs.getString("sales_Order_PrivateNotes"));
				order.setInvCreated(rs.getString("invoice_Created"));
				ordDetails.setSrNo(rs.getInt("sr_No"));
				ordDetails.setProdId(rs.getString("product_Id"));
				String prodId=rs.getString("product_Id");
				float aQty=jdbcTemplate.queryForObject("select opening_Stock from product_master where product_Id='"+prodId+"'", Float.class);
				ordDetails.setItemCode(rs.getString("prod_Name"));
				ordDetails.setDes(rs.getString("description"));
				ordDetails.setQuantity(rs.getInt("sales_Order_Quantity"));
				int invQty=jdbcTemplate.queryForObject("select sales_Invoice_Quantity from vsalesinvoice where product_Id='"+prodId+"' and sales_order_Id='"+ordId+"'", Integer.class);
				ordDetails.setInvQty(invQty);
				ordDetails.setrQty(rs.getInt("sales_Order_Quantity")-invQty);
				ordDetails.setUnitPrice(rs.getFloat("sales_Order_Unit_Price"));									
				ordDetails.setItemTotal(rs.getFloat("sales_Order_Item_Total"));		
				ordDetails.setUnit(rs.getString("unit_Of_Measure"));
				ordDetails.setaQty(aQty);
				orderDetails.add(ordDetails);
				order.setProductList(orderDetails);
				return order;
			}
		});
		}catch(Exception e)
		{
			System.out.println(e);
			return null;
		}

	}
	@Override
	public List<Order> editOrderTaxDetails(String orderId) {
		try{
			final String ordId=orderId;
			RowCountCallbackHandler countCallback1 = new RowCountCallbackHandler();
			 jdbcTemplate.query("select * FROM vsalesordtaxdetails where sales_Order_Id='"+ordId+"'", countCallback1);
			 int counter1= countCallback1.getRowCount();
			 if(counter1!=0)
			 {
			String sql="select * from vsalesordtaxdetails where sales_Order_Id='"+orderId+"'";		
			return jdbcTemplate.query(sql, new RowMapper<Order>() {			
				List<TaxDetailsList> taxesList=new ArrayList<TaxDetailsList>();
			@Override
			public Order mapRow(ResultSet rs, int arg1) throws SQLException {
				Order order=new Order();				
				TaxDetailsList taxDetailsList=new TaxDetailsList();				
				 taxDetailsList.setTaxId(rs.getString("tax_Id"));
				String taxId=rs.getString("tax_Id");
				taxDetailsList.setTaxType(rs.getString("tax_Name"));
				taxDetailsList.setTaxRate(rs.getString("sales_tax_rate"));
				taxDetailsList.setTxtTaxValue(rs.getFloat("tax_Amount"));
				taxDetailsList.setTxtprevLinkTax(rs.getFloat("linked_Tax_Amt"));
				RowCountCallbackHandler countCallback = new RowCountCallbackHandler();
				 jdbcTemplate.query("select * FROM linkedtax where taxID='"+taxId+"'", countCallback);
				int counter= countCallback.getRowCount();
				taxDetailsList.setCounter(counter);
				taxesList.add(taxDetailsList);				
				order.setTaxList(taxesList);
				 
				return order;
				 
		}
		});
			 }
		 else
		 {
			 return null;
		 }
	
		}catch(Exception e)
		{
			System.out.println(e);
			return null;
		}
	}
	@Override
	public List<Order> editOrderLinkedTaxDetails(String orderId) {
		try{
		String sql="select * from vsalesordlinkedtaxdetails where sales_Order_Id='"+orderId+"'";		
		return jdbcTemplate.query(sql, new RowMapper<Order>() {			
			List<LinkedTaxDetails> linkedTaxesList=new ArrayList<LinkedTaxDetails>();
			@Override
			public Order mapRow(ResultSet rs, int arg1) throws SQLException {
				Order order=new Order();				
				LinkedTaxDetails linkedTaxDetailsList=new LinkedTaxDetails();
				linkedTaxDetailsList.setmTaxID(rs.getString("tax_Id"));				
				linkedTaxDetailsList.setmTaxAmt(rs.getFloat("tax_Amount"));
				linkedTaxDetailsList.setLinkedTaxId(rs.getString("linked_Tax_Id"));
				linkedTaxDetailsList.setLinkedTaxName(rs.getString("taxName"));
				linkedTaxDetailsList.setLinkedTaxRate(rs.getFloat("linked_Tax_Rate"));
				linkedTaxDetailsList.setSerLinkedTax(rs.getFloat("linked_Tax_Amt"));				
				linkedTaxesList.add(linkedTaxDetailsList);				
				order.setLinkedTaxList(linkedTaxesList);
				
				return order;
			}
		});
		}catch(Exception e)
		{
			System.out.println(e);
			return null;
		}
	}
	@Override
	public int updateOrder(Order order) {	
		int i1=0,i2=0,i3=0,ip=0;
		java.sql.Timestamp updateDate=new java.sql.Timestamp(new java.util.Date().getTime());
		try{
		String updateEstHeaderUrl="UPDATE sales_order_header SET sales_Order_Order_Date='"+order.getTxtDate()+"',"+"sales_Order_Due_Date='"+order.getTxtDueDate()+"',"+"bill_To='"+order.getTxtBillAddr()+"',"+"ship_To='"+order.getTxtShipAddr()+"',"+"customer_PO_No='"+order.getTxtCPONo()+"',"+"sales_Order_Charges='"+order.getTxtTransCost()+"',"+"sales_Order_sub_Total='"+order.getTxtSubTotal()+"',"+"discount_Type='"+order.getRadio()+"',"+"discount_Value='"+order.getTxtDiscount()+"',"+"sales_Ord_Discounted_Total='"+order.getTxtDisTotal()+"',"+"total_Tax='"+order.getTxtTaxTotal()+"',"+"round_Off='"+order.getTxtRoundOff()+"',"+"sales_Order_Amt_Payable='"+order.getTxtAmtPayble()+"',"+"sales_Order_PublicNotes='"+order.getTxtpubNotes()+"',"+"sales_Order_PrivateNotes='"+order.getTxtpvtNotes()+"',"+" sales_Order_Updated_By='"+order.getUpdatedBy()+"',"+"sales_Order_Update_Date='"+updateDate+"' WHERE sales_Order_Id='"+order.getTxtSOID()+"'";
		i1=jdbcTemplate.update(updateEstHeaderUrl);
		String taxId="";
		deleteList(order.getTxtSOID());
		deleteTaxDetailsList(order.getTxtSOID());
		deleteLinkedTaxDetailsList(order.getTxtSOID());
		
		if(order.getApplyTax() != null)
		{
			List<TaxDetailsList> taxList=order.getTaxList();
			taxList.remove(0);
			for (TaxDetailsList ord_taxList : taxList)			
			{	
				String taxID=ord_taxList.getTaxType();
				taxId=taxID.substring((taxID.indexOf("^"))+1, taxID.length());				
				String sql1="insert into sales_order_tax_details value('"+order.getTxtSOID()+"','"+taxId+"','"+ord_taxList.getTxtTaxValue()+"','"+ord_taxList.getTxtprevLinkTax()+"')";
				i2= jdbcTemplate.update(sql1);
			}			
			List<LinkedTaxDetails> linkedTaxList=order.getLinkedTaxList();
			if(!(linkedTaxList.isEmpty()))
			{
				linkedTaxList.remove(0);		
				for (LinkedTaxDetails linkedTaxDetails : linkedTaxList)
				{				
					String sql4="insert into sales_order_linked_tax_details value('"+order.getTxtSOID()+"','"+linkedTaxDetails.getmTaxID()+"','"+linkedTaxDetails.getLinkedTaxId()+"','"+linkedTaxDetails.getSerLinkedTax()+"')";
					ip= jdbcTemplate.update(sql4);
				}
			}
		}
        List<Details> productList=order.getProductList(); 
		for (Details details : productList)			
		{		
			String sql1="insert into sales_order_details value('"+details.getSrNo()+"','"+order.getTxtSOID()+"','"+details.getItemCode()+"','"+details.getQuantity()+"','"+details.getUnitPrice()+"','"+details.getItemTotal()+"','0')";
			 i3= jdbcTemplate.update(sql1);
		}
		 
       
	if(i1>=1 && i3>=1)
       {
		return 1;
      }
	else if(i2>=1)
	{
		return 1;
	}
	else if(ip>=1)
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
	
	private void deleteList(String orderId){
		String deleteListUrl="DELETE FROM sales_order_details WHERE sales_Order_Id= '"+orderId+"'";
		jdbcTemplate.update(deleteListUrl);
	}
	private void deleteTaxDetailsList(String orderId){
		String deleteListUrl="DELETE FROM sales_order_tax_details WHERE sales_Order_Id= '"+orderId+"'";
		jdbcTemplate.update(deleteListUrl);
	}
	private void deleteLinkedTaxDetailsList(String orderId){
		String deleteListUrl="DELETE FROM sales_order_linked_tax_details WHERE sales_Order_Id= '"+orderId+"'";
		jdbcTemplate.update(deleteListUrl);
	}
	
	@Override
	public List<CreateNewProduct> retriveProductList() {
		try{
		String sql="select * from product_master where prod_Type='Resale Product' or prod_Type='Sale Item' and status='Active' ";		
		final List<CreateNewProduct> ordProdList=getJdbcTemplate().query(sql, new RowMapper<CreateNewProduct>() {
		private List<CreateNewProduct> orderList=new ArrayList<CreateNewProduct>();
		public CreateNewProduct mapRow(ResultSet rs,int rowNo)throws SQLException
		{
			CreateNewProduct createNewProduct=new CreateNewProduct();
			createNewProduct.setProductId(rs.getString("product_Id"));
			createNewProduct.setTxtName(rs.getString("prod_Name"));			
			orderList.add(createNewProduct);
			return createNewProduct;
		}	
	});		
		return ordProdList;
		}catch(Exception e)
		{
			System.out.println(e);
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
			System.out.println(e);
			return null;
		}
}
	@Override
	public Order generateOrdId() {
		String ordId="";
		try{
		RowCountCallbackHandler countCallback = new RowCountCallbackHandler();  // not reusable
		 jdbcTemplate.query("select * from sales_order_header", countCallback);
		 int count = countCallback.getRowCount();
		 count++;		
		 if(count<10)
		 {
			 ordId="SOR00"+count;
		 }
		 else
		 {
			 if(count<99)
			 {
				 ordId = "SOR0" + count;
			 }
			 else
				{
				 ordId = "SOR" + count;
				}
		 }
		 Order order=new Order();
		 order.setTxtSOID(ordId);
		return order;
		}catch(Exception e)
		{
			System.out.println(e);
			return null;
		}
	}
	@Override
	public List<Taxes> retriveTaxList() {
		try{
		String sql="select * from taxes where tax_apply_to='S' OR tax_apply_to='S,P' OR tax_apply_to='B'";		
		final List<Taxes> txList=getJdbcTemplate().query(sql, new RowMapper<Taxes>() {
		private List<Taxes> taxList=new ArrayList<Taxes>();
		public Taxes mapRow(ResultSet rs,int rowNo)throws SQLException
		{
			Taxes taxes=new Taxes();
			taxes.setTaxId(rs.getString("tax_id"));
			taxes.setTaxRate(rs.getFloat("sales_tax_rate"));
			taxes.setTaxName(rs.getString("tax_Name"));			
			taxList.add(taxes);
			return taxes; 
		}	
	});		
		return txList;
		}catch(Exception e)
		{
			System.out.println(e);
			return null;
		}
	}
	@Override
	public int deleteOrder(String orderId) {
		try{
		String status="Inactive";
		String updateEstHeaderUrl="UPDATE sales_order_header SET sales_Order_Status='"+status+"' WHERE sales_Order_Id='"+orderId+"'";
		int i=jdbcTemplate.update(updateEstHeaderUrl);
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
			System.out.println(e);
			return 0;
		}
	}
	@Override
	public List<Customer> retriveCustInfo(String custId,String id) {
		final String path = "Sales Order.pdf";		
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
			custoInfo.setSubject("Sales Order");
			String regards=jdbcTemplate.queryForObject("select comp_Name from comp_details",String.class);
			custoInfo.setRegards(regards);	
			custoInfo.setBodyPart("\t New Sales Order is Generated For More Details\n Please Find The Attached PDF File.\n\nThank You..");
				return custoInfo;
			}	
		});		
			return custInfo;
		}catch(Exception e)
		{
			System.out.println(e);
			return null;
		}
	}
	@Override
	public float retriveQuantity(String productId) {
		try{
		String sql="select opening_Stock from product_master where product_Id='"+productId+"'";
		float qty=(Integer) jdbcTemplate.queryForObject(sql, Integer.class); 
		return qty;
		}catch(Exception e)
		{
			System.out.println(e);
			return 0;
		}
	}
	
}
