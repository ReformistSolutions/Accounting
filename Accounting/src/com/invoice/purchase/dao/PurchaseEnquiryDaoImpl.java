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

import com.invoice.company.beans.CompanyDetails;
import com.invoice.inventory.beans.CreateNewProduct;
import com.invoice.purchase.beans.ComposeMail;
import com.invoice.purchase.beans.PurchaseEnquiry;
import com.invoice.purchase.beans.PurchaseEnquiryDetails;
import com.invoice.purchase.beans.Vender;


@Component(value="puchaseenquiryDao")
public class PurchaseEnquiryDaoImpl implements PurchaseEnquiryDao
{
	
	JdbcTemplate jdbcTemplate;
	private String sql;

	public JdbcTemplate getJdbcTemplate() 
	{
		return jdbcTemplate;
	}
	@Autowired
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) 
	{
		this.jdbcTemplate = jdbcTemplate;
	}
	@Override
	public int save(PurchaseEnquiry purchaseEnquiry) 
	{
		int iD=0,i=0;
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");	     
		Date date = new Date();	   		 
		String updateDate=dateFormat.format(date);
		try{
		sql="insert into purchase_enquiry_header value('"+purchaseEnquiry.getEnqID()+"','"+purchaseEnquiry.getSupplierName()+"','"+purchaseEnquiry.getEnqDate()+"','"+purchaseEnquiry.getPubNotes()+"','"+purchaseEnquiry.getPriNotes()+"','"+purchaseEnquiry.getCreatedBy()+"','"+purchaseEnquiry.getCreatedBy()+"','"+updateDate+"','No','Active')";
		i=jdbcTemplate.update(sql);
		List<PurchaseEnquiryDetails> eDList=purchaseEnquiry.getPurchasenquiryDetails();
		for (PurchaseEnquiryDetails ed : eDList)
		{
			String sql1="insert into purchase_enquiry_details value('"+ed.getSrNo()+"','"+purchaseEnquiry.getEnqID()+"','"+ed.getItemCode()+"','"+ed.getQuantity()+"')";
			iD= jdbcTemplate.update(sql1);
		}
		 if(i>0 && iD>0)
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
	public List<PurchaseEnquiry> show() 
	{
		try
		{
		String sql = "select * from venquiry where status = 'Active' GROUP BY pur_Enq_Id ";
		final List<PurchaseEnquiry> enqList=getJdbcTemplate().query(sql, new RowMapper<PurchaseEnquiry>(){
			private List<PurchaseEnquiry> purchaseEnquiryList = new ArrayList<PurchaseEnquiry>();	
			public PurchaseEnquiry mapRow(ResultSet rs, int rowNo) throws SQLException {
				
				PurchaseEnquiry purchaseEnquiry = new PurchaseEnquiry();
				purchaseEnquiry.setEnqID(rs.getString("pur_Enq_Id"));
				purchaseEnquiry.setSupplierName(rs.getString("vender_Name"));
				purchaseEnquiry.setEnqDate(rs.getString("pur_Date"));
				purchaseEnquiry.setQoutCreated(rs.getString("quot_Created")); 
				
				return purchaseEnquiry;
			}
		}); 
		return enqList;
		}catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public List<PurchaseEnquiry> view(String enquiryId)	
	{
		try
		{
		sql = "select * from venquiry where pur_Enq_Id='"+enquiryId+"' order by pur_Sr_No ";
		return jdbcTemplate.query(sql, new RowMapper<PurchaseEnquiry>(){
			List<PurchaseEnquiryDetails> enquiryDetailsList = new ArrayList<PurchaseEnquiryDetails>();
			public PurchaseEnquiry mapRow(ResultSet rs, int rowNo) throws SQLException {
				PurchaseEnquiry enquiry = new PurchaseEnquiry();
				PurchaseEnquiryDetails enquiryDetails = new PurchaseEnquiryDetails();
				enquiry.setEnqID(rs.getString("pur_Enq_Id"));
				enquiry.setVenderID(rs.getString("vender_ID"));
				enquiry.setSupplierName(rs.getString("vender_Name"));
				enquiry.setVenderEmail(rs.getString("vender_Email"));
				enquiry.setEnqDate(rs.getString("pur_Date"));
				enquiry.setPubNotes(rs.getString("pur_PublicNotes"));
				enquiry.setPriNotes(rs.getString("pur_PrivateNotes"));
				enquiry.setQoutCreated(rs.getString("quot_Created")); 
				
				enquiryDetails.setSrNo(rs.getInt("pur_Sr_No"));
				enquiryDetails.setProdId(rs.getString("product_Id"));
				enquiryDetails.setItemCode(rs.getString("prod_Name"));
				enquiryDetails.setDes(rs.getString("description"));
				enquiryDetails.setUnit(rs.getString("unit_of_measure"));
				enquiryDetails.setQuantity(rs.getString("pur_Quantity"));
				
				
				enquiryDetailsList.add(enquiryDetails);
				enquiry.setPurchasenquiryDetails(enquiryDetailsList);
				return enquiry;
			}			
		});
		}catch(Exception e)
		{
			return null;
		}
	} 
	@Override
	public List<CreateNewProduct> showProduct() 
	{
		try
		{
		sql = "select product_Id,prod_Name from product_master where prod_Type='Purchase Item' or prod_Type='Resale Product'" ;		
		final List<CreateNewProduct> prodList=getJdbcTemplate().query(sql, new RowMapper<CreateNewProduct>() 
		{
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
	public int updateEnquiry(PurchaseEnquiry purchaseEnquiry) 
	{	
		int iD=0,i=0;
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");	     
		Date date = new Date();	   		 
		String updateDate=dateFormat.format(date);
		String sql1;
		try
		{
		sql = "UPDATE purchase_enquiry_header SET pur_Date='"+purchaseEnquiry.getEnqDate()+"',"+"pur_PublicNotes='"+purchaseEnquiry.getPubNotes()+"',"+"pur_PrivateNotes='"+purchaseEnquiry.getPriNotes()+"',"+"pur_Update_By='"+purchaseEnquiry.getUpdatedBy()+"',"+"pur_Update_Date='"+updateDate+"' WHERE pur_Enq_Id='"+purchaseEnquiry.getEnqID()+"'";
		i=jdbcTemplate.update(sql);
		String enquiryId = purchaseEnquiry.getEnqID();
		deleteList(enquiryId);
		List<PurchaseEnquiryDetails> eDList=purchaseEnquiry.getPurchasenquiryDetails();
		for (PurchaseEnquiryDetails ed : eDList)			
		{
			sql1="insert into purchase_enquiry_details value('"+ed.getSrNo()+"','"+purchaseEnquiry.getEnqID()+"','"+ed.getItemCode()+"','"+ed.getQuantity()+"')";
			iD= jdbcTemplate.update(sql1);
		}
		if(i>=1 && iD>=1)
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
	private void deleteList(String enquiryId)
	{
		String deleteListUrl="DELETE FROM purchase_enquiry_details WHERE pur_Enq_Id= '"+enquiryId+"'";
		jdbcTemplate.update(deleteListUrl);
	}
	@Override
	public PurchaseEnquiry autoID() 
	{
		try
		{
		String enqId = "";
		RowCountCallbackHandler countCallback = new RowCountCallbackHandler();  // not reusable
		jdbcTemplate.query("select * from purchase_enquiry_header", countCallback);
		int count = countCallback.getRowCount();
		count++;
		if(count<10)
		{
			enqId="ENQ00"+count;
		}
		else
		{
			if(count<99)
			{
				enqId = "ENQ0" + count;
			}
			else
			{
				enqId = "ENQ" + count;
			}
		}
		PurchaseEnquiry purchaseEnquiry=new PurchaseEnquiry();
		purchaseEnquiry.setEnqID(enqId); 
		return purchaseEnquiry;
		}catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public List<Vender> showVenders() 
	{
		try
		{
		String sql = "select * from vendor_header where vender_Status = 'Active' order by vender_Name" ;
		final List<Vender> venderList=getJdbcTemplate().query(sql, new RowMapper<Vender>() 
		{
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
	public List<PurchaseEnquiryDetails> showDetails(String enquiryId) 
	{
		try
		{
		String sql = "select * from venquiry where pur_Enq_Id='"+enquiryId+"' order by pur_Sr_No ";
		final List<PurchaseEnquiryDetails> enqList=getJdbcTemplate().query(sql, new RowMapper<PurchaseEnquiryDetails>(){
			private List<PurchaseEnquiryDetails> dEnquiryList = new ArrayList<PurchaseEnquiryDetails>();	
			public PurchaseEnquiryDetails mapRow(ResultSet rs, int rowNo) throws SQLException {
				
				PurchaseEnquiryDetails dEnquiry = new PurchaseEnquiryDetails();
				PurchaseEnquiry pEnquiry = new PurchaseEnquiry(); 
				pEnquiry.setEnqID(rs.getString("pur_Enq_Id"));
				dEnquiry.setSrNo(rs.getInt("pur_Sr_No"));
				dEnquiry.setItemCode(rs.getString("prod_Name"));
				dEnquiry.setDes(rs.getString("description"));
				dEnquiry.setUnit(rs.getString("unit_of_measure")); 
				dEnquiry.setQuantity(rs.getString("pur_Quantity")); 
				dEnquiryList.add(dEnquiry);
				return dEnquiry;
			}
		}); 
		return enqList;
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
	public String retriveUnit(String productId) 
	{
		try
		{
			String sql="select unit_Of_Measure from product_master where product_Id='"+productId+"'";
			String unit=(String) jdbcTemplate.queryForObject(sql, String.class);
			return unit;
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
	public int delete(String enquiryId) 
	{
		try{
		sql = "update purchase_enquiry_header set status = 'Inactive' where pur_Enq_Id='"+enquiryId+"'";
		int i = jdbcTemplate.update(sql) ;
		return i;
		}catch(Exception e)
		{
			return 0;
		}
	}
	@Override
	public int sendMail(final ComposeMail composeMail)
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
		
			helper.addAttachment(composeMail.getId(),new File(System.getProperty("user.dir")+"/"+composeMail.getAttachment()));
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
		final String path = "Purchase Enquiry.pdf";	
		final String id1=id;
		try
		{
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
				venderInfo.setSubject("Purchase Enquiry");    				
				String regards=jdbcTemplate.queryForObject("select comp_Name from comp_details",String.class);
				venderInfo.setRegards(regards);	
				venderInfo.setBodyPart("\t New Purchase Enquiry is Generated For More Details\n Please Find The Attached PDF File.\n\nThank You..");
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
	
	
}