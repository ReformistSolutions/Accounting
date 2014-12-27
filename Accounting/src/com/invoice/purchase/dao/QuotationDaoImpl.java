package com.invoice.purchase.dao;


import java.io.File;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCountCallbackHandler;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import com.invoice.accounting.beans.LinkedTax;
import com.invoice.accounting.beans.Taxes;
import com.invoice.company.beans.CompanyDetails;
import com.invoice.inventory.beans.CreateNewProduct;
import com.invoice.purchase.beans.ComposeMail;
import com.invoice.purchase.beans.PurchaseQuotation;
import com.invoice.purchase.beans.Vender;
import com.invoice.purchase.beans.purchaseDetails;
import com.invoice.sales.beans.LinkedTaxDetails;
import com.invoice.sales.beans.TaxDetailsList;

@Component(value="quotationDao")
public class QuotationDaoImpl implements QuotationDao{

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
	public int saveQuotation(PurchaseQuotation purchaseQuotation) 
	{
		int i=0,i4=0,i5=0;
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");	     
		Date date = new Date();	   		 
		String updateDate=dateFormat.format(date);
		try
		{
			sql="insert into purchase_quoatation_header value('"+purchaseQuotation.getTxyQuotationNo()+"','"+purchaseQuotation.getTxtCustName()+"','"+purchaseQuotation.getTxtQuotationDate()+"','"+purchaseQuotation.getTxtBillingTo()+"','"+purchaseQuotation.getTxtAreaShipto()+"','"+purchaseQuotation.getTxtPubNotes()+"','"+purchaseQuotation.getTxtPvtNotes()+"','"+purchaseQuotation.getTxtSubTotal()+"','"+purchaseQuotation.getRadio()+"','"+purchaseQuotation.getTxtDiscount()+"','"+purchaseQuotation.getTxtDisTotal()+"','"+purchaseQuotation.getTxtTaxTotal()+"','"+purchaseQuotation.getTxtRoundOff()+"','"+purchaseQuotation.getTxtAmtPayble()+"','"+purchaseQuotation.getCreatedBy()+"','"+purchaseQuotation.getCreatedBy()+"','"+updateDate+"','No','Active')";
			i=jdbcTemplate.update(sql);
		/*String taxId="";
		List<TaxDetailsList> taxList=purchaseQuotation.getTaxList();			
		taxList.remove(0);				
		for (TaxDetailsList pur_quot_taxList : taxList)			
		{	
			String taxID=pur_quot_taxList.getTaxType();
			taxId=taxID.substring((taxID.indexOf("^"))+1, taxID.length());				
			String sql1="insert into purchase_quot_tax_details value('"+purchaseQuotation.getTxyQuotationNo()+"','"+taxId+"','"+pur_quot_taxList.getTxtTaxValue()+"','"+pur_quot_taxList.getTxtprevLinkTax()+"')";
			i1= jdbcTemplate.update(sql1);
		}			
		List<LinkedTaxDetails> linkedTaxList=purchaseQuotation.getLinkedTaxList();
		if(!(linkedTaxList.isEmpty())){
			linkedTaxList.remove(0);		
			for (LinkedTaxDetails linkedTaxDetails : linkedTaxList) {
				
				String sql4="insert into purchase_quot_linked_tax_details value('"+purchaseQuotation.getTxyQuotationNo()+"','"+linkedTaxDetails.getmTaxID()+"','"+linkedTaxDetails.getLinkedTaxId()+"','"+linkedTaxDetails.getSerLinkedTax()+"')";
				i2= jdbcTemplate.update(sql4);
			}
			}*/
			/*else
			{
				String sql4="insert into purchase_quot_linked_tax_details value('"+purchaseQuotation.getTxyQuotationNo()+"','"+taxId+"','0.0','0.0')";
				i3= jdbcTemplate.update(sql4);
			}	*/
		
		
		List<purchaseDetails> qdList = purchaseQuotation.getProductList();
		for(purchaseDetails qD : qdList)
		{
			String sql1="insert into purchase_quoatation_details value('"+qD.getSrNo()+"','"+purchaseQuotation.getTxyQuotationNo()+"','"+qD.getItemCode()+"','"+qD.getQuantity()+"','"+qD.getUnitPrice()+"','"+qD.getItemTotal()+"')";
			i4= jdbcTemplate.update(sql1);
		}
		if(purchaseQuotation.getSelEnquiryNo()!=null)
		{		
			String sql = "update purchase_enquiry_header set quot_Created = 'Yes' where pur_Enq_Id = '"+purchaseQuotation.getSelEnquiryNo()+"' ";
			i5=jdbcTemplate.update(sql);
		}
		//&& i1>0 && i2>0 && i3>0 
		 if(i>0 && i4>0)
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
	public List<PurchaseQuotation> showQuotaion() {
		try{
		String sql= "select DISTINCT * from vquotation where status = 'Active' GROUP BY pur_Quot_Id" ;
		final List<PurchaseQuotation> quotationList=getJdbcTemplate().query(sql, new RowMapper<PurchaseQuotation>() {
			private List<PurchaseQuotation> quotationList=new ArrayList<PurchaseQuotation>();
			public PurchaseQuotation mapRow(ResultSet rs, int rowNo)throws SQLException 
			{
				PurchaseQuotation purchaseQuotation = new PurchaseQuotation();
				purchaseQuotation.setTxyQuotationNo(rs.getString("pur_Quot_Id"));
				purchaseQuotation.setTxtCustName(rs.getString("vender_Name"));
				purchaseQuotation.setTxtQuotationDate(rs.getString("pur_Quot_Date")); 
				purchaseQuotation.setOrderCreated(rs.getString("pur_Ord_Created"));
				purchaseQuotation.setTxtAmtPayble(rs.getFloat("pur_Quot_Amt_Payable"));
				quotationList.add(purchaseQuotation);
				return purchaseQuotation;
			}			
		});		
			return quotationList;
		}catch(Exception e)
		{
			return null;
		}

	}
	@Override
	public List<PurchaseQuotation> view(String quoationId) {
		try{
		sql = "select * from vquotation where pur_Quot_Id='"+quoationId+"' order by  pur_Quot_Sr_No";
		return jdbcTemplate.query(sql, new RowMapper<PurchaseQuotation>(){  
			List<purchaseDetails> DetailsList = new ArrayList<purchaseDetails>();
			public PurchaseQuotation mapRow(ResultSet rs, int rowNo) throws SQLException {
				PurchaseQuotation quotation = new PurchaseQuotation();
				purchaseDetails quotationDetails = new purchaseDetails();
				quotation.setTxyQuotationNo(rs.getString("pur_Quot_Id")); 
				quotation.setTxtQuotationDate(rs.getString("pur_Quot_Date"));
				quotation.setVenderID(rs.getString("vendor_Id"));
				quotation.setTxtCustName(rs.getString("vender_Name"));
				quotation.setTxtBillingTo(rs.getString("billingAddress")); 
				quotation.setTxtBillingCity(rs.getString("billing_City"));
				quotation.setTxtBillingState(rs.getString("billing_State"));
				quotation.setTxtBillingPinCode(rs.getInt("billing_Pin"));
				quotation.setTxtAreaShipto(rs.getString("shippingAddress"));
				quotation.setTxtShippingCity(rs.getString("shipping_City"));
				quotation.setTxtShippingState(rs.getString("shipping_State"));
				quotation.setTxtShippingPinCode(rs.getInt("shipping_Pin"));
				quotation.setTxtPubNotes(rs.getString("pur_Quot_PublicNote"));
				quotation.setTxtPvtNotes(rs.getString("pur_Quot_PrivateNote"));
				quotation.setTxtSubTotal(rs.getFloat("pur_Quot_Sub_Total"));
				quotation.setRadio(rs.getString("discount_Type"));
				quotation.setTxtDiscount(rs.getFloat("discount_Value"));
				quotation.setTxtDisTotal(rs.getFloat("pur_Quot_Discounted_Total"));
				quotation.setTxtTaxTotal(rs.getFloat("total_Tax"));
				quotation.setTxtRoundOff(rs.getString("round_Off"));
				quotation.setTxtAmtPayble(rs.getFloat("pur_Quot_Amt_Payable"));
				quotation.setOrderCreated(rs.getString("pur_Ord_Created"));
				quotationDetails.setSrNo(rs.getInt("pur_Quot_Sr_No"));
				quotationDetails.setProdId(rs.getString("product_Id"));
				quotationDetails.setItemCode(rs.getString("prod_Name"));
				quotationDetails.setDes(rs.getString("description"));
				quotationDetails.setUnit(rs.getString("unit_Of_Measure"));
				quotationDetails.setQuantity(rs.getInt("pur_Quot_Quantity"));
				quotationDetails.setUnitPrice(rs.getFloat("pur_Quot_Unit_Price"));				 				
				quotationDetails.setItemTotal(rs.getFloat("item_Total")); 				
				DetailsList.add(quotationDetails);
				quotation.setProductList(DetailsList);
				return quotation;
			}			
		});
		}catch(Exception e)
		{
			System.out.println(e); 
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
	public int updateQuotation(PurchaseQuotation purchaseQuotation) {
		//,i1=0,i2=0,i3=0
		int i=0,i4=0;
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");	     
		Date date = new Date();	   		 
		String updateDate=dateFormat.format(date);
		//String taxId="";
		try{
		sql = "UPDATE purchase_quoatation_header SET pur_Quot_Date='"+purchaseQuotation.getTxtQuotationDate()+"',"+"billingAddress='"+purchaseQuotation.getTxtBillingTo()+"',"+"shippingAddress='"+purchaseQuotation.getTxtAreaShipto()+"',"+"pur_Quot_PublicNote='"+purchaseQuotation.getTxtPubNotes()+"',"+"pur_Quot_PrivateNote='"+purchaseQuotation.getTxtPvtNotes()+"',"+"pur_Quot_Sub_Total='"+purchaseQuotation.getTxtSubTotal()+"',"+"discount_Type='"+purchaseQuotation.getRadio()+"',"+"discount_Value='"+purchaseQuotation.getTxtDiscount()+"',"+"pur_Quot_Discounted_Total='"+purchaseQuotation.getTxtDisTotal()+"',"+"total_Tax='"+purchaseQuotation.getTxtTaxTotal()+"',"+"round_Off='"+purchaseQuotation.getTxtRoundOff()+"',"+"pur_Quot_Amt_Payable='"+purchaseQuotation.getTxtAmtPayble()+"',"+"pur_Quot_Updated_By='"+purchaseQuotation.getUpdatedBy()+"',"+"pur_Quot_Update_Date='"+updateDate+"' WHERE pur_Quot_Id='"+purchaseQuotation.getTxyQuotationNo()+"'";
		i=jdbcTemplate.update(sql);
		String quotationId = purchaseQuotation.getTxyQuotationNo();
		deleteList(quotationId);
		/*deleteTaxDetailsList(quotationId);
		deleteLinkedTaxDetailsList(quotationId);
		
		List<TaxDetailsList> taxList=purchaseQuotation.getTaxList();			
		taxList.remove(0);				
		for (TaxDetailsList pur_quot_taxList : taxList)			
		{	
			String taxID=pur_quot_taxList.getTaxType();
			taxId=taxID.substring((taxID.indexOf("^"))+1, taxID.length());				
			String sql1="insert into purchase_quot_tax_details value('"+purchaseQuotation.getTxyQuotationNo()+"','"+taxId+"','"+pur_quot_taxList.getTxtTaxValue()+"','"+pur_quot_taxList.getTxtprevLinkTax()+"')";
			i1= jdbcTemplate.update(sql1);
		}			
		List<LinkedTaxDetails> linkedTaxList=purchaseQuotation.getLinkedTaxList();
		if(!(linkedTaxList.isEmpty())){
			linkedTaxList.remove(0);		
			for (LinkedTaxDetails linkedTaxDetails : linkedTaxList) {
				
				String sql4="insert into purchase_quot_linked_tax_details value('"+purchaseQuotation.getTxyQuotationNo()+"','"+linkedTaxDetails.getmTaxID()+"','"+linkedTaxDetails.getLinkedTaxId()+"','"+linkedTaxDetails.getSerLinkedTax()+"')";
				i2= jdbcTemplate.update(sql4);
			}
			}*/
			/*else
			{
				String sql4="insert into purchase_quot_linked_tax_details value('"+purchaseQuotation.getTxyQuotationNo()+"','"+taxId+"','0.0','0.0')";
				i3= jdbcTemplate.update(sql4);
			}	*/
		
		List<purchaseDetails> qdList = purchaseQuotation.getProductList();
		for(purchaseDetails qD : qdList)
		{
			sql="insert into purchase_quoatation_details value('"+qD.getSrNo()+"','"+purchaseQuotation.getTxyQuotationNo()+"','"+qD.getItemCode()+"','"+qD.getQuantity()+"','"+qD.getUnitPrice()+"','"+qD.getItemTotal()+"')";
			i4= jdbcTemplate.update(sql);
		}
		//&& i1>=1 && i2>=1 && i3>=1
		if(i>=1 && i4>=1)
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
	private void deleteList(String quotationId)
	{
		String deleteListUrl="DELETE FROM purchase_quoatation_details WHERE pur_Quot_Id= '"+quotationId+"'";
		jdbcTemplate.update(deleteListUrl);
	}
	/*private void deleteTaxDetailsList(String quotationId){
		String deleteListUrl="DELETE FROM purchase_quot_tax_details WHERE pur_Quot_Id= '"+quotationId+"'";
		jdbcTemplate.update(deleteListUrl);
	}
	private void deleteLinkedTaxDetailsList(String quotationId){
		String deleteListUrl="DELETE FROM purchase_quot_linked_tax_details WHERE pur_Quot_Id= '"+quotationId+"'";
		jdbcTemplate.update(deleteListUrl);
	}*/
	@Override
	public PurchaseQuotation autoId() {
		try{
		String qId="";
		RowCountCallbackHandler countCallback = new RowCountCallbackHandler();  // not reusable
		 jdbcTemplate.query("select * from purchase_quoatation_header", countCallback);
		 int count = countCallback.getRowCount();
		 count++;
		// System.out.println("Count="+count);
		 if(count<10)
		 {
		 qId="QOT00"+count;
		 }
		 else
		 {
		 if(count<99)
		 {
		 qId = "QOT0" + count;
		 }
		 else
		{
		qId = "QOT" + count;
		}
		} 
		 PurchaseQuotation quotation=new PurchaseQuotation();
		 quotation.setTxyQuotationNo(qId);
		return quotation;
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
		String sql = "select tax_id,tax_Name,purchase_tax_Rate from taxes" ;
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
	public List<purchaseDetails> showDetails(String quotationId) {
		
		try{
		String sql= "select * from vquotation WHERE pur_Quot_Id='"+quotationId+"' order by  pur_Quot_Sr_No " ;
		final List<purchaseDetails> qList=getJdbcTemplate().query(sql, new RowMapper<purchaseDetails>() {
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
			return qList;
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
	public String retriveShippiing(String venderId) {
		try{
		String sql="select shipping_Address from vendor_header where vender_ID='"+venderId+"' ";
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
				enq.setCstNo(rs.getString("vatNo"));
				enq.setVatNo(rs.getString("cstNo"));
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
	public int delete(String quotId) {
		try{
		String st = "InActive";
		sql = "update purchase_quoatation_header set status = '"+st+"' where pur_Quot_Id='"+quotId+"'";
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
		try{
		String sql="select comp_Mail from comp_details";
	final String sendermailid=(String) jdbcTemplate.queryForObject(sql,String.class);
	
	Properties props = new Properties();
	props.put("mail.smtp.auth", "true");
	props.put("mail.smtp.starttls.enable", "true");
	props.put("mail.smtp.host", "smtp.mandrillapp.com");
	props.put("mail.smtp.port", "587");

	Session session = Session.getInstance(props,
	  new javax.mail.Authenticator() {
		protected PasswordAuthentication getPasswordAuthentication() {
			return new PasswordAuthentication("jelastics.refo1@gmail.com","G3Oa7nuA5ItYeUWpRdbjXg");
		}
	  });
	try {
		 
		MimeMessage message = new MimeMessage(session);		
		MimeMessageHelper helper = new MimeMessageHelper(message, true);
	
		helper.setFrom(sendermailid);	
		message.addRecipients(Message.RecipientType.TO, InternetAddress.parse(composeMail.getMailTo()));
		message.addRecipients(Message.RecipientType.CC, InternetAddress.parse(composeMail.getMailCC()));
		message.addRecipients(Message.RecipientType.BCC, InternetAddress.parse(composeMail.getMailBCC()));
		helper.setSubject(composeMail.getSubject());
		helper.setText(String.format(
			composeMail.getBody()));
	
		helper.addAttachment("File",new File(System.getProperty("user.dir")+"/"+composeMail.getAttachment()));
		Transport.send(message);
       File file=new File(System.getProperty("user.dir")+"/"+composeMail.getAttachment());
       file.delete();	      

	} catch (MessagingException e) {
		throw new RuntimeException(e);
	}
	
	 return 1;       
		}catch(Exception e)
		{
			return 0;
		}
	}
	@Override
	public List<Vender> retrriveVenderInfo(String vendId,String id)
	{
		final String path = "Purchase Quotation.pdf";	
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
				venderInfo.setSubject("Purchase Quotation");
				String regards=jdbcTemplate.queryForObject("select comp_Name from comp_details",String.class);
				venderInfo.setRegards(regards);	
				venderInfo.setBodyPart("\t New Purchase Quotation is Generated For More Details\n Please Find The Attached PDF File.\n\nThank You..");
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
		try{
		//System.out.println("TaxId="+taxId);
		String sql="SELECT linkedTaxID,taxID,taxName,purchase_tax_rate FROM linkedtax where taxID='"+taxId+"' ";
		//String sql="SELECT taxName FROM linkedtax where taxID='"+taxId+"' ";
		final List<LinkedTax> linkedList=getJdbcTemplate().query(sql, new RowMapper<LinkedTax>()
		{
			private List<LinkedTax> tList = new ArrayList<LinkedTax>();
			public LinkedTax mapRow(ResultSet rs,int rowNo)throws SQLException
			{
				LinkedTax lTax=new LinkedTax();				
				lTax.setLinkTaxName(rs.getString("taxName"));
				//System.out.println(rs.getString("taxName"));
				lTax.setLinkPurTax(rs.getFloat("purchase_tax_rate"));
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
		RowCountCallbackHandler countCallback = new RowCountCallbackHandler();  // not reusable
		 jdbcTemplate.query("select * FROM linkedtax where taxID='"+taxId+"'", countCallback);
		 return countCallback.getRowCount();
		}catch(Exception e)
		{
			return 0;
		}
	}
	@Override
	public List<PurchaseQuotation> editPurQuotTaxDetails(String quoationId) {
		try{
			 final String quoationId1=quoationId;
			 RowCountCallbackHandler countCallback1 = new RowCountCallbackHandler();
			  jdbcTemplate.query("select * FROM vpurchasequottaxdetails where pur_Quot_Id='"+quoationId1+"'", countCallback1);
			  int counter1= countCallback1.getRowCount();
			  if(counter1!=0)
			  {
		String sql="select * from vpurchasequottaxdetails where pur_Quot_Id='"+quoationId+"'";		
		return jdbcTemplate.query(sql, new RowMapper<PurchaseQuotation>() {			
			List<TaxDetailsList> taxesList=new ArrayList<TaxDetailsList>();
			@Override
			public PurchaseQuotation mapRow(ResultSet rs, int arg1) throws SQLException {
				PurchaseQuotation purchaseQuotation=new PurchaseQuotation();				
				TaxDetailsList taxDetailsList=new TaxDetailsList();
				taxDetailsList.setTaxId(rs.getString("tax_Id"));
				String taxId=rs.getString("tax_Id");
				taxDetailsList.setTaxType(rs.getString("tax_Name"));
				taxDetailsList.setTaxRate(rs.getString("purchase_tax_Rate"));
				taxDetailsList.setTxtTaxValue(rs.getFloat("tax_Amout"));
				taxDetailsList.setTxtprevLinkTax(rs.getFloat("linked_Tax_Amt"));
				RowCountCallbackHandler countCallback = new RowCountCallbackHandler();
				 jdbcTemplate.query("select * FROM linkedtax where taxID='"+taxId+"'", countCallback);
				int counter= countCallback.getRowCount();
				taxDetailsList.setCounter(counter);
				taxesList.add(taxDetailsList);				
				purchaseQuotation.setTaxList(taxesList);
				return purchaseQuotation;
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
	public List<PurchaseQuotation> editPurQuotLinkedTaxDetails(String quoationId) {
		try{
		String sql="select * from vpurchasequotlinkedtaxdetails where pur_Quot_Id='"+quoationId+"'";		
		return jdbcTemplate.query(sql, new RowMapper<PurchaseQuotation>() {			
			List<LinkedTaxDetails> linkedTaxesList=new ArrayList<LinkedTaxDetails>();
			@Override
			public PurchaseQuotation mapRow(ResultSet rs, int arg1) throws SQLException {
				PurchaseQuotation purchaseQuotation=new PurchaseQuotation();				
				LinkedTaxDetails linkedTaxDetailsList=new LinkedTaxDetails();
				linkedTaxDetailsList.setmTaxID(rs.getString("tax_Id"));				
				linkedTaxDetailsList.setmTaxAmt(rs.getFloat("tax_Amout"));
				linkedTaxDetailsList.setLinkedTaxId(rs.getString("linked_Tax_Id"));
				linkedTaxDetailsList.setLinkedTaxName(rs.getString("taxName"));
				linkedTaxDetailsList.setLinkedTaxRate(rs.getFloat("linked_Tax_Rate"));
				linkedTaxDetailsList.setSerLinkedTax(rs.getFloat("linked_Tax_Amt"));				
				linkedTaxesList.add(linkedTaxDetailsList);				
				purchaseQuotation.setLinkedTaxList(linkedTaxesList);				
				return purchaseQuotation;
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
		String sql = "select purchase_Price from product_master where product_Id = '"+productId+"'";
		String unitprice = jdbcTemplate.queryForObject(sql, String.class);
		return unitprice;
	}
	}