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
import com.invoice.inventory.beans.RecordTransferred;
import com.invoice.inventory.beans.RecordTransferredDetails;
import com.invoice.inventory.beans.Warehouse;
@Component(value="recordTransferredDao")
public class RecordTransferredDaoImplementation implements RecordTransferredDao{

	private static String sql,sql1;	
	private JdbcTemplate jdbcTemplate;
	
	public static String getSql() {
		return sql;
	}
@Autowired
	public static void setSql(String sql) {
		RecordTransferredDaoImplementation.sql = sql;
	}
	public static String getSql1() {
		return sql1;
	}
	@Autowired
	public static void setSql1(String sql1) {
		RecordTransferredDaoImplementation.sql1 = sql1;
	}
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	@Autowired
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
//SAVE	
	@Override
	public int save(RecordTransferred recordTransferred) {
		
	int iD=0;
	int j=0;
	try
	{
		String productID = "";
		float avalQty = 0;
		String wID = recordTransferred.getSelectWarehouse();
		float qty = 0;
		List<RecordTransferredDetails> recordTransferredList1=recordTransferred.getRecordTransferredDetailsList();
		for (RecordTransferredDetails recordTransferredListDetailList1 : recordTransferredList1)	
		{
			productID = recordTransferredListDetailList1.getTxtItem1();
			qty = recordTransferredListDetailList1.getTxtQuant1();
			avalQty = jdbcTemplate.queryForObject("select warehouse_Quantity from warehouse_details where product_Id='"+productID+"' and warehouse_Id = '"+wID+"'", Float.class);
		}
		if(qty > avalQty)
		{
			return 0;
		}
		else
		{
			String url="insert into record_trans_header value('"+recordTransferred.getTxtVNo()+"','"+recordTransferred.getDate()+"','"+recordTransferred.getSelectWarehouse()+"','"+recordTransferred.getTxtDetails()+"','"+recordTransferred.getStatus()+"')";
			int i=jdbcTemplate.update(url); 
			List<RecordTransferredDetails> recordTransferredList=recordTransferred.getRecordTransferredDetailsList();
			for (RecordTransferredDetails recordTransferredListDetailList : recordTransferredList)	
			{
				sql1="insert into record_trans_details value('"+recordTransferredListDetailList.getTxtSrNo1()+"','"+recordTransferred.getTxtVNo()+"','"+recordTransferredListDetailList.getTxtItem1()+"','"+recordTransferredListDetailList.getTxtQuant1()+"','"+recordTransferredListDetailList.getDestWarehouse1()+"')";
			 	iD= jdbcTemplate.update(sql1);
			 
			 	String sqlheader="Update warehouse_details set warehouse_Quantity=warehouse_Quantity-'"+recordTransferredListDetailList.getTxtQuant1()+"' where warehouse_Id='"+recordTransferred.getSelectWarehouse()+"' and product_Id='"+recordTransferredListDetailList.getTxtItem1()+"'";
			 	j=jdbcTemplate.update(sqlheader);
			 	
			 	String sqlheader1="Update warehouse_details set warehouse_Quantity=warehouse_Quantity+'"+recordTransferredListDetailList.getTxtQuant1()+"' where warehouse_Id='"+recordTransferredListDetailList.getDestWarehouse1()+"' and product_Id='"+recordTransferredListDetailList.getTxtItem1()+"'";
			 	j=jdbcTemplate.update(sqlheader1);
			}
			if(i>=1 && iD>=1)
			{
				return 1;
			}
			if(j>=0)
			{
				return 1;
			}
			else
			{
				return 0;
			}
		}
	}catch(Exception e)
	{
		System.out.println(e); 
		return 0;
	}
	}
	
//SHOW
	@Override
	public List<RecordTransferred> showRecTrans() {
		String sql="select * from recordtransfer where status = 'Active' group by voucher_No";		
		final List<RecordTransferred> recordTransffredList=getJdbcTemplate().query(sql, new RowMapper<RecordTransferred>() {
		private List<RecordTransferred> transfredrecordList=new ArrayList<RecordTransferred>();
		public RecordTransferred mapRow(ResultSet rs,int rowNo)throws SQLException
		{
			RecordTransferred recordTransffered=new RecordTransferred();
			recordTransffered.setTxtVNo(rs.getString("voucher_No"));
			recordTransffered.setDate(rs.getString("tran_date"));
			recordTransffered.setSelectWarehouse(rs.getString("warehouse_Name"));
			recordTransffered.setTxtDetails(rs.getString("details"));
			transfredrecordList.add(recordTransffered);
			return recordTransffered;
		}	
	});		
		return recordTransffredList;	
	}


//Edit Record Transferred
	@Override
	public List<RecordTransferred> editRecordTransferred(String txtVNo) {
		sql="select * from recordtransfer where voucher_No='"+txtVNo+"'";		
		return jdbcTemplate.query(sql, new RowMapper<RecordTransferred>() {
			List<RecordTransferredDetails> recordTransferredDetailsList =new ArrayList<RecordTransferredDetails>();
			@Override
			public RecordTransferred mapRow(ResultSet rs, int arg1) throws SQLException {
				RecordTransferred recordTransferred=new RecordTransferred();
				RecordTransferredDetails recordTransferredDetails=new RecordTransferredDetails();
				recordTransferred.setTxtVNo(rs.getString("voucher_No"));
				recordTransferred.setDate(rs.getString("tran_date"));
				recordTransferred.setWearehouseID(rs.getString("warehouse_Id"));
				recordTransferred.setSelectWarehouse(rs.getString("warehouse_Name"));
				recordTransferred.setTxtDetails(rs.getString("details"));
				recordTransferredDetails.setTxtSrNo1(rs.getInt("sr_No"));
				recordTransferredDetails.setItemID(rs.getString("product_Id"));
				recordTransferredDetails.setTxtItem1(rs.getString("prod_Name"));
				recordTransferredDetails.setDesti_warehouseId(rs.getString("desti_warehouseId"));	
				recordTransferredDetails.setDestWarehouse1(rs.getString("desti_warehouse"));	
				//recordTransferredDetails.setAvailableqty(rs.getString("warehouse_Quantity"));	
				recordTransferredDetails.setTxtQuant1(rs.getFloat("quantity"));
				recordTransferredDetailsList.add(recordTransferredDetails);
				recordTransferred.setRecordTransferredDetailsList(recordTransferredDetailsList);
				return recordTransferred;
			}
		});
	}
//AUTOGENERATE	
@Override
	public RecordTransferred generateTransID() {
		String txtVNo="";
		RowCountCallbackHandler countCallback = new RowCountCallbackHandler();  // not reusable
		 jdbcTemplate.query("select * from record_trans_header", countCallback);
		 int count = countCallback.getRowCount();
		 count++;
		 /*System.out.println("Count="+count);*/
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
		 RecordTransferred recordTransferred=new RecordTransferred();
		 recordTransferred.setTxtVNo(txtVNo);
		return recordTransferred;
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
		sql="select * from product_master where status='Active'";	
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
	public int updateRecordTransferred(RecordTransferred recordTransferred) 
	{
		int j=0;
		int j1=0;
		int k1=0;
		int j2=0;
		int k2=0;
		String Fromproduct="";
		float fromqty=0;
		String FromWarehouse="";
		
		float prevqty=0;
		String toprodId="";
		String destwarehouse="";
		
		String prodid = "";
		float currentQty = 0;
		String destintn = "";
		
		
		String sql="UPDATE record_trans_header SET tran_date='"+recordTransferred.getDate()+"',"+"warehouse_Id='"+recordTransferred.getSelectWarehouse()+"',"+"details='"+recordTransferred.getTxtDetails()+"' WHERE voucher_No='"+recordTransferred.getTxtVNo()+"'";
		int i=jdbcTemplate.update(sql);
		String voucher_No = recordTransferred.getTxtVNo();
		
		List<RecordTransferredDetails> qtyList =  getWaredetails(voucher_No);
		for (RecordTransferredDetails recordTransferredDetails : qtyList) 
		{		
			Fromproduct=recordTransferredDetails.getItemID();
			//System.out.println("prvs source Product="+Fromproduct);
		    fromqty=recordTransferredDetails.getTxtQuant1();
			//System.out.println("prvs source Qty="+fromqty);
		    FromWarehouse=recordTransferred.getSelectWarehouse();
			//System.out.println("prvs source Warehouse="+FromWarehouse);
			
			
			toprodId = recordTransferredDetails.getItemID();
			//System.out.println("prevs Dest Product="+toprodId);
			prevqty = recordTransferredDetails.getTxtQuant1();
			//System.out.println("prevs Dest Qty="+prevqty);
		    destwarehouse=recordTransferredDetails.getDestWarehouse1();
		    //System.out.println("prevs Dest Warehouse="+destwarehouse);
		    
		    
		}
		
		deleteList(voucher_No);
		
		
		List<RecordTransferredDetails> recordTransList = recordTransferred.getRecordTransferredDetailsList();
		for(RecordTransferredDetails detailList : recordTransList)
		{
			sql1="insert into record_trans_details value('"+detailList.getTxtSrNo1()+"','"+recordTransferred.getTxtVNo()+"','"+detailList.getTxtItem1()+"','"+detailList.getTxtQuant1()+"','"+detailList.getDestWarehouse1()+"')";
			j= jdbcTemplate.update(sql1);	
			
			prodid = detailList.getTxtItem1();
			//System.out.println("currnt prodid="+prodid);
			destintn = detailList.getDestWarehouse1();
			//System.out.println("current des="+destintn);
			currentQty=detailList.getTxtQuant1();
			//System.out.println("Current Qty="+currentQty);
			
			
			if(currentQty < prevqty)
			{
				
				 String sqlupheadertbl="Update warehouse_details set warehouse_Quantity=warehouse_Quantity + '"+currentQty+"' where warehouse_Id='"+FromWarehouse+"' and product_Id='"+prodid+"'";
				 j1=jdbcTemplate.update(sqlupheadertbl);
				 //System.out.println("In less="+sqlupheadertbl);
				 
				 String sqlupheadertbl1="Update warehouse_details set warehouse_Quantity=warehouse_Quantity - '"+currentQty+"' where warehouse_Id = '"+destintn+"' and product_Id='"+prodid+"'";
				 k1=jdbcTemplate.update(sqlupheadertbl1);
				 //System.out.println("In less="+sqlupheadertbl1);
			}
			else
			{
				float Newqty=currentQty - prevqty;
				
				String Newupdateqty="Update warehouse_details set warehouse_Quantity=warehouse_Quantity - '"+Newqty+"' where warehouse_Id='"+FromWarehouse+"' and product_Id='"+prodid+"'";
				 j2=jdbcTemplate.update(Newupdateqty);
				 //System.out.println("In Greater="+Newupdateqty);
				 
				 String Newupdateqty1="Update warehouse_details set warehouse_Quantity=warehouse_Quantity + '"+Newqty+"' where warehouse_Id = '"+destintn+"' and product_Id='"+prodid+"'";
				 k2=jdbcTemplate.update(Newupdateqty1);
				 //System.out.println("In Greater="+Newupdateqty1);
						
			}
		}
		
		if(i>0 && j>0) 
		{
		return 1;
		}
		else if(j1>0 && k1>0)
		{
			return 1;
		}
		else if(j2>0 && k2>0)
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
		String deleteListUrl="DELETE FROM record_trans_details WHERE voucher_No= '"+voucher_number+"'";	
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
		String sql = "update record_trans_header set status ='"+status+"' where voucher_No = '"+txtVNo+"'";
		int i = jdbcTemplate.update(sql);
		
		int j=0;
		float qty=0;
		String prodId="";
		int k=0;
		
		
		List<RecordTransferredDetails> qtyList =  getWaredetails(txtVNo);
		for (RecordTransferredDetails recordTransferredDetails : qtyList) {
			
			prodId = recordTransferredDetails.getItemID();
		     qty = recordTransferredDetails.getTxtQuant1();
		     String destwarehouse=recordTransferredDetails.getDestWarehouse1();
		    // System.out.println(destwarehouse);
		     
		     String sqlheadertbl="Update warehouse_details set warehouse_Quantity=warehouse_Quantity - '"+qty+"' where warehouse_Id='"+destwarehouse+"' and product_Id='"+prodId+"'";
			 j=jdbcTemplate.update(sqlheadertbl);
			 
			 
			 
			 String  sql2 = "select warehouse_Id from record_trans_header where voucher_No = '"+txtVNo+"' "; 
				String frmwarehouseid = jdbcTemplate.queryForObject(sql2,String.class);
				//System.out.println("From Warehouse="+frmwarehouseid);
			 
				String  sql3 = "select quantity from recordtransfer where warehouse_Id = '"+frmwarehouseid+"' and product_Id='"+prodId+"' "; 
				String frmwareqty = jdbcTemplate.queryForObject(sql3,String.class);
				//System.out.println("From Warehouseqty="+frmwareqty);
				
				String sqlheadertbl1="Update warehouse_details set warehouse_Quantity=warehouse_Quantity + '"+frmwareqty+"' where warehouse_Id = '"+frmwarehouseid+"' and product_Id='"+prodId+"'";
				 k=jdbcTemplate.update(sqlheadertbl1);
		}
		
		
		if (i>0 && j>0 && k>0)
			
		{
			return 1;
		}
		else
		{
			return 0;
		}
		
	}
	
	private List<RecordTransferredDetails> getWaredetails(String txtVno)
	{
		String url1="select quantity,desti_warehouse,product_Id from record_trans_details where voucher_No='"+txtVno+"'";
        final List<RecordTransferredDetails> jList=getJdbcTemplate().query(url1, new RowMapper<RecordTransferredDetails>()
        		{
                    List<RecordTransferredDetails> jDList=new ArrayList<RecordTransferredDetails>();
					@Override
					public RecordTransferredDetails mapRow(ResultSet rs,int arg1) throws SQLException {
							
						RecordTransferredDetails recordTransferredDetails=new RecordTransferredDetails();
						recordTransferredDetails.setItemID(rs.getString("product_Id"));
						recordTransferredDetails.setTxtQuant1(rs.getFloat("quantity"));
						recordTransferredDetails.setDestWarehouse1(rs.getString("desti_warehouse"));
						jDList.add(recordTransferredDetails);
						return recordTransferredDetails;
					}
				
					});
			return jList;		
		}
	@Override
	public List<CreateNewProduct> retriveWarehouseProd(String wID) 
	{
		String url1="select w.product_Id,p.prod_name from warehouse_details w,product_master p  where p.product_Id =  w.product_Id  and w.warehouse_Id = '"+wID+"'";
        final List<CreateNewProduct> jList=getJdbcTemplate().query(url1, new RowMapper<CreateNewProduct>()
        		{
                    List<CreateNewProduct> jDList=new ArrayList<CreateNewProduct>();
					@Override
					public CreateNewProduct mapRow(ResultSet rs,int arg1) throws SQLException {
							
						CreateNewProduct recordTransferredDetails=new CreateNewProduct();
						recordTransferredDetails.setProductCode(rs.getString("product_Id"));
						recordTransferredDetails.setTxtName(rs.getString("prod_name"));
						jDList.add(recordTransferredDetails);
						return recordTransferredDetails;
					}
				
					});
			return jList;	
	}
	@Override
	public String retriveAvailqty(String productId,String wID) 
	{
		String sql="select warehouse_Quantity from warehouse_details where product_Id='"+productId+"' and warehouse_Id = '"+wID+"'";
		String Qty=jdbcTemplate.queryForObject(sql, String.class);
		return Qty;
	}
	@Override
	public int checkProduct(String prodID, String wid) 
	{
		try
		{
			String sql = "select count(product_Id) from warehouse_details where warehouse_Id = '"+wid+"' and product_Id = '"+prodID+"'";
			int count = jdbcTemplate.queryForObject(sql, Integer.class);
			return count;
		}
		catch(Exception e)
		{
			System.out.println(e);
			return 0;
		}
	}
}
        	
        		
		
					
