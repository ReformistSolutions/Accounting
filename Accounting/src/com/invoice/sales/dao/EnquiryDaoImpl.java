package com.invoice.sales.dao;



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
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCountCallbackHandler;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import com.invoice.accounting.beans.Taxes;
import com.invoice.company.beans.CompanyDetails;
import com.invoice.customer.beans.Customer;
import com.invoice.inventory.beans.CreateNewProduct;
import com.invoice.sales.beans.ComposeMail;
import com.invoice.sales.beans.Enquiry;
import com.invoice.sales.beans.EnquiryDetails;



@Component(value="enquiryDao")
public class EnquiryDaoImpl implements EnquiryDao {
	HttpServletResponse response;
	HttpServletRequest request;
	private static String sql,sql1;	
	private JdbcTemplate jdbcTemplate;
	ServletContext servletContext;	
	
	
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	@Autowired
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Override
	public List<Enquiry> show() {	
		try{
		sql="select * from vsalesenquiry where status='Active' group by enq_Id";		
		final List<Enquiry> enquiryList=getJdbcTemplate().query(sql, new RowMapper<Enquiry>() {
		private List<Enquiry> salesEnquiryList=new ArrayList<Enquiry>();
		public Enquiry mapRow(ResultSet rs,int rowNo)throws SQLException
		{
			Enquiry enq=new Enquiry();
			enq.setTxtEnqId(rs.getString("enq_Id"));
			enq.setTxtCutName(rs.getString("customer_Name"));
			DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy"); 
		    String enq_Date=dateFormat.format(rs.getDate("enq_Date"));
		    enq.setTxtDate(enq_Date);
			enq.setStatus(rs.getString("status"));
			enq.setEstCreated(rs.getString("est_Created"));
			salesEnquiryList.add(enq);
			return enq;
		}	
	});		
		return enquiryList;
		}catch(Exception e)
		{
			return null;
		}
	}
	
	@Override
	public int save(Enquiry enquiry){
		 int iD=0;		
		 
			DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");	     
			Date date = new Date();	   		 
			String updateDate=dateFormat.format(date);
			try{
		 String url="insert into sales_enq_header value('"+enquiry.getTxtEnqId()+"','"+enquiry.getTxtCutName()+"','"+enquiry.getTxtDate()+"','"+enquiry.getTxtPubNotes()+"','"+enquiry.getTxtPvtNotes()+"','"+enquiry.getCreatedBy()+"','"+enquiry.getCreatedBy()+"','"+updateDate+"','No','Active')";
		 int i=jdbcTemplate.update(url); 
        List<EnquiryDetails> eDList=enquiry.getEnquiryDetails();
		for (EnquiryDetails ed : eDList)			
		{
			
			sql1="insert into sales_enq_details value('"+ed.getSrNo()+"','"+enquiry.getTxtEnqId()+"','"+ed.getItemCode()+"','"+ed.getQuantity()+"')";
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
				return 0;
			}
	}
	@Override
	public List<Enquiry> editEnquiry(String enquiryId) {	
		try{
		sql="select * from vsalesenquiry where enq_Id='"+enquiryId+"' group by srNo";		
		return jdbcTemplate.query(sql, new RowMapper<Enquiry>() {
			List<EnquiryDetails> enquiryDetails =new ArrayList<EnquiryDetails>();
			@Override
			public Enquiry mapRow(ResultSet rs, int arg1) throws SQLException {
				Enquiry enq=new Enquiry();
				EnquiryDetails enqDetails=new EnquiryDetails();
				enq.setTxtEnqId(rs.getString("enq_Id"));				
				enq.setTxtCutName(rs.getString("customer_Name"));
				enq.setCustID(rs.getString("customer_ID"));				
				enq.setTxtDate(rs.getString("enq_Date"));
				enq.setTxtPubNotes(rs.getString("public_Notes"));
				enq.setTxtPvtNotes(rs.getString("private_Notes"));
				enq.setEstCreated(rs.getString("est_Created"));
				enqDetails.setSrNo(rs.getInt("srNo"));
				enqDetails.setItemCode(rs.getString("prod_Name"));
				enqDetails.setDes(rs.getString("description"));
				enqDetails.setQuantity(rs.getString("quantity"));				
				enqDetails.setItemId(rs.getString("product_Code"));
				enq.setCustVatNo(rs.getString("vat_No"));
				enqDetails.setMunit(rs.getString("unit_Of_Measure"));
				enqDetails.setUnitPrice(rs.getFloat("sales_Price"));
				
				enquiryDetails.add(enqDetails);
				enq.setEnquiryDetails(enquiryDetails);				
				return enq;
			}
		});
		}catch(Exception e)
		{
			return null;
		}
	}
	
	@Override
	public int updateEnquiry(Enquiry enquiry){		
		int iD=0;
		java.sql.Timestamp updateDate=new java.sql.Timestamp(new java.util.Date().getTime());
		try{
		String updateEnqHeaderUrl="UPDATE sales_enq_header SET public_Notes='"+enquiry.getTxtPubNotes()+"',"+"private_Notes='"+enquiry.getTxtPvtNotes()+"',"+"updated_By='"+enquiry.getUpdatedBy()+"',"+"update_Date='"+updateDate+"' WHERE enq_Id='"+enquiry.getTxtEnqId()+"'";
		int i=jdbcTemplate.update(updateEnqHeaderUrl);
		deleteList(enquiry.getTxtEnqId());
		
		List<EnquiryDetails> eDList=enquiry.getEnquiryDetails();
		for (EnquiryDetails ed : eDList)			
		{
			
			sql1="insert into sales_enq_details value('"+ed.getSrNo()+"','"+enquiry.getTxtEnqId()+"','"+ed.getItemCode()+"','"+ed.getQuantity()+"')";
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
			return 0;
		}
			
	}
	
	private void deleteList(String enquiryId){
		try{
		String deleteListUrl="DELETE FROM sales_enq_details WHERE enq_Id= '"+enquiryId+"'";
		jdbcTemplate.update(deleteListUrl);
		}catch(Exception e)
		{
			
		}
	}
	
	@Override
	public List<CreateNewProduct> retriveProductList() {
		try{
		sql="select * from product_master where prod_Type='Resale Product' or prod_Type='Sale Item' and status='Active' ";		
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
	public List<Customer> retriveCustomerList() {
		try{
		sql="select customer_ID,customer_Name from customer_header where customer_Status='Active' order by customer_Name ASC";		
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
	public Enquiry generateId() {
		String enqId="";
		try{
		RowCountCallbackHandler countCallback = new RowCountCallbackHandler();  // not reusable
		 jdbcTemplate.query("select * from sales_enq_header", countCallback);
		 int count = countCallback.getRowCount();
		 count++;
		// System.out.println("Count="+count);
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
		 Enquiry enquiry=new Enquiry();
		 enquiry.setTxtEnqId(enqId);
		return enquiry;
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
	public String retriveMUnit(String productId) {
		try{
		String sql="select unit_Of_Measure from product_master where product_Id='"+productId+"'";
		String mUnit=(String) jdbcTemplate.queryForObject(sql, String.class); 		
		return mUnit;
		}catch(Exception e)
		{
			System.out.println(e);
			return null;
		}
	}
	@Override
	public int deleteEnquiry(String enquiryId) {
		
		String status="Inactive";
		String updateEnqHeaderUrl="UPDATE sales_enq_header SET status='"+status+"' WHERE enq_Id='"+enquiryId+"'";
		int i=jdbcTemplate.update(updateEnqHeaderUrl);
		return i;
		
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
	public List<Customer> retriveCustInfo(String custId,String id) {
		final String path = "Sales Enquiry.pdf";	
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
			custoInfo.setSubject("Sales Enquiry");
			String regards=jdbcTemplate.queryForObject("select comp_Name from comp_details",String.class);
			custoInfo.setRegards(regards);	
			custoInfo.setBodyPart("\t New Sales Enquiry is Generated For More Details\n Please Find The Attached PDF File.\n\nThank You..");
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
	public List<Taxes> getTaxes(Taxes taxes) {

		try{
		 String sql="select registration_No from taxes";		
		final List<Taxes> taxList=getJdbcTemplate().query(sql, new RowMapper<Taxes>() {
		private List<Taxes> tList=new ArrayList<Taxes>();
		public Taxes mapRow(ResultSet rs,int rowNo)throws SQLException
		{
			Taxes taxnm=new Taxes();
			taxnm.setRegNo(rs.getString("registration_No"));
			
			tList.add(taxnm);				
			return taxnm;
		}	
	});		
		return taxList;
	
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
	public String ShowRestore() 
	{
		String notUpdate = jdbcTemplate.queryForObject("select msgName from messages where msgID='MSG004'", String.class);
		return notUpdate;
	}
	@Override
	public String ShowNotRestrore() 
	{
		String notUpdate = jdbcTemplate.queryForObject("select msgName from messages where msgID='MSG009'", String.class);
		return notUpdate;
	}
	
}
