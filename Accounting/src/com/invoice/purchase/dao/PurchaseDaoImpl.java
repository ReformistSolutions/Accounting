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

import com.invoice.accounting.beans.JournalDetails;
import com.invoice.accounting.beans.Taxes;
import com.invoice.company.beans.CompanyDetails;
import com.invoice.inventory.beans.CreateNewProduct;
import com.invoice.purchase.beans.PurchaseVoucher;
import com.invoice.purchase.beans.Purchases;
import com.invoice.purchase.beans.Vender;
import com.invoice.purchase.beans.purchaseDetails;
import com.invoice.sales.beans.LinkedTaxDetails;
import com.invoice.sales.beans.TaxDetailsList;

@Component("purchaseDao")
public class PurchaseDaoImpl implements PurchaseDao{

	JdbcTemplate jdbcTemplate;
	
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	@Autowired
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	@Override
	public Purchases generateId() {
		try{
		String purchaseNo="";
		RowCountCallbackHandler countCallback = new RowCountCallbackHandler();  // not reusable
		 jdbcTemplate.query("select * from purchases_header", countCallback);
		 int count = countCallback.getRowCount();
		 count++;
		// System.out.println("Count="+count);
		 if(count<10)
		 {
			 purchaseNo="PUR00"+count;
		 }
		 else
		 {
		 if(count<99)
		 {
			 purchaseNo = "PUR0" + count;
		 }
		 else
		{
			 purchaseNo = "PUR" + count;
		}
		 }
		 Purchases purchase=new Purchases();
		 purchase.setTxtPurchaseNo(purchaseNo);
		return purchase;
		}catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public List<CreateNewProduct> showProduct() {
		try{
		String sql = "select product_Id,prod_Name from product_master where prod_Type='Purchase Item' or prod_Type='Resale Product'" ;
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
	public List<Purchases> showPurchases() {
		try{
		String sql = "select DISTINCT * from vpurchases where purs_Status = 'Active' GROUP BY purchase_Id";
		final List<Purchases> purList = getJdbcTemplate().query(sql, new RowMapper<Purchases>()
			{
			private List<Purchases> purchaseLIst = new ArrayList<Purchases>();
			public Purchases mapRow(ResultSet rs, int rowNo)throws SQLException {
				
				Purchases purchases = new Purchases();
				purchases.setTxtPurchaseNo(rs.getString("purchase_Id")); 
				purchases.setSelSupplierName(rs.getString("vender_Name"));
				purchases.setTxtPurchaseDate(rs.getString("purs_Date"));
				purchases.setTxtAmtPayble(rs.getFloat("purs_Amt_Payable"));				
				purchases.setBalAmt(rs.getFloat("bal_Amt"));
				purchaseLIst.add(purchases);
				return purchases;
			}
					
		});
		return purList;
		}catch(Exception e)
		{
			System.out.println(e);
			return null;
		}
}
	
	@Override
	public int save(Purchases purchases) {
		try{
		int i=0,i1=0,i2=0,i4=0,i5=0,i6=0,i7=0,i8=0,i9=0;
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");	     
		Date date = new Date();	   		 
		String updateDate=dateFormat.format(date);		
		String sql="insert into purchases_header value('"+purchases.getTxtPurchaseNo()+"','"+purchases.getSelSupplierName()+"','"+purchases.getTxtPurchaseDate()+"','"+purchases.getTxtDueDate()+"','"+purchases.getTxtAreaAddress()+"','"+purchases.getTxtPubNotes()+"','"+purchases.getTxtPvtNotes()+"','"+purchases.getTxtSubTotal()+"','"+purchases.getRadio()+"','"+purchases.getTxtDiscount()+"','"+purchases.getTxtDisTotal()+"','"+purchases.getTxtTaxTotal()+"','"+purchases.getTxtRoundOff()+"','"+purchases.getTxtAmtPayble()+"','"+purchases.getTxtAmtPayble()+"','"+purchases.getCreatedBy()+"','"+purchases.getCreatedBy()+"','"+updateDate+"','Active')";
		i=jdbcTemplate.update(sql);
		
		String taxId="";
		List<TaxDetailsList> taxList=purchases.getTaxList();			
		taxList.remove(0);				
		for (TaxDetailsList pur_quot_taxList : taxList)			
		{	
			String taxID=pur_quot_taxList.getTaxType();
			taxId=taxID.substring((taxID.indexOf("^"))+1, taxID.length());				
			String sql1="insert into purchase_tax_details value('"+purchases.getTxtPurchaseNo()+"','"+taxId+"','"+pur_quot_taxList.getTxtTaxValue()+"','"+pur_quot_taxList.getTxtprevLinkTax()+"')";
			i1= jdbcTemplate.update(sql1);
		}			
		List<LinkedTaxDetails> linkedTaxList=purchases.getLinkedTaxList();
		if(!(linkedTaxList.isEmpty())){
			linkedTaxList.remove(0);		
			for (LinkedTaxDetails linkedTaxDetails : linkedTaxList) {
				
				String sql4="insert into purchase_linked_tax_details value('"+purchases.getTxtPurchaseNo()+"','"+linkedTaxDetails.getmTaxID()+"','"+linkedTaxDetails.getLinkedTaxId()+"','"+linkedTaxDetails.getSerLinkedTax()+"')";
				i2= jdbcTemplate.update(sql4);
			}
			}
			/*else
			{
				String sql4="insert into purchase_linked_tax_details value('"+purchases.getTxtPurchaseNo()+"','"+taxId+"','0.0','0.0')";
				i3= jdbcTemplate.update(sql4);
			}	*/
		
		
		List<purchaseDetails> puchaseProdList = purchases.getProductList();
		for(purchaseDetails qD : puchaseProdList)
		{			
			String sql1="insert into purchases_details value('"+qD.getSrNo()+"','"+purchases.getTxtPurchaseNo()+"','"+qD.getItemCode()+"','"+qD.getQuantity()+"','"+qD.getUnitPrice()+"','"+qD.getItemTotal()+"')";
			i4= jdbcTemplate.update(sql1);
		}
		 String journal_Id=genrateJId();	
		 String urlj="insert into journal_header value('"+journal_Id+"','Purchase','"+purchases.getTxtPurchaseNo()+"','"+purchases.getTxtPurchaseDate()+"','V','Being Goods Purchase on Credit','2','"+purchases.getTxtAmtPayble()+"','"+purchases.getTxtAmtPayble()+"')";
		 i5=jdbcTemplate.update(urlj); 
		 
	
		 String accountNo=jdbcTemplate.queryForObject("select account_No from vendor_header where vender_ID='"+purchases.getSelSupplierName()+"'",String.class);
		 String urlLine1="insert into journal_details value('1','"+journal_Id+"','105','D','"+purchases.getTxtAmtPayble()+"')";
		 i5=jdbcTemplate.update(urlLine1);
		 String updateBalUrl1="UPDATE accounts_chart SET opeinig_Balance=opeinig_Balance+'"+purchases.getTxtAmtPayble()+"' where account_No='105'";
		 i7=jdbcTemplate.update(updateBalUrl1);
		 String urlLine2="insert into journal_details value('2','"+journal_Id+"','"+accountNo+"','C','"+purchases.getTxtAmtPayble()+"')";
		 i6=jdbcTemplate.update(urlLine2);
		 String updateBalUrl2="UPDATE accounts_chart SET opeinig_Balance=opeinig_Balance-'"+purchases.getTxtAmtPayble()+"' where account_No='"+accountNo+"'";
		 i8=jdbcTemplate.update(updateBalUrl2);
		 
		if(purchases.getSelOrderID()!=null)
		 {
			 String sq = "update purchase_order_header set purchases_Created = 'Yes' where pur_Order_Id = '"+purchases.getSelOrderID()+"'" ;
			 i9=jdbcTemplate.update(sq);
		 }
		 if(i>0 && i1>0 && i4>0 && i5>0 && i6>0 && i7>0 && i8>0)
		 {
			 return 1;
		 }
		 else if(i2>0)
		 {
			 return 1;
		 }
		 else if(i9>0)
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
	public List<Purchases> editPurchase(final String purchaseId) {
		try{ 
		String sql = "select * from vpurchases where purchase_Id='"+purchaseId+"' order by pur_Sr_No ";
		return jdbcTemplate.query(sql, new RowMapper<Purchases>(){ 
			List<purchaseDetails> DetailsList = new ArrayList<purchaseDetails>();
			public Purchases mapRow(ResultSet rs, int rowNo) throws SQLException {
				Purchases purchases = new Purchases();
				purchaseDetails orderDetails = new purchaseDetails();
				
				purchases.setTxtPurchaseNo(rs.getString("purchase_Id")); 
				purchases.setSelSupplierName(rs.getString("vender_Name"));
				purchases.setVenderID(rs.getString("vendor_Id"));
				purchases.setTxtPurchaseDate(rs.getString("purs_Date"));
				purchases.setTxtDueDate(rs.getString("purs_Due_Date"));
				purchases.setTxtAreaAddress(rs.getString("purs_Address"));
				purchases.setTxtPubNotes(rs.getString("purs_PublicNote"));
				purchases.setTxtPvtNotes(rs.getString("purs_PrivateNote")); 
				purchases.setTxtSubTotal(rs.getFloat("purs_Sub_Total"));				
				purchases.setRadio(rs.getString("discount_Type"));
				purchases.setTxtDiscount(rs.getFloat("discount_Value"));
				purchases.setTxtDisTotal(rs.getFloat("purs_Discounted_Total"));
				purchases.setTxtTaxTotal(rs.getFloat("total_Tax"));
				purchases.setTxtRoundOff(rs.getString("round_Off"));
				purchases.setTxtAmtPayble(rs.getFloat("purs_Amt_Payable"));
				purchases.setBalAmt(rs.getFloat("bal_Amt")); 
				orderDetails.setSrNo(rs.getInt("pur_Sr_No")); 
				orderDetails.setProdId(rs.getString("product_Id"));
				orderDetails.setItemCode(rs.getString("prod_Name"));
				orderDetails.setDes(rs.getString("description")); 
				orderDetails.setUnit(rs.getString("unit_Of_Measure")); 
				orderDetails.setQuantity(rs.getInt("pur_Order_Quantity"));		
				orderDetails.setUnitPrice(rs.getFloat("pur_Order_Unit_Price"));
				orderDetails.setItemTotal(rs.getFloat("item_Total"));				
				DetailsList.add(orderDetails);
				purchases.setProductList(DetailsList);
				
				String yes = "yes",no="no";			
				float payamt = purchases.getTxtAmtPayble();
				float avlamt = purchases.getBalAmt();
				if(avlamt == 0 || avlamt == 0.0)
				{
					purchases.setPayamtNo(no);
				}
				else if(avlamt < payamt || avlamt == payamt)
				{
					purchases.setPayamtYes(yes);									
				}	
				return purchases;
			}			
		});
		}catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public List<Purchases> editPurTaxDetails(String purchaseId) {
		try{
		String sql="select * from vpurchasestaxdetails where purchase_Id='"+purchaseId+"'";		
		return jdbcTemplate.query(sql, new RowMapper<Purchases>() {			
			List<TaxDetailsList> taxesList=new ArrayList<TaxDetailsList>();
			@Override
			public Purchases mapRow(ResultSet rs, int arg1) throws SQLException {
				Purchases purchases=new Purchases();				
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
				purchases.setTaxList(taxesList);
				return purchases;
			}
		});
		}catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public List<Purchases> editPurLinkedTaxDetails(String purchaseId) {
		try{
		String sql="select * from vpurchaseslinkestaxdetails where purchase_Id='"+purchaseId+"'";		
		return jdbcTemplate.query(sql, new RowMapper<Purchases>() {			
			List<LinkedTaxDetails> linkedTaxesList=new ArrayList<LinkedTaxDetails>();
			@Override
			public Purchases mapRow(ResultSet rs, int arg1) throws SQLException {
				Purchases purchases=new Purchases();				
				LinkedTaxDetails linkedTaxDetailsList=new LinkedTaxDetails();
				linkedTaxDetailsList.setmTaxID(rs.getString("tax_Id"));				
				linkedTaxDetailsList.setmTaxAmt(rs.getFloat("tax_Amt"));
				linkedTaxDetailsList.setLinkedTaxId(rs.getString("linked_Tax_Id"));
				linkedTaxDetailsList.setLinkedTaxName(rs.getString("taxName"));
				linkedTaxDetailsList.setLinkedTaxRate(rs.getFloat("linked_Tax_Rate"));
				linkedTaxDetailsList.setSerLinkedTax(rs.getFloat("linked_Tax_Amt"));				
				linkedTaxesList.add(linkedTaxDetailsList);				
				purchases.setLinkedTaxList(linkedTaxesList);				
				return purchases;
			}
		});
		}catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public int updatePurchase(Purchases purchases) {		
		try{
		String account_No="",type="";
		float amount=0;
		String journalId=jdbcTemplate.queryForObject("select journal_Id from journal_header where refrence='"+purchases.getTxtPurchaseNo()+"' and journal_Header_Status='V'",String.class);		
		float amt=jdbcTemplate.queryForObject("select totalDebit from journal_header where refrence='"+purchases.getTxtPurchaseNo()+"' and journal_Header_Status='V'",Float.class);
		String up="update journal_header set journal_Header_Status='D',"+"description='Being Updated Purchase Journal Deleted' where journal_Id='"+journalId+"'";
		jdbcTemplate.update(up);
		String journal_Id=genrateJId();	
		int k=1;
		 DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");	     
	     Date date = new Date();	     
	     String dt=dateFormat.format(date);
		String urlj="insert into journal_header value('"+journal_Id+"','Purchase','"+purchases.getTxtPurchaseNo()+"','"+dt+"','R','Being Updated Purchase Reversed','2','"+amt+"','"+amt+"')";
		jdbcTemplate.update(urlj); 
		List<JournalDetails> jList=getAccountDetails(journalId);
		for (JournalDetails journalDetails : jList) {			
			account_No=journalDetails.getAccno();
			type=journalDetails.getTxtType();
			if(type.equals("D"))
			{
				type="C";
			}
			else
			{
				type="D";
			}
			amount=journalDetails.getTxtAmount();	

				 String urlLine1="insert into journal_details value('"+k+"','"+journal_Id+"','"+account_No+"','"+type+"','"+amount+"')";
				 jdbcTemplate.update(urlLine1);
				 if(type.equals("D"))
				 {
						 String updateBalUrl1="UPDATE accounts_chart SET opeinig_Balance=opeinig_Balance+'"+amount+"' where account_No='"+account_No+"'";
						 jdbcTemplate.update(updateBalUrl1);
				 }
				 if(type.equals("C"))
				 {
						 String updateBalUrl2="UPDATE accounts_chart SET opeinig_Balance=opeinig_Balance-'"+amount+"' where account_No='"+account_No+"'";
						 jdbcTemplate.update(updateBalUrl2);					
				 }
		k++;
		}
		
		String accountNo1=jdbcTemplate.queryForObject("select account_No from vendor_header where vender_ID='"+purchases.getSelSupplierName()+"'",String.class);
		int i=0,i1=0,i2=0,i4=0;
		DateFormat dateFormat1 = new SimpleDateFormat("yyyy/MM/dd");	     
		Date date1 = new Date();	   		 
		String updateDate=dateFormat1.format(date1);	
		String sql = "UPDATE purchases_header SET purs_Date='"+purchases.getTxtPurchaseDate()+"',"+"purs_Due_Date='"+purchases.getTxtDueDate()+"',"+"purs_Address='"+purchases.getTxtAreaAddress()+"',"+"purs_PublicNote='"+purchases.getTxtPubNotes()+"',"+"purs_PrivateNote='"+purchases.getTxtPvtNotes()+"',"+"purs_Sub_Total='"+purchases.getTxtSubTotal()+"',"+"discount_Type='"+purchases.getRadio()+"',"+"discount_Value='"+purchases.getTxtDiscount()+"',"+"purs_Discounted_Total='"+purchases.getTxtDisTotal()+"',"+"total_Tax='"+purchases.getTxtTaxTotal()+"',"+"round_Off='"+purchases.getTxtRoundOff()+"',"+"purs_Amt_Payable='"+purchases.getTxtAmtPayble()+"',"+"purs_Updated_By='"+purchases.getUpdatedBy()+"',"+"purs_Update_Date='"+updateDate+"' WHERE purchase_Id='"+purchases.getTxtPurchaseNo()+"'";
		i=jdbcTemplate.update(sql);
		
		deleteList(purchases.getTxtPurchaseNo());
		deleteTaxDetailsList(purchases.getTxtPurchaseNo());
		deleteLinkedTaxDetailsList(purchases.getTxtPurchaseNo());

		String taxId="";
		List<TaxDetailsList> taxList=purchases.getTaxList();			
		taxList.remove(0);				
		for (TaxDetailsList pur_quot_taxList : taxList)			
		{	
			String taxID=pur_quot_taxList.getTaxType();
			taxId=taxID.substring((taxID.indexOf("^"))+1, taxID.length());				
			String sql1="insert into purchase_tax_details value('"+purchases.getTxtPurchaseNo()+"','"+taxId+"','"+pur_quot_taxList.getTxtTaxValue()+"','"+pur_quot_taxList.getTxtprevLinkTax()+"')";
			i1= jdbcTemplate.update(sql1);
		}			
		List<LinkedTaxDetails> linkedTaxList=purchases.getLinkedTaxList();
		if(!(linkedTaxList.isEmpty())){
			linkedTaxList.remove(0);		
			for (LinkedTaxDetails linkedTaxDetails : linkedTaxList) {
				
				String sql4="insert into purchase_linked_tax_details value('"+purchases.getTxtPurchaseNo()+"','"+linkedTaxDetails.getmTaxID()+"','"+linkedTaxDetails.getLinkedTaxId()+"','"+linkedTaxDetails.getSerLinkedTax()+"')";
				i2= jdbcTemplate.update(sql4);
			}
			}
			/*else
			{
				String sql4="insert into purchase_linked_tax_details value('"+purchases.getTxtPurchaseNo()+"','"+taxId+"','0.0','0.0')";
				i3= jdbcTemplate.update(sql4);
			}*/			
		
		List<purchaseDetails> puchaseProdList = purchases.getProductList();
		for(purchaseDetails qD : puchaseProdList)
		{			
			String sql1="insert into purchases_details value('"+qD.getSrNo()+"','"+purchases.getTxtPurchaseNo()+"','"+qD.getItemCode()+"','"+qD.getQuantity()+"','"+qD.getUnitPrice()+"','"+qD.getItemTotal()+"')";
			i4= jdbcTemplate.update(sql1);
		}
		
		 int i5=0,i6=0,i7=0,i8=0,i9=0;
		 String journal_Id1=genrateJId();	
		 String urlj1="insert into journal_header value('"+journal_Id1+"','Purchase','"+purchases.getTxtPurchaseNo()+"','"+purchases.getTxtPurchaseDate()+"','V','Being Goods Purchase on Credit','2','"+purchases.getTxtAmtPayble()+"','"+purchases.getTxtAmtPayble()+"')";
		 i5=jdbcTemplate.update(urlj1); 
		 
		 
		 String urlLine1="insert into journal_details value('1','"+journal_Id1+"','105','D','"+purchases.getTxtAmtPayble()+"')";
		 i6=jdbcTemplate.update(urlLine1);
		 String updateBalUrl1="UPDATE accounts_chart SET opeinig_Balance=opeinig_Balance+'"+purchases.getTxtAmtPayble()+"' where account_No='105'";
		 i7=jdbcTemplate.update(updateBalUrl1);
		 String urlLine2="insert into journal_details value('2','"+journal_Id1+"','"+accountNo1+"','C','"+purchases.getTxtAmtPayble()+"')";
		 i8=jdbcTemplate.update(urlLine2);
		 String updateBalUrl2="UPDATE accounts_chart SET opeinig_Balance=opeinig_Balance-'"+purchases.getTxtAmtPayble()+"' where account_No='"+accountNo1+"'";
		 i9=jdbcTemplate.update(updateBalUrl2);
		
		 if(i>0 && i1>0 && i4>0 && i5>0 && i6>0 && i7>0 && i8>0 && i9>0)
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
			System.out.println(e); 
			return 0;
		}
	}
	private void deleteList(String purchaseId)
	{
		String deleteListUrl="DELETE FROM purchases_details WHERE purchase_Id= '"+purchaseId+"'";
		jdbcTemplate.update(deleteListUrl);
	}
	private void deleteTaxDetailsList(String purchaseId){
		String deleteListUrl="DELETE FROM purchase_tax_details WHERE purchase_Id= '"+purchaseId+"'";
		jdbcTemplate.update(deleteListUrl);
	}
	private void deleteLinkedTaxDetailsList(String purchaseId){
		String deleteListUrl="DELETE FROM purchase_linked_tax_details WHERE purchase_Id= '"+purchaseId+"'";
		jdbcTemplate.update(deleteListUrl);
	}
	@Override
	public int delete(String purchaseId,float amt) {
		try{
		String account_No="",type="";
		float amount=0;
		String journalId=jdbcTemplate.queryForObject("select journal_Id from journal_header where refrence='"+purchaseId+"' and journal_Header_Status='V'",String.class);		
		String up="update journal_header set journal_Header_Status='R' where journal_Id='"+journalId+"'";
		jdbcTemplate.update(up);
		String journal_Id=genrateJId();	
		int i=1;
		 DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");	     
	     Date date = new Date();	     
	     String dt=dateFormat.format(date);
		String urlj="insert into journal_header value('"+journal_Id+"','Purchase','"+purchaseId+"','"+dt+"','V','Being Deleted Purchase Reversed','2','"+amt+"','"+amt+"')";
		jdbcTemplate.update(urlj); 
		List<JournalDetails> jList=getAccountDetails(journalId);
		for (JournalDetails journalDetails : jList) {			
			account_No=journalDetails.getAccno();
			type=journalDetails.getTxtType();
			if(type.equals("D"))
			{
				type="C";
			}
			else
			{
				type="D";
			}
			amount=journalDetails.getTxtAmount();	

				 String urlLine1="insert into journal_details value('"+i+"','"+journal_Id+"','"+account_No+"','"+type+"','"+amount+"')";
				 jdbcTemplate.update(urlLine1);
				 if(type.equals("D"))
				 {
						 String updateBalUrl1="UPDATE accounts_chart SET opeinig_Balance=opeinig_Balance+'"+amount+"' where account_No='"+account_No+"'";
						 jdbcTemplate.update(updateBalUrl1);
				 }
				 if(type.equals("C"))
				 {
						 String updateBalUrl2="UPDATE accounts_chart SET opeinig_Balance=opeinig_Balance-'"+amount+"' where account_No='"+account_No+"'";
						 jdbcTemplate.update(updateBalUrl2);					
				 }
		i++;
		}
		
		String sql = "update purchases_header set purs_Status = 'Inactive' where purchase_Id='"+purchaseId+"'";
		int s = jdbcTemplate.update(sql) ;
		return s;
		}catch(Exception e)
		{
			return 0;
		}
	}
	private List<JournalDetails> getAccountDetails(String journalId)
	{
		try{
		String url1="select account_No,type,amount from journal_details where journal_Id='"+journalId+"'";
		final List<JournalDetails> jList=getJdbcTemplate().query(url1, new RowMapper<JournalDetails>()
			{
			List<JournalDetails> jDList=new ArrayList<JournalDetails>();
				@Override
				public JournalDetails mapRow(ResultSet rs, int arg1)throws SQLException 
				{
					JournalDetails journalDetails=new JournalDetails();
					journalDetails.setAccno(rs.getString("account_No"));
					journalDetails.setTxtType(rs.getString("type"));
					journalDetails.setTxtAmount(rs.getFloat("amount"));
					jDList.add(journalDetails);
					return journalDetails;
				}
			
				});
		return jList;	
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
	private String genrateJId()
	{
		try{
		String journal_Id = "";
		RowCountCallbackHandler countCallback = new RowCountCallbackHandler();
		jdbcTemplate.query("select * from journal_header", countCallback);
		int count = countCallback.getRowCount();
		count++; 		
		if (count < 10) {
			journal_Id = "JID00" + count;
		} else 
		{
			if (count < 99) {
				journal_Id = "JID0" + count;
			} else 
			{
				journal_Id = "JID" + count;
			}
		}
		return journal_Id;
		}catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public List<Vender> retrriveVenderInfo(String vendId,String id)
	{
		try{
		final String path = "Purchases.pdf";	
		final String id1=id;
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
				venderInfo.setSubject("New Purchase");
				String regards=jdbcTemplate.queryForObject("select comp_Name from comp_details",String.class);
				venderInfo.setRegards(regards);	
				venderInfo.setBodyPart("\t New Purchase is Generated For More Details\n Please Find The Attached PDF File.\n\nThank You..");
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
	public String retriveUnitPrice(String productId) 
	{
		String unitprice = jdbcTemplate.queryForObject("select purchase_Price from product_master where product_Id = '"+productId+"'", String.class);
		return unitprice;
	}
	@Override
	public List<PurchaseVoucher> retrivePaymentHistory(String purchaseNo) 
	{
		try{
			String url1="select v.voucher_No,v.purchase_Id,v.payment_Date,a.account_Name,v.amount from purchase_voucher v,accounts_chart a where a.account_No = v.from_Account_No AND v.purchase_Id = '"+purchaseNo+"';";
			final List<PurchaseVoucher> pay=getJdbcTemplate().query(url1, new RowMapper<PurchaseVoucher>()
				{
				List<PurchaseVoucher> payList=new ArrayList<PurchaseVoucher>();
					@Override
					public PurchaseVoucher mapRow(ResultSet rs, int arg1)throws SQLException 
					{
						PurchaseVoucher purchases=new PurchaseVoucher();
						purchases.setVoucherNo(rs.getString("voucher_No"));
						purchases.setOrderId(rs.getString("purchase_Id"));						
						purchases.setDate(rs.getString("payment_Date"));
						//purchases.setAccName(rs.getString("account_Name"));
						purchases.setAmount(rs.getInt("amount")); 
						payList.add(purchases);
						return purchases;
					}
				
					});
			return pay;	
			}catch(Exception e)
			{				
				return null;
			}
	}
	
}
