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


@Component(value="createNewProductDao")
public class CreateNewProductDaoImplementation implements CreateNewProductDao {

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
	public int save(CreateNewProduct createNewProduct) {
				String status = "Active";
				int iD = 0, i = 0,k=0;
				try{
				String type = createNewProduct.getProductType();
				if(type.equalsIgnoreCase("Sale Item"))
				{
					sql = "insert into product_master value('"+ createNewProduct.getProductCode() + "','"+ createNewProduct.getTxtName() + "','"+ createNewProduct.getInventory() + "','"+ createNewProduct.getTxtOpeningStock() + "','"+ createNewProduct.getTxtDes() + "','"+ createNewProduct.getTxtUnitOfMeasure() + "','"+ createNewProduct.getTxtReorderlevel() + "','"+ createNewProduct.getProductType() + "','" + status+ "','" + createNewProduct.getTxtSalesPrice() + "','"+ createNewProduct.getTxtPurchasePrice() + "')";
					i = jdbcTemplate.update(sql);
					
					List<Details> newproductList = createNewProduct.getCreateNewPdetails();
					for (Details newProductDetailsList : newproductList)
						{
							String sql1 = "insert into productmasterdetails value('"+ newProductDetailsList.getTxtSrNo1() + "','"+ newProductDetailsList.getTxtItem1() + "','"+ createNewProduct.getProductCode() + "','"+ newProductDetailsList.getQuantity() + "')";
							iD = jdbcTemplate.update(sql1);
						} 
					String warehouseID = jdbcTemplate.queryForObject("select warehouse_Id from warehouse_header where warehouse_Name = 'Default Warehouse' ", String.class);
					String sq = "insert into warehouse_details(warehouse_Id,product_Id,warehouse_Quantity,status)value('"+warehouseID+"','"+createNewProduct.getProductCode()+"','"+createNewProduct.getTxtOpeningStock()+"','"+status+"')";
					k=jdbcTemplate.update(sq);
				}
				else if(type.equalsIgnoreCase("Resale Product"))
				{
					sql = "insert into product_master value('"+ createNewProduct.getProductCode() + "','"+ createNewProduct.getTxtName() + "','"+ createNewProduct.getInventory() + "','"+ createNewProduct.getTxtOpeningStock() + "','"+ createNewProduct.getTxtDes() + "','"+ createNewProduct.getTxtUnitOfMeasure() + "','"+ createNewProduct.getTxtReorderlevel() + "','"+ createNewProduct.getProductType() + "','" + status+ "','" + createNewProduct.getTxtSalesPrice() + "','"+ createNewProduct.getTxtPurchasePrice() + "')";
					i = jdbcTemplate.update(sql);
					
					String warehouseID = jdbcTemplate.queryForObject("select warehouse_Id from warehouse_header where warehouse_Name = 'Default Warehouse' ", String.class);
					String sq = "insert into warehouse_details(warehouse_Id,product_Id,warehouse_Quantity,status)value('"+warehouseID+"','"+createNewProduct.getProductCode()+"','"+createNewProduct.getTxtOpeningStock()+"','"+status+"')";
					k=jdbcTemplate.update(sq);		
				}
				else if(type.equalsIgnoreCase("Purchase Item"))
				{
					sql = "insert into product_master value('"+ createNewProduct.getProductCode() + "','"+ createNewProduct.getTxtName() + "','"+ createNewProduct.getInventory() + "','"+ createNewProduct.getTxtOpeningStock() + "','"+ createNewProduct.getTxtDes() + "','"+ createNewProduct.getTxtUnitOfMeasure() + "','"+ createNewProduct.getTxtReorderlevel() + "','"+ createNewProduct.getProductType() + "','" + status+ "','" + createNewProduct.getTxtSalesPrice() + "','"+ createNewProduct.getTxtPurchasePrice() + "')";
					i = jdbcTemplate.update(sql);
					
					String warehouseID = jdbcTemplate.queryForObject("select warehouse_Id from warehouse_header where warehouse_Name = 'Default Warehouse' ", String.class);
					String sq = "insert into warehouse_details(warehouse_Id,product_Id,warehouse_Quantity,status)value('"+warehouseID+"','"+createNewProduct.getProductCode()+"','"+createNewProduct.getTxtOpeningStock()+"','"+status+"')";
					k=jdbcTemplate.update(sq);
				}	
				if (i >= 1)  
				{
					return 1;
				} 
				else if(iD >=1)
				{
					return 1;
				}
				else if(k >=1)
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
	public List<CreateNewProduct> show() {
		try{
		String sql="select * from product_master where status = 'Active'  group by product_Id";		
		final List<CreateNewProduct> prodList=getJdbcTemplate().query(sql, new RowMapper<CreateNewProduct>() {
		private List<CreateNewProduct> productList=new ArrayList<CreateNewProduct>();
		public CreateNewProduct mapRow(ResultSet rs,int rowNo)throws SQLException
		{
			CreateNewProduct createNewProduct=new CreateNewProduct();
			createNewProduct.setProductCode(rs.getString("product_Id"));
			createNewProduct.setTxtName(rs.getString("prod_Name"));
			createNewProduct.setProductType(rs.getString("prod_Type"));
			createNewProduct.setTxtOpeningStock(rs.getFloat("opening_Stock"));
			createNewProduct.setTxtDes(rs.getString("description"));
			createNewProduct.setTxtUnitOfMeasure(rs.getString("unit_Of_Measure"));
			createNewProduct.setTxtReorderlevel(rs.getString("reorder_Level"));		
			createNewProduct.setTxtSalesPrice(rs.getFloat("sales_Price"));
			createNewProduct.setTxtPurchasePrice(rs.getFloat("purchase_Price"));
			productList.add(createNewProduct);
			return createNewProduct;
		}
		
	});		
		return prodList;
		}catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public List<CreateNewProduct> ViewCreateNewProduct(String productCode) {
		try{
		String sql="select product_Id,prod_Name,description,unit_Of_Measure,opening_Stock,reorder_Level,sales_Price,purchase_Price from product_master where product_Id='"+productCode+"'";	
		return jdbcTemplate.query(sql, new RowMapper<CreateNewProduct>(){
			List<CreateNewProduct> productList = new ArrayList<CreateNewProduct>();
			public CreateNewProduct mapRow(ResultSet rs, int rowNo) throws SQLException {
				CreateNewProduct  creat= new CreateNewProduct();
				
				creat.setProductCode(rs.getString("product_Id"));
				creat.setTxtName(rs.getString("prod_Name"));
				creat.setTxtOpeningStock(rs.getFloat("opening_Stock"));
				creat.setTxtUnitOfMeasure(rs.getString("unit_Of_Measure"));				
				creat.setTxtReorderlevel(rs.getString("reorder_Level"));
				creat.setTxtSalesPrice(rs.getFloat("sales_Price"));
				creat.setTxtPurchasePrice(rs.getFloat("purchase_Price"));
				productList.add(creat);
				return creat;
			}			
		});
		}catch(Exception e)
		{
			return null;
		}

	}

	@Override
	public CreateNewProduct generateID() {
		try{
		String productCode="";
		RowCountCallbackHandler countCallback = new RowCountCallbackHandler();  // not reusable
		 jdbcTemplate.query("select * from product_master", countCallback);
		 int count = countCallback.getRowCount();
		 count++;
		 if(count<10)
		 {
			 productCode="PRO00"+count;
		 }
		 else
		 {
		 if(count<99)
		 {
			 productCode = "PRO0" + count;
		 }
		 else
		{
			 productCode = "PRO" + count;
		}
		 }
		 CreateNewProduct createNewProduct=new CreateNewProduct();
		 createNewProduct.setProductCode(productCode);
		return createNewProduct;
		}catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public List<CompanyDetails> getInfo(CompanyDetails companyDetails) {
		try{
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
		}catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public int delete(String productCode) {
		try{
		String status = "InActive";
		String sql = "update product_master set status = '"+status+"' where product_Id = '"+productCode+"' ";
		int i = jdbcTemplate.update(sql);
		return i;
		}catch(Exception e)
		{
			return 0;
		}
	}
	@Override
	public List<CreateNewProduct> showwarehouseDetails(String warehouseId) {

		String sql = "select b1.product_id,p1.prod_Name,p1.opening_Stock,p1.unit_Of_Measure,p1.description,p1.reorder_Level from warehouse_header a1,warehouse_details b1,product_master p1 where  a1.warehouse_id = b1.warehouse_id AND  b1.product_id = p1.product_id AND a1.warehouse_id = '"
				+ warehouseId + "' ";
		final List<CreateNewProduct> prodList = getJdbcTemplate().query(sql,
				new RowMapper<CreateNewProduct>() {
					private List<CreateNewProduct> productList = new ArrayList<CreateNewProduct>();

					public CreateNewProduct mapRow(ResultSet rs, int rowNo)
							throws SQLException {
						CreateNewProduct createNewProduct = new CreateNewProduct();
						createNewProduct.setProductCode(rs.getString("product_Id"));
						createNewProduct.setTxtName(rs.getString("prod_Name"));
						createNewProduct.setTxtOpeningStock(rs.getFloat("opening_Stock"));
						createNewProduct.setTxtDes(rs.getString("description"));
						createNewProduct.setTxtUnitOfMeasure(rs.getString("unit_Of_Measure"));
						createNewProduct.setTxtReorderlevel(rs.getString("reorder_Level"));
						productList.add(createNewProduct);
						return createNewProduct;
					}

				});
		return prodList;
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
	public List<Details> showProductDetails(String productCode) 
	{
		//String sql1="select pd.srNo,pd.rawMId,p.unit_Of_Measure,p.description,pd.quantity,p.prod_Name from product_master p,productmasterdetails pd where pd.productId = p.product_Id and p.product_Id = '"+productCode+"' ;";	
		String sql1 = "select * from vproductdetails where productId = '"+productCode+"'";
		final List<Details> detailsList=getJdbcTemplate().query(sql1, new RowMapper<Details>() {
		private List<Details> dList=new ArrayList<Details>();
		public Details mapRow(ResultSet rs,int rowNo)throws SQLException
		{
			Details details=new Details();
			details.setTxtSrNo1(rs.getInt("srNo"));
			details.setTxtItem1(rs.getString("rawMId"));
			details.setProdName(rs.getString("prod_Name"));
 			details.setUnit(rs.getString("unit_Of_Measure"));
			details.setDecription(rs.getString("description"));						
			details.setQuantity(rs.getFloat("quantity"));
			dList.add(details);
			return details;
		}	
		});	
		return detailsList;
	}
	@Override
	public List<CreateNewProduct> editCreateNewProduct(String productCode) 
	{
		try
		{
			List<CreateNewProduct> createNewProducts = new ArrayList<CreateNewProduct>();			
			String prod_Type = jdbcTemplate.queryForObject("select prod_Type from product_master where product_Id = '"+productCode+"' ", String.class);
			if (prod_Type.equalsIgnoreCase("Resale Product") || prod_Type.equalsIgnoreCase("Purchase Item")) 
			{
				String sql = "select * from product_master where product_Id = '"+productCode+"'";
				createNewProducts = getJdbcTemplate().query(sql, new RowMapper<CreateNewProduct>(){
					private List<CreateNewProduct> productList = new ArrayList<CreateNewProduct>();
					@Override
					public CreateNewProduct mapRow(ResultSet rs, int rowNo) throws SQLException 
					{
						CreateNewProduct createNewProduct = new CreateNewProduct();
						createNewProduct.setProductCode(rs.getString("product_Id"));
						createNewProduct.setTxtName(rs.getString("prod_Name"));
						createNewProduct.setInventory(rs.getString("inventory"));
						createNewProduct.setProductType(rs.getString("prod_Type"));
						createNewProduct.setTxtOpeningStock(rs.getFloat("opening_Stock"));
						createNewProduct.setTxtReorderlevel(rs.getString("reorder_Level"));
						createNewProduct.setTxtUnitOfMeasure(rs.getString("unit_Of_Measure"));
						createNewProduct.setTxtSalesPrice(rs.getFloat("sales_Price"));
						createNewProduct.setTxtPurchasePrice(rs.getFloat("purchase_Price"));
						createNewProduct.setTxtDes(rs.getString("description"));
						productList.add(createNewProduct);
						return createNewProduct;
					}					
				});
				return createNewProducts;
			} 
			else if(prod_Type.equalsIgnoreCase("Sale Item"))
			{
				String sql = "select * from vcreatenewproduct where product_Id = '"+productCode+"'";
				createNewProducts =  getJdbcTemplate().query(sql, new RowMapper<CreateNewProduct>(){
					List<Details> detailsList = new ArrayList<Details>();
					@Override
					public CreateNewProduct mapRow(ResultSet rs, int rowNo) throws SQLException 
					{
						CreateNewProduct productList = new CreateNewProduct();
						Details dList = new Details();
						
						productList.setProductCode(rs.getString("product_Id"));
						productList.setTxtName(rs.getString("prod_Name"));
						productList.setInventory(rs.getString("inventory"));
						productList.setTxtOpeningStock(rs.getFloat("opening_Stock"));
						productList.setTxtReorderlevel(rs.getString("reorder_Level"));
						productList.setProductType(rs.getString("prod_Type"));
						productList.setTxtUnitOfMeasure(rs.getString("unit_Of_Measure"));
						productList.setTxtSalesPrice(rs.getFloat("sales_Price"));
						productList.setTxtPurchasePrice(rs.getFloat("purchase_Price"));
						productList.setTxtDes(rs.getString("description"));
						
						dList.setTxtSrNo1(rs.getInt("srNo"));
						dList.setTxtItem1(rs.getString("prod_Name"));
						dList.setUnit(rs.getString("unit_Of_Measure"));
						dList.setDecription(rs.getString("description"));						
						dList.setQuantity(rs.getFloat("quantity"));
						
						detailsList.add(dList);
						productList.setCreateNewPdetails(detailsList);
						return productList;
					}
				});
				return createNewProducts;
				/*createNewProducts = getJdbcTemplate().query(sql, new RowMapper<CreateNewProduct>(){
					private List<CreateNewProduct> productList = new ArrayList<CreateNewProduct>();
					@Override
					public CreateNewProduct mapRow(ResultSet rs, int rowNo) throws SQLException 
					{
						CreateNewProduct createNewProduct = new CreateNewProduct();
						createNewProduct.setProductCode(rs.getString("product_Id"));
						createNewProduct.setTxtName(rs.getString("prod_Name"));
						createNewProduct.setInventory(rs.getString("inventory"));
						createNewProduct.setProductType(rs.getString("prod_Type"));
						createNewProduct.setTxtOpeningStock(rs.getFloat("opening_Stock"));
						createNewProduct.setTxtReorderlevel(rs.getString("reorder_Level"));
						createNewProduct.setTxtUnitOfMeasure(rs.getString("unit_Of_Measure"));
						createNewProduct.setTxtSalesPrice(rs.getFloat("sales_Price"));
						createNewProduct.setTxtPurchasePrice(rs.getFloat("purchase_Price"));
						createNewProduct.setTxtDes(rs.getString("description"));
						productList.add(createNewProduct);
						return createNewProduct;
					}					
				});
				return createNewProducts;*/
				/*String sql = "select p.product_Id,p.prod_Name,p.unit_Of_Measure,p.description,p.inventory,p.opening_Stock,p.description,p.unit_Of_Measure,p.reorder_Level,p.prod_Type,p.sales_Price,p.purchase_Price,p1.srNo,p1.rawMId,p1.quantity from productmasterdetails p1,product_master p where p.product_Id = p1.productId and p.product_Id = '"+productCode+"'";
				createNewProducts =  getJdbcTemplate().query(sql, new RowMapper<CreateNewProduct>(){
					List<Details> detailsList = new ArrayList<Details>();
					@Override
					public CreateNewProduct mapRow(ResultSet rs, int rowNo) throws SQLException 
					{
						CreateNewProduct productList = new CreateNewProduct();
						Details dList = new Details();
						
						productList.setProductCode(rs.getString("product_Id"));
						productList.setTxtName(rs.getString("prod_Name"));
						productList.setInventory(rs.getString("inventory"));
						productList.setTxtOpeningStock(rs.getFloat("opening_Stock"));
						productList.setTxtReorderlevel(rs.getString("reorder_Level"));
						productList.setProductType(rs.getString("prod_Type"));
						productList.setTxtUnitOfMeasure(rs.getString("unit_Of_Measure"));
						productList.setTxtSalesPrice(rs.getFloat("sales_Price"));
						productList.setTxtPurchasePrice(rs.getFloat("purchase_Price"));
						productList.setTxtDes(rs.getString("description"));
						
						dList.setTxtSrNo1(rs.getInt("srNo"));
						dList.setTxtItem1(rs.getString("rawMId"));
						dList.setUnit(rs.getString("unit_Of_Measure"));
						dList.setDecription(rs.getString("description"));						
						dList.setQuantity(rs.getFloat("quantity"));
						
						detailsList.add(dList);
						productList.setCreateNewPdetails(detailsList);
						return productList;
					}
				});
				return createNewProducts;*/
			}
			return createNewProducts;
		}catch(Exception e)
		{
			System.out.println(e); 
			return null;
		}
	}
	
	// update new product
	@Override
	public int updateProduct(CreateNewProduct createNewProduct) 
	{
		int i=0,j=0;
		try{
		String prod_Type = jdbcTemplate.queryForObject("select prod_Type from product_master where product_Id = '"+createNewProduct.getProductCode()+"' ", String.class);
		if(prod_Type.equalsIgnoreCase("Resale Product") || prod_Type.equalsIgnoreCase("Purchase Item")) 
		{
			String sql = "UPDATE product_master SET prod_Name='"+ createNewProduct.getTxtName() + "'," + " opening_Stock='"+ createNewProduct.getTxtOpeningStock() + "',"+ "description='" + createNewProduct.getTxtDes() + "',"+ "unit_Of_Measure='" + createNewProduct.getTxtUnitOfMeasure()+ "'," + "reorder_Level='"+ createNewProduct.getTxtReorderlevel() + "',"+ "sales_Price='" + createNewProduct.getTxtSalesPrice() + "',"+ "purchase_Price='" + createNewProduct.getTxtPurchasePrice()+ "'  WHERE product_Id='" + createNewProduct.getProductCode()+ "'";
			i = jdbcTemplate.update(sql);
		}
		else if(prod_Type.equalsIgnoreCase("Sale Item"))
		{
			String sql1 = "UPDATE product_master SET prod_Name='"+ createNewProduct.getTxtName() + "'," + " opening_Stock='"+ createNewProduct.getTxtOpeningStock() + "',"+ "description='" + createNewProduct.getTxtDes() + "',"+ "unit_Of_Measure='" + createNewProduct.getTxtUnitOfMeasure()+ "'," + "reorder_Level='"+ createNewProduct.getTxtReorderlevel() + "',"+ "sales_Price='" + createNewProduct.getTxtSalesPrice() + "',"+ "purchase_Price='" + createNewProduct.getTxtPurchasePrice()+ "'  WHERE product_Id='" + createNewProduct.getProductCode()+ "'";
			i = jdbcTemplate.update(sql1);
			
			String productID = createNewProduct.getProductCode();
			deleteList(productID);
			
			List<Details> detaillist = createNewProduct.getCreateNewPdetails();
			for (Details newProductDetailsList : detaillist) 
			{
				String sql2 = "insert into productmasterdetails value('"+ newProductDetailsList.getTxtSrNo1() + "','"+ newProductDetailsList.getTxtItem1() + "','"+ createNewProduct.getProductCode() + "','"+ newProductDetailsList.getQuantity() + "')";
				j = jdbcTemplate.update(sql2);
			}
		}
		
		
		if(i>0) 
		{
			return 1;
		}
		else if(j>0) 
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

	private void deleteList(String productID) 
	{
		String del = "delete from productmasterdetails where productId = '"+productID+"'";
		jdbcTemplate.update(del);
	}

	@Override
	public String ShowAdd() 
	{
		String add = jdbcTemplate.queryForObject("select msgName from messages where msgID='MSG001'", String.class);
		return add;
	}
	@Override
	public String ShowDelete() 
	{
		String delete = jdbcTemplate.queryForObject("select msgName from messages where msgID='MSG003'", String.class);
		return delete;
	}
	@Override
	public String ShowUpdate() 
	{
		String update = jdbcTemplate.queryForObject("select msgName from messages where msgID='MSG002'", String.class);
		return update;
	}
	@Override
	public String ShowRestore() 
	{
		String restore = jdbcTemplate.queryForObject("select msgName from messages where msgID='MSG004'", String.class);
		return restore;
	}
	@Override
	public String ShowNotAdd() 
	{
		String notAdd = jdbcTemplate.queryForObject("select msgName from messages where msgID='MSG006'", String.class);
		return notAdd;
	}
	@Override
	public String ShowNotDelete()
	{
		String notDelete = jdbcTemplate.queryForObject("select msgName from messages where msgID='MSG008'", String.class);
		return notDelete;
	}
	@Override
	public String ShowNotUpdate() 
	{
		String notUpdate = jdbcTemplate.queryForObject("select msgName from messages where msgID='MSG007'", String.class);
		return notUpdate;
	}
	@Override
	public String ShowNotRestore() 
	{
		String notRestore = jdbcTemplate.queryForObject("select msgName from messages where msgID='MSG009'", String.class);
		return notRestore;
	}
	@Override
	public List<CreateNewProduct> viewPDFCreateNewProduct(String productCode) 
	{
		try
		{
			List<CreateNewProduct> createNewProducts = new ArrayList<CreateNewProduct>();			
			String prod_Type = jdbcTemplate.queryForObject("select prod_Type from product_master where product_Id = '"+productCode+"' ", String.class);			
 			if (prod_Type.equalsIgnoreCase("Resale Product") || prod_Type.equalsIgnoreCase("Purchase Item")) 
			{
 				
				String sql = "select * from product_master where product_Id = '"+productCode+"'";
				createNewProducts = getJdbcTemplate().query(sql, new RowMapper<CreateNewProduct>(){
					private List<CreateNewProduct> productList = new ArrayList<CreateNewProduct>();
					@Override
					public CreateNewProduct mapRow(ResultSet rs, int rowNo) throws SQLException 
					{
						CreateNewProduct createNewProduct = new CreateNewProduct();
						createNewProduct.setProductCode(rs.getString("product_Id"));
						createNewProduct.setTxtName(rs.getString("prod_Name"));
						createNewProduct.setInventory(rs.getString("inventory"));
						createNewProduct.setProductType(rs.getString("prod_Type"));
						createNewProduct.setTxtOpeningStock(rs.getFloat("opening_Stock"));
						createNewProduct.setTxtReorderlevel(rs.getString("reorder_Level"));
						createNewProduct.setTxtUnitOfMeasure(rs.getString("unit_Of_Measure"));
						createNewProduct.setTxtSalesPrice(rs.getFloat("sales_Price"));
						createNewProduct.setTxtPurchasePrice(rs.getFloat("purchase_Price"));
						createNewProduct.setTxtDes(rs.getString("description"));
						productList.add(createNewProduct);
						return createNewProduct;
					}					
				});
				return createNewProducts;
			} 
			else if(prod_Type.equalsIgnoreCase("Sale Item"))
			{ 
				//String sql = "select * from vcreatenewproduct where product_Id = '"+productCode+"'";
				String sql = "select p1.srNo,p1.rawMId,p2.prod_Name as pName,p3.prod_Name,p2.description as pDes,p3.description,p3.unit_Of_Measure,p2.purchase_Price,p2.sales_Price,p2.reorder_Level,p2.opening_Stock,p2.inventory,p1.quantity,p2.product_Id,p2.prod_Type from productmasterdetails p1,product_master p2 ,product_master p3 where p1.productId=p2.product_Id and p1.rawMId=p3.product_Id and p2.prod_Type='"+prod_Type+"' and p2.product_Id='"+productCode+"' ";
				createNewProducts =  getJdbcTemplate().query(sql, new RowMapper<CreateNewProduct>(){
					List<Details> detailsList = new ArrayList<Details>();
					@Override
					public CreateNewProduct mapRow(ResultSet rs, int rowNo) throws SQLException 
					{
						CreateNewProduct productList = new CreateNewProduct();
						Details dList = new Details();
						productList.setProductCode(rs.getString("product_Id"));
						productList.setTxtName(rs.getString("pName"));
						productList.setInventory(rs.getString("inventory"));
						productList.setTxtOpeningStock(rs.getFloat("opening_Stock"));
						productList.setTxtReorderlevel(rs.getString("reorder_Level"));
						productList.setProductType(rs.getString("prod_Type"));
						productList.setTxtUnitOfMeasure(rs.getString("unit_Of_Measure"));
						productList.setTxtSalesPrice(rs.getFloat("sales_Price"));
						//productList.setTxtPurchasePrice(rs.getFloat("purchase_Price"));
						productList.setTxtDes(rs.getString("pDes"));
						
						dList.setTxtSrNo1(rs.getInt("srNo"));
						dList.setTxtItem1(rs.getString("prod_Name"));
						dList.setUnit(rs.getString("unit_Of_Measure"));
						dList.setDecription(rs.getString("description"));						
						dList.setQuantity(rs.getFloat("quantity"));
						
						detailsList.add(dList);
						productList.setCreateNewPdetails(detailsList);
						return productList;
					}
				});
				return createNewProducts;
				/*createNewProducts = getJdbcTemplate().query(sql, new RowMapper<CreateNewProduct>(){
					private List<CreateNewProduct> productList = new ArrayList<CreateNewProduct>();
					@Override
					public CreateNewProduct mapRow(ResultSet rs, int rowNo) throws SQLException 
					{
						CreateNewProduct createNewProduct = new CreateNewProduct();
						createNewProduct.setProductCode(rs.getString("product_Id"));
						createNewProduct.setTxtName(rs.getString("prod_Name"));
						createNewProduct.setInventory(rs.getString("inventory"));
						createNewProduct.setProductType(rs.getString("prod_Type"));
						createNewProduct.setTxtOpeningStock(rs.getFloat("opening_Stock"));
						createNewProduct.setTxtReorderlevel(rs.getString("reorder_Level"));
						createNewProduct.setTxtUnitOfMeasure(rs.getString("unit_Of_Measure"));
						createNewProduct.setTxtSalesPrice(rs.getFloat("sales_Price"));
						createNewProduct.setTxtPurchasePrice(rs.getFloat("purchase_Price"));
						createNewProduct.setTxtDes(rs.getString("description"));
						productList.add(createNewProduct);
						return createNewProduct;
					}					
				});
				return createNewProducts;*/
				/*String sql = "select p.product_Id,p.prod_Name,p.unit_Of_Measure,p.description,p.inventory,p.opening_Stock,p.description,p.unit_Of_Measure,p.reorder_Level,p.prod_Type,p.sales_Price,p.purchase_Price,p1.srNo,p1.rawMId,p1.quantity from productmasterdetails p1,product_master p where p.product_Id = p1.productId and p.product_Id = '"+productCode+"'";
				createNewProducts =  getJdbcTemplate().query(sql, new RowMapper<CreateNewProduct>(){
					List<Details> detailsList = new ArrayList<Details>();
					@Override
					public CreateNewProduct mapRow(ResultSet rs, int rowNo) throws SQLException 
					{
						CreateNewProduct productList = new CreateNewProduct();
						Details dList = new Details();
						
						productList.setProductCode(rs.getString("product_Id"));
						productList.setTxtName(rs.getString("prod_Name"));
						productList.setInventory(rs.getString("inventory"));
						productList.setTxtOpeningStock(rs.getFloat("opening_Stock"));
						productList.setTxtReorderlevel(rs.getString("reorder_Level"));
						productList.setProductType(rs.getString("prod_Type"));
						productList.setTxtUnitOfMeasure(rs.getString("unit_Of_Measure"));
						productList.setTxtSalesPrice(rs.getFloat("sales_Price"));
						productList.setTxtPurchasePrice(rs.getFloat("purchase_Price"));
						productList.setTxtDes(rs.getString("description"));
						
						dList.setTxtSrNo1(rs.getInt("srNo"));
						dList.setTxtItem1(rs.getString("rawMId"));
						dList.setUnit(rs.getString("unit_Of_Measure"));
						dList.setDecription(rs.getString("description"));						
						dList.setQuantity(rs.getFloat("quantity"));
						
						detailsList.add(dList);
						productList.setCreateNewPdetails(detailsList);
						return productList;
					}
				});
				return createNewProducts;*/
			}
			return createNewProducts;
		}catch(Exception e)
		{
			System.out.println(e); 
			return null;
		}
	}

}
