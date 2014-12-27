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
import com.invoice.inventory.beans.ReceiveAgainstProduct;
import com.invoice.inventory.beans.ReceiveAgainstProductDetails;
import com.invoice.inventory.beans.Warehouse;
import com.invoice.purchase.beans.PurchaseOrder;
@Component(value="receiveAgainstProductDao")
public class ReceiveAgainstProductDaoImpl implements ReceiveAgainstProductDao {

	
	private static String sql,sql1,sql2;	
	private JdbcTemplate jdbcTemplate;
	
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	@Autowired
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Override
	public int save(ReceiveAgainstProduct receiveAgainstProduct) {
		int iD=0,j=0;
		
		String Status="Active";
		 sql="insert into received_against_prod_header value('"+receiveAgainstProduct.getTxtVNo()+"','"+receiveAgainstProduct.getTxtpurNo()+"','"+receiveAgainstProduct.getDate()+"','"+receiveAgainstProduct.getTxtDetails()+"','"+Status+"')";
		 int i=jdbcTemplate.update(sql); 
       List<ReceiveAgainstProductDetails> receiveAgainProduct=receiveAgainstProduct.getReceiveAgainstProductList();
		for (ReceiveAgainstProductDetails receiveProList : receiveAgainProduct)		
		{
			 sql1="insert into received_against_prod_details value('"+receiveProList.getTxtSrNo1()+"','"+receiveAgainstProduct.getTxtVNo()+"','"+receiveProList.getSelectWarehouse()+"','"+receiveProList.getTxtItem1()+"','"+receiveProList.getTxtQuant1()+"')";
			 iD= jdbcTemplate.update(sql1);
			 sql2 = "UPDATE product_master set opening_Stock = opening_Stock + '"+receiveProList.getTxtQuant1()+"' where product_Id='"+receiveProList.getTxtItem1()+"' ";
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
	public List<PurchaseOrder> retriveOrderId() {
		sql="select * from purchase_order_header";
		final List<PurchaseOrder> pOrder=getJdbcTemplate().query(sql, new RowMapper<PurchaseOrder>() {
			private List<PurchaseOrder> oderList=new ArrayList<PurchaseOrder>();
			public PurchaseOrder mapRow(ResultSet rs,int rowNo)throws SQLException
			{
				PurchaseOrder order=new PurchaseOrder();
				order.setTxtPurchaseOrdNo(rs.getString("pur_Order_Id")); 			
				oderList.add(order);
			return order;
			}	
			});	
			return pOrder;
	}
	@Override
	public ReceiveAgainstProduct generateID() {
		
		String txtVNo="";
		RowCountCallbackHandler countCallback = new RowCountCallbackHandler();  // not reusable
		 jdbcTemplate.query("select * from received_against_prod_header", countCallback);
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
		 ReceiveAgainstProduct receiveProd = new ReceiveAgainstProduct();
		 receiveProd.setTxtVNo(txtVNo);
		return receiveProd;
	}
	@Override
	public List<ReceiveAgainstProduct> showRecProd() {
		
		sql="select * from vreceiveagstprod where status='Active' group by voucher_No";
		return jdbcTemplate.query(sql, new RowMapper<ReceiveAgainstProduct>() {
			List<ReceiveAgainstProductDetails> receiveDetailsList =new ArrayList<ReceiveAgainstProductDetails>();
			@Override
			public ReceiveAgainstProduct mapRow(ResultSet rs, int arg1) throws SQLException {
				
				ReceiveAgainstProduct receivePrdctn=new ReceiveAgainstProduct();
				ReceiveAgainstProductDetails receiveDetails = new ReceiveAgainstProductDetails();
				receivePrdctn.setTxtVNo(rs.getString("voucher_No"));
				receivePrdctn.setDate(rs.getString("date"));
				receivePrdctn.setTxtDetails(rs.getString("comments"));
				receiveDetailsList.add(receiveDetails);
				receivePrdctn.setReceiveAgainstProductList(receiveDetailsList);
				return receivePrdctn;
			}
		}); 
	}
	@Override
	public List<ReceiveAgainstProduct> edit(String txtVNo) {

		sql="select * from vreceiveagstprod where voucher_No='"+txtVNo+"'";		
		return jdbcTemplate.query(sql, new RowMapper<ReceiveAgainstProduct>(){
			List<ReceiveAgainstProductDetails> receiveDetailList = new ArrayList<ReceiveAgainstProductDetails>();
			@Override
			public ReceiveAgainstProduct mapRow(ResultSet rs, int rowNo)throws SQLException {
				ReceiveAgainstProduct receivePrdctn=new ReceiveAgainstProduct();
				ReceiveAgainstProductDetails receiveDetails = new ReceiveAgainstProductDetails();
				receivePrdctn.setTxtVNo(rs.getString("voucher_No"));
				receivePrdctn.setDate(rs.getString("date"));
				receivePrdctn.setTxtpurNo(rs.getString("pur_Order_Id"));
				receivePrdctn.setTxtDetails(rs.getString("comments"));
				receiveDetails.setTxtSrNo1(rs.getInt("sr_No"));
				receiveDetails.setProdId(rs.getString("product_Id"));
 				receiveDetails.setTxtItem1(rs.getString("prod_Name"));
 				receiveDetails.setwID(rs.getString("warehouse_Id"));
				receiveDetails.setSelectWarehouse(rs.getString("warehouse_Name"));
				receiveDetails.setTxtQuant1(rs.getInt("quantity"));
				
				receiveDetailList.add(receiveDetails);
				receivePrdctn.setReceiveAgainstProductList(receiveDetailList);
				return receivePrdctn;
			}			
		}); 
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
	public int updateRecievedAgainstProd(ReceiveAgainstProduct receiveProd) {
		int j=0;
		String sql="UPDATE received_against_prod_header SET date='"+receiveProd.getDate()+"',"+"comments='"+receiveProd.getTxtDetails()+"'  WHERE voucher_No='"+receiveProd.getTxtVNo()+"'";
		int i=jdbcTemplate.update(sql);
		String voucher_No = receiveProd.getTxtVNo();
		deleteList(voucher_No);
		List<ReceiveAgainstProductDetails> receivedProdList = receiveProd.getReceiveAgainstProductList();
		for(ReceiveAgainstProductDetails receivedDetails : receivedProdList)
		{
			sql1="insert into received_against_prod_details value('"+receivedDetails.getTxtSrNo1()+"','"+receiveProd.getTxtVNo()+"','"+receivedDetails.getSelectWarehouse()+"','"+receivedDetails.getTxtItem1()+"','"+receivedDetails.getTxtQuant1()+"')";
			j= jdbcTemplate.update(sql1);
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
		String deleteListUrl="DELETE FROM received_against_prod_details WHERE voucher_No= '"+voucher_number+"'";	
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
		String sql = "update received_against_prod_header set status = '"+status+"' where voucher_No='"+txtVNo+"'";
		int i = jdbcTemplate.update(sql);
		return i;
	}
}
