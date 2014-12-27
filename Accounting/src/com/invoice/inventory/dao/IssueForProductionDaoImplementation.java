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
import com.invoice.inventory.beans.IssueForProduction;
import com.invoice.inventory.beans.Warehouse;

@Component(value="issueForProductionDao")
public class IssueForProductionDaoImplementation implements IssueForProductionDao{

	private static String sql,sql1,sql2;	
	private JdbcTemplate jdbcTemplate;
	
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	@Autowired
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
//SAVE
	public int save(final IssueForProduction issueForProduction){
		 int iD=0,j=0;
		 
		
		 
		 String url="insert into issue_for_product_header value('"+issueForProduction.getTxtVNo()+"','"+issueForProduction.getDate()+"','"+issueForProduction.getSelectWarehouse()+"','"+issueForProduction.getTxtDetails()+"','"+issueForProduction.getStatus()+"')";
		 int i=jdbcTemplate.update(url); 
       List<Details> issueForProdList=issueForProduction.getProductList();
		for (Details issueForProdDetailList : issueForProdList)			
		{			 
			 sql1="insert into issue_for_product_details value('"+issueForProdDetailList.getTxtSrNo1()+"','"+issueForProduction.getTxtVNo()+"','"+issueForProdDetailList.getTxtItem1()+"','"+issueForProdDetailList.getTxtQuant1()+"')";
			 iD= jdbcTemplate.update(sql1);
			 sql2 = "UPDATE product_master set opening_Stock = opening_Stock - '"+issueForProdDetailList.getTxtQuant1()+"' where product_Id='"+issueForProdDetailList.getTxtItem1()+"' ";
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
	public List<IssueForProduction> showIssueProdList() {
		String sql="select * from vissueforprod where status = 'Active' group by voucher_No";		
		final List<IssueForProduction> issueForProdList=getJdbcTemplate().query(sql, new RowMapper<IssueForProduction>() {
		private List<IssueForProduction> issueForProdList1=new ArrayList<IssueForProduction>();
		public IssueForProduction mapRow(ResultSet rs,int rowNo)throws SQLException
		{
			IssueForProduction issueForProduction=new IssueForProduction();
			issueForProduction.setTxtVNo(rs.getString("voucher_No"));
			issueForProduction.setDate(rs.getString("voucher_Date"));
			issueForProduction.setSelectWarehouse(rs.getString("warehouse_Name"));
			issueForProduction.setTxtDetails(rs.getString("voucher_Details"));
			issueForProdList1.add(issueForProduction);
			return issueForProduction;
		}		
	});		
		return issueForProdList;
	}
//EDIT
@Override
	public List<IssueForProduction> editIssueForProduction(String txtVNo) { 
		sql="select * from vissueforprod where voucher_No='"+txtVNo+"'";
		return jdbcTemplate.query(sql, new RowMapper<IssueForProduction>() {
			List<Details> issueForProductionDetailsList =new ArrayList<Details>();
			@Override
			public IssueForProduction mapRow(ResultSet rs, int arg1) throws SQLException {
				IssueForProduction issueForPrdctn=new IssueForProduction();
				Details issueForProductionDetails=new Details();
				issueForPrdctn.setTxtVNo(rs.getString("voucher_No"));
				issueForPrdctn.setDate(rs.getString("voucher_Date"));
				issueForPrdctn.setWearehouseID(rs.getString("warehouse_Id"));
				issueForPrdctn.setSelectWarehouse(rs.getString("warehouse_Name"));
				issueForPrdctn.setTxtDetails(rs.getString("voucher_Details"));
				
				issueForProductionDetails.setTxtSrNo1(rs.getInt("sr_No"));
				issueForProductionDetails.setItemID(rs.getString("product_Id"));
				issueForProductionDetails.setTxtItem1(rs.getString("prod_Name"));				
				issueForProductionDetails.setTxtQuant1(rs.getInt("quantity"));
				issueForProductionDetailsList.add(issueForProductionDetails);
				
				issueForPrdctn.setProductList(issueForProductionDetailsList);
				return issueForPrdctn;
			} 
		});
	}
//UPDATE 
@Override 
public int updateIssueForProduct(IssueForProduction issueForProduction) {
	int j=0;	
	String sql="UPDATE issue_for_product_header SET voucher_Date='"+issueForProduction.getDate()+"',"+"voucher_Details='"+issueForProduction.getTxtDetails()+"'  WHERE voucher_No='"+issueForProduction.getTxtVNo()+"'";
	int i=jdbcTemplate.update(sql);
	String voucher_number=issueForProduction.getTxtVNo();
	 

	
	int prevqty=0;
	String prodId="";
	List<Details> qtyList = getProductdetails(voucher_number);
	for (Details details : qtyList) 
	{
		 prodId = details.getItemID();
	     prevqty = details.getTxtQuant1();	
	}
	deleteList(voucher_number);	
	
	  List<Details> issueForProdList=issueForProduction.getProductList();
			for (Details issueForProdDetailList : issueForProdList)
			{
				
				 
				 sql1="insert into issue_for_product_details value('"+issueForProdDetailList.getTxtSrNo1()+"','"+issueForProduction.getTxtVNo()+"','"+issueForProdDetailList.getTxtItem1()+"','"+issueForProdDetailList.getTxtQuant1()+"')";
				 j= jdbcTemplate.update(sql1);	
				 
				 int currentqty = issueForProdDetailList.getTxtQuant1();
				 if(currentqty < prevqty)
				 {
					String updatenewqty = "UPDATE product_master set opening_Stock = opening_Stock + '"+currentqty+"' where product_Id='"+issueForProdDetailList.getTxtItem1()+"' ";
					 j = jdbcTemplate.update(updatenewqty); 
		
				 }
				 else
				 {
					 int newqty=currentqty - prevqty;
					 String updatenewqty1 = "UPDATE product_master set opening_Stock = opening_Stock - '"+newqty+"' where product_Id='"+issueForProdDetailList.getTxtItem1()+"' ";
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
private void deleteList(String voucher_number){
	

	
	String deleteListUrl="DELETE FROM issue_for_product_details WHERE voucher_No= '"+voucher_number+"'";	
	jdbcTemplate.update(deleteListUrl);
}
//AUTO GENERATE ID
@Override
public IssueForProduction generateIssueID() {
	String txtVNo="";
	RowCountCallbackHandler countCallback = new RowCountCallbackHandler();  // not reusable
	 jdbcTemplate.query("select * from issue_for_product_header", countCallback);
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
	 IssueForProduction issueForProduction=new IssueForProduction();
	 issueForProduction.setTxtVNo(txtVNo);
	return issueForProduction;
}
//AUTO FETCH DATA
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
	String sql = "update issue_for_product_header set status = '"+status+"' where voucher_No='"+txtVNo+"'";
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
	String url1="select quantity,product_Id from issue_for_product_details where voucher_No='"+txtVNo+"'";
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
@Override
public String retriveStock(String productId) {
	
	String sql="select opening_Stock from product_master where product_Id='"+productId+"'";
	String stock=jdbcTemplate.queryForObject(sql, String.class);
	return stock;
}


}