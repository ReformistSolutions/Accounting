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
import com.invoice.inventory.beans.RecordWastage;
import com.invoice.inventory.beans.RecordWastageDetails;
import com.invoice.inventory.beans.Warehouse;
@Component(value="recordWastageDao")
public class RecordWastageDaoImplementation implements RecordWastageDao{

	private static String sql,sql1;	
	private JdbcTemplate jdbcTemplate;
	
	
	public static String getSql() {
		return sql;
	}
@Autowired
	public static void setSql(String sql) {
		RecordWastageDaoImplementation.sql = sql;
	}

	public static String getSql1() {
		return sql1;
	}
	@Autowired
	public static void setSql1(String sql1) {
		RecordWastageDaoImplementation.sql1 = sql1;
	}

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	@Autowired
	public void setJdbcTemplatel(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
//
	@Override
	public int save(RecordWastage recordWastage) {
		 int iD=0; 
		 int j=0;
		 /*System.out.println("Voucher No="+recordWastage.getTxtVNo());
		 System.out.println("Date="+recordWastage.getDate());
		 System.out.println("Warehouse="+recordWastage.getSelectWarehouse());
		 System.out.println("Details="+recordWastage.getTxtDetails());*/
		 String url="insert into record_waste_header value('"+recordWastage.getTxtVNo()+"','"+recordWastage.getDate()+"','"+recordWastage.getSelectWarehouse()+"','"+recordWastage.getTxtDetails()+"','"+recordWastage.getStatus()+"')";
		 int i=jdbcTemplate.update(url); 
		 List<RecordWastageDetails> recordWastageList=recordWastage.getRecordWastageDetailsList();
		for (RecordWastageDetails recordWastageListDetailList : recordWastageList)			
		{
			/*System.out.println("Sr No="+recordWastageListDetailList.getTxtSrNo1());
			System.out.println("Product Name="+recordWastageListDetailList.getTxtItem1());
			System.out.println("Remark ="+recordWastageListDetailList.getRemark());
			System.out.println("Quantity="+recordWastageListDetailList.getTxtQuant1());*/
		
			 sql1="insert into record_waste_details value('"+recordWastageListDetailList.getTxtSrNo1()+"','"+recordWastage.getTxtVNo()+"','"+recordWastageListDetailList.getTxtItem1()+"','"+recordWastageListDetailList.getRemark()+"','"+recordWastageListDetailList.getTxtQuant1()+"')";
			 iD= jdbcTemplate.update(sql1);
			 
			String sql2 = "UPDATE product_master set opening_Stock = opening_Stock - '"+recordWastageListDetailList.getTxtQuant1()+"' where product_Id='"+recordWastageListDetailList.getTxtItem1()+"' ";
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
//SHOW	
	@Override
	public List<RecordWastage> showRecWast()
	{
		String sql="select * from vrecwastage where status = 'Active' group by voucher_No";		
		final List<RecordWastage> recordWastageList=getJdbcTemplate().query(sql, new RowMapper<RecordWastage>() {
		private List<RecordWastage> wastagerecordList=new ArrayList<RecordWastage>();
		public RecordWastage mapRow(ResultSet rs,int rowNo)throws SQLException
		{
			RecordWastage recordWastage=new RecordWastage();
			
			recordWastage.setTxtVNo(rs.getString("voucher_No"));
			recordWastage.setDate(rs.getString("voucher_Date"));
			recordWastage.setSelectWarehouse(rs.getString("warehouse_Name"));
			recordWastage.setTxtDetails(rs.getString("details"));
			wastagerecordList.add(recordWastage);
			return recordWastage;
		}	
	});		
		return recordWastageList;	
	}
//Edit Record Wastage
	@Override
	public List<RecordWastage> editRecordWastage(String txtVNo) {		
			sql="select * from vrecwastage where voucher_No='"+txtVNo+"'";		
		return jdbcTemplate.query(sql, new RowMapper<RecordWastage>() {
			List<RecordWastageDetails> recordWastageDetailsList =new ArrayList<RecordWastageDetails>();
			@Override
			public RecordWastage mapRow(ResultSet rs, int arg1) throws SQLException {
				RecordWastage recordWastage=new RecordWastage();
				RecordWastageDetails recordWastageDetails=new RecordWastageDetails();
				recordWastage.setTxtVNo(rs.getString("voucher_No"));
				recordWastage.setDate(rs.getString("voucher_Date"));
				recordWastage.setWearehouseID(rs.getString("warehouse_Id"));
				recordWastage.setSelectWarehouse(rs.getString("warehouse_Name"));
				recordWastage.setTxtDetails(rs.getString("details"));
				recordWastageDetails.setTxtSrNo1(rs.getInt("sr_No"));
				recordWastageDetails.setItemID(rs.getString("product_Id"));
				recordWastageDetails.setTxtItem1(rs.getString("prod_Name"));
				recordWastageDetails.setTxtQuant1(rs.getInt("quantity"));				
				recordWastageDetails.setRemark(rs.getString("remark"));
				recordWastageDetailsList.add(recordWastageDetails);
				recordWastage.setRecordWastageDetailsList(recordWastageDetailsList);
				return recordWastage;
			}
		});
	}
//AUTO GENERATE
	@Override
	public RecordWastage generateWasteID() {
		String txtVNo="";
		RowCountCallbackHandler countCallback = new RowCountCallbackHandler();  // not reusable
		 jdbcTemplate.query("select * from record_waste_header", countCallback);
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
		 RecordWastage recordWastage=new RecordWastage();
		 recordWastage.setTxtVNo(txtVNo);
		return recordWastage;
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
	public int updateRecordWastage(RecordWastage recordWastage) 
	{
		int j=0;
		String sql="UPDATE record_waste_header SET voucher_Date='"+recordWastage.getDate()+"',"+"details='"+recordWastage.getTxtDetails()+"' WHERE voucher_No='"+recordWastage.getTxtVNo()+"'";
		int i=jdbcTemplate.update(sql);
		String Voucher_No = recordWastage.getTxtVNo();
		int prevqty=0;
		String prodId="";
		List<Details> qtyList = getProductdetails(Voucher_No);
		for (Details details : qtyList) 
		{
			 prodId = details.getItemID();
		     prevqty = details.getTxtQuant1();	
		}
		
		deleteList(Voucher_No);
		List<RecordWastageDetails> recordWastList = recordWastage.getRecordWastageDetailsList();
		for(RecordWastageDetails detailsList : recordWastList)
		{
			sql1="insert into record_waste_details value('"+detailsList.getTxtSrNo1()+"','"+recordWastage.getTxtVNo()+"','"+detailsList.getTxtItem1()+"','"+detailsList.getRemark()+"','"+detailsList.getTxtQuant1()+"')";
			j= jdbcTemplate.update(sql1);		
			
			int currentqty = detailsList.getTxtQuant1();
			 if(currentqty < prevqty)
			 {
				String updatenewqty = "UPDATE product_master set opening_Stock = opening_Stock + '"+currentqty+"' where product_Id='"+detailsList.getTxtItem1()+"' ";
				 j = jdbcTemplate.update(updatenewqty); 
	
			 }
			 else
			 {
				 int newqty=currentqty - prevqty;
				 String updatenewqty1 = "UPDATE product_master set opening_Stock = opening_Stock - '"+newqty+"' where product_Id='"+detailsList.getTxtItem1()+"' ";
				 j = jdbcTemplate.update(updatenewqty1); 
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
		String deleteListUrl="DELETE FROM record_waste_details WHERE voucher_Id= '"+voucher_number+"'";	
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
		String sql = "update record_waste_header set status ='"+status+"' where voucher_No = '"+txtVNo+"'";
		int i = jdbcTemplate.update(sql);

	int j=0;
	int qty=0;
	String prodId="";
	List<Details> qtyList = getProductdetails(txtVNo);
	for (Details details : qtyList) 
	{
		 prodId = details.getItemID();
	     qty = details.getTxtQuant1();	
		
		
			
	     String updatestk = "UPDATE product_master set opening_Stock = opening_Stock + '"+qty+"' where product_Id='"+prodId+"' ";
	      j=jdbcTemplate.update(updatestk);
			
		
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
		String url1="select quantity,product_Id from record_waste_details where voucher_Id='"+txtVNo+"'";
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
	public List<RecordWastage> showrecord() {
		sql="select * from vrecwastage";		
		return jdbcTemplate.query(sql, new RowMapper<RecordWastage>() {
			List<RecordWastageDetails> recordWastageDetailsList =new ArrayList<RecordWastageDetails>();
			@Override
			public RecordWastage mapRow(ResultSet rs, int arg1) throws SQLException {
				RecordWastage recordWastage=new RecordWastage();
				RecordWastageDetails recordWastageDetails=new RecordWastageDetails();
				recordWastage.setTxtVNo(rs.getString("voucher_No"));
				recordWastage.setDate(rs.getString("voucher_Date"));
				recordWastage.setWearehouseID(rs.getString("warehouse_Id"));
				recordWastage.setSelectWarehouse(rs.getString("warehouse_Name"));
				recordWastage.setTxtDetails(rs.getString("details"));
				recordWastageDetails.setItemID(rs.getString("product_Id"));
				recordWastageDetails.setTxtItem1(rs.getString("prod_Name"));
				recordWastageDetails.setTxtQuant1(rs.getInt("quantity"));				
				recordWastageDetails.setRemark(rs.getString("remark"));
				recordWastageDetailsList.add(recordWastageDetails);
				recordWastage.setRecordWastageDetailsList(recordWastageDetailsList);
				return recordWastage;
			}
		});
	}
	/*@Override
	public String retrivewasteAvailqty(String productId,String wID) 
	{
		String sql="select warehouse_Quantity from warehouse_details where product_Id='"+productId+"' and warehouse_Id = '"+wID+"'";
		//String sql="select opening_Stock from product_master where product_Id='"+productId+"'";
		String stock=jdbcTemplate.queryForObject(sql, String.class);
		System.out.println(stock);
		return stock; 
	}*/
	@Override
	public List<CreateNewProduct> retriveWarehouseWProd(String wID) 
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
	public String retriveWastageAvailqty(String productId,String wID) 
	{
	String sql="select warehouse_Quantity from warehouse_details where product_Id='"+productId+"' and warehouse_Id = '"+wID+"'";
		String Qty=jdbcTemplate.queryForObject(sql, String.class);
		return Qty;
	}
}