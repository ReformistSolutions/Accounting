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

import com.invoice.accounting.beans.LinkedTax;
import com.invoice.accounting.beans.Taxes;
import com.invoice.customer.beans.Customer;
import com.invoice.inventory.beans.CreateNewProduct;
import com.invoice.sales.beans.Details;
import com.invoice.sales.beans.Enquiry;
import com.invoice.sales.beans.Estimate;
import com.invoice.sales.beans.LinkedTaxDetails;
import com.invoice.sales.beans.TaxDetailsList;


@Component(value="estimateDao")
public class EstimateDaoImpl implements EstimateDao{

	private JdbcTemplate jdbcTemplate;
	
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	@Autowired
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Override
	public List<Estimate> show() {
		try{
		String sql="select * from vsalesestimate where status='Active' group by sales_Est_Id";		
		final List<Estimate> enquiryList=getJdbcTemplate().query(sql, new RowMapper<Estimate>() {
		private List<Estimate> salesEnquiryList=new ArrayList<Estimate>();
		public Estimate mapRow(ResultSet rs,int rowNo)throws SQLException
		{
			Estimate estimate=new Estimate();
			estimate.setTxtEstID(rs.getString("sales_Est_Id"));
			estimate.setTxtCutName(rs.getString("customer_Name"));
			DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy"); 
		    String est_Date=dateFormat.format(rs.getDate("sales_Est_Date"));
			estimate.setTxtDate(est_Date);
			estimate.setTxtAmtPayble(rs.getFloat("sales_Est_Amt_Payable"));
			estimate.setOrdCreated(rs.getString("sales_Order_Creadted"));
			salesEnquiryList.add(estimate);
			return estimate;
		}	
	});		
		return enquiryList;
		}catch(Exception e)
		{
			return null;
		}
	}

	@Override
	public int save(Estimate estimate) {
		
		    int i1=0,i2=0,ie=0;
		    String status="Active";
		   // String taxId="";
		    String ordCreated="No";		   
		    java.sql.Timestamp updateDate=new java.sql.Timestamp(new java.util.Date().getTime());
		    try{
		    	 //String url="insert into sales_est_header value('"+estimate.getTxtEstID()+"','"+estimate.getTxtCutName()+"','"+estimate.getTxtEnqNo()+"','"+estimate.getTxtDate()+"','"+estimate.getTxtBillAddr()+"','"+estimate.getTxtShipAddr()+"','"+estimate.getTxtpubNotes()+"','"+estimate.getTxtpvtNotes()+"','"+estimate.getTxtSubTotal()+"','"+estimate.getRadio()+"','"+estimate.getTxtDiscount()+"','"+estimate.getTxtDisTotal()+"','"+estimate.getTxtTaxTotal()+"','"+estimate.getTxtRoundOff()+"','"+estimate.getTxtAmtPayble()+"','"+estimate.getCreatedBy()+"','"+estimate.getCreatedBy()+"','"+updateDate+"','"+ordCreated+"','"+status+"')";
		    String url="insert into sales_est_header value('"+estimate.getTxtEstID()+"','"+estimate.getTxtCutName()+"','"+estimate.getTxtEnqNo()+"','"+estimate.getTxtDate()+"','"+estimate.getTxtBillAddr()+"','"+estimate.getTxtShipAddr()+"','"+estimate.getTxtpubNotes()+"','"+estimate.getTxtpvtNotes()+"','"+estimate.getTxtAmtPayble()+"','"+estimate.getCreatedBy()+"','"+estimate.getCreatedBy()+"','"+updateDate+"','"+ordCreated+"','"+status+"')";
			i1=jdbcTemplate.update(url); 
	       
			/*List<TaxDetailsList> taxList=estimate.getTaxList();			
			taxList.remove(0);				
			for (TaxDetailsList est_taxList : taxList)			
			{	
				String taxID=est_taxList.getTaxType();
				taxId=taxID.substring((taxID.indexOf("^"))+1, taxID.length());				
				String sql1="insert into sales_est_tax_details value('"+estimate.getTxtEstID()+"','"+taxId+"','"+est_taxList.getTxtTaxValue()+"','"+est_taxList.getTxtprevLinkTax()+"')";
				i3= jdbcTemplate.update(sql1);
			}			
			List<LinkedTaxDetails> linkedTaxList=estimate.getLinkedTaxList();
			if(!(linkedTaxList.isEmpty())){
				linkedTaxList.remove(0);		
				for (LinkedTaxDetails linkedTaxDetails : linkedTaxList) {
					
					String sql4="insert into sales_est_linked_tax_details value('"+estimate.getTxtEstID()+"','"+linkedTaxDetails.getmTaxID()+"','"+linkedTaxDetails.getLinkedTaxId()+"','"+linkedTaxDetails.getSerLinkedTax()+"')";
					ip= jdbcTemplate.update(sql4);
				}
				}*/
				/*else
				{
					String sql4="insert into sales_est_linked_tax_details value('"+estimate.getTxtEstID()+"','"+taxId+"','0.0','0.0')";
					ipl= jdbcTemplate.update(sql4);
				}*/	
			
			List<Details> productList=estimate.getProductList();			
			for (Details details : productList)			
			{	
				String sql1="insert into sales_est_details value('"+details.getSrNo()+"','"+estimate.getTxtEstID()+"','"+details.getItemCode()+"','"+details.getQuantity()+"','"+details.getUnitPrice()+"','"+details.getItemTotal()+"')";
				i2= jdbcTemplate.update(sql1);
			}
			if(estimate.getTxtEnqNo() !=null)
			{
				String updateEstHeaderUrl="UPDATE sales_enq_header SET est_Created='Yes' WHERE enq_Id='"+estimate.getTxtEnqNo()+"'";
				ie=jdbcTemplate.update(updateEstHeaderUrl);
			}
			
		if(i1>=1 && i2>=1)
	       {
			return 1;
	      }
		else if(ie>=1)
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
	public List<Estimate> editEstimate(String estimateID) {
		try{
		String sql="select * from vsalesestimate where sales_Est_Id='"+estimateID+"' group by sales_Est_Sr_No";		
		return jdbcTemplate.query(sql, new RowMapper<Estimate>() {
			List<Details> estimateDetails =new ArrayList<Details>();		
			@Override
			public Estimate mapRow(ResultSet rs, int arg1) throws SQLException {
				Estimate estimate=new Estimate();
				Details estDetails=new Details();			
				estimate.setTxtEstID(rs.getString("sales_Est_Id"));
				estimate.setTxtEnqNo(rs.getString("enquiryID"));
				estimate.setTxtCutName(rs.getString("customer_Name"));
				estimate.setTxtDate(rs.getString("sales_Est_Date"));
				estimate.setTxtBillAddr(rs.getString("bill_To"));
				estimate.setTxtShipAddr(rs.getString("ship_To"));
				estimate.setTxtpubNotes(rs.getString("sales_Est_PublicNotes"));
				estimate.setTxtpvtNotes(rs.getString("sales_Est_PrivateNotes"));
				estimate.setOrdCreated(rs.getString("sales_Order_Creadted"));
				/*estimate.setTxtSubTotal(rs.getFloat("sales_Est_Sub_Total"));
				estimate.setRadio(rs.getString("discount_Type"));
				estimate.setTxtDiscount(rs.getFloat("discount_Value"));
				estimate.setTxtDisTotal(rs.getFloat("sales_Est_Discounted_Total"));
				estimate.setTxtTaxTotal(rs.getFloat("total_Tax"));
				estimate.setTxtRoundOff(rs.getString("round_Off"));*/
				estimate.setTxtAmtPayble(rs.getFloat("sales_Est_Amt_Payable"));
				estDetails.setSrNo(rs.getInt("sales_Est_Sr_No"));
				estDetails.setItemCode(rs.getString("prod_Name"));
				estDetails.setDes(rs.getString("description"));
				estDetails.setQuantity(rs.getInt("sales_Est_Quantity"));
				estDetails.setUnitPrice(rs.getFloat("sales_Est_Unit_Price"));							
				estDetails.setItemTotal(rs.getFloat("sales_Est_Total"));
				estDetails.setProdId(rs.getString("product_Id"));			
				estimate.setCustID(rs.getString("customer_ID"));			
				estimate.setCustVatNo(rs.getString("vat_No"));		
				estDetails.setUnit(rs.getString("unit_Of_Measure"));
				String prodId=rs.getString("product_Id");
				float aQty=jdbcTemplate.queryForObject("select opening_Stock from product_master where product_Id='"+prodId+"'", Float.class);
				estDetails.setaQty(aQty);
				estimateDetails.add(estDetails);
				estimate.setProductList(estimateDetails);	
			
				return estimate;
			}
		});
		}catch(Exception e)
		{
			return null;
		}
		
	}
	
	@Override
	public List<Estimate> editEstimateTaxDetails(String estimateID) {
		try{
			
			final String estId=estimateID;
			RowCountCallbackHandler countCallback1 = new RowCountCallbackHandler();
			 jdbcTemplate.query("select * FROM vsalesesttaxdetails where sales_Est_Id='"+estId+"'", countCallback1);
			 int counter1= countCallback1.getRowCount();
			 if(counter1!=0)
			 {
			
		String sql="select * from vsalesesttaxdetails where sales_Est_Id='"+estimateID+"'";		
		return jdbcTemplate.query(sql, new RowMapper<Estimate>() {			
			List<TaxDetailsList> taxesList=new ArrayList<TaxDetailsList>();
			@Override
			public Estimate mapRow(ResultSet rs, int arg1) throws SQLException {
				Estimate estimate=new Estimate();				
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
				estimate.setTaxList(taxesList);
				return estimate;
			}
		});
			 }
			 else
			 {
				 return null;
			 }
		}catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public List<Estimate> editEstimateLinkedTaxDetails(String estimateID) {
		try{
		String sql="select * from vsalesestlinkedtaxdetails where sales_Est_Id='"+estimateID+"'";		
		return jdbcTemplate.query(sql, new RowMapper<Estimate>() {			
			List<LinkedTaxDetails> linkedTaxesList=new ArrayList<LinkedTaxDetails>();
			@Override
			public Estimate mapRow(ResultSet rs, int arg1) throws SQLException {
				Estimate estimate=new Estimate();				
				LinkedTaxDetails linkedTaxDetailsList=new LinkedTaxDetails();
				linkedTaxDetailsList.setmTaxID(rs.getString("tax_Id"));				
				linkedTaxDetailsList.setmTaxAmt(rs.getFloat("tax_Amount"));
				linkedTaxDetailsList.setLinkedTaxId(rs.getString("linked_Tax_Id"));
				linkedTaxDetailsList.setLinkedTaxName(rs.getString("taxName"));
				linkedTaxDetailsList.setLinkedTaxRate(rs.getFloat("linked_Tax_Rate"));
				linkedTaxDetailsList.setSerLinkedTax(rs.getFloat("linked_Tax_Amt"));				
				linkedTaxesList.add(linkedTaxDetailsList);				
				estimate.setLinkedTaxList(linkedTaxesList);				
				return estimate;
			}
		});
		}catch(Exception e)
		{
			return null;
		}
	}
	
	@Override
	public int updateEstimate(Estimate estimate) {		
		int i1=0,i2=0;
		java.sql.Timestamp updateDate=new java.sql.Timestamp(new java.util.Date().getTime());
		try{
		String updateEstHeaderUrl="UPDATE sales_est_header SET sales_Est_Date='"+estimate.getTxtDate()+"',"+"bill_To='"+estimate.getTxtBillAddr()+"',"+"ship_To='"+estimate.getTxtShipAddr()+"',"+"sales_Est_PublicNotes='"+estimate.getTxtpubNotes()+"',"+"sales_Est_PrivateNotes='"+estimate.getTxtpvtNotes()+"',"+"sales_Est_Amt_Payable='"+estimate.getTxtAmtPayble()+"',"+"sales_Est_Updated_By='"+estimate.getUpdatedBy()+"',"+"sales_Est_Update_Date='"+updateDate+"' WHERE sales_Est_Id='"+estimate.getTxtEstID()+"'";
		i1=jdbcTemplate.update(updateEstHeaderUrl);
		//String taxId="";
		deleteProductList(estimate.getTxtEstID());
		/*deleteTaxDetailsList(estimate.getTxtEstID());
		deleteLinkedTaxDetailsList(estimate.getTxtEstID());
		List<TaxDetailsList> taxList=estimate.getTaxList();	
		taxList.remove(0);		
		for (TaxDetailsList est_taxList : taxList)			
		{	
			String taxID=est_taxList.getTaxType();
			taxId=taxID.substring((taxID.indexOf("^"))+1, taxID.length());				
			String sql1="insert into sales_est_tax_details value('"+estimate.getTxtEstID()+"','"+taxId+"','"+est_taxList.getTxtTaxValue()+"','"+est_taxList.getTxtprevLinkTax()+"')";
			i3= jdbcTemplate.update(sql1);
		}
		List<LinkedTaxDetails> linkedTaxList=estimate.getLinkedTaxList();
		if(!(linkedTaxList.isEmpty())){
		linkedTaxList.remove(0);		
		for (LinkedTaxDetails linkedTaxDetails : linkedTaxList) {
			
			String sql4="insert into sales_est_linked_tax_details value('"+estimate.getTxtEstID()+"','"+linkedTaxDetails.getmTaxID()+"','"+linkedTaxDetails.getLinkedTaxId()+"','"+linkedTaxDetails.getSerLinkedTax()+"')";
			ip= jdbcTemplate.update(sql4);
		}
		}*/
		/*else
		{
			String sql4="insert into sales_est_linked_tax_details value('"+estimate.getTxtEstID()+"','"+taxId+"','0.0','0.0')";
			ipL= jdbcTemplate.update(sql4);
		}*/
		List<Details> productList=estimate.getProductList();			
		for (Details details : productList)			
		{	
			String sql1="insert into sales_est_details value('"+details.getSrNo()+"','"+estimate.getTxtEstID()+"','"+details.getItemCode()+"','"+details.getQuantity()+"','"+details.getUnitPrice()+"','"+details.getItemTotal()+"')";
			i2= jdbcTemplate.update(sql1);
		}	
		
		if(i1>=1 && i2>=1)
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
	private void deleteProductList(String estimateId){
	
		String deleteListUrl="DELETE FROM sales_est_details WHERE sales_Est_Id= '"+estimateId+"'";
		jdbcTemplate.update(deleteListUrl);
		
	}
	/*private void deleteTaxDetailsList(String estimateId){
	
		String deleteListUrl="DELETE FROM sales_est_tax_details WHERE sales_Est_Id= '"+estimateId+"'";
		jdbcTemplate.update(deleteListUrl);
	}
	private void deleteLinkedTaxDetailsList(String estimateId){
		String deleteListUrl="DELETE FROM sales_est_linked_tax_details WHERE sales_Est_Id= '"+estimateId+"'";
		jdbcTemplate.update(deleteListUrl);
	}*/
	@Override
	public List<CreateNewProduct> retriveProductList() {
		try{
		String sql="select * from product_master where prod_Type='Resale Product' or prod_Type='Sale Item' and status='Active' ";		
		final List<CreateNewProduct> estList=getJdbcTemplate().query(sql, new RowMapper<CreateNewProduct>() {
		private List<CreateNewProduct> EstimateList=new ArrayList<CreateNewProduct>();
		public CreateNewProduct mapRow(ResultSet rs,int rowNo)throws SQLException
		{
			CreateNewProduct createNewProduct=new CreateNewProduct();
			createNewProduct.setProductId(rs.getString("product_Id"));
			createNewProduct.setTxtName(rs.getString("prod_Name"));			
			EstimateList.add(createNewProduct);
			return createNewProduct;
		}	
	});		
		return estList;
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
	public Estimate generateEstId() {
		String estId="";
		try{
		RowCountCallbackHandler countCallback = new RowCountCallbackHandler();  // not reusable
		 jdbcTemplate.query("select * from sales_est_header", countCallback);
		 int count = countCallback.getRowCount();
		 count++;		
		 if(count<10)
		 {
			 estId="EST00"+count;
		 }
		 else
		 {
			 if(count<99)
			 {
				 estId = "EST0" + count;
			 }
			 else
				{
				 estId = "EST" + count;
				}
		 }
		 Estimate estimate=new Estimate();
		 estimate.setTxtEstID(estId);
		return estimate;
		}catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public List<Taxes> retriveTaxList() {
		try{
		String sql="select tax_id,sales_tax_rate,tax_Name from taxes";		
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
			return null;
		}
	}
	@Override
	public String retriveDesc(String productId) {
		try{
		String sql="select description from product_master where product_Id='"+productId+"'";
		String desc=(String) jdbcTemplate.queryForObject(sql, String.class); 
		return desc;
		}catch(Exception e)
		{
			return null;
		}
	}
	/*@Override
	public String retriveAdd(String customerId) {
		String sql="select billing_Address,shipping_Address from customer_header where customer_ID='"+customerId+"'";
		
		return null;
	}*/
	@Override
	public String retriveBillAdd(String customerId) {
		try{
		String sql="select billing_Address from customer_header where customer_ID='"+customerId+"'";
		String billAddress=(String) jdbcTemplate.queryForObject(sql, String.class); 
		return billAddress;
		}catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public String retriveShipAdd(String customerId) {
		try{
		String sql="select shipping_Address from customer_header where customer_ID='"+customerId+"'";
		String shipAddress=(String) jdbcTemplate.queryForObject(sql, String.class); 
		return shipAddress;
		}catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public int deleteEstimate(String estimateID) {
		String status="Inactive";
		try{
		String updateEstHeaderUrl="UPDATE sales_est_header SET status='"+status+"' WHERE sales_Est_Id='"+estimateID+"'";
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
			return 0;
		}
	}
	@Override
	public List<Taxes> retriveVat() {
		try{
		String sql="select tax_Name,sales_tax_rate from taxes where tax_Name='VAT'";
		final List<Taxes> vatname=getJdbcTemplate().query(sql, new RowMapper<Taxes>() {
		public Taxes mapRow(ResultSet rs,int rowNo)throws SQLException
			{
			Taxes vat=new Taxes();
			vat.setTaxName(rs.getString("tax_Name"));
			vat.setTaxRate(rs.getFloat("sales_tax_rate"));
			
							
				return vat;
			}	
		});		
			return vatname;
		}catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public List<Taxes> retriveService() {
		try{
		String sql="select tax_Name,sales_tax_rate from taxes where tax_Name='Service Tax'";
		final List<Taxes> vatname=getJdbcTemplate().query(sql, new RowMapper<Taxes>() {
		public Taxes mapRow(ResultSet rs,int rowNo)throws SQLException
			{
			Taxes vat=new Taxes();
			vat.setServiceName(rs.getString("tax_Name")); 
			/*System.out.println(rs.getString("tax_Name"));*/
			vat.setServiceTaxRate(rs.getFloat("sales_tax_rate"));
			
							
				return vat;
			}	
		});		
			return vatname;
		}catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public List<Customer> retriveCustInfo(String custId,String id) {
		final String path = "Sales Estimate.pdf";		
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
			custoInfo.setSubject("Sales Estimate");
			String regards=jdbcTemplate.queryForObject("select comp_Name from comp_details",String.class);
			custoInfo.setRegards(regards);	
			custoInfo.setBodyPart("\t New Sales Estimate is Generated For More Details\n Please Find The Attached PDF File.\n\nThank You..");
				return custoInfo;
			}	
		});		
			return custInfo;
		}catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public String retriveTaxID(String taxName)
	{
		try{
		String sql="select tax_id from taxes where tax_Name='"+taxName+"'";
		String serTaxId=(String) jdbcTemplate.queryForObject(sql, String.class);
		return serTaxId;
		}catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public List<LinkedTax> retriveLinkedtax(String taxId) {
		
		//IF EXISTS (select * from Company WHERE CompanyId ='" +  
		 //Company_Id + "') select 1 ELSE select 0"
		final String mtaxId=taxId;
		try{
		String sql="SELECT linkedTaxID,taxID,taxName,sales_tax_rate FROM linkedtax where taxID='"+taxId+"'";
		//String sql="SELECT taxName FROM linkedtax where taxID='"+taxId+"' ";
		final List<LinkedTax> linkedList=getJdbcTemplate().query(sql, new RowMapper<LinkedTax>()
		{
			private List<LinkedTax> tList = new ArrayList<LinkedTax>();
			public LinkedTax mapRow(ResultSet rs,int rowNo)throws SQLException
			{
				LinkedTax lTax=new LinkedTax();	
				lTax.setmTaxID(mtaxId);
				lTax.setLinkTaxID(rs.getString("linkedTaxID"));
				lTax.setLinkTaxName(rs.getString("taxName"));
				//System.out.println(rs.getString("taxName"));
				lTax.setLinksalesTax(rs.getFloat("sales_tax_rate"));
				tList.add(lTax);
				return lTax;
			}
		});
		return linkedList;
		}catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public int getCounter(String taxId) {
		try{
		RowCountCallbackHandler countCallback = new RowCountCallbackHandler(); 
		 jdbcTemplate.query("select * FROM linkedtax where taxID='"+taxId+"'", countCallback);
		 return countCallback.getRowCount();
		}catch(Exception e)
		{
			return 0;
		}
	}
	@Override
	public List<Enquiry> retriveEnqList() {
		try{
			String sql="select enq_Id from sales_enq_header where est_Created='No'";		
			final List<Enquiry> enqList=getJdbcTemplate().query(sql, new RowMapper<Enquiry>() {
			private List<Enquiry> enquiryList=new ArrayList<Enquiry>();
			public Enquiry mapRow(ResultSet rs,int rowNo)throws SQLException
			{
				Enquiry enquiry=new Enquiry();
				enquiry.setTxtEnqId(rs.getString("enq_Id"));							
				enquiryList.add(enquiry);
				return enquiry;
			}	
		});		
			return enqList;
			}catch(Exception e)
			{
				System.out.println(e);
				return null;
			}
	}
	@Override
	public float retriveUnitPrice(String productId) {
		try{
			String sql="select sales_Price from product_master where product_Id='"+productId+"'";
			float unitPrice=(float) jdbcTemplate.queryForObject(sql, Float.class); 		
			return unitPrice;
			}catch(Exception e)
			{
				System.out.println(e);
				return 0;
			}
	}
	
	
}
