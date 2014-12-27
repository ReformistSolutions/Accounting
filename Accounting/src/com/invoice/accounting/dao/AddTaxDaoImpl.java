package com.invoice.accounting.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCountCallbackHandler;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.invoice.accounting.beans.AddNewTax;
import com.invoice.accounting.beans.LinkedTax;
import com.invoice.accounting.beans.Taxes;


@Component(value="addTaxDao")
public class AddTaxDaoImpl implements AddTaxDao{

	 
	 JdbcTemplate jdbcTemplate;
	 String sql;
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	@Autowired
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	@Override
	public int save(AddNewTax addNewTax,LinkedTax linkedTax) {
		
		int j = 0,j1=0,i = 0,i1=0,k = 0,k1=0;
		String status="Active";
		String sales="S";
		String purchase="P";
		String salestax=addNewTax.getSalepurchase();		
		if(salestax.equals("sales"))
		{
			String sql="insert into taxes(tax_id,tax_Name,registration_No,filling_frequency,tax_apply_to,sales_tax_rate,description,status) value('"+addNewTax.getTaxid()+"','"+addNewTax.getTxtTaxName()+"','"+addNewTax.getTxtRegNo()+"','"+addNewTax.getTxtFillingFre()+"','"+sales+"','"+addNewTax.getTxtSalesTaxRate()+"','"+addNewTax.getTxtDescription()+"','"+status+"')";
			i=jdbcTemplate.update(sql);	
			List<LinkedTax> linkedTaxList=addNewTax.getLinkedTax();
			for (LinkedTax lTaxList : linkedTaxList) {				
				if(lTaxList.getLinkTaxName()!= "")
				{
					String sql1="insert into linkedtax(taxID,taxName,registraionNo,sales_tax_rate,filling_frequency,description,status) value('"+addNewTax.getTaxid()+"','"+lTaxList.getLinkTaxName()+"','"+lTaxList.getLinkregNo()+"','"+lTaxList.getRate()+"','"+addNewTax.getTxtFillingFre()+"','"+lTaxList.getLinkdesc()+"','"+status+"')";
					i1=jdbcTemplate.update(sql1);
				}
			}
			/*if(addNewTax.getLinkTaxID() != "")
			{
				String sql1="insert into linkedtax(linkedTaxID,taxID,taxName,registraionNo,sales_tax_rate,description,status) value('"+addNewTax.getLinkTaxID()+"','"+addNewTax.getTaxid()+"','"+addNewTax.getLinkTaxName()+"','"+addNewTax.getLinkregNo()+"','"+addNewTax.getLinksalesTax()+"','"+addNewTax.getLinkdesc()+"','"+status+"')";
				i1=jdbcTemplate.update(sql1);
			}*/
		}
		
		else if(salestax.equals("purchase"))
		{
			String sql2="insert into taxes(tax_id,tax_Name,registration_No,filling_frequency,tax_apply_to,purchase_tax_rate,filling_frequency,description,status) value('"+addNewTax.getTaxid()+"','"+addNewTax.getTxtTaxName()+"','"+addNewTax.getTxtRegNo()+"','"+addNewTax.getTxtFillingFre()+"','"+purchase+"','"+addNewTax.getTxtPurTax()+"','"+addNewTax.getTxtDescription()+"','"+status+"')";	
			j=jdbcTemplate.update(sql2);
			List<LinkedTax> linkedTaxList=addNewTax.getLinkedTax();
			for (LinkedTax lTaxList : linkedTaxList) {				
				if(lTaxList.getLinkTaxName()!= "")
				{
					String sql1="insert into linkedtax(taxID,taxName,registraionNo,purchase_tax_rate,filling_frequency,description,status) value('"+addNewTax.getTaxid()+"','"+lTaxList.getLinkTaxName()+"','"+lTaxList.getLinkregNo()+"','"+lTaxList.getRate()+"','"+addNewTax.getTxtFillingFre()+"','"+lTaxList.getLinkdesc()+"','"+status+"')";
					j1=jdbcTemplate.update(sql1);
				}
			}
			/*if(addNewTax.getLinkTaxID() != "")
			{
				String sql3="insert into linkedtax(linkedTaxID,taxID,taxName,registraionNo,purchase_tax_rate,description,status) value('"+addNewTax.getLinkTaxID()+"','"+addNewTax.getTaxid()+"','"+addNewTax.getLinkTaxName()+"','"+addNewTax.getLinkregNo()+"','"+addNewTax.getLinkPurTax()+"','"+addNewTax.getLinkdesc()+"','"+status+"')";
				j1=jdbcTemplate.update(sql3);
			}*/
		}
		else
		{			
			String salepur="B";
			String sql4="insert into taxes(tax_id,tax_Name,registration_No,filling_frequency,tax_apply_to,sales_tax_rate,purchase_tax_rate,description,status) value('"+addNewTax.getTaxid()+"','"+addNewTax.getTxtTaxName()+"','"+addNewTax.getTxtRegNo()+"','"+addNewTax.getTxtFillingFre()+"','"+salepur+"','"+addNewTax.getTxtSalesTaxRate()+"','"+addNewTax.getTxtPurTax()+"','"+addNewTax.getTxtDescription()+"','"+status+"')";	
			k=jdbcTemplate.update(sql4);
			List<LinkedTax> linkedTaxList=addNewTax.getLinkedTax();
			for (LinkedTax lTaxList : linkedTaxList) {				
				if(lTaxList.getLinkTaxName()!= "")
				{
					String sql1="insert into linkedtax(taxID,taxName,registraionNo,sales_tax_rate,purchase_tax_rate,filling_frequency,description,status) value('"+addNewTax.getTaxid()+"','"+lTaxList.getLinkTaxName()+"','"+lTaxList.getLinkregNo()+"','"+lTaxList.getRate()+"','"+lTaxList.getRate()+"','"+addNewTax.getTxtFillingFre()+"','"+lTaxList.getLinkdesc()+"','"+status+"')";
					k1=jdbcTemplate.update(sql1);
				}
			}
			/*if(addNewTax.getLinkTaxID() != "")
			{
				String sql5="insert into linkedtax(linkedTaxID,taxID,taxName,registraionNo,sales_tax_rate,purchase_tax_rate,description,status) value('"+addNewTax.getLinkTaxID()+"','"+addNewTax.getTaxid()+"','"+addNewTax.getLinkTaxName()+"','"+addNewTax.getLinkregNo()+"','"+addNewTax.getLinksalesTax()+"','"+addNewTax.getLinkPurTax()+"','"+addNewTax.getLinkdesc()+"','"+status+"')";
				k1=jdbcTemplate.update(sql5);
			}*/
		}
		if(i>=1 && j>=1 && k>=1&&i1>=1&&j1>=1&&k1>=1)
		 {
			 return 1;
		 }
		 else
		 {
			 return 0;	 
		 }
	}
	
	@Override
	public AddNewTax genrateID() {
		String taxId="";
		RowCountCallbackHandler countCallback = new RowCountCallbackHandler(); // not reusable
		 jdbcTemplate.query("select * from taxes", countCallback);
		 int count = countCallback.getRowCount();
		 count++;
		// System.out.println("Count="+count);
		 if(count<10)
		 {
			 taxId="TAX00"+count;
		 }
		 else
		 {
		 if(count<99)
		 {
			 taxId = "TAX0" + count;
		 }
		 else
		{
			 taxId = "TAX" + count;
		}
		 }
		 AddNewTax addNewTax=new AddNewTax();
		 addNewTax.setTaxid(taxId);
		return addNewTax;
	}
	@Override
	public List<Taxes> showSalesTax() {
		try{
		String sql="select * from taxes where tax_apply_to='S' OR tax_apply_to='B'";		
		return jdbcTemplate.query(sql, new RowMapper<Taxes>() {		
			List<Taxes> taxList=new ArrayList<Taxes>();			
			@Override
			public Taxes mapRow(ResultSet rs, int arg1)
					throws SQLException {
				Taxes taxes=new Taxes();
				//String taxId=rs.getString("tax_id");
				taxes.setTaxName(rs.getString("tax_Name"));
				taxes.setRegNo(rs.getString("registration_No"));
				taxes.setFillFreq(rs.getString("filling_frequency"));
				taxes.setTaxRate(rs.getFloat("sales_tax_rate"));
				/*float totalTax=jdbcTemplate.queryForObject("select sum(tax_Amount) from sales_invoice_tax_details where tax_Id='"+taxId+"'",Float.class);
				taxes.setTotalTaxAmt(totalTax);*/
				taxList.add(taxes);
				return taxes;
			}
		});
		}catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public List<LinkedTax> showSalesLinkedTax() {
		try{
			String sql="select * from linkedtax";		
			return jdbcTemplate.query(sql, new RowMapper<LinkedTax>() {		
				List<LinkedTax> linkedTaxList=new ArrayList<LinkedTax>();
				@Override
				public LinkedTax mapRow(ResultSet rs, int arg1) throws SQLException {
					LinkedTax linkedTax=new LinkedTax();
					//String lTaxId=rs.getString("linkedTaxID");
					linkedTax.setLinkTaxName(rs.getString("taxName"));
					linkedTax.setLinkregNo(rs.getString("registraionNo"));
					linkedTax.setLinksalesTax(rs.getFloat("sales_tax_rate"));
					linkedTax.setlTaxFillingFreq(rs.getString("filling_frequency"));
					/*float totalLTax=jdbcTemplate.queryForObject("select sum(linked_Tax_Amt) from sales_inv_linked_tax_details where linked_Tax_Id='"+lTaxId+"'",Float.class);
					linkedTax.setTotalLinkedTax(totalLTax);*/
					linkedTaxList.add(linkedTax);
					return linkedTax;
				}
			});
			}catch(Exception e)
			{
				return null;
			}
	}
	@Override
	public List<Taxes> showPurTax() {
		try{
			String sql="select * from taxes where tax_apply_to='P' OR tax_apply_to='B'";		
			return jdbcTemplate.query(sql, new RowMapper<Taxes>() {		
				List<Taxes> taxList=new ArrayList<Taxes>();
				@Override
				public Taxes mapRow(ResultSet rs, int arg1) throws SQLException {
					Taxes taxes=new Taxes();
					//String taxId=rs.getString("tax_id");
					taxes.setTaxName(rs.getString("tax_Name"));
					taxes.setRegNo(rs.getString("registration_No"));
					taxes.setFillFreq(rs.getString("filling_frequency"));
					taxes.setTaxRate(rs.getFloat("purchase_tax_Rate"));
				/*	float totalTax=jdbcTemplate.queryForObject("select sum(tax_Amt) from purchase_tax_details where tax_Id='"+taxId+"'",Float.class);
					taxes.setTotalTaxAmt(totalTax);*/
					taxList.add(taxes);
					return taxes;
				}
			});
			}catch(Exception e)
			{
				return null;
			}
	}
	@Override
	public List<LinkedTax> showPurLinkedTax() {
		try{
			String sql="select * from linkedtax";		
			return jdbcTemplate.query(sql, new RowMapper<LinkedTax>() {		
				List<LinkedTax> linkedTaxList=new ArrayList<LinkedTax>();
				@Override
				public LinkedTax mapRow(ResultSet rs, int arg1) throws SQLException {
					LinkedTax linkedTax=new LinkedTax();
					//String lTaxId=rs.getString("linkedTaxID");
					linkedTax.setLinkTaxName(rs.getString("taxName"));
					linkedTax.setLinkregNo(rs.getString("registraionNo"));
					linkedTax.setLinksalesTax(rs.getFloat("purchase_tax_rate"));
					linkedTax.setlTaxFillingFreq(rs.getString("filling_frequency"));
					/*float totalLTax=jdbcTemplate.queryForObject("select sum(linked_Tax_Amt) from purchase_linked_tax_details where linked_Tax_Id='"+lTaxId+"'",Float.class);
					linkedTax.setTotalLinkedTax(totalLTax);*/
					linkedTaxList.add(linkedTax);
					return linkedTax;
				}
			});
			}catch(Exception e)
			{
				return null;
			}
	}
	
}