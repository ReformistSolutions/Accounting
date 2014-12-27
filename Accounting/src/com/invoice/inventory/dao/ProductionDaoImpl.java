package com.invoice.inventory.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCountCallbackHandler;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.invoice.company.beans.CompanyDetails;
import com.invoice.inventory.beans.Production;
import com.invoice.inventory.beans.ProductionDetails;
import com.invoice.inventory.beans.RawMaterialDetails;
import com.invoice.sales.beans.Order;

@Component("productionDao") 
public class ProductionDaoImpl implements ProductionDao
{

	JdbcTemplate jdbcTemplate;
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	@Autowired
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Override
	public Production generateId() 
	{
		try{
			String prodID="";
			RowCountCallbackHandler countCallback = new RowCountCallbackHandler();  // not reusable
			 jdbcTemplate.query("select * from production_header", countCallback);
			 int count = countCallback.getRowCount();
			 count++;
			 if(count<10)
			 {
				prodID="PROD00"+count;
			 }
			 else
			 {
			 if(count<99)
			 {
				prodID = "PROD0" + count;
			 }
			 else
			{
				 prodID = "PROD" + count;
			}
			 }
				 Production production=new Production();
				 production.setProductionID(prodID);				
			return production;	
			}catch(Exception e)
			{
				System.out.println(e);
				return null;
			}
	}
	@Override
	public List<Order> showOrder() 
	{
		try{
			String sql = "select sales_Order_Id from sales_order_header" ;		
			final List<Order> orderList=getJdbcTemplate().query(sql, new RowMapper<Order>() {
				private List<Order> salesorderList=new ArrayList<Order>();
				public Order mapRow(ResultSet rs,int rowNo)throws SQLException
				{
					Order salesOrder=new Order();
					salesOrder.setTxtSOID(rs.getString("sales_Order_Id")); 
					salesorderList.add(salesOrder);
					return salesOrder;
				}	
			});		
				return orderList;
			}catch(Exception e)
			{
				return null;
			}
	}
	@Override
	public List<ProductionDetails> retrivepProductDetails(String orderID) 
	{
		try{
			String sql = "select sr_No,product_Id,prod_Name,description,sales_Order_Quantity,sales_Order_Quantity,unit_Of_Measure from vsalesorder where sales_Order_Id='"+orderID+"'" ;
			final List<ProductionDetails> orderList=getJdbcTemplate().query(sql, new RowMapper<ProductionDetails>() {
				private List<ProductionDetails> salesorderList=new ArrayList<ProductionDetails>();
				public ProductionDetails mapRow(ResultSet rs,int rowNo)throws SQLException
				{
					ProductionDetails prodDetails=new ProductionDetails();
					prodDetails.setSrNo(rs.getInt("sr_No"));					
					prodDetails.setProductId(rs.getString("product_Id")); 
					prodDetails.setProductName(rs.getString("prod_Name"));
					prodDetails.setDesc(rs.getString("description"));
					prodDetails.setQuantity(rs.getInt("sales_Order_Quantity"));
					prodDetails.setUnit(rs.getString("unit_Of_Measure"));
					salesorderList.add(prodDetails);
					return prodDetails;
				}	
			});		
				return orderList;
			}catch(Exception e)
			{
				return null;
			}
	}
	@Override
	public List<RawMaterialDetails> retriveRawMaterial(String productId,final float qty) {
		try{
			final String prodId=productId;
			String sql = "select * from vrawmaterial where productId='"+productId+"' group by srNo" ;
			final List<RawMaterialDetails> rawMList=getJdbcTemplate().query(sql, new RowMapper<RawMaterialDetails>() {
				private List<RawMaterialDetails> rmList=new ArrayList<RawMaterialDetails>();
				public RawMaterialDetails mapRow(ResultSet rs,int rowNo)throws SQLException
				{
					RawMaterialDetails rawMaterialDetails=new RawMaterialDetails();
					rawMaterialDetails.setSrno(rs.getInt("srNo"));					
					rawMaterialDetails.setRawMId(rs.getString("rawMId")); 
					rawMaterialDetails.setProductName(rs.getString("rawmaterialname"));
					rawMaterialDetails.setProductId(prodId);
					rawMaterialDetails.setDesc(rs.getString("rawmaterialdes"));
					rawMaterialDetails.setReqty(rs.getFloat("requiredqty"));
					float aqty=rs.getFloat("requiredqty");	
					rawMaterialDetails.setQuantity(aqty*qty);
					rawMaterialDetails.setAvlqty(rs.getFloat("availableqty"));
					rmList.add(rawMaterialDetails);
					return rawMaterialDetails;
				}	
			});		
				return rawMList;
			}catch(Exception e)
			{
				return null;
			}
	}
	@Override
	public List<RawMaterialDetails> retriveRawMaterialList() {
		try{			
			String sql = "select * from product_master where status='Active'" ;
			final List<RawMaterialDetails> rawMList=getJdbcTemplate().query(sql, new RowMapper<RawMaterialDetails>() {
				private List<RawMaterialDetails> rmList=new ArrayList<RawMaterialDetails>();
				public RawMaterialDetails mapRow(ResultSet rs,int rowNo)throws SQLException
				{
					RawMaterialDetails rawMaterialDetails=new RawMaterialDetails();									
					rawMaterialDetails.setProductId(rs.getString("product_Id")); 
					rawMaterialDetails.setProductName(rs.getString("prod_Name"));					
					rmList.add(rawMaterialDetails);
					return rawMaterialDetails;
				}	
			});		
				return rawMList;
			}catch(Exception e)
			{
				return null;
			}
	}
	@Override
	public String retriveRMDesc(String rmId) {
		try{
		String desc =jdbcTemplate.queryForObject("select description from product_master where product_Id='"+rmId+"'", String.class);
		return desc;
		}
		catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public float retriveRMQty(String rmId,String productId) {
	
		try{
		float qty =jdbcTemplate.queryForObject("select quantity from productmasterdetails where rawMId='"+rmId+"' and productId='"+productId+"'", Float.class);
		return qty;
		}
		catch(Exception e)
		{
			return 0;
		}
	}
	@Override
	public String retriveProductDesc(String productId) {
		try{
		String desc =jdbcTemplate.queryForObject("select description from product_master where product_Id='"+productId+"'", String.class);
		return desc;
		}catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public float retriveProductQty(String productId) {
		try{
		float qty =jdbcTemplate.queryForObject("select opening_Stock from product_master where product_Id='"+productId+"'", Float.class);
		return qty;
	}catch(Exception e)
	{
		return 0;
	}
	}
	@Override
	public String retriveProductUnit(String productId) {
		try{
		String unit =jdbcTemplate.queryForObject("select unit_Of_Measure from product_master where product_Id='"+productId+"'", String.class);
		
		return unit;
	}catch(Exception e)
	{
		return null;
	}
	}
	@Override
	public int save(Production production) {
		int i1=0,i2=0,i3=0;
		java.sql.Timestamp updateDate=new java.sql.Timestamp(new java.util.Date().getTime());	 
		try{
	    String url="insert into production_header(productionID,salesorderID,date,createdBy,updatedBy,updatedate,status,orderstatus) value('"+production.getProductionID()+"','"+production.getSorderId()+"','"+production.getProdDate()+"','"+production.getCreatedBy()+"','"+production.getUpdatedBy()+"','"+updateDate+"','Active','P')";		
		i1=jdbcTemplate.update(url); 
		
			List<ProductionDetails> productList=production.getProductList();
			if(productList!=null)
			{	
				for (ProductionDetails pList : productList)			
				{	
					String sql1="insert into production_details value('"+pList.getSrNo()+"','"+pList.getProductId()+"','"+production.getProductionID()+"','"+pList.getQuantity()+"')";
					i2= jdbcTemplate.update(sql1);				
				}
			}
			List<RawMaterialDetails> rawMaterialList = production.getRawMaterialList();			
			if(!(rawMaterialList.isEmpty()))
				{	
					for (RawMaterialDetails rpList : rawMaterialList) 
					{	  
						if(rpList.getSrno() == 0)
						{
							rawMaterialList.removeAll(Collections.singleton(null));
						}
						else
						{
							String sql4="insert into production_rawmaterial value('"+rpList.getSrno()+"','"+rpList.getRawMId()+"','"+rpList.getProductId()+"','"+production.getProductionID()+"','"+rpList.getQuantity()+"')";
							i3= jdbcTemplate.update(sql4);
						}						
					}				
				}			
			if(i1>=1 && i2>=1 && i3>=1)
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
	public List<Production> showPending() {
		try{
			String sql="select * from vproduction where status='Active' and orderstatus='P'	group by productionID";	//where sales_Order_Status='Active'	
			final List<Production> purchaseList=getJdbcTemplate().query(sql, new RowMapper<Production>() {
			private List<Production> pList=new ArrayList<Production>();
			public Production mapRow(ResultSet rs,int rowNo)throws SQLException
			{
				Production production=new Production();
				production.setProductionID(rs.getString("productionID"));
				production.setSorderId(rs.getString("salesorderID"));	
				DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy"); 
			    String pDate=dateFormat.format(rs.getDate("date"));
				production.setProdDate(pDate);
				production.setProductionstatus(rs.getString("orderstatus"));
				pList.add(production);
				return production;
			}	
		});		
			return purchaseList;
			}catch(Exception e)
			{
				System.out.println(e);
				return null;
			}
	}
	@Override
	public List<Production> showCompleted() {
		try{
			String sql="select * from vproduction where status='Active' and orderstatus='C'	group by productionID";	//where sales_Order_Status='Active'	
			final List<Production> purchaseList=getJdbcTemplate().query(sql, new RowMapper<Production>() {
			private List<Production> pList=new ArrayList<Production>();
			public Production mapRow(ResultSet rs,int rowNo)throws SQLException
			{
				Production production=new Production();
				production.setProductionID(rs.getString("productionID"));
				production.setSorderId(rs.getString("salesorderID"));
				DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy"); 
			    String pDate=dateFormat.format(rs.getDate("date"));
				production.setProdDate(pDate);
				production.setProductionstatus(rs.getString("orderstatus"));
				pList.add(production);
				return production;
			}	
		});		
			return purchaseList;
			}catch(Exception e)
			{
				System.out.println(e);
				return null;
			}
	}
	@Override
	public int completeProductionOrder(Production production) {
		try{
			 int i=0,i1=0,i2=0;
			 String productId="";
			 float qty=0;
			 DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");	     
		     Date date = new Date();	     
		     String completedDate=dateFormat.format(date);	     
		     
		     for (ProductionDetails productList : (getProductId(production.getProductionID()))) 
		     {
		    	 productId=productList.getProductId();
		    	 qty=productList.getQuantity();
		    	 
		    	 String updateWarehouseProducts="UPDATE warehouse_details SET warehouse_Quantity=warehouse_Quantity+'"+qty+"' where warehouse_Id='"+production.getWarehouse()+"' and product_Id='"+productId+"'";
		    	 i=jdbcTemplate.update(updateWarehouseProducts);
		    	 
		    	 String updateProducts="UPDATE product_master SET opening_Stock=opening_Stock+'"+qty+"' where product_Id='"+productId+"'";
		    	 i1=jdbcTemplate.update(updateProducts);
			 }
		   
			 String url="Update production_header set completedDate='"+completedDate+"',"+"orderstatus='C' where productionID='"+production.getProductionID()+"'";
			 i2=jdbcTemplate.update(url);
			 if(i>0 && i1>0 && i2>0)
			 {
				 return 1;
			 }
			 else
			 {
				 return 0;
			 }
		}
		catch(Exception e)
		{
			System.out.println(e);
			return 0;
		}
		
	}
	@Override
	public int deleteProductionOrder(String productionId) {
		try{
			String url="Update production_header set status='Inactive' where productionID='"+productionId+"'";
			int i=jdbcTemplate.update(url);
			return i;
		}
		catch(Exception e)
		{
			System.out.println(e);
			return 0;
		}
		
	}
	@Override
	public List<Production> edit(String productionId) {
		try{
			final String pid=productionId;			
			String sql="select * from vproduction where productionID='"+productionId+"'  group by srNo";		
			return jdbcTemplate.query(sql, new RowMapper<Production>() {
				List<ProductionDetails> prodDetails =new ArrayList<ProductionDetails>();
				List<RawMaterialDetails> rawMaterialList = new ArrayList<RawMaterialDetails>();	
				@Override
				public Production mapRow(ResultSet rs, int arg1) throws SQLException {					
					Production production=new Production();
					ProductionDetails productionDetails=new ProductionDetails();					
					production.setProductionID(rs.getString("productionID"));					
					production.setSorderId(rs.getString("salesorderID"));	
					DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy"); 
				    String pDate=dateFormat.format(rs.getDate("date"));
					production.setProdDate(pDate);	
					production.setProductionstatus(rs.getString("orderstatus"));	
					if(rs.getDate("completedDate") != null)
					{
						String completedDate=dateFormat.format(rs.getDate("completedDate"));
						production.setCompletedDate(completedDate);
					}
					productionDetails.setSrNo(rs.getInt("srNo"));
					productionDetails.setProductId(rs.getString("productId"));
					String productId=rs.getString("productId");
					productionDetails.setProductName(rs.getString("prod_Name"));
					productionDetails.setDesc(rs.getString("description"));
					productionDetails.setQuantity(rs.getFloat("quantity"));
					productionDetails.setUnit(rs.getString("unit_Of_Measure"));						
					prodDetails.add(productionDetails);
					production.setProductList(prodDetails);	
					rawMaterialList.addAll(editRawMaterial(pid,productId));	
					production.setRawMaterialList(rawMaterialList);						
					return production;
				}
			});
			}catch(Exception e)
			{
				System.out.println(e);
				return null;
			}
	}
	@Override
	public List<RawMaterialDetails> showRawMaterial(String productionId,String productId) {
		try{
			String sql="select * from vproductionrawmaterial where productionID='"+productionId+"' and productId='"+productId+"' group by srNo";		
			final List<RawMaterialDetails> rList=jdbcTemplate.query(sql, new RowMapper<RawMaterialDetails>() {
				List<RawMaterialDetails> rawMDetails =new ArrayList<RawMaterialDetails>();
				@Override
				public RawMaterialDetails mapRow(ResultSet rs, int arg1) throws SQLException {					
					RawMaterialDetails rawMaterialDetails=new RawMaterialDetails();	
					rawMaterialDetails.setSrno(rs.getInt("srNo"));
					rawMaterialDetails.setRawMId(rs.getString("rawMId"));					
					rawMaterialDetails.setProductName(rs.getString("rawMaterialName"));
					rawMaterialDetails.setDesc(rs.getString("description"));
					rawMaterialDetails.setReqty(rs.getFloat("reqQuantity"));
					rawMaterialDetails.setAvlqty(rs.getFloat("availableQty"));
					rawMaterialDetails.setProductId(rs.getString("productId"));
					rawMaterialDetails.setQuantity(rs.getFloat("totalQuantity"));					
					rawMDetails.add(rawMaterialDetails);							
					return rawMaterialDetails;
				}
			});
			return rList;
			}catch(Exception e)
			{
				System.out.println(e);
				return null;
			}
	}
	private List<RawMaterialDetails> editRawMaterial(String productionId,String productId) {
		try{
			String sql="select * from vproductionrawmaterial where productionID='"+productionId+"' and productId='"+productId+"' group by srNo,rawMId";		
			final List<RawMaterialDetails> rList=jdbcTemplate.query(sql, new RowMapper<RawMaterialDetails>() {
				List<RawMaterialDetails> rawMDetails =new ArrayList<RawMaterialDetails>();
				@Override
				public RawMaterialDetails mapRow(ResultSet rs, int arg1) throws SQLException {					
					RawMaterialDetails rawMaterialDetails=new RawMaterialDetails();	
					rawMaterialDetails.setSrno(rs.getInt("srNo"));
					rawMaterialDetails.setRawMId(rs.getString("rawMId"));					
					rawMaterialDetails.setProductName(rs.getString("rawMaterialName"));
					rawMaterialDetails.setDesc(rs.getString("description"));
					rawMaterialDetails.setUnitm(rs.getString("unit_Of_Measure"));
					rawMaterialDetails.setReqty(rs.getFloat("reqQuantity"));
					rawMaterialDetails.setAvlqty(rs.getFloat("availableQty"));
					rawMaterialDetails.setProductId(rs.getString("productId"));
					rawMaterialDetails.setQuantity(rs.getFloat("totalQuantity"));					
					rawMDetails.add(rawMaterialDetails);							
					return rawMaterialDetails;
				}
			});
			return rList;
			}catch(Exception e)
			{
				System.out.println(e);
				return null;
			}
	}
	private List<ProductionDetails> getProductId(String productionId)
	{
		try{
			String sql="select * from vproduction where status='Active' and orderstatus='P' and productionID='"+productionId+"'	group by srNo";	//where sales_Order_Status='Active'	
			final List<ProductionDetails> productList=getJdbcTemplate().query(sql, new RowMapper<ProductionDetails>() {
			private List<ProductionDetails> pList=new ArrayList<ProductionDetails>();
			public ProductionDetails mapRow(ResultSet rs,int rowNo)throws SQLException
			{
				ProductionDetails productionDetails=new ProductionDetails();
				productionDetails.setSrNo(rs.getInt("srNo"));
				productionDetails.setProductId(rs.getString("productId"));
				productionDetails.setProductName(rs.getString("prod_Name"));
				productionDetails.setQuantity(rs.getFloat("quantity"));				
				pList.add(productionDetails);
				return productionDetails;
			}	
		});		
			return productList;
			}catch(Exception e)
			{
				System.out.println(e);
				return null;
			}		
	}
	@Override
	public int updateProduction(Production production) {
		try
		{
			int i=0,i1=0,i2=0;
			 DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");	     
		     Date date = new Date();	     
		     String dt=dateFormat.format(date);		     
		     String updateUrl="UPDATE production_header SET salesorderID='"+production.getSorderId()+"',"+"date='"+production.getProdDate()+"',"+"createdBy='"+production.getCreatedBy()+"',"+"updatedBy='"+production.getUpdatedBy()+"',"+"updatedate='"+dt+"' where productionID='"+production.getProductionID()+"'";
		     i=jdbcTemplate.update(updateUrl);
		     
		     deleteList(production.getProductionID());
		     deleteRawMaterialList(production.getProductionID());
		     List<ProductionDetails> productList=production.getProductList();
				if(productList!=null)
				{	
					for (ProductionDetails pList : productList)			
					{	
						String sql1="insert into production_details value('"+pList.getSrNo()+"','"+pList.getProductId()+"','"+production.getProductionID()+"','"+pList.getQuantity()+"')";
						i1= jdbcTemplate.update(sql1);				
					}
				}
				List<RawMaterialDetails> rawMaterialList = production.getRawMaterialList();			
				if(!(rawMaterialList.isEmpty()))
					{	
						for (RawMaterialDetails rpList : rawMaterialList) 
						{	  
							if(rpList.getSrno() == 0)
							{
								rawMaterialList.removeAll(Collections.singleton(null));
							}
							else
							{
								String sql4="insert into production_rawmaterial value('"+rpList.getSrno()+"','"+rpList.getRawMId()+"','"+rpList.getProductId()+"','"+production.getProductionID()+"','"+rpList.getQuantity()+"')";
								i2= jdbcTemplate.update(sql4);
							}						
						}				
					}	
		     if(i>0 && i1>0 && i2>0)
				{
					return 1;
				}
		      else
		      	{
		    	    return 0;
		      	}
		}
		catch(Exception e)
		{
			System.out.println(e);
			return 0;
		}		
	}
	private void deleteList(String productionId){
		String deleteListUrl="DELETE FROM production_details WHERE productionId= '"+productionId+"'";
		jdbcTemplate.update(deleteListUrl);
	}
	private void deleteRawMaterialList(String productionId){
		String deleteListUrl="DELETE FROM production_rawmaterial WHERE productionId= '"+productionId+"'";
		jdbcTemplate.update(deleteListUrl);
	}
	public List<CompanyDetails> getInfo(CompanyDetails companyDetails)
	{
		try{
			 String sql="select comp_Name,comp_Address,comp_Contact,comp_Mail,comp_Website,vatNo,cstNo,comp_desc,terms from comp_details";		
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
				enq.setVatNo(rs.getString("vatNo"));
				enq.setCstNo(rs.getString("cstNo"));
				enq.setCompDesc(rs.getString("comp_desc"));
				enq.setCompTerms(rs.getString("terms"));
				companyList.add(enq);				
				return enq;
			}	
		});		
			return comList;
		}catch(Exception e)
		{
			return null;
		}
	}
}

