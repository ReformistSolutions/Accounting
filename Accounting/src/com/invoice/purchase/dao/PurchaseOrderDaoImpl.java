package com.invoice.purchase.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCountCallbackHandler;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.invoice.accounting.beans.JournalHeader;
import com.invoice.accounting.beans.Taxes;
import com.invoice.company.beans.CompanyDetails;
import com.invoice.inventory.beans.CreateNewProduct;
import com.invoice.purchase.beans.ComposeMail;
import com.invoice.purchase.beans.PurchaseOrder;
import com.invoice.purchase.beans.Vender;
import com.invoice.purchase.beans.purchaseDetails;
import com.invoice.sales.beans.LinkedTaxDetails;
import com.invoice.sales.beans.TaxDetailsList;

@Component(value="pOrderDao")
public class PurchaseOrderDaoImpl implements PurchaseOrderDao{

	JdbcTemplate jdbcTemplate;
	private String sql;
	
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	@Autowired
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	@Override
	public int saveOrder(PurchaseOrder purchaseOrder,JournalHeader journalHeader) {
		
		int i=0,i1=0,i2=0,i3=0,i4=0,i5=0;
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");	     
		Date date = new Date();	   		 
		String updateDate=dateFormat.format(date);	
		try
		{
		sql="insert into purchase_order_header value('"+purchaseOrder.getTxtPurchaseOrdNo()+"','"+purchaseOrder.getSelSupplierName()+"','"+purchaseOrder.getTxtPurcaseDate()+"','"+purchaseOrder.getTxtDueDate()+"','"+purchaseOrder.getTxtAreaAddress()+"','"+purchaseOrder.getTxtPubNotes()+"','"+purchaseOrder.getTxtPvtNotes()+"','"+purchaseOrder.getTxtSubTotal()+"','"+purchaseOrder.getRadio()+"','"+purchaseOrder.getTxtDiscount()+"','"+purchaseOrder.getTxtDisTotal()+"','"+purchaseOrder.getTxtTaxTotal()+"','"+purchaseOrder.getTxtRoundOff()+"','"+purchaseOrder.getTxtAmtPayble()+"','"+purchaseOrder.getCreatedBy()+"','"+purchaseOrder.getCreatedBy()+"','"+updateDate+"','No','Active')";
		i=jdbcTemplate.update(sql);
		
		String taxId="";
		List<TaxDetailsList> taxList=purchaseOrder.getTaxList();			
		taxList.remove(0);				
		for (TaxDetailsList pur_quot_taxList : taxList)			
		{	
			String taxID=pur_quot_taxList.getTaxType();
			taxId=taxID.substring((taxID.indexOf("^"))+1, taxID.length());				
			String sql1="insert into purchase_ord_tax_details value('"+purchaseOrder.getTxtPurchaseOrdNo()+"','"+taxId+"','"+pur_quot_taxList.getTxtTaxValue()+"','"+pur_quot_taxList.getTxtprevLinkTax()+"')";
			i1= jdbcTemplate.update(sql1);
		}			
		List<LinkedTaxDetails> linkedTaxList=purchaseOrder.getLinkedTaxList();
		if(!(linkedTaxList.isEmpty())){
			linkedTaxList.remove(0);		
			for (LinkedTaxDetails linkedTaxDetails : linkedTaxList) {
				
				String sql4="insert into purchase_ord_linked_tax_details value('"+purchaseOrder.getTxtPurchaseOrdNo()+"','"+linkedTaxDetails.getmTaxID()+"','"+linkedTaxDetails.getLinkedTaxId()+"','"+linkedTaxDetails.getSerLinkedTax()+"')";
				i2= jdbcTemplate.update(sql4);
			}
			}
			/*else
			{
				String sql4="insert into purchase_ord_linked_tax_details value('"+purchaseOrder.getTxtPurchaseOrdNo()+"','"+taxId+"','0.0','0.0')";
				i3= jdbcTemplate.update(sql4);
			}*/	
		List<purchaseDetails> qdList = purchaseOrder.getProductList();
		for(purchaseDetails qD : qdList)
		{			
			String sql1="insert into purchase_order_details value('"+qD.getSrNo()+"','"+purchaseOrder.getTxtPurchaseOrdNo()+"','"+qD.getItemCode()+"','"+qD.getQuantity()+"','"+qD.getUnitPrice()+"','"+qD.getItemTotal()+"')";
			i4= jdbcTemplate.update(sql1);
		}
		if(purchaseOrder.getSelQuotatonNo()!=null)
		{
			String sql = "update purchase_quoatation_header set pur_Ord_Created = 'Yes' where pur_Quot_Id = '"+purchaseOrder.getSelQuotatonNo()+"'" ;
			i5 = jdbcTemplate.update(sql);
		}
		 if(i>0 && i3>0 && i4>0)
		 {
			 return 1;
		 }
		 else if(i1>0)
		 {
			 return 1;
		 }
		 else if(i2>0)
		 {
			 return 1;
		 }
		 else if(i5>0)
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
	public List<PurchaseOrder> showOrder() {
		try{
		String sql = "select DISTINCT * from vpurchaseorder where pur_Order_Status = 'Active' GROUP BY pur_Order_Id";
		final List<PurchaseOrder> orderList = getJdbcTemplate().query(sql, new RowMapper<PurchaseOrder>()
			{
			private List<PurchaseOrder> purchaseOrderLIst = new ArrayList<PurchaseOrder>();
			public PurchaseOrder mapRow(ResultSet rs, int rowNo)throws SQLException {
				
				PurchaseOrder purchaseOrder = new PurchaseOrder();
				purchaseOrder.setTxtPurchaseOrdNo(rs.getString("pur_Order_Id")); 
				purchaseOrder.setSelSupplierName(rs.getString("vender_Name"));
				purchaseOrder.setTxtPurcaseDate(rs.getString("pur_Order_Date"));
				purchaseOrder.setPurchasesCreated(rs.getString("purchases_Created"));
				purchaseOrderLIst.add(purchaseOrder);
				return purchaseOrder;
			}			
		});
		return orderList;
		}catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public List<PurchaseOrder> editOrder(String orderId) {	
		try{ 
		sql = "select * from vpurchaseorder where pur_Order_Id='"+orderId+"' group by pur_Ord_Sr_No ";		
		return jdbcTemplate.query(sql, new RowMapper<PurchaseOrder>(){ 
			List<purchaseDetails> DetailsList = new ArrayList<purchaseDetails>();
			public PurchaseOrder mapRow(ResultSet rs, int rowNo) throws SQLException {
				PurchaseOrder order = new PurchaseOrder();
				purchaseDetails orderDetails = new purchaseDetails();				
				order.setTxtPurchaseOrdNo(rs.getString("pur_Order_Id"));
				order.setSelSupplierName(rs.getString("vender_Name"));
				order.setVenderID(rs.getString("vendor_Id"));
				order.setTxtPurcaseDate(rs.getString("pur_Order_Date"));
				order.setTxtDueDate(rs.getString("pur_Order_Due_Date"));
				order.setTxtAreaAddress(rs.getString("pur_Order_Address"));
				order.setTxtPubNotes(rs.getString("pur_Order_PublicNote"));
				order.setTxtPvtNotes(rs.getString("pur_Order_PrivateNote")); 
				order.setTxtSubTotal(rs.getFloat("pur_Order_Sub_Total"));				
				order.setRadio(rs.getString("discount_Type"));
				order.setTxtDiscount(rs.getFloat("discount_Value"));
				order.setTxtDisTotal(rs.getFloat("pur_Order_Discounted_Total"));
				order.setTxtTaxTotal(rs.getFloat("total_Tax"));
				order.setTxtRoundOff(rs.getString("round_Off"));
				order.setTxtAmtPayble(rs.getFloat("pur_Order_Amt_Payable"));
				order.setPurchasesCreated(rs.getString("purchases_Created"));
				orderDetails.setSrNo(rs.getInt("pur_Ord_Sr_No")); 
				orderDetails.setProdId(rs.getString("product_Id"));
				orderDetails.setItemCode(rs.getString("prod_Name"));
				orderDetails.setDes(rs.getString("description")); 
				orderDetails.setUnit(rs.getString("unit_Of_Measure"));
				orderDetails.setQuantity(rs.getInt("pur_Order_Quantity"));		
				orderDetails.setUnitPrice(rs.getFloat("pur_Order_Unit_Price"));
				orderDetails.setItemTotal(rs.getFloat("item_Total"));				
				DetailsList.add(orderDetails);
				order.setProductList(DetailsList);
				return order;
			}			
		});
		}catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public List<CreateNewProduct> showProduct() {
		try{
		sql = "select product_Id,prod_Name from product_master where prod_Type='Purchase Item' or prod_Type='Resale Product'" ;
		final List<CreateNewProduct> prodList=getJdbcTemplate().query(sql, new RowMapper<CreateNewProduct>() {
			private List<CreateNewProduct> productList=new ArrayList<CreateNewProduct>();
			public CreateNewProduct mapRow(ResultSet rs,int rowNo)throws SQLException
			{
				CreateNewProduct createNewProduct=new CreateNewProduct();
				createNewProduct.setProductId(rs.getString("product_Id"));
				createNewProduct.setTxtName(rs.getString("prod_Name"));			
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
	public int updateOrder(PurchaseOrder purchaseOrder) {
		
		int i=0,i1=0,i2=0,i4=0;
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");	     
		Date date = new Date();	   		 
		String updateDate=dateFormat.format(date);
		try{
		sql = "UPDATE purchase_order_header SET pur_Order_Date='"+purchaseOrder.getTxtPurcaseDate()+"',"+"pur_Order_Due_Date='"+purchaseOrder.getTxtDueDate()+"',"+"pur_Order_Address='"+purchaseOrder.getTxtAreaAddress()+"',"+"pur_Order_PublicNote='"+purchaseOrder.getTxtPubNotes()+"',"+"pur_Order_PrivateNote='"+purchaseOrder.getTxtPvtNotes()+"',"+"pur_Order_Sub_Total='"+purchaseOrder.getTxtSubTotal()+"',"+"discount_Type='"+purchaseOrder.getRadio()+"',"+"discount_Value='"+purchaseOrder.getTxtDiscount()+"',"+"pur_Order_Discounted_Total='"+purchaseOrder.getTxtDisTotal()+"',"+"total_Tax='"+purchaseOrder.getTxtTaxTotal()+"',"+"round_Off='"+purchaseOrder.getTxtRoundOff()+"',"+"pur_Order_Amt_Payable='"+purchaseOrder.getTxtAmtPayble()+"',"+"pur_Order_Updated_By='"+purchaseOrder.getUpdatedBy()+"',"+"pur_Order_Update_Date='"+updateDate+"' WHERE pur_Order_Id='"+purchaseOrder.getTxtPurchaseOrdNo()+"'";
		i=jdbcTemplate.update(sql);
		String orderId = purchaseOrder.getTxtPurchaseOrdNo();
		deleteList(orderId);
		deleteTaxDetailsList(orderId);
		deleteLinkedTaxDetailsList(orderId);
		
		String taxId="";
		List<TaxDetailsList> taxList=purchaseOrder.getTaxList();			
		taxList.remove(0);				
		for (TaxDetailsList pur_quot_taxList : taxList)			
		{	
			String taxID=pur_quot_taxList.getTaxType();
			taxId=taxID.substring((taxID.indexOf("^"))+1, taxID.length());				
			String sql1="insert into purchase_ord_tax_details value('"+purchaseOrder.getTxtPurchaseOrdNo()+"','"+taxId+"','"+pur_quot_taxList.getTxtTaxValue()+"','"+pur_quot_taxList.getTxtprevLinkTax()+"')";
			i1= jdbcTemplate.update(sql1);
		}			
		List<LinkedTaxDetails> linkedTaxList=purchaseOrder.getLinkedTaxList();
		if(!(linkedTaxList.isEmpty())){
			linkedTaxList.remove(0);		
			for (LinkedTaxDetails linkedTaxDetails : linkedTaxList) {
				
				String sql4="insert into purchase_ord_linked_tax_details value('"+purchaseOrder.getTxtPurchaseOrdNo()+"','"+linkedTaxDetails.getmTaxID()+"','"+linkedTaxDetails.getLinkedTaxId()+"','"+linkedTaxDetails.getSerLinkedTax()+"')";
				i2= jdbcTemplate.update(sql4);
			}
			}
			/*else
			{
				String sql4="insert into purchase_ord_linked_tax_details value('"+purchaseOrder.getTxtPurchaseOrdNo()+"','"+taxId+"','0.0','0.0')";
				i3= jdbcTemplate.update(sql4);
			}	*/
		
		
		List<purchaseDetails> qdList = purchaseOrder.getProductList();
		for(purchaseDetails qD : qdList)
		{			
			sql="insert into purchase_order_details value('"+qD.getSrNo()+"','"+purchaseOrder.getTxtPurchaseOrdNo()+"','"+qD.getItemCode()+"','"+qD.getQuantity()+"','"+qD.getUnitPrice()+"','"+qD.getItemTotal()+"')";
			i4= jdbcTemplate.update(sql);
		}
		if(i>0 && i1>0 && i4>0)
	    {
			return 1;
	    }
		else if(i2>0)
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
	private void deleteList(String orderId)
	{
		String deleteListUrl="DELETE FROM purchase_order_details WHERE pur_Order_Id= '"+orderId+"'";
		jdbcTemplate.update(deleteListUrl);
	}
	private void deleteTaxDetailsList(String quotationId){
		String deleteListUrl="DELETE FROM purchase_ord_tax_details WHERE pur_Order_Id= '"+quotationId+"'";
		jdbcTemplate.update(deleteListUrl);
	}
	private void deleteLinkedTaxDetailsList(String quotationId){
		String deleteListUrl="DELETE FROM purchase_ord_linked_tax_details WHERE pur_Order_Id= '"+quotationId+"'";
		jdbcTemplate.update(deleteListUrl);
	}
	@Override
	public PurchaseOrder autoId() {
		try{
		String orderId="";
		RowCountCallbackHandler countCallback = new RowCountCallbackHandler();  // not reusable
		 jdbcTemplate.query("select * from purchase_order_header", countCallback);
		 int count = countCallback.getRowCount();
		 count++;
		// System.out.println("Count="+count);
		 if(count<10)
		 {
		 orderId="POR00"+count;
		 }
		 else
		 {
		 if(count<99)
		 {
		 orderId = "POR0" + count;
		 }
		 else
		{
		orderId = "POR" + count;
		}
		 }
		 PurchaseOrder order=new PurchaseOrder();
		 order.setTxtPurchaseOrdNo(orderId);
		return order;
		}catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public List<Vender> showVenders() {
		try{
		String sql = "select * from vendor_header where vender_Status = 'Active' order by vender_Name" ;
		final List<Vender> venderList=getJdbcTemplate().query(sql, new RowMapper<Vender>() {
			private List<Vender> vList=new ArrayList<Vender>();
			public Vender mapRow(ResultSet rs,int rowNo)throws SQLException
			{
				Vender vender=new Vender();
				vender.setTxtCustID(rs.getString("vender_ID"));
				vender.setTxtCustName(rs.getString("vender_Name"));
				vender.setTxtAcNo(rs.getString("bank_Account_No"));
				vList.add(vender);
				return vender;
			}	
		});		
			return venderList;
		}catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public List<Taxes> showTaxes() {
		try{
		String sql = "select * from taxes where tax_apply_to='P' OR tax_apply_to='S,P' OR tax_apply_to='B'" ;
		final List<Taxes> taxList = getJdbcTemplate().query(sql,new RowMapper<Taxes>(){
			private List<Taxes> tList = new ArrayList<Taxes>();
			public Taxes mapRow(ResultSet rs, int rowNo) throws SQLException 
			{
				Taxes tax = new Taxes();
				tax.setTaxId(rs.getString("tax_id"));
				tax.setTaxName(rs.getString("tax_Name"));
				tax.setTaxRate(rs.getFloat("purchase_tax_Rate"));
				tList.add(tax);
				return tax;
			}			
		});
		return taxList;
		}catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public List<purchaseDetails> showDetails(String orderId) {

		try{
		String sql= "select DISTINCT * from vquotation WHERE pur_Quot_Id='"+orderId+"' " ;
		final List<purchaseDetails> quotationList=getJdbcTemplate().query(sql, new RowMapper<purchaseDetails>() {
			private List<purchaseDetails> dQuotationList=new ArrayList<purchaseDetails>();
			public purchaseDetails mapRow(ResultSet rs, int rowNo)throws SQLException 
			{
				purchaseDetails dQuotation = new purchaseDetails();
				dQuotation.setSrNo(rs.getInt("pur_Quot_Sr_No"));
				dQuotation.setProdId(rs.getString("product_Id"));
				dQuotation.setItemCode(rs.getString("prod_Name"));
				dQuotation.setDes(rs.getString("description"));
				dQuotation.setUnit(rs.getString("unit_Of_Measure")); 
				dQuotation.setQuantity(rs.getInt("pur_Quot_Quantity"));
				dQuotation.setUnitPrice(rs.getFloat("pur_Quot_Unit_Price"));
				dQuotation.setDiscount(rs.getFloat("detailDiscount"));
				dQuotation.setTaxRate(rs.getFloat("pur_Quot_Tax_Type"));
				dQuotation.setTaxName(rs.getString("tax_Name")); 
				dQuotation.setTaxAmt(rs.getFloat("taxAmt")); 
				dQuotation.setItemTotal(rs.getFloat("purQuototal"));
				
				dQuotationList.add(dQuotation);
				return dQuotation;
			}			
		});		
			return quotationList;
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
	@Override
	public String retriveAdd(String venderId) {
		try{
		String sql="select billing_Address from vendor_header where vender_ID='"+venderId+"' ";
		String add = jdbcTemplate.queryForObject(sql, String.class);
		return add;
		}catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public String retrriveBankAcNo(String venderId) {

		try{
		String sql="select bank_Account_No from vendor_header where vender_ID='"+venderId+"' ";
		String add = jdbcTemplate.queryForObject(sql, String.class);
		return add;
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
	public int delete(String orderID) {

		try{
		String st = "InActive";
		sql = "update purchase_order_header set pur_Order_Status = '"+st+"' where pur_Order_Id='"+orderID+"'";
		int i = jdbcTemplate.update(sql) ;
		return i;
		}catch(Exception e)
		{
			return 0;
		}
	}
	@Override
	public int sendMail(ComposeMail composeMail)
	{
		/*final String username = "pradeep.pol99@gmail.com";
		final String password = "8888068893";
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "25");
 
		Session session = Session.getInstance(props,
		  new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		  });
		try {
 
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("bhimsenmayachari@gmail.com"));
			message.setRecipients(Message.RecipientType.TO,
				InternetAddress.parse(composeMail.getMailTo()));
			message.setSubject(composeMail.getSubject());
			message.setText(composeMail.getBody());
 
			System.out.println(composeMail.getMailTo()+"\n");
			System.out.println(composeMail.getSubject()+"\n");
			System.out.println(composeMail.getBody()+"\n");
			System.out.println(composeMail.getAttachment()+"\n");
			
			//Transport.send(message);
			BodyPart messageBodyPart = new MimeBodyPart();

	         // Fill the message
	         messageBodyPart.setText(composeMail.getBody());
	         
	         // Create a multipar message
	         Multipart multipart = new MimeMultipart();

	         // Set text message part
	         multipart.addBodyPart(messageBodyPart);

	         // Part two is attachment
	        messageBodyPart = new MimeBodyPart();
	         String filename = composeMail.getAttachment();
	         DataSource source = new FileDataSource(filename);
	         messageBodyPart.setDataHandler(new DataHandler(source));
	         messageBodyPart.setFileName(filename);
	         multipart.addBodyPart(messageBodyPart);

	         // Send the complete message parts
	         message.setContent(multipart );

	         // Send message
	         Transport.send(message);
	       //  System.out.println("Sent message successfully....");
			//System.out.println("Done");
 
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}*/
		return 1;
	}
	@Override
	public List<Vender> retrriveVenderInfo(String vendId,String id)
	{
		final String path = "Purchase Order.pdf";	
		final String id1=id;
		try{
		String sql="select vender_ID,vender_Name,vender_Email from vendor_header where vender_ID='"+vendId+"'";
		final List<Vender> vendInfo=getJdbcTemplate().query(sql, new RowMapper<Vender>() {
		public Vender mapRow(ResultSet rs,int rowNo)throws SQLException
			{
				Vender venderInfo=new Vender();
				venderInfo.setTxtCustID(rs.getString("vender_ID"));
				venderInfo.setTxtCustName(rs.getString("vender_Name"));
				venderInfo.setTxtMail1(rs.getString("vender_Email"));
				venderInfo.setAttachment(path);
				venderInfo.setId(id1);
				venderInfo.setSubject("Purchase Order");				
				String regards=jdbcTemplate.queryForObject("select comp_Name from comp_details",String.class);
				venderInfo.setRegards(regards);	
				venderInfo.setBodyPart("\t New Purchase Order is Generated For More Details\n Please Find The Attached PDF File.\n\nThank You..");
				return venderInfo;
			}
		});
			return vendInfo;
		}catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public JournalHeader generateId() 
	{
		try{
		String journal_Id = "";
		RowCountCallbackHandler countCallback = new RowCountCallbackHandler(); // not
																				// reusable
		jdbcTemplate.query("select * from journal_header", countCallback);
		int count = countCallback.getRowCount();
		count++;
		//System.out.println("Count=" + count);
		if (count < 10) {
			journal_Id = "JID00" + count;
		} else {
			if (count < 99) {
				journal_Id = "JID0" + count;
			} else {
				journal_Id = "JID" + count;
			}
		}
		JournalHeader journalHeader = new JournalHeader();
		journalHeader.setTxtjourid(journal_Id);
		return journalHeader;
		}catch(Exception e)
		{
			return null;
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
	public List<PurchaseOrder> editPurOrdTaxDetails(String orderId) {
		try{
			
			final String orderId1=orderId; 			
			 RowCountCallbackHandler countCallback1 = new RowCountCallbackHandler();
			  jdbcTemplate.query("select * FROM vpurchaseordtaxdetails where pur_Order_Id='"+orderId1+"'", countCallback1);
			  int counter1= countCallback1.getRowCount();
			  
			  if(counter1!=0)
			  {
		String sql="select * from vpurchaseordtaxdetails where pur_Order_Id='"+orderId+"'";		
		return jdbcTemplate.query(sql, new RowMapper<PurchaseOrder>() {
			List<TaxDetailsList> taxesList=new ArrayList<TaxDetailsList>();
			@Override
			public PurchaseOrder mapRow(ResultSet rs, int arg1) throws SQLException {
				PurchaseOrder purchaseOrder=new PurchaseOrder();				
				TaxDetailsList taxDetailsList=new TaxDetailsList();
				taxDetailsList.setTaxId(rs.getString("tax_Id"));
				String taxId=rs.getString("tax_Id");
				taxDetailsList.setTaxType(rs.getString("tax_Name"));
				taxDetailsList.setTaxRate(rs.getString("purchase_tax_Rate"));
				taxDetailsList.setTxtTaxValue(rs.getFloat("tax_Amt"));
				taxDetailsList.setTxtprevLinkTax(rs.getFloat("linked_Tax_Amt"));
				RowCountCallbackHandler countCallback = new RowCountCallbackHandler();
				 jdbcTemplate.query("select * FROM linkedtax where taxID='"+taxId+"'", countCallback);
				int counter= countCallback.getRowCount();
				taxDetailsList.setCounter(counter);
				taxesList.add(taxDetailsList);				
				purchaseOrder.setTaxList(taxesList);
				return purchaseOrder;
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
	public List<PurchaseOrder> editPurOrdLinkedTaxDetails(String orderId) {
		try{
		String sql="select * from vpurchaseordlinkedtaxdetails where pur_Order_Id='"+orderId+"'";		
		return jdbcTemplate.query(sql, new RowMapper<PurchaseOrder>() {			
			List<LinkedTaxDetails> linkedTaxesList=new ArrayList<LinkedTaxDetails>();
			@Override
			public PurchaseOrder mapRow(ResultSet rs, int arg1) throws SQLException {
				PurchaseOrder purchaseOrder=new PurchaseOrder();				
				LinkedTaxDetails linkedTaxDetailsList=new LinkedTaxDetails();
				linkedTaxDetailsList.setmTaxID(rs.getString("tax_Id"));				
				linkedTaxDetailsList.setmTaxAmt(rs.getFloat("tax_Amt"));
				linkedTaxDetailsList.setLinkedTaxId(rs.getString("linked_Tax_Id"));
				linkedTaxDetailsList.setLinkedTaxName(rs.getString("taxName"));
				linkedTaxDetailsList.setLinkedTaxRate(rs.getFloat("linked_Tax_Rate"));
				linkedTaxDetailsList.setSerLinkedTax(rs.getFloat("linked_Tax_Amt"));				
				linkedTaxesList.add(linkedTaxDetailsList);				
				purchaseOrder.setLinkedTaxList(linkedTaxesList);				
				return purchaseOrder;
			}
		});
		}catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public String retriveUnitPrice(String productId) 
	{
		String unitprice = jdbcTemplate.queryForObject("select purchase_Price from product_master where product_Id = '"+productId+"'", String.class);
		return unitprice;
	}
}