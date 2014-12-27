package com.invoice.inventory.dao;

import java.io.File;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCountCallbackHandler;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import com.invoice.company.beans.CompanyDetails;
import com.invoice.inventory.beans.ComposeMail;
import com.invoice.inventory.beans.CreateNewProduct;
import com.invoice.inventory.beans.Warehouse;
import com.invoice.inventory.beans.WarehouseDetails;

@Component("warehouseDao")
public class WarehouseDaoImpl implements WarehouseDao
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
	public Warehouse generateID() {
		String Wid = "";
	
		RowCountCallbackHandler countCallback = new RowCountCallbackHandler();  // not reusable
		jdbcTemplate.query("select * from warehouse_header", countCallback);
		 int count = countCallback.getRowCount();
		 count++;
		 if(count<10)
		 {
			 Wid="WRH00"+count;
		 }
		 else
		 {
		 if(count<99)
		 {
			 Wid = "WRH0" + count;
		 }
		 else
		{
			 Wid = "WRHO" + count;
		}
		 }
		 Warehouse warehouse=new Warehouse();
		 warehouse.setWarehousrID(Wid);
		 return warehouse;
	}
	@Override
	public int save(Warehouse warehouse) {
		String status="Active";
		int iD=0;
		try{
		String sql="insert into warehouse_header value('"+warehouse.getWarehousrID()+"','"+warehouse.getWareHouseName()+"','"+warehouse.getAddress()+"','"+warehouse.getComments()+"','"+status+"')";
		int i=jdbcTemplate.update(sql);
		List<WarehouseDetails> warehouselist=warehouse.getWarehousedetails();
		for(WarehouseDetails warehousedetaillist : warehouselist)
		{
			String sql1="insert into warehouse_details value('"+warehousedetaillist.getSrNo()+"','"+warehouse.getWarehousrID()+"','"+warehousedetaillist.getItemCode()+"','"+warehousedetaillist.getQuantity()+"','"+status+"')";
			iD=jdbcTemplate.update(sql1);
			
			String sql2 = "update warehouse_details set warehouse_Quantity = warehouse_Quantity - '"+warehousedetaillist.getQuantity()+"' where warehouse_Id = 'WRH001' and product_Id = '"+warehousedetaillist.getItemCode()+"'";
			iD=jdbcTemplate.update(sql2);
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
	@Override
	public List<CreateNewProduct> retriveProduct() {
		String sql="select * from product_master where status='Active'";	
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
	public List<Warehouse> editWarehouse(String warehousrID) {
		
		String sql="select * from vwarehouse where warehouse_Id='"+warehousrID+"'";
		return jdbcTemplate.query(sql, new RowMapper<Warehouse>(){
			List<WarehouseDetails> warehouseDetailsList=new ArrayList<WarehouseDetails>();

			@Override
			public Warehouse mapRow(ResultSet rs, int arg1) throws SQLException{
				Warehouse warehouse=new Warehouse();
				WarehouseDetails warehousedetails=new WarehouseDetails();
				
				warehouse.setWarehousrID(rs.getString("warehouse_Id"));
				warehouse.setWareHouseName(rs.getString("warehouse_Name"));
				warehouse.setAddress(rs.getString("warehouse_Address"));
				warehouse.setComments(rs.getString("warehouse_Comment"));
				 
				warehousedetails.setSrNo(rs.getInt("sr_No"));
				warehousedetails.setItemId(rs.getString("product_Id"));
				warehousedetails.setItemCode(rs.getString("prod_Name"));
				warehousedetails.setUnit(rs.getString("unit_Of_Measure"));
				warehousedetails.setDecription(rs.getString("description"));
				warehousedetails.setQuantity(rs.getString("warehouse_Quantity"));
				
				warehouseDetailsList.add(warehousedetails);
				
				warehouse.setWarehousedetails(warehouseDetailsList);
				return warehouse;
			}
		});
}
	@Override
	public List<Warehouse> show() {
		String sql="select * from vwarehouse where status='Active' group by warehouse_Id";
		final List<Warehouse> warehouseList=getJdbcTemplate().query(sql, new RowMapper<Warehouse>(){
			private List<Warehouse> warehouseList1=new ArrayList<Warehouse>();
			public Warehouse mapRow(ResultSet rs, int rowNo)throws SQLException
					 {
				Warehouse warehouse=new Warehouse();
				
				warehouse.setWarehousrID(rs.getString("warehouse_Id"));
				warehouse.setWareHouseName(rs.getString("warehouse_Name"));
				warehouse.setAddress(rs.getString("warehouse_Address"));

				
				warehouseList1.add(warehouse);
				return warehouse;
			}
		});
		return warehouseList;
		
		
	}
	@Override
	public int update(Warehouse warehouse) {
		
		int j=1;
		
		String sql="update warehouse_header Set warehouse_Name='"+warehouse.getWareHouseName()+"',"+"warehouse_Address='"+warehouse.getAddress()+"',"+"warehouse_Comment='"+warehouse.getComments()+"' where warehouse_Id='"+warehouse.getWarehousrID()+"'";
		int i=jdbcTemplate.update(sql);
		String WarehouseId=warehouse.getWarehousrID();
		deleteList(WarehouseId);
		List<WarehouseDetails> warehousedetails = warehouse.getWarehousedetails();
		for(WarehouseDetails warehousedetailslist : warehousedetails)
		{
			String sql1="insert into warehouse_details value('"+warehousedetailslist.getSrNo()+"','"+warehouse.getWarehousrID()+"','"+warehousedetailslist.getItemCode()+"','"+warehousedetailslist.getQuantity()+"','Active')";
			j=jdbcTemplate.update(sql1);
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
	}
	private void deleteList(String warehouseId) {
		String deleteList="delete from warehouse_details where warehouse_Id='"+warehouseId+"'";
		jdbcTemplate.update(deleteList);
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
	public int sendMail(final ComposeMail composeMail) {
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
			helper.setTo(composeMail.getMailTo());
			helper.setCc(composeMail.getMailCC());
			helper.setBcc(composeMail.getMailBCC());
			helper.setSubject(composeMail.getSubject());
			helper.setText(String.format(
				composeMail.getBody()));
			helper.addAttachment("Pdf", new File(composeMail.getAttachment()));
	 
	         Transport.send(message);
	       

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
		
		 return 1;       
		


	}
	@Override
	public String retriveWarehouseAvailqty(String productId) 
	{
		try
		{
		String sql="select warehouse_Quantity from warehouse_details where product_Id='"+productId+"'";
		String Qty=jdbcTemplate.queryForObject(sql, String.class);
		return Qty;
		}
		catch(Exception e)
		{
			System.out.println(e);
			return null;
		}
	}
	}

