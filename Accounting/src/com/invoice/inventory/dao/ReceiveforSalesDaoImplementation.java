package com.invoice.inventory.dao;

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
import com.invoice.inventory.beans.CreateNewProduct;
import com.invoice.inventory.beans.Details;
import com.invoice.inventory.beans.ReceiveforSales;
import com.invoice.inventory.beans.Warehouse;
import com.invoice.sales.beans.Order;

@Component(value="receiveForServiceDao")
public class ReceiveforSalesDaoImplementation implements ReceiveforSalesDao{
	
	private static String sql,sql1;	
	private JdbcTemplate jdbcTemplate;
	
	public static String getSql() {
		return sql;
	}
	@Autowired
	public static void setSql(String sql) {
		ReceiveforSalesDaoImplementation.sql = sql;
	}
	public static String getSql1() {
		return sql1;
	}
	@Autowired
	public static void setSql1(String sql1) {
		ReceiveforSalesDaoImplementation.sql1 = sql1;
	}
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
@Autowired

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Override
	public int save(ReceiveforSales receiveForSales) {
		int j=0,iD=0;
		
		 String url="insert into received_for_sales_header value('"+receiveForSales.getTxtVNo()+"','"+receiveForSales.getDate()+"','"+receiveForSales.getSelectWarehouse()+"','"+receiveForSales.getTxtDetails()+"','"+receiveForSales.getStatus()+"')";
		 int i=jdbcTemplate.update(url); 
       List<Details> receiveForSalesList=receiveForSales.getProductList();
		for (Details receiveForSalesDetailList : receiveForSalesList)			
		{
			String itemid = receiveForSalesDetailList.getTxtItemr();
			 sql1="insert into received_for_sales_details value('"+receiveForSalesDetailList.getTxtSrNo1()+"','"+receiveForSales.getTxtVNo()+"','"+receiveForSalesDetailList.getTxtItemr()+"','"+receiveForSalesDetailList.getTxtQuant1()+"')";
			 iD= jdbcTemplate.update(sql1);
			String sql2 = "UPDATE product_master set opening_Stock = opening_Stock + '"+receiveForSalesDetailList.getTxtQuant1()+"' where product_Id='"+receiveForSalesDetailList.getTxtItem1()+"' ";
			 j = jdbcTemplate.update(sql2);
		}
		 
      
	if(i>=1 && iD>=1 && j>=1)
      {
		return 1;
     }
      else
      {
   	   return 0;
      }
	}
	
	@Override
	public List<ReceiveforSales> showSalesProd() {
		String sql="select * from vreceiveforsale where status = 'Active' group by voucher_No";		
		final List<ReceiveforSales> receiveforsalesList=getJdbcTemplate().query(sql, new RowMapper<ReceiveforSales>() {
		private List<ReceiveforSales> productReceiveList=new ArrayList<ReceiveforSales>();
		public ReceiveforSales mapRow(ResultSet rs,int rowNo)throws SQLException
		{
			ReceiveforSales receiveForsales=new ReceiveforSales();
			receiveForsales.setTxtVNo(rs.getString("voucher_No"));
			receiveForsales.setDate(rs.getString("voucher_Date"));
			receiveForsales.setSelectWarehouse(rs.getString("warehouse_Name"));
			receiveForsales.setTxtDetails(rs.getString("details"));
			productReceiveList.add(receiveForsales);
			return receiveForsales;
		}	
	});		
		return receiveforsalesList;	
	}
//Edit Receive for sales	
	@Override
	public List<ReceiveforSales> editReceiveforSales(String txtVNo) {
		sql="select * from vreceiveforsale where voucher_No='"+txtVNo+"'";
		return jdbcTemplate.query(sql, new RowMapper<ReceiveforSales>() {
			List<Details> receiveForsalesDetailsList =new ArrayList<Details>();
			@Override
			public ReceiveforSales mapRow(ResultSet rs, int arg1) throws SQLException {
				ReceiveforSales receiveForsales=new ReceiveforSales();
				Details receiveForsalesDetails=new Details();
				receiveForsales.setTxtVNo(rs.getString("voucher_No"));
				receiveForsales.setDate(rs.getString("voucher_Date"));
				receiveForsales.setWearehouseID(rs.getString("warehouser_Id"));
				receiveForsales.setSelectWarehouse(rs.getString("warehouse_Name"));
				receiveForsales.setTxtDetails(rs.getString("details"));				
				receiveForsalesDetails.setTxtSrNo1(rs.getInt("sr_No"));			
				receiveForsalesDetails.setItemID(rs.getString("product_Id"));
				receiveForsalesDetails.setTxtItemr(rs.getString("prod_Name"));
				receiveForsalesDetails.setTxtQuant1(rs.getInt("quantity"));
				receiveForsalesDetailsList.add(receiveForsalesDetails);
				receiveForsales.setProductList(receiveForsalesDetailsList);
				return receiveForsales;
			}
		});
	}
	@Override
	public ReceiveforSales generateReceiveID() {
					 String txtVNo="";
			 RowCountCallbackHandler countCallback = new RowCountCallbackHandler();  // not reusable
			  jdbcTemplate.query("select * from received_for_sales_header", countCallback);
			  int count = countCallback.getRowCount();
			  count++;
			  if(count<10)
			  {
				  txtVNo="VR00"+count;
			  }
			  else
			  {
			  if(count<99)
			  {
				  txtVNo = "VR0" + count;
			  }
			  else
			 {
				  txtVNo = "VR" + count;
			 }
			  }
			  ReceiveforSales receiveForSales=new ReceiveforSales();
			  receiveForSales.setTxtVNo(txtVNo);
			 return receiveForSales;
	}
	@Override
	public List<Warehouse> retriveWareHouse() {
		sql="select * from warehouse_header";	
		final List<Warehouse> accGroup=getJdbcTemplate().query(sql, new RowMapper<Warehouse>() {
		private List<Warehouse> accountList=new ArrayList<Warehouse>();
		public Warehouse mapRow(ResultSet rs,int rowNo)throws SQLException
		{
		Warehouse warehouse=new Warehouse();
		warehouse.setWarehousrID(rs.getString("warehouse_Id"));
		warehouse.setWareHouseName(rs.getString("warehouse_Name"));
		 
		
		accountList.add(warehouse);

		return warehouse;
		}	
		});	
		return accGroup;
	}
	@Override
	public List<CreateNewProduct> retriveProduct() {
		sql="select * from product_master";	
		final List<CreateNewProduct> prodgrp=getJdbcTemplate().query(sql, new RowMapper<CreateNewProduct>() {
		private List<CreateNewProduct> prodList=new ArrayList<CreateNewProduct>();
		public CreateNewProduct mapRow(ResultSet rs,int rowNo)throws SQLException
		{
			CreateNewProduct createNewProduct=new CreateNewProduct();
			createNewProduct.setProductCode(rs.getString("product_Id"));
			createNewProduct.setTxtName(rs.getString("prod_Name"));
		 
		
		prodList.add(createNewProduct);

		return createNewProduct;
		}	
		});	
		return prodgrp;
	}
	@Override
	public int updateReceiveforSales(ReceiveforSales receiveforSales) 
	{
		int j=0;
		String sql="UPDATE received_for_sales_header SET voucher_Date='"+receiveforSales.getDate()+"',"+"warehouser_Id='"+receiveforSales.getSelectWarehouse()+"',"+"details='"+receiveforSales.getTxtDetails()+"'  WHERE voucher_No='"+receiveforSales.getTxtVNo()+"'";
		int i=jdbcTemplate.update(sql);
		String voucher_No = receiveforSales.getTxtVNo();
		
		int prevqty=0;
		String prodId="";
		List<Details> qtyList = getProductdetails(voucher_No);
		for (Details details : qtyList) 
		{
			 prodId = details.getItemID();
			 prevqty = details.getTxtQuant1();
		     

		}
		deleteList(voucher_No);
		List<Details> prodList = receiveforSales.getProductList();
		for(Details detailsList : prodList)
		{
			sql1="insert into received_for_sales_details value('"+detailsList.getTxtSrNo1()+"','"+receiveforSales.getTxtVNo()+"','"+detailsList.getTxtItemr()+"','"+detailsList.getTxtQuant1()+"')";
			j= jdbcTemplate.update(sql1);
			
			int currentqty = detailsList.getTxtQuant1();
			
			 if(currentqty < prevqty)
			 {
				 String updateqty="Update Product_master set opening_Stock=opening_Stock -'"+currentqty+"' where product_Id='"+detailsList.getTxtItem1()+"'";
				 j=jdbcTemplate.update(updateqty);
			 }
			 else
			 {
				 int newqty=currentqty - prevqty;
				 String updateqty="Update Product_master set opening_Stock=opening_Stock +'"+newqty+"' where product_Id='"+detailsList.getTxtItem1()+"'";
				 j=jdbcTemplate.update(updateqty);
			 }
		}
		if(i>0 && j>0)
		{	
		return 1;
		}
		else
		{
			return 0;
		}	
	}
	private void deleteList(String voucher_number)
	{		
		String deleteListUrl="DELETE FROM received_for_sales_details WHERE voucher_No= '"+voucher_number+"'";	
		jdbcTemplate.update(deleteListUrl);
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
	@Override
	public int delete(String txtVNo) {
		
		String status = "InActive";
		String sql = "update received_for_sales_header set status ='"+status+"' where voucher_No = '"+txtVNo+"'";
		int i = jdbcTemplate.update(sql);
		
		String prodId="";
		int qty=0;
		int j=0;
		List<Details> qtyList = getProductdetails(txtVNo);
		for (Details details : qtyList) 
		{
			 prodId = details.getItemID();
		     qty = details.getTxtQuant1();	
		     
		     
		     String sql2 = "UPDATE product_master set opening_Stock = opening_Stock - '"+qty+"' where product_Id='"+prodId+"' ";
			 j = jdbcTemplate.update(sql2);
		}
		
		if (i>0 && j>0 )
			
		{
			return 1;
		}
		else
		{
			return 0;
		}
	}
	private List<Details> getProductdetails(String txtVNo)
	{
		String url1="select quantity,product_Id from received_for_sales_details where voucher_No='"+txtVNo+"'";
		final List<Details> jList=getJdbcTemplate().query(url1, new RowMapper<Details>()
			{
			List<Details> jDList=new ArrayList<Details>();
				@Override
				public Details mapRow(ResultSet rs, int arg1)throws SQLException 
				{
					Details details=new Details();
					details.setItemID(rs.getString("product_Id"));
					details.setTxtQuant1(rs.getInt("quantity"));
					jDList.add(details);
					return details;
				}
			
				});
		return jList;		
	}
	@Override
	public List<Order> retriveOrderId() {
		sql="select * from sales_order_header";
		final List<Order> pOrder=getJdbcTemplate().query(sql, new RowMapper<Order>() {
			private List<Order> oderList=new ArrayList<Order>();
			public Order mapRow(ResultSet rs,int rowNo)throws SQLException
			{
				Order order=new Order();
				order.setTxtSOID(rs.getString("sales_Order_Id")); 			
				oderList.add(order);
			return order;
			}	
		});
		return pOrder;
	}
	@Override
	public String retriveDesc(String productId) {
		String sql="select description from product_master where product_Id='"+productId+"'";
		String desc=(String) jdbcTemplate.queryForObject(sql, String.class); 
		return desc;
	}
	@Override
	public String retriveUnit(String productId) {
		String sql="select unit_Of_Measure from product_master where product_Id='"+productId+"'";
		String unit=(String) jdbcTemplate.queryForObject(sql, String.class);
		return unit;
	}
	
}