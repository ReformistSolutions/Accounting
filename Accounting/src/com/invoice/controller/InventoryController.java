package com.invoice.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.invoice.company.beans.CompanyDetails;
import com.invoice.inventory.beans.ComposeMail;
import com.invoice.inventory.beans.CreateNewProduct;
import com.invoice.inventory.beans.Details;
import com.invoice.inventory.beans.IssueForProduction;
import com.invoice.inventory.beans.Production;
import com.invoice.inventory.beans.RawMaterialDetails;
import com.invoice.inventory.beans.ReceiveforSales;
import com.invoice.inventory.beans.RecordTransferred;
import com.invoice.inventory.beans.RecordWastage;
import com.invoice.inventory.beans.Warehouse;
import com.invoice.inventory.service.CreateNewProductService;
import com.invoice.inventory.service.IssueForProductionService;
import com.invoice.inventory.service.ProductionService;
import com.invoice.inventory.service.ReceiveforSalesService;
import com.invoice.inventory.service.RecordTransferredService;
import com.invoice.inventory.service.RecordWastageService;
import com.invoice.inventory.service.WarehouseService;
import com.invoice.login.beans.Login;
import com.invoice.login.service.LoginUserService;
import com.invoice.reports.service.ReportsServiceImpl;
import com.invoice.sales.service.EnquiryService;

@Controller
public class InventoryController {	
	
	String inventory = "inventory";
	String index="index";
	 CreateNewProductService createNewProductService;
	 IssueForProductionService issueForProductionService;
	 ReceiveforSalesService receiveForSalesService;
	 RecordTransferredService recordTransferredService;
	 RecordWastageService recordWastageService;
	 WarehouseService warehouseService;
	 ProductionService productionService;
	 EnquiryService enquiryService;
	 @Autowired
	 ReportsServiceImpl reportsServiceImpl;
	
	public EnquiryService getEnquiryService() {
		return enquiryService;
	}
	public void setEnquiryService(EnquiryService enquiryService) {
		this.enquiryService = enquiryService;
	}
	public ProductionService getProductionService() {
		return productionService;
	}
	@Autowired
	public void setProductionService(ProductionService productionService) {
		this.productionService = productionService;
	}
	public WarehouseService getWarehouseService() {
		return warehouseService;
	}
	@Autowired
	public void setWarehouseService(WarehouseService warehouseService) {
		this.warehouseService = warehouseService;
	}
	
	private JdbcTemplate jdbcTemplate;
	
	 public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	 @Autowired
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	public CreateNewProductService getCreateNewProductService() {
		return createNewProductService;
	}
public IssueForProductionService getIssueForProductionService() {
		return issueForProductionService;
	}
@Autowired
	public void setIssueForProductionService(
			IssueForProductionService issueForProductionService) {
		this.issueForProductionService = issueForProductionService;
	}
@Autowired
	public void setCreateNewProductService(
			CreateNewProductService createNewProductService) {
		this.createNewProductService = createNewProductService;
	}

	public ReceiveforSalesService getReceiveForSalesService() {
		return receiveForSalesService;
	}	
@Autowired
	public void setReceiveForSalesService(
		ReceiveforSalesService receiveForSalesService) {
	this.receiveForSalesService = receiveForSalesService;
	
}

	public RecordTransferredService getRecordTransferredService() {
	return recordTransferredService;
}
	@Autowired
	public void setRecordTransferredService(
			RecordTransferredService recordTransferredService) {
		this.recordTransferredService = recordTransferredService;
	}		
	public RecordWastageService getRecordWastageService() {
		return recordWastageService;
	}
	@Autowired
	public void setRecordWastageService(RecordWastageService recordWastageService) {
		this.recordWastageService = recordWastageService;
	}	
	@Autowired
	LoginUserService lus;
	//inventory show
    @RequestMapping("/inventory")
    public ModelAndView showInventory(CreateNewProduct createNewProduct,IssueForProduction issueForProduction,ReceiveforSales receiveforSales,RecordTransferred recordTransferred,RecordWastage recordWastage,ModelMap model,HttpSession session)
    {   
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Inventory"))
		{
			model.addAttribute("inventory",inventory);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
	    	model.addAttribute("showProductList",createNewProductService.show());
	    	model.addAttribute("showissueProduction",issueForProductionService.showIssueProdList());
	    	model.addAttribute("showreceive",receiveForSalesService.showSalesProd());
	    	model.addAttribute("showtransfered",recordTransferredService.showRecTrans());
	    	model.addAttribute("showwastage",recordWastageService.showRecWast());
	    	model.addAttribute("pendingProduction",productionService.showPending());
			model.addAttribute("completedProduction",productionService.showCompleted());
			model.addAttribute("wareID",recordTransferredService.retriveWareHouse());    
	    	return new ModelAndView("Inventory/inventory");
		}
		else{
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			model.addAttribute("index", index);
			model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());
			model.addAttribute("msg","<script>alert('Access Denied');</script>");
			return new ModelAndView("index");
		}
		}
		else
		{
			return new ModelAndView("Login");
		}
    }
    @RequestMapping("/createNewProduct")
   	public ModelAndView createNewProduct(CreateNewProduct createNewProd,ModelMap model,HttpSession session)
   	{
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Inventory"))
		{
			model.addAttribute("inventory",inventory);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
    	createNewProd=createNewProductService.generateID();
    	model.addAttribute("prodID", createNewProductService.retriveProduct());
    	return new ModelAndView("Inventory/CreateNewProduct", "createNewProduct", createNewProd);
		}
		else{
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			model.addAttribute("index", index);
			model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());
			model.addAttribute("msg","<script>alert('Access Denied');</script>");
			return new ModelAndView("index");
		}
		}
		else
		{
			return new ModelAndView("Login");
		}
   	} 
    //addProduct
    @RequestMapping("/addProduct")
   	public ModelAndView addProduct(CreateNewProduct createNewProd,ModelMap model,HttpSession session)
   	{
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Inventory"))
		{
			model.addAttribute("inventory",inventory);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
	    	int i=0;
			int message = 0;
	    	i=createNewProductService.save(createNewProd); 
	    	if(i>=1)
	   
			{
				message=1;
				model.addAttribute("message", message);
				model.addAttribute("msg", createNewProductService.ShowAdd());
			}
			else
			{
				message=0;
				model.addAttribute("message", message);
				model.addAttribute("msg", createNewProductService.ShowNotAdd());
			}
	    	model.addAttribute("detailsList", createNewProductService.showProductDetails(createNewProd.getProductCode()));
		    String prod_type = createNewProd.getProductType();
			if (prod_type.equalsIgnoreCase("Resale Product"))
			{
				model.addAttribute("resale", prod_type);
			}
			else if(prod_type.equalsIgnoreCase("Sale Item"))
			{
				model.addAttribute("sale", prod_type);
			}
			else if(prod_type.equalsIgnoreCase("Purchase Item"))
			{
				model.addAttribute("purchase", prod_type);
			}
	    	return new ModelAndView("Inventory/viewCreateNewProduct", "createNewProView", createNewProd);
		}
		else{
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			model.addAttribute("index", index);
			model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());
			model.addAttribute("msg","<script>alert('Access Denied');</script>");
			return new ModelAndView("index");
		}
		}
		else
		{
			return new ModelAndView("Login");
		}
   	}       
    @RequestMapping("/manageStock")
   	public ModelAndView manageStock(Production production,Warehouse warehouse,IssueForProduction issueForProduction,ReceiveforSales receiveforSales,RecordTransferred recordTransferred,RecordWastage recordWastage,ModelMap model,HttpSession session)
   	{
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Inventory"))
		{
			model.addAttribute("inventory",inventory);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
	    	model.addAttribute("wareID",issueForProductionService.retriveWareHouse());
	    	model.addAttribute("wareID",receiveForSalesService.retriveWareHouse());
	    	model.addAttribute("wareID",recordWastageService.retriveWareHouse());
	    	model.addAttribute("wareID",recordTransferredService.retriveWareHouse());    	
	    	model.addAttribute("prodID", issueForProductionService.retriveProduct());
	    	model.addAttribute("prodID", receiveForSalesService.retriveProduct());
	    	model.addAttribute("prodID", recordWastageService.retriveProduct());
	    	model.addAttribute("prodID",recordTransferredService.retriveProduct());    	 
	    	model.addAttribute("orderList",receiveForSalesService.retriveOrderId());    	
	    	model.addAttribute("production", productionService.generateId());
	    	production = productionService.generateId();
	    	model.addAttribute("orderList", productionService.showOrder()); 
	    	
	    	issueForProduction=issueForProductionService.generateIssueID();
	    	model.addAttribute("issueForProduction", issueForProductionService.generateIssueID());
	    	receiveforSales=receiveForSalesService.generateReceiveID();
	    	model.addAttribute("receiveforSales", receiveForSalesService.generateReceiveID());
	    	recordWastage=recordWastageService.generateWasteID();
	    	model.addAttribute("recordWastage",recordWastageService.generateWasteID());
	    	recordTransferred=recordTransferredService.generateTransID();
	    	model.addAttribute("recordTransferred",recordTransferredService.generateTransID());
	    	
	    	return new ModelAndView("Inventory/ManageStock");
		}
		else{
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			model.addAttribute("index", index);
			model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());
			model.addAttribute("msg","<script>alert('Access Denied');</script>");
			return new ModelAndView("index");
		}
		}
		else
		{
			return new ModelAndView("Login");
		}
    }	
    @RequestMapping("/retriveproductDetails")
    public ModelAndView retriveproductDetails(@RequestParam String orderID,RawMaterialDetails details, ModelMap model,HttpSession session)
    {
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Inventory"))
		{
			model.addAttribute("inventory",inventory);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	 
			model.addAttribute("salesproductList", productionService.retrivepProductDetails(orderID));
			model.addAttribute("prodID", issueForProductionService.retriveProduct());
			return new ModelAndView("Inventory/retriveProductsDetails");
		}
		else{
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			model.addAttribute("index", index);
			model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());
			model.addAttribute("msg","<script>alert('Access Denied');</script>");
			return new ModelAndView("index");
		}
		}
		else
		{
			return new ModelAndView("Login");
		}
    }
    
    
@RequestMapping("/warehouse")
public ModelAndView warehouse(Warehouse warehouse,ModelMap model,HttpSession session)
{
	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Inventory"))
		{
			model.addAttribute("inventory",inventory);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			warehouse=warehouseService.generateID();
			
			model.addAttribute("warehouseTrans",warehouseService.generateID());
			model.addAttribute("prodID", warehouseService.retriveProduct());
			return new ModelAndView("Inventory/ManageWarehouse","warehouseTrans",warehouse);
	}
		else{
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			model.addAttribute("index", index);
			model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());
			model.addAttribute("msg","<script>alert('Access Denied');</script>");
			return new ModelAndView("index");
		}
		}
		else
		{
			return new ModelAndView("Login");
		}
}
@RequestMapping("/warehouseTrans")
public ModelAndView addwarehouse(Warehouse warehouse,ModelMap model,HttpSession session)
{
	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Inventory"))
		{
			model.addAttribute("inventory",inventory);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			int i=0;
			int message = 0;
	    	i=warehouseService.save(warehouse);
	    	if(i>=1)
			{
				message=1;
				model.addAttribute("message", message);
				model.addAttribute("msg", createNewProductService.ShowAdd());
			}
			else
			{
				message=0;
				model.addAttribute("message", message);
				model.addAttribute("msg", createNewProductService.ShowNotAdd());
			}
			warehouse=warehouseService.editWarehouse(warehouse.getWarehousrID()).get(0);
			
			return new ModelAndView("Inventory/ViewWarehouse","warehouseview",warehouse);
	}
		else{
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			model.addAttribute("index", index);
			model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());
			model.addAttribute("msg","<script>alert('Access Denied');</script>");
			return new ModelAndView("index");
		}
		}
		else
		{
			return new ModelAndView("Login");
		}
}

// show warehouse

@RequestMapping("/showwarehouse")
public ModelAndView showwarehouse(Warehouse warehouse,ModelMap model,HttpSession session)
{
	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Inventory"))
		{
			model.addAttribute("inventory",inventory);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			model.addAttribute("warehouseList",warehouseService.show());
			return new ModelAndView("Inventory/Showwarehouses","showwarehouse",warehouse);
	}
		else{
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			model.addAttribute("index", index);
			model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());
			model.addAttribute("msg","<script>alert('Access Denied');</script>");
			return new ModelAndView("index");
		}
		}
		else
		{
			return new ModelAndView("Login");
		}
}
//edit warehouse
@RequestMapping("/editWarehouse")
public ModelAndView editwarehouse(@RequestParam String warehousrID,Warehouse warehouse,ModelMap model,HttpSession session)
{   	
	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Inventory"))
		{
			model.addAttribute("inventory",inventory);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			warehouse=warehouseService.editWarehouse(warehouse.getWarehousrID()).get(0)  ;
			model.addAttribute("prodID", warehouseService.retriveProduct());
			return new ModelAndView("Inventory/EditWarehouse","editWarehouse",warehouse);
	
	}
		else{
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			model.addAttribute("index", index);
			model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());
			model.addAttribute("msg","<script>alert('Access Denied');</script>");
			return new ModelAndView("index");
		}
		}
		else
		{
			return new ModelAndView("Login");
		}
}

//updatewarehouse

@RequestMapping("/updatewarehouse")
public ModelAndView updatewarehouse(@ModelAttribute Warehouse warehouse,ModelMap model,HttpSession session)
{
	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Inventory"))
		{
			
			model.addAttribute("inventory",inventory);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			int i=0;
			int update = 0;
	    	i=warehouseService.update(warehouse);
	    	if(i>=1)
	    		
			{
				update=1;
				model.addAttribute("update", update);
				model.addAttribute("msg", createNewProductService.ShowUpdate());
			}
			else
			{
				update=0;
				model.addAttribute("update", update);
				model.addAttribute("msg", createNewProductService.ShowNotUpdate());
			}
			
			warehouse=warehouseService.editWarehouse(warehouse.getWarehousrID()).get(0);
			return new ModelAndView("Inventory/ViewWarehouse","warehouseview",warehouse);
	}
		else{
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			model.addAttribute("index", index);
			model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());
			model.addAttribute("msg","<script>alert('Access Denied');</script>");
			return new ModelAndView("index");
		}
		}
		else
		{
			return new ModelAndView("Login");
		}
}


//warehouseview
@RequestMapping("/warehouseview")
public ModelAndView warehouse(@RequestParam String warehousrID,Warehouse warehouse,ModelMap model,HttpSession session)
{
	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Inventory"))
		{
			model.addAttribute("inventory",inventory);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			warehouse=warehouseService.editWarehouse(warehousrID).get(0);
			return new ModelAndView("Inventory/ViewWarehouse","warehouseview",warehouse); 
	}
		else{
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			model.addAttribute("index", index);
			model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());
			model.addAttribute("msg","<script>alert('Access Denied');</script>");
			return new ModelAndView("index");
		}
		}
		else
		{
			return new ModelAndView("Login");
		}
}

//warehouse pdf

@RequestMapping(value="warehousePDF")
public ModelAndView warehousepdf(@RequestParam String warehousrID,CompanyDetails companyDetailss,Warehouse warehouse,ModelMap model,HttpSession session)
{
	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Inventory"))
		{
			model.addAttribute("inventory",inventory);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			warehouse=warehouseService.editWarehouse(warehousrID).get(0);	
			model.addAttribute("compInfo", warehouseService.getInfo(companyDetailss).get(0));
			return new ModelAndView("warehousePDF", "warehouse", warehouse);
	}
		else{
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			model.addAttribute("index", index);
			model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());
			model.addAttribute("msg","<script>alert('Access Denied');</script>");
			return new ModelAndView("index");
		}
		}
		else
		{
			return new ModelAndView("Login");
		}
}

//sendmail

@RequestMapping("/composewarehouseMail")

public ModelAndView warehousemail(ComposeMail composeMail,ModelMap model,HttpSession session)
{
	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Inventory"))
		{
			model.addAttribute("inventory",inventory);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			return new ModelAndView("Inventory/composeMail","composewarehouseMail",composeMail);
	}
		else{
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			model.addAttribute("index", index);
			model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());
			model.addAttribute("msg","<script>alert('Access Denied');</script>");
			return new ModelAndView("index");
		}
		}
		else
		{
			return new ModelAndView("Login");
		}
}

@RequestMapping("/sendwarehouseMail")

public ModelAndView senwarehousedmail(ComposeMail composeMail,ModelMap model,HttpSession session)
{
	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Inventory"))
		{
			model.addAttribute("inventory",inventory);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			model.addAttribute("message",warehouseService.sendMail(composeMail));
			return new ModelAndView("Inventory/composeMail","composewarehouseMail",composeMail);
	}
		else{
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			model.addAttribute("index", index);
			model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());
			model.addAttribute("msg","<script>alert('Access Denied');</script>");
			return new ModelAndView("index");
		}
		}
		else
		{
			return new ModelAndView("Login");
		}
}
//issue for production receiveAgainProd
@RequestMapping("/issueForProduction")
public ModelAndView issueForProduction(IssueForProduction issueForProduction,ReceiveforSales receiveforSales,RecordWastage recordWastage,RecordTransferred recordTransferred,ModelMap model,HttpSession session)
{
	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Inventory"))
		{
			model.addAttribute("inventory",inventory);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			model.addAttribute("Message",issueForProductionService.save(issueForProduction));
			issueForProduction=issueForProductionService.editIssueForProduction(issueForProduction.getTxtVNo()).get(0);//add
			model.addAttribute("receiveforSales", receiveforSales);
			model.addAttribute("recordWastage", recordWastage);
			model.addAttribute("recordTransferred", recordTransferred);
			return new ModelAndView("Inventory/ViewIssueForProduction", "issueForProductionView", issueForProduction);  
	}
		else{
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			model.addAttribute("index", index);
			model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());
			model.addAttribute("msg","<script>alert('Access Denied');</script>");
			return new ModelAndView("index");
		}
		}
		else
		{
			return new ModelAndView("Login");
		}
}    

//receive for sales
@RequestMapping("/receiveforSales")
public ModelAndView receiveForSales(IssueForProduction issueForProduction,ReceiveforSales receiveforSales,RecordWastage recordWastage,RecordTransferred recordTransferred,ModelMap model,HttpSession session)
{
	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Inventory"))
		{
			model.addAttribute("inventory",inventory);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			model.addAttribute("issueForProduction", issueForProduction); 
			model.addAttribute("Message", receiveForSalesService.save(receiveforSales));
			receiveforSales=receiveForSalesService.editReceiveforSales(receiveforSales.getTxtVNo()).get(0);
		    model.addAttribute("recordWastage", recordWastage);
		    model.addAttribute("recordTransferred", recordTransferred);    		
			return new ModelAndView("Inventory/ViewReceiveForSale","receiveforSalesView",receiveforSales);
	}
		else{
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			model.addAttribute("index", index);
			model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());
			model.addAttribute("msg","<script>alert('Access Denied');</script>");
			return new ModelAndView("index");
		}
		}
		else
		{
			return new ModelAndView("Login");
		}
}
//record transferred
@RequestMapping("/recordTransferred")
public ModelAndView recordTransferred(IssueForProduction issueForProduction,ReceiveforSales receiveforSales,RecordTransferred recordTransferred,RecordWastage recordWastage,ModelMap model,HttpSession session)
{	 
	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Inventory"))
		{
			model.addAttribute("inventory",inventory);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			model.addAttribute("issueForProduction", issueForProduction);
		    model.addAttribute("receiveforSales", receiveforSales);
		    model.addAttribute("recordWastage", recordWastage);    	   
			//model.addAttribute("Message", recordTransferredService.save(recordTransferred));
			int i=0,message=0;
			i = recordTransferredService.save(recordTransferred);
			if(i==0)
			{
				model.addAttribute("inventory",inventory);
				model.addAttribute("userName",l.getUname());
				model.addAttribute("userId",l.getEmpUserId());
				model.addAttribute("message",message);
		    	model.addAttribute("showProductList",createNewProductService.show());
		    	model.addAttribute("showissueProduction",issueForProductionService.showIssueProdList());
		    	model.addAttribute("showreceive",receiveForSalesService.showSalesProd());
		    	model.addAttribute("showtransfered",recordTransferredService.showRecTrans());
		    	model.addAttribute("showwastage",recordWastageService.showRecWast());
		    	model.addAttribute("pendingProduction",productionService.showPending());
				model.addAttribute("completedProduction",productionService.showCompleted());
				model.addAttribute("wareID",recordTransferredService.retriveWareHouse());    
		    	return new ModelAndView("Inventory/ManageStock");
			}
			else 
			{
				if(i>=1)
				{
					message=1;
					model.addAttribute("message", message);
					model.addAttribute("msg", createNewProductService.ShowAdd());
				}
				else
				{
					message=0;
					model.addAttribute("message", message);
					model.addAttribute("msg", createNewProductService.ShowNotAdd());
				}
				recordTransferred=recordTransferredService.editRecordTransferred(recordTransferred.getTxtVNo()).get(0);
				return new ModelAndView("Inventory/ViewRecordTransferred","recordTransferredView",recordTransferred);
			}
			
	}
		else{
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			model.addAttribute("index", index);
			model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());
			model.addAttribute("msg","<script>alert('Access Denied');</script>");
			return new ModelAndView("index");
		}
		}
		else
		{
			return new ModelAndView("Login");
		}
}    	 
//record Wastage
@RequestMapping("/recordWastage")
public ModelAndView recordWastage(IssueForProduction issueForProduction,ReceiveforSales receiveforSales,RecordTransferred recordTransferred,RecordWastage recordWastage,ModelMap model,HttpSession session)
{
	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Inventory"))
		{
			model.addAttribute("inventory",inventory);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			model.addAttribute("issueForProduction", issueForProduction);
			model.addAttribute("receiveforSales", receiveforSales);
			int i=0;
			int message = 0;
			i=recordWastageService.save(recordWastage);
			if(i>=1)
			{
				message=1;
				model.addAttribute("message", message);
				model.addAttribute("msg", createNewProductService.ShowAdd());
			}
			else
			{
				message=0;
				model.addAttribute("message", message);
				model.addAttribute("msg", createNewProductService.ShowNotAdd());
			}
			recordWastage=recordWastageService.editRecordWastage(recordWastage.getTxtVNo()).get(0);
			model.addAttribute("recordTransferred", recordTransferred);    		
			return new ModelAndView("Inventory/ViewRecordWastage","recordWastageview",recordWastage);		
	}
		else{
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			model.addAttribute("index", index);
			model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());
			model.addAttribute("msg","<script>alert('Access Denied');</script>");
			return new ModelAndView("index");
		}
		}
		else
		{
			return new ModelAndView("Login");
		}
}


//Edit createNewProduct
@RequestMapping(value="editCreateNewProduct")
public ModelAndView editCreateNewProduct(@RequestParam String productCode,Details details, CreateNewProduct createNewProduct, ModelMap model, HttpSession session) 
{
		Login l = (Login) session.getAttribute("user");
		if (lus.chkFlag(l)) 
		{
			if (lus.authontication(l, "Inventory")) 
			{
				model.addAttribute("userName", l.getUname());
				createNewProduct = createNewProductService.editCreateNewProduct(productCode).get(0);
				model.addAttribute("detailsList", createNewProductService.showProductDetails(productCode));
				String enable = createNewProduct.getInventory();
				if (enable.equalsIgnoreCase("Yes")) 
				{
					model.addAttribute("yes", enable);
				} 
				else if (enable.equalsIgnoreCase("No")) 
				{
					model.addAttribute("no", enable);
				}
				String prod_type = createNewProduct.getProductType();
				if (prod_type.equalsIgnoreCase("Resale Product"))
				{
					model.addAttribute("resale", prod_type);
				}
				else if(prod_type.equalsIgnoreCase("Sale Item"))
				{
					model.addAttribute("sale", prod_type);
				}
				else if(prod_type.equalsIgnoreCase("Purchase Item"))
				{
					model.addAttribute("purchase", prod_type);
				}
				model.addAttribute("prodID",createNewProductService.retriveProduct());
				return new ModelAndView("Inventory/EditCrateNewProduct","createNewProView", createNewProduct);
			} 
			else 
			{
				model.addAttribute("msg", "<script>alert('Access Denied');</script>");
				return new ModelAndView("index");
			}
		} 
		else 
		{
			return new ModelAndView("Login");
		}
}   
@RequestMapping(value="retrieveprodDesc")
public ModelAndView retrieveprodDesc(@RequestParam String productId,ModelMap model,HttpSession session)
{
	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Inventory"))
		{
			model.addAttribute("descNewProduction",createNewProductService.retriveDesc(productId)); 
	    	model.addAttribute("unitNewProduction", createNewProductService.retriveUnit(productId));
	    	
	    	return new ModelAndView("Inventory/retrieveprodDesc");
		}
		else{
			model.addAttribute("msg","<script>alert('Access Denied');</script>");
			return new ModelAndView("index");
		}
		}
		else
		{
			return new ModelAndView("Login");
		}
}

//updateProducts
@RequestMapping(value="updateProduct")
public ModelAndView updateProduct(@ModelAttribute CreateNewProduct createNewProduct,ModelMap model,HttpSession session)
{   	  	
	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Inventory"))
		{
			model.addAttribute("inventory",inventory);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			//model.addAttribute("message",createNewProductService.updateProduct(createNewProduct) );
			int i=0;
			int update = 0;
	    	i=createNewProductService.updateProduct(createNewProduct);
	    	if(i>=1)
	    		
			{
				update=1;
				model.addAttribute("update", update);
				model.addAttribute("msg", createNewProductService.ShowUpdate());
			}
			else
			{
				update=0;
				model.addAttribute("update", update);
				model.addAttribute("msg", createNewProductService.ShowNotUpdate());
			}
	    	createNewProduct=createNewProductService.editCreateNewProduct(createNewProduct.getProductCode()).get(0);  
	    	model.addAttribute("detailsList", createNewProductService.showProductDetails(createNewProduct.getProductCode()));
		    String prod_type = createNewProduct.getProductType();
			if (prod_type.equalsIgnoreCase("Resale Product"))
			{
				model.addAttribute("resale", prod_type);
			}
			else if(prod_type.equalsIgnoreCase("Sale Item"))
			{
				model.addAttribute("sale", prod_type);
			}
			else if(prod_type.equalsIgnoreCase("Purchase Item"))
			{
				model.addAttribute("purchase", prod_type);
			}
			return new ModelAndView("Inventory/viewCreateNewProduct","createNewProView",createNewProduct);}
		else{
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			model.addAttribute("index", index);
			model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());
			model.addAttribute("msg","<script>alert('Access Denied');</script>");
			return new ModelAndView("index");
		}
		}
		else
		{
			return new ModelAndView("Login");
		}
}
//View createNewProduct
@RequestMapping(value="viewCreateNewProduct")
public ModelAndView CreateNewProductView(@RequestParam String productCode,CreateNewProduct createNewProduct,ModelMap model,HttpSession session)
{   	
	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Inventory"))
		{
			model.addAttribute("inventory",inventory);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
		    createNewProduct=createNewProductService.editCreateNewProduct(productCode).get(0);  	
		    model.addAttribute("detailsList", createNewProductService.showProductDetails(productCode));
		    String prod_type = createNewProduct.getProductType();
			if (prod_type.equalsIgnoreCase("Resale Product"))
			{
				model.addAttribute("resale", prod_type);
			}
			else if(prod_type.equalsIgnoreCase("Sale Item"))
			{
				model.addAttribute("sale", prod_type);
			}
			else if(prod_type.equalsIgnoreCase("Purchase Item"))
			{
				model.addAttribute("purchase", prod_type);
			}
			return new ModelAndView("Inventory/viewCreateNewProduct","createNewProView",createNewProduct);
	}
		else{
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			model.addAttribute("index", index);
			model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());
			model.addAttribute("msg","<script>alert('Access Denied');</script>");
			return new ModelAndView("index");
		}
		}
		else
		{
			return new ModelAndView("Login");
		}
}



//edit issue for production
@RequestMapping(value="viewIssueForProduction")
public ModelAndView editIssueForProduction(@RequestParam String txtVNo,IssueForProduction issueForProduction,ModelMap model,HttpSession session)
{
	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Inventory"))
		{
			model.addAttribute("inventory",inventory);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			 issueForProduction=issueForProductionService.editIssueForProduction(txtVNo).get(0);
			 return new ModelAndView("Inventory/ViewIssueForProduction","issueForProductionView",issueForProduction); 
	}
		else{
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			model.addAttribute("index", index);
			model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());
			model.addAttribute("msg","<script>alert('Access Denied');</script>");
			return new ModelAndView("index");
		}
		}
		else
		{
			return new ModelAndView("Login");
		}
}
//View IssueForProduction
@RequestMapping(value="editIssueForProduction")
public ModelAndView viewIssueForProduction(@RequestParam String txtVNo,IssueForProduction issueForProduction,ModelMap model,HttpSession session)
{   	
	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Inventory"))
		{
			model.addAttribute("inventory",inventory);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			model.addAttribute("wareID",issueForProductionService.retriveWareHouse());
			model.addAttribute("prodID", issueForProductionService.retriveProduct());
			issueForProduction=issueForProductionService.editIssueForProduction(txtVNo).get(0);  	
			return new ModelAndView("Inventory/EditIssueForProduction","editIssueForProduction",issueForProduction);
	}
		else{
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			model.addAttribute("index", index);
			model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());
			model.addAttribute("msg","<script>alert('Access Denied');</script>");
			return new ModelAndView("index");
		}
		}
		else
		{
			return new ModelAndView("Login");
		}
}
//Update issue for production
@RequestMapping(value="updateissueForProduct")
public ModelAndView updateIssueForProduct(@ModelAttribute IssueForProduction issueForProduction,ModelMap model,HttpSession session)
{
	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Inventory"))
		{
			model.addAttribute("inventory",inventory);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			model.addAttribute("message",issueForProductionService.updateIssueForProduct(issueForProduction));
			issueForProduction=issueForProductionService.editIssueForProduction(issueForProduction.getTxtVNo()).get(0);//add    	
			return new ModelAndView("Inventory/ViewIssueForProduction","issueForProductionView",issueForProduction);
	}
		else{
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			model.addAttribute("index", index);
			model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());
			model.addAttribute("msg","<script>alert('Access Denied');</script>");
			return new ModelAndView("index");
		}
		}
		else
		{
			return new ModelAndView("Login");
		}
}
//edit receive for sales
@RequestMapping(value="editreceiveforSales")
public ModelAndView editReceiveForSales(@RequestParam String txtVNo,ReceiveforSales receiveForSales,ModelMap model,HttpSession session)
{
	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Inventory"))
		{
			model.addAttribute("inventory",inventory);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			model.addAttribute("wareID",receiveForSalesService.retriveWareHouse());
		    model.addAttribute("prodID", receiveForSalesService.retriveProduct());
			receiveForSales=receiveForSalesService.editReceiveforSales(txtVNo).get(0);
			return new ModelAndView("Inventory/EditReceiveSales","editreceiveforSales",receiveForSales); 
	}
		else{
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			model.addAttribute("index", index);
			model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());
			model.addAttribute("msg","<script>alert('Access Denied');</script>");
			return new ModelAndView("index");
		}
		}
		else
		{
			return new ModelAndView("Login");
		}
}
//update receive for sales
@RequestMapping(value="updatereceiveforSales")
 public ModelAndView updateReceiveForSales(@ModelAttribute ReceiveforSales receiveForSales,ModelMap model,HttpSession session)
 {
	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Inventory"))
		{
			model.addAttribute("inventory",inventory);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			model.addAttribute("message",receiveForSalesService.updateReceiveforSales(receiveForSales));
			receiveForSales = receiveForSalesService.editReceiveforSales(receiveForSales.getTxtVNo()).get(0);
			return new ModelAndView("Inventory/ViewReceiveForSale","receiveforSalesView",receiveForSales);
	}
		else{
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			model.addAttribute("index", index);
			model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());
			model.addAttribute("msg","<script>alert('Access Denied');</script>");
			return new ModelAndView("index");
		}
		}
		else
		{
			return new ModelAndView("Login");
		}
 }
//View Receive for sale
@RequestMapping(value="receiveforSalesView")
public ModelAndView viewReceiveForSale(@RequestParam String txtVNo,ReceiveforSales receiveForSales,ModelMap model,HttpSession session)
{   
	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Inventory"))
		{
			model.addAttribute("inventory",inventory);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
	    	receiveForSales=receiveForSalesService.editReceiveforSales(txtVNo).get(0);  	
	    	return new ModelAndView("Inventory/ViewReceiveForSale","receiveforSalesView",receiveForSales);
	}
		else{
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			model.addAttribute("index", index);
			model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());
			model.addAttribute("msg","<script>alert('Access Denied');</script>");
			return new ModelAndView("index");
		}
		}
		else
		{
			return new ModelAndView("Login");
		}
}
//edit record Wastage 
@RequestMapping(value="editrecordWastage")
public ModelAndView editRecordWastage(@RequestParam String txtVNo,RecordWastage recordWastage,ModelMap model,HttpSession session)
{
	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Inventory"))
		{
			model.addAttribute("inventory",inventory);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			model.addAttribute("wareID",recordWastageService.retriveWareHouse());
			model.addAttribute("prodID", recordWastageService.retriveProduct());
			recordWastage=recordWastageService.editRecordWastage(txtVNo).get(0);
			return new ModelAndView("Inventory/EditRecordWastage","recordWastageVEdit",recordWastage); 
	}
		else{
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			model.addAttribute("index", index);
			model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());
			model.addAttribute("msg","<script>alert('Access Denied');</script>");
			return new ModelAndView("index");
		}
		}
		else
		{
			return new ModelAndView("Login");
		}
}
//update record Wastage 
@RequestMapping(value="updaterecordWastage")
public ModelAndView updateRecordWastage(RecordWastage recordWastage,ModelMap model,HttpSession session)
{	
	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Inventory"))
		{
			model.addAttribute("inventory",inventory);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			int i=0;
			int update = 0;
			i= recordWastageService.updateRecordWastage(recordWastage);
	    	if(i>=1)
			{
				update=1;
				model.addAttribute("update", update);
				model.addAttribute("msg", createNewProductService.ShowUpdate());
			}
			else
			{
				update=0;
				model.addAttribute("update", update);
				model.addAttribute("msg", createNewProductService.ShowNotUpdate());
			}
			recordWastage = recordWastageService.editRecordWastage(recordWastage.getTxtVNo()).get(0);
			return new ModelAndView("Inventory/ViewRecordWastage","recordWastageview",recordWastage);
	}
		else{
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			model.addAttribute("index", index);
			model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());
			model.addAttribute("msg","<script>alert('Access Denied');</script>");
			return new ModelAndView("index");
		}
		}
		else
		{
			return new ModelAndView("Login");
		}
}
//View Record Wastagess
@RequestMapping(value="recordWastageView")
public ModelAndView viewRecordWastage(@RequestParam String txtVNo,RecordWastage recordWastage,ModelMap model,HttpSession session)
{	
	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Inventory"))
		{
			model.addAttribute("inventory",inventory);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			recordWastage=recordWastageService.editRecordWastage(txtVNo).get(0);
			return new ModelAndView("Inventory/ViewRecordWastage","recordWastageview",recordWastage); 
	}
		else{
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			model.addAttribute("index", index);
			model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());
			model.addAttribute("msg","<script>alert('Access Denied');</script>");
			return new ModelAndView("index");
		}
		}
		else
		{
			return new ModelAndView("Login");
		}
}
//edit record transferred
@RequestMapping(value="editrecordTransferred")
public ModelAndView editRecordTransferred(@RequestParam String txtVNo,RecordTransferred recordTransferred,ModelMap model,HttpSession session)
{
	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Inventory"))
		{
			model.addAttribute("inventory",inventory);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			model.addAttribute("wareID",recordTransferredService.retriveWareHouse());    	
			model.addAttribute("prodID",recordTransferredService.retriveProduct());
			recordTransferred=recordTransferredService.editRecordTransferred(txtVNo).get(0);
			return new ModelAndView("Inventory/EditRecordTransferred","recordTransferredView",recordTransferred); 
	}
		else{
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			model.addAttribute("index", index);
			model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());
			model.addAttribute("msg","<script>alert('Access Denied');</script>");
			return new ModelAndView("index");
		}
		}
		else
		{
			return new ModelAndView("Login");
		}
}
//update record transferred
@RequestMapping(value="updaterecordTransferred")
public ModelAndView updateRecordTransferred(RecordTransferred recordTransferred,ModelMap model,HttpSession session)
{	
	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Inventory"))
		{
			model.addAttribute("inventory",inventory);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			int i=0;
			int update = 0;
	    	i=recordTransferredService.updateRecordTransferred(recordTransferred);
	    	if(i>=1)
			{
				update=1;
				model.addAttribute("update", update);
				model.addAttribute("msg", createNewProductService.ShowUpdate());
			}
			else
			{
				update=0;
				model.addAttribute("update", update);
				model.addAttribute("msg", createNewProductService.ShowNotUpdate());
			}
		
			recordTransferred = recordTransferredService.editRecordTransferred(recordTransferred.getTxtVNo()).get(0);
			return new ModelAndView("Inventory/ViewRecordTransferred","recordTransferredView",recordTransferred);
	}
		else{
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			model.addAttribute("index", index);
			model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());
			model.addAttribute("msg","<script>alert('Access Denied');</script>");
			return new ModelAndView("index");
		}
		}
		else
		{
			return new ModelAndView("Login");
		}
}
//View Record Transferred  recordTransferredView
@RequestMapping(value="recordTransferredView")
public ModelAndView viewRecordTransferred(@RequestParam String txtVNo,RecordTransferred recordTransferred,ModelMap model,HttpSession session)
{
	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Inventory"))
		{
			model.addAttribute("inventory",inventory);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			recordTransferred=recordTransferredService.editRecordTransferred(txtVNo).get(0);
			return new ModelAndView("Inventory/ViewRecordTransferred","recordTransferredView",recordTransferred); 
	}
		else{
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			model.addAttribute("index", index);
			model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());
			model.addAttribute("msg","<script>alert('Access Denied');</script>");
			return new ModelAndView("index");
		}
		}
		else
		{
			return new ModelAndView("Login");
		}
}


//PDF FOR CREATE NEW PRODUCT
@RequestMapping(value="inventoryPDF")
public ModelAndView inventoryPDF(@RequestParam String productCode,CompanyDetails companyDetailss,CreateNewProduct createNewProduct,ModelMap model,HttpSession session)
{
	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Inventory"))
		{
			model.addAttribute("inventory",inventory);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			createNewProduct=createNewProductService.viewPDFCreateNewProduct(productCode).get(0);	
		    model.addAttribute("detailsList", createNewProductService.showProductDetails(productCode)); 	
		    String prod_type = createNewProduct.getProductType(); 		    
			if (prod_type.equalsIgnoreCase("Resale Product"))
			{
				model.addAttribute("resale", prod_type);
			}
			else if(prod_type.equalsIgnoreCase("Sale Item"))
			{
				model.addAttribute("sale", prod_type);
			}
			else if(prod_type.equalsIgnoreCase("Purchase Item"))
			{
				model.addAttribute("purchase", prod_type);
			}
			model.addAttribute("compInfo", createNewProductService.getInfo(companyDetailss).get(0));
			return new ModelAndView("inventoryPDF", "createNewProView", createNewProduct);
	}
		else{
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			model.addAttribute("index", index);
			model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());
			model.addAttribute("msg","<script>alert('Access Denied');</script>");
			return new ModelAndView("index");
		}
		}
		else
		{
			return new ModelAndView("Login");
		}
}
//PDF FOR ISSUE FOR PRODUCTION
@RequestMapping(value="issuePDF")
public ModelAndView issuePDF(@RequestParam String txtVNo,CompanyDetails companyDetailss,IssueForProduction issueForProduction,ModelMap model,HttpSession session)
{
	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Inventory"))
		{
			model.addAttribute("inventory",inventory);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			issueForProduction=issueForProductionService.editIssueForProduction(txtVNo).get(0);	
			model.addAttribute("compInfo", issueForProductionService.getInfo(companyDetailss).get(0));
			return new ModelAndView("issuePDF", "issueForProductionView", issueForProduction);
	}
		else{
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			model.addAttribute("index", index);
			model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());
			model.addAttribute("msg","<script>alert('Access Denied');</script>");
			return new ModelAndView("index");
		}
		}
		else
		{
			return new ModelAndView("Login");
		}
}
//PDF FOR RECEIVE FOR SALES
@RequestMapping(value="receiveForSalesPDF")
public ModelAndView receiveForSalesPDF(@RequestParam String txtVNo,CompanyDetails companyDetailss,ReceiveforSales receiveForSales,ModelMap model,HttpSession session)
{
	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Inventory"))
		{	
			model.addAttribute("inventory",inventory);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			receiveForSales=receiveForSalesService.editReceiveforSales(txtVNo).get(0);	
			model.addAttribute("compInfo", receiveForSalesService.getInfo(companyDetailss).get(0));
			return new ModelAndView("receiveForSalesPDF", "receiveforSalesView", receiveForSales);
	}
		else{
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			model.addAttribute("index", index);
			model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());
			model.addAttribute("msg","<script>alert('Access Denied');</script>");
			return new ModelAndView("index");
		}
		}
		else
		{
			return new ModelAndView("Login");
		}
}
//PDF FOR RECORD TRANSFERRD 
@RequestMapping(value="recordTransferredPDF")
public ModelAndView recordTransferredPDF(@RequestParam String txtVNo,CompanyDetails companyDetailss,RecordTransferred recordTransferred,ModelMap model,HttpSession session)
{
	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Inventory"))
		{
			model.addAttribute("inventory",inventory);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			recordTransferred=recordTransferredService.editRecordTransferred(txtVNo).get(0);
			model.addAttribute("compInfo", recordTransferredService.getInfo(companyDetailss).get(0));
			return new ModelAndView("recordTransferredPDF", "recordTransferredView", recordTransferred);
	}
		else{
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			model.addAttribute("index", index);
			model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());
			model.addAttribute("msg","<script>alert('Access Denied');</script>");
			return new ModelAndView("index");
		}
		}
		else
		{
			return new ModelAndView("Login");
		}
}
//PDF FOR RECORD WASTAGE
@RequestMapping(value="recordWastagePDF")
public ModelAndView recordWastagePDF(@RequestParam String txtVNo,CompanyDetails companyDetailss,RecordWastage recordWastage,ModelMap model,HttpSession session)
{
	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Inventory"))
		{
			model.addAttribute("inventory",inventory);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			recordWastage=recordWastageService.editRecordWastage(txtVNo).get(0);	
			model.addAttribute("compInfo", recordWastageService.getInfo(companyDetailss).get(0));
			return new ModelAndView("recordWastagePDF", "recordWastageview", recordWastage);
	}
		else{
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			model.addAttribute("index", index);
			model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());
			model.addAttribute("msg","<script>alert('Access Denied');</script>");
			return new ModelAndView("index");
		}
		}
		else
		{
			return new ModelAndView("Login");
		}
}

/* delete start */
@RequestMapping("/deleteCreateNewProduct")
public ModelAndView deleteProduct(@RequestParam String productCode, CreateNewProduct createNewProduct, ModelMap model,HttpSession session)
{Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Inventory"))
		{
			model.addAttribute("inventory",inventory);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());				
			int i=0,delete=0;
			i=createNewProductService.delete(productCode);
			if(i>=1)
			{
				delete=1;
				model.addAttribute("delete", delete);
				model.addAttribute("msg", createNewProductService.ShowDelete());
			}
			else	
			{
				delete=0;
				model.addAttribute("delete", delete);
				model.addAttribute("msg", createNewProductService.ShowNotDelete());
			}
			model.addAttribute("showProductList",createNewProductService.show());
			model.addAttribute("showissueProduction",issueForProductionService.showIssueProdList());
			model.addAttribute("showreceive",receiveForSalesService.showSalesProd());
			model.addAttribute("showtransfered",recordTransferredService.showRecTrans());
			model.addAttribute("showwastage",recordWastageService.showRecWast());
			model.addAttribute("wareID",recordTransferredService.retriveWareHouse());
			return new ModelAndView("Inventory/inventory");
	}
		else{
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			model.addAttribute("index", index);
			model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());
			model.addAttribute("msg","<script>alert('Access Denied');</script>");
			return new ModelAndView("index");
		}
		}
		else
		{
			return new ModelAndView("Login");
		}
}
@RequestMapping("/deleteIssueForProduction")
public ModelAndView deleteIssueProd(@RequestParam String txtVNo, IssueForProduction issueForProduction,ModelMap model,HttpSession session)
{
	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Inventory"))
		{
			model.addAttribute("inventory",inventory);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			model.addAttribute("message", issueForProductionService.delete(txtVNo));
			model.addAttribute("showProductList",createNewProductService.show());
			model.addAttribute("showissueProduction",issueForProductionService.showIssueProdList());
			model.addAttribute("showreceive",receiveForSalesService.showSalesProd());
			model.addAttribute("showtransfered",recordTransferredService.showRecTrans());
			model.addAttribute("showwastage",recordWastageService.showRecWast());
			model.addAttribute("wareID",recordTransferredService.retriveWareHouse());	
			return new ModelAndView("Inventory/inventory");
	}
		else{
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			model.addAttribute("index", index);
			model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());
			model.addAttribute("msg","<script>alert('Access Denied');</script>");
			return new ModelAndView("index");
		}
		}
		else
		{
			return new ModelAndView("Login");
		}
}
@RequestMapping("/deleteReceiveforSales")
public ModelAndView deleteReceive(@RequestParam String txtVNo,ReceiveforSales receiveForSales, ModelMap model,HttpSession session)
{
	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Inventory"))
		{
			model.addAttribute("inventory",inventory);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			model.addAttribute("message", receiveForSalesService.delete(txtVNo));
			model.addAttribute("showProductList",createNewProductService.show());
			model.addAttribute("showissueProduction",issueForProductionService.showIssueProdList());
			model.addAttribute("showreceive",receiveForSalesService.showSalesProd());
			model.addAttribute("showtransfered",recordTransferredService.showRecTrans());
			model.addAttribute("showwastage",recordWastageService.showRecWast());
			model.addAttribute("wareID",recordTransferredService.retriveWareHouse());
			return new ModelAndView("Inventory/inventory");
	}
		else{
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			model.addAttribute("index", index);
			model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());
			model.addAttribute("msg","<script>alert('Access Denied');</script>");
			return new ModelAndView("index");
		}
		}
		else
		{
			return new ModelAndView("Login");
		}
}
@RequestMapping("/deleteRecordTransferred")
public ModelAndView deleteRecordTrns(@RequestParam String txtVNo,RecordTransferred recordTransfer,ModelMap model,HttpSession session)
{
	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Inventory"))
		{
			model.addAttribute("inventory",inventory);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			int i=0,delete=0;
			i=recordTransferredService.delete(txtVNo);
			if(i>=1)
			{
				delete=1;
				model.addAttribute("delete", delete);
				model.addAttribute("msg", createNewProductService.ShowDelete());
			}
			else	
			{
				delete=0;
				model.addAttribute("delete", delete);
				model.addAttribute("msg", createNewProductService.ShowNotDelete());
			}
			model.addAttribute("showProductList",createNewProductService.show());
			model.addAttribute("showissueProduction",issueForProductionService.showIssueProdList());
			model.addAttribute("showreceive",receiveForSalesService.showSalesProd());
			model.addAttribute("showtransfered",recordTransferredService.showRecTrans());
			model.addAttribute("showwastage",recordWastageService.showRecWast());
			model.addAttribute("wareID",recordTransferredService.retriveWareHouse());
			return new ModelAndView("Inventory/inventory");
	}
		else{
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			model.addAttribute("index", index);
			model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());
			model.addAttribute("msg","<script>alert('Access Denied');</script>");
			return new ModelAndView("index");
		}
		}
		else
		{
			return new ModelAndView("Login");
		}
}
@RequestMapping("/deleteRecordWastage")
public ModelAndView deleteRecordWastage(@RequestParam String txtVNo,RecordWastage recordWastage,ModelMap model,HttpSession session)
{
	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Inventory"))
		{
			model.addAttribute("inventory",inventory);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			int i=0,delete=0;
			i=recordWastageService.delete(txtVNo);;
			if(i>=1)
			{
				delete=1;
				model.addAttribute("delete", delete);
				model.addAttribute("msg", createNewProductService.ShowDelete());
			}
			else	
			{
				delete=0;
				model.addAttribute("delete", delete);
				model.addAttribute("msg", createNewProductService.ShowNotDelete());
			} 
			model.addAttribute("showProductList",createNewProductService.show());
			model.addAttribute("showissueProduction",issueForProductionService.showIssueProdList());
			model.addAttribute("showreceive",receiveForSalesService.showSalesProd());
			model.addAttribute("showtransfered",recordTransferredService.showRecTrans());
			model.addAttribute("showwastage",recordWastageService.showRecWast());
			model.addAttribute("wareID",recordTransferredService.retriveWareHouse());
			return new ModelAndView("Inventory/inventory");
	}
		else{
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			model.addAttribute("index", index);
			model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());
			model.addAttribute("msg","<script>alert('Access Denied');</script>");
			return new ModelAndView("index");
		}
		}
		else
		{
			return new ModelAndView("Login");
		}
}
@RequestMapping("/DeleteReceivedAgaistProd")
public ModelAndView deleteReceivedProd(@RequestParam String txtVNo,ModelMap model,HttpSession session)
{
	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Inventory"))
		{
			model.addAttribute("inventory",inventory);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			model.addAttribute("showProductList",createNewProductService.show());
			model.addAttribute("showissueProduction",issueForProductionService.showIssueProdList());
			model.addAttribute("showreceive",receiveForSalesService.showSalesProd());
			model.addAttribute("showtransfered",recordTransferredService.showRecTrans());
			model.addAttribute("showwastage",recordWastageService.showRecWast());
			model.addAttribute("wareID",recordTransferredService.retriveWareHouse());
			return new ModelAndView("Inventory/inventory");
			
	}
		else{
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			model.addAttribute("index", index);
			model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());
			model.addAttribute("msg","<script>alert('Access Denied');</script>");
			return new ModelAndView("index");
		}
		}
		else
		{
			return new ModelAndView("Login");
		}
}
//retriveRawMaterial
@RequestMapping("/retriveRawMaterial")
public ModelAndView retriveRawMaterial(@RequestParam String productId,@RequestParam int cnt,@RequestParam float qty,@RequestParam String unit,RawMaterialDetails details, ModelMap model,HttpSession session)
{
	Login l=(Login) session.getAttribute("user");
	if(lus.chkFlag(l)){
	if(lus.authontication(l,"Inventory"))
	{	
		model.addAttribute("inventory",inventory);
		model.addAttribute("userName",l.getUname());
		model.addAttribute("userId",l.getEmpUserId());	
		model.addAttribute("rawMaterialList",productionService.retriveRawMaterial(productId,qty));
		model.addAttribute("rmList",productionService.retriveRawMaterialList());
		model.addAttribute("cnt",cnt);
		model.addAttribute("unit",unit);
		return new ModelAndView("Inventory/retriveRawMaterial");
	}
	else{
		model.addAttribute("userName",l.getUname());
		model.addAttribute("userId",l.getEmpUserId());	
		model.addAttribute("index", index);
		model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());
		model.addAttribute("msg","<script>alert('Access Denied');</script>");
		return new ModelAndView("index");
	}
	}
	else
	{
		return new ModelAndView("Login");
	}
}
//retrieveRMDetails.do
@RequestMapping("/retrieveRMDetails")
public ModelAndView retrieveRMDetails(@RequestParam String rmId,@RequestParam String productId,RawMaterialDetails details, ModelMap model,HttpSession session)
{
	Login l=(Login) session.getAttribute("user");
	if(lus.chkFlag(l)){
	if(lus.authontication(l,"Inventory"))
	{	
		model.addAttribute("inventory",inventory);
		model.addAttribute("userName",l.getUname());
		model.addAttribute("userId",l.getEmpUserId());	
		model.addAttribute("rawMaterialDesc",productionService.retriveRMDesc(rmId));
		model.addAttribute("rawMaterialQty",productionService.retriveRMQty(rmId,productId));
		model.addAttribute("rawMaterialAQty",productionService.retriveProductQty(rmId));		
		return new ModelAndView("Inventory/retrieveRMDetails");
	}
	else{
		model.addAttribute("userName",l.getUname());
		model.addAttribute("userId",l.getEmpUserId());	
		model.addAttribute("index", index);
		model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());
		model.addAttribute("msg","<script>alert('Access Denied');</script>");
		return new ModelAndView("index");
	}
	}
	else
	{
		return new ModelAndView("Login");
	}
}
//retrieveProductDetails
@RequestMapping("/retrieveProductDetailsI")
public ModelAndView retrieveProductDetailsI(@RequestParam String productId,RawMaterialDetails details, ModelMap model,HttpSession session)
{
	Login l=(Login) session.getAttribute("user");
	if(lus.chkFlag(l)){
	if(lus.authontication(l,"Inventory"))
	{	
		model.addAttribute("inventory",inventory);
		model.addAttribute("userName",l.getUname());
		model.addAttribute("userId",l.getEmpUserId());	
		model.addAttribute("productDesc",productionService.retriveProductDesc(productId));
		model.addAttribute("productQty",productionService.retriveProductQty(productId));	
		model.addAttribute("productUnit",productionService.retriveProductUnit(productId));	
		return new ModelAndView("Inventory/retrieveProductDetailsI");
	}
	else{
		model.addAttribute("userName",l.getUname());
		model.addAttribute("userId",l.getEmpUserId());	
		model.addAttribute("index", index);
		model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());
		model.addAttribute("msg","<script>alert('Access Denied');</script>");
		return new ModelAndView("index");
	}
	}
	else
	{
		return new ModelAndView("Login");
	}
}
//addProduction
@RequestMapping("/addProduction")
public ModelAndView addProduction(Production production, ModelMap model,HttpSession session)
{
	Login l=(Login) session.getAttribute("user");
	if(lus.chkFlag(l)){
	if(lus.authontication(l,"Inventory"))
	{			
		model.addAttribute("inventory",inventory);
		model.addAttribute("userName",l.getUname());
		model.addAttribute("userId",l.getEmpUserId());	
		production.setCreatedBy(l.getEmpUserId());
		production.setUpdatedBy(l.getEmpUserId());
		model.addAttribute("msg",productionService.save(production));
		model.addAttribute("pendingProduction",productionService.showPending());
		model.addAttribute("completedProduction",productionService.showCompleted());
		model.addAttribute("userName",l.getUname());
    	model.addAttribute("showProductList",createNewProductService.show());
    	model.addAttribute("showissueProduction",issueForProductionService.showIssueProdList());
    	model.addAttribute("showreceive",receiveForSalesService.showSalesProd());
    	model.addAttribute("showtransfered",recordTransferredService.showRecTrans());
    	model.addAttribute("showwastage",recordWastageService.showRecWast());
    	model.addAttribute("wareID",recordTransferredService.retriveWareHouse());
    	return new ModelAndView("Inventory/inventory");
	}
	else{
		model.addAttribute("userName",l.getUname());
		model.addAttribute("userId",l.getEmpUserId());	
		model.addAttribute("index", index);
		model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());
		model.addAttribute("msg","<script>alert('Access Denied');</script>");
		return new ModelAndView("index");
	}
	}
	else
	{
		return new ModelAndView("Login");
	}
}
//retrieveProductId
@RequestMapping("/retrieveProductId")
public ModelAndView retrieveProductId(@RequestParam String productId,RawMaterialDetails details,ModelMap model,HttpSession session)
{
	Login l=(Login) session.getAttribute("user");
	if(lus.chkFlag(l)){
	if(lus.authontication(l,"Inventory"))
	{	
		model.addAttribute("inventory",inventory);
		model.addAttribute("userName",l.getUname());
		model.addAttribute("userId",l.getEmpUserId());	
		model.addAttribute("productId",productId);
		return new ModelAndView("Inventory/retrieveProductId");
	}
	else{
		model.addAttribute("userName",l.getUname());
		model.addAttribute("userId",l.getEmpUserId());	
		model.addAttribute("index", index);
		model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());
		model.addAttribute("msg","<script>alert('Access Denied');</script>");
		return new ModelAndView("index");
	}
	}
	else
	{
		return new ModelAndView("Login");
	}
}
//viewpProduction.do?productionId viewProductionOrder.jsp
@RequestMapping("/viewProduction")
public ModelAndView viewProduction(@RequestParam String productionId,Production production, ModelMap model,HttpSession session)
{
	Login l=(Login) session.getAttribute("user");
	if(lus.chkFlag(l)){
	if(lus.authontication(l,"Inventory"))
	{			
		model.addAttribute("inventory",inventory);
		model.addAttribute("userName",l.getUname());
		model.addAttribute("userId",l.getEmpUserId());	
		production.setCreatedBy(l.getEmpUserId());
		production.setUpdatedBy(l.getEmpUserId());		
		model.addAttribute("userName",l.getUname());    	
		production=productionService.edit(productionId).get(0);
    	return new ModelAndView("Inventory/viewProductionOrder","production",production);
	}
	else{
		model.addAttribute("userName",l.getUname());
		model.addAttribute("userId",l.getEmpUserId());	
		model.addAttribute("index", index);
		model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());
		model.addAttribute("msg","<script>alert('Access Denied');</script>");
		return new ModelAndView("index");
	}
	}
	else
	{
		return new ModelAndView("Login");
	}
}
//editProduction.do?productionId
@RequestMapping("/editProduction")
public ModelAndView editProduction(@RequestParam String productionId,Production production, ModelMap model,HttpSession session)
{
	Login l=(Login) session.getAttribute("user");
	if(lus.chkFlag(l)){
	if(lus.authontication(l,"Inventory"))
	{	
		model.addAttribute("inventory",inventory);
		model.addAttribute("userName",l.getUname());
		model.addAttribute("userId",l.getEmpUserId());	
		production.setCreatedBy(l.getEmpUserId());
		production.setUpdatedBy(l.getEmpUserId());		
		model.addAttribute("userName",l.getUname());    	
		production=productionService.edit(productionId).get(0);		
		model.addAttribute("orderList", productionService.showOrder()); 
		model.addAttribute("rmList",productionService.retriveRawMaterialList());
		model.addAttribute("prodID",recordTransferredService.retriveProduct());    	 
    	return new ModelAndView("Inventory/editProductionOrder","production",production);
	}
	else{
		model.addAttribute("userName",l.getUname());
		model.addAttribute("userId",l.getEmpUserId());	
		model.addAttribute("index", index);
		model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());
		model.addAttribute("msg","<script>alert('Access Denied');</script>");
		return new ModelAndView("index");
	}
	}
	else
	{
		return new ModelAndView("Login");
	}
}
//updateProduction
@RequestMapping("/updateProduction")
public ModelAndView updateProduction(Production production, ModelMap model,HttpSession session)
{
	Login l=(Login) session.getAttribute("user");
	if(lus.chkFlag(l)){
	if(lus.authontication(l,"Inventory"))
	{			
		model.addAttribute("inventory",inventory);
		model.addAttribute("userName",l.getUname());
		model.addAttribute("userId",l.getEmpUserId());	
		production.setCreatedBy(l.getEmpUserId());
		production.setUpdatedBy(l.getEmpUserId());
		model.addAttribute("msg",productionService.updateProduction(production));
		model.addAttribute("pendingProduction",productionService.showPending());
		model.addAttribute("completedProduction",productionService.showCompleted());
		model.addAttribute("userName",l.getUname());
    	model.addAttribute("showProductList",createNewProductService.show());
    	model.addAttribute("showissueProduction",issueForProductionService.showIssueProdList());
    	model.addAttribute("showreceive",receiveForSalesService.showSalesProd());
    	model.addAttribute("showtransfered",recordTransferredService.showRecTrans());
    	model.addAttribute("showwastage",recordWastageService.showRecWast());
    	model.addAttribute("wareID",recordTransferredService.retriveWareHouse());
    	return new ModelAndView("Inventory/inventory");
	}
	else{
		model.addAttribute("userName",l.getUname());
		model.addAttribute("userId",l.getEmpUserId());	
		model.addAttribute("index", index);
		model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());
		model.addAttribute("msg","<script>alert('Access Denied');</script>");
		return new ModelAndView("index");
	}
	}
	else
	{
		return new ModelAndView("Login");
	}
}
///completepProduction.do?productionId
/*@RequestMapping("/completepProduction")
public ModelAndView completepProduction(@RequestParam String productionId,Production production, ModelMap model,HttpSession session)
{
	Login l=(Login) session.getAttribute("user");
	if(lus.chkFlag(l)){
	if(lus.authontication(l,"Inventory"))
	{			
		production.setCreatedBy(l.getEmpUserId());
		production.setUpdatedBy(l.getEmpUserId());
		model.addAttribute("wareID",recordTransferredService.retriveWareHouse());    	
		production.setProductionID(productionId);
    	return new ModelAndView("Inventory/completeProduction","production",production);
	}
	else{
		model.addAttribute("userName",l.getUname());
		model.addAttribute("msg","<script>alert('Access Denied');</script>");
		return new ModelAndView("index");
	}
	}
	else
	{
		return new ModelAndView("Login");
	}
}*/
//completeProductionOrder
@RequestMapping("/completeProductionOrder")
public ModelAndView completeProductionOrder(Production production, ModelMap model,HttpSession session)
{
	Login l=(Login) session.getAttribute("user");
	if(lus.chkFlag(l)){
	if(lus.authontication(l,"Inventory"))
	{			
		model.addAttribute("inventory",inventory);
		model.addAttribute("userName",l.getUname());
		model.addAttribute("userId",l.getEmpUserId());	
		production.setCreatedBy(l.getEmpUserId());
		production.setUpdatedBy(l.getEmpUserId());
		model.addAttribute("msg",productionService.completeProductionOrder(production));
		model.addAttribute("pendingProduction",productionService.showPending());
		model.addAttribute("completedProduction",productionService.showCompleted());
		model.addAttribute("userName",l.getUname());
    	model.addAttribute("showProductList",createNewProductService.show());
    	model.addAttribute("showissueProduction",issueForProductionService.showIssueProdList());
    	model.addAttribute("showreceive",receiveForSalesService.showSalesProd());
    	model.addAttribute("showtransfered",recordTransferredService.showRecTrans());
    	model.addAttribute("showwastage",recordWastageService.showRecWast());	
    	model.addAttribute("wareID",recordTransferredService.retriveWareHouse());
    	return new ModelAndView("Inventory/inventory");
	}
	else{
		model.addAttribute("userName",l.getUname());
		model.addAttribute("userId",l.getEmpUserId());	
		model.addAttribute("index", index);
		model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());
		model.addAttribute("msg","<script>alert('Access Denied');</script>");
		return new ModelAndView("index");
	}
	}
	else
	{
		return new ModelAndView("Login");
	}
}
///deletepProduction.do?productionId
@RequestMapping("/deletepProduction")
public ModelAndView deletepProduction(@RequestParam String productionId,Production production, ModelMap model,HttpSession session)
{
	Login l=(Login) session.getAttribute("user");
	if(lus.chkFlag(l)){
	if(lus.authontication(l,"Inventory"))
	{			
		model.addAttribute("inventory",inventory);
		model.addAttribute("userName",l.getUname());
		model.addAttribute("userId",l.getEmpUserId());	
		production.setCreatedBy(l.getEmpUserId());
		production.setUpdatedBy(l.getEmpUserId());
		model.addAttribute("msg",productionService.deleteProductionOrder(productionId));
		model.addAttribute("pendingProduction",productionService.showPending());
		model.addAttribute("completedProduction",productionService.showCompleted());
		model.addAttribute("userName",l.getUname());
    	model.addAttribute("showProductList",createNewProductService.show());
    	model.addAttribute("showissueProduction",issueForProductionService.showIssueProdList());
    	model.addAttribute("showreceive",receiveForSalesService.showSalesProd());
    	model.addAttribute("showtransfered",recordTransferredService.showRecTrans());
    	model.addAttribute("showwastage",recordWastageService.showRecWast());
    	model.addAttribute("wareID",recordTransferredService.retriveWareHouse());
    	return new ModelAndView("Inventory/inventory");
	}
	else{
		model.addAttribute("userName",l.getUname());
		model.addAttribute("userId",l.getEmpUserId());	
		model.addAttribute("index", index);
		model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());
		model.addAttribute("msg","<script>alert('Access Denied');</script>");
		return new ModelAndView("index");
	}
	}
	else
	{
		return new ModelAndView("Login");
	}
}
//showRawMaterial.do?productId
@RequestMapping("/showRawMaterial")
public ModelAndView showRawMaterial(@RequestParam String productionId,@RequestParam String productId,@RequestParam String pName,Production production, ModelMap model,HttpSession session)
{
	Login l=(Login) session.getAttribute("user");
	if(lus.chkFlag(l)){
	if(lus.authontication(l,"Inventory"))
	{			
		model.addAttribute("inventory",inventory);
		model.addAttribute("userName",l.getUname());
		model.addAttribute("userId",l.getEmpUserId());	
		production.setCreatedBy(l.getEmpUserId());
		production.setUpdatedBy(l.getEmpUserId());		
		model.addAttribute("userName",l.getUname());		
		//production=productionService.showRawMaterial(productionId,productId).get(0);
		model.addAttribute("rawMaterialList",productionService.showRawMaterial(productionId,productId));
		model.addAttribute("productionId",productionId);
		model.addAttribute("pName",pName);
    	return new ModelAndView("Inventory/showRawMaterial");
	}
	else{
		model.addAttribute("userName",l.getUname());
		model.addAttribute("userId",l.getEmpUserId());	
		model.addAttribute("index", index);
		model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());
		model.addAttribute("msg","<script>alert('Access Denied');</script>");
		return new ModelAndView("index");
	}
	}
	else
	{
		return new ModelAndView("Login");
	}
}
//productionOrderDetails
@RequestMapping("/productionOrderDetails")
public ModelAndView productionOrderDetails(@RequestParam String productionId,Production production, ModelMap model,HttpSession session)
{
	Login l=(Login) session.getAttribute("user");
	if(lus.chkFlag(l)){
	if(lus.authontication(l,"Inventory"))
	{		
		model.addAttribute("inventory",inventory);
		model.addAttribute("userName",l.getUname());
		model.addAttribute("userId",l.getEmpUserId());	
    	production=productionService.edit(productionId).get(0);
    	return new ModelAndView("Inventory/productionOrderDetails","production",production);
	}
	else{
		model.addAttribute("userName",l.getUname());
		model.addAttribute("userId",l.getEmpUserId());	
		model.addAttribute("index", index);
		model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());
		model.addAttribute("msg","<script>alert('Access Denied');</script>");
		return new ModelAndView("index");
	}
	}
	else
	{
		return new ModelAndView("Login");
	}
}
//productionOrderPDF.do?productionId=${production.productionID}
@RequestMapping("/productionOrderPDF")
public ModelAndView productionOrderPDF(@RequestParam String productionId,CompanyDetails companyDetails,Production production, ModelMap model,HttpSession session)
{
	Login l=(Login) session.getAttribute("user");
	if(lus.chkFlag(l)){
	if(lus.authontication(l,"Inventory"))
	{			
		model.addAttribute("inventory",inventory);
		model.addAttribute("userName",l.getUname());
		model.addAttribute("userId",l.getEmpUserId());	
		production.setCreatedBy(l.getEmpUserId());
		production.setUpdatedBy(l.getEmpUserId());		
		model.addAttribute("userName",l.getUname());    	
		production=productionService.edit(productionId).get(0);
		model.addAttribute("compInfo", productionService.getInfo(companyDetails).get(0));
    	return new ModelAndView("productionOrderPDF","production",production);
	}
	else{
		model.addAttribute("userName",l.getUname());
		model.addAttribute("userId",l.getEmpUserId());	
		model.addAttribute("index", index);
		model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());
		model.addAttribute("msg","<script>alert('Access Denied');</script>");
		return new ModelAndView("index");
	}
	}
	else
	{
		return new ModelAndView("Login");
	}
}
//warehouseProducts.do?warehouseId=${warehouseList.warehousrID}
@RequestMapping("/warehouseProducts")
public ModelAndView warehouseProducts(@RequestParam String warehouseId,Warehouse warehouse, ModelMap model,HttpSession session)
{
	Login l=(Login) session.getAttribute("user");
	if(lus.chkFlag(l)){
	if(lus.authontication(l,"Inventory"))
	{		
		model.addAttribute("inventory",inventory);
		model.addAttribute("userName",l.getUname());
		model.addAttribute("userId",l.getEmpUserId());	
		warehouse=warehouseService.editWarehouse(warehouseId).get(0);
    	return new ModelAndView("Inventory/warehouseProducts","warehouse",warehouse);
	}
	else{	
		model.addAttribute("userName",l.getUname());
		model.addAttribute("userId",l.getEmpUserId());	
		model.addAttribute("index", index);
		model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());
		model.addAttribute("msg","<script>alert('Access Denied');</script>");
		return new ModelAndView("index");
	}
	}
	else
	{
		return new ModelAndView("Login");
	}
}
@RequestMapping("retrievewID")
public ModelAndView retrivewarehouseProd(@RequestParam String wID,ModelMap model,HttpSession session)
{
	Login l=(Login) session.getAttribute("user");
	if(lus.chkFlag(l)){
	if(lus.authontication(l,"Inventory"))
	{
		model.addAttribute("prodID", recordTransferredService.retriveWarehouseProd(wID));
		return new ModelAndView("Inventory/retriveWarehouseProduct");
	}
	else
	{
		model.addAttribute("msg","<script>alert('Access Denied');</script>");
		return new ModelAndView("index");
	}
	}
	else
	{
		return new ModelAndView("Login");
	}
}
@RequestMapping("retrievewastageID")
public ModelAndView retrievewastageID(@RequestParam String wID,ModelMap model,HttpSession session)
{
	Login l=(Login) session.getAttribute("user");
	if(lus.chkFlag(l)){
	if(lus.authontication(l,"Inventory"))
	{
		
		model.addAttribute("prodID", recordWastageService.retriveWarehouseWProd(wID)); 
		return new ModelAndView("Inventory/retriveWastageProducts");
	}
	else{
		model.addAttribute("msg","<script>alert('Access Denied');</script>");
		return new ModelAndView("index");
	}
	}
	else
	{
		return new ModelAndView("Login");
	}
}
@RequestMapping(value="retriveWastageqty")
public ModelAndView retrivewasteAvailableQty(@RequestParam String productId,String wID,ModelMap model,HttpSession session)
{
	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Inventory"))
		{
			model.addAttribute("availqtyrecordwaste",recordWastageService.retriveWastageAvailqty(productId, wID));			
	    	return new ModelAndView("Inventory/retrivewasteAvailableQty");
		}
		else{
			model.addAttribute("msg","<script>alert('Access Denied');</script>");
			return new ModelAndView("index");
		}
		}
		else
		{
			return new ModelAndView("Login");
		}
}
@RequestMapping(value="retriveTransAvailableQty")
public ModelAndView retriveTransAvailableQty(@RequestParam String productId,String wID,ModelMap model,HttpSession session)
{
	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Inventory"))
		{
			model.addAttribute("availqtyrecordTras",recordTransferredService.retriveAvailqty(productId,wID)); 			
	    	return new ModelAndView("Inventory/retriveTransAvailableQty");
		}
		else{
			model.addAttribute("msg","<script>alert('Access Denied');</script>");
			return new ModelAndView("index");
		}
		}
		else
		{
			return new ModelAndView("Login");
		}
}
@RequestMapping(value="retriveWarehouseAvailableQty")
public ModelAndView retriveWarehouseAvailableQty(@RequestParam String productId,ModelMap model,HttpSession session)
{
	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Inventory"))
		{
			model.addAttribute("availqtyrecordTras",warehouseService.retriveWarehouseAvailqty(productId));
	    	return new ModelAndView("Inventory/retriveWarehouseAvlQuantity");
		}
		else{
			model.addAttribute("msg","<script>alert('Access Denied');</script>");
			return new ModelAndView("index");
		}
		}
		else
		{
			return new ModelAndView("Login");
		}
}
@RequestMapping(value="checkAvlProduct")
public ModelAndView checkProduct(@RequestParam String prodID,String wid,ModelMap model,HttpSession session)
{
	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Inventory"))
		{			
			model.addAttribute("count", recordTransferredService.checkProduct(prodID, wid));
	    	return new ModelAndView("Inventory/getCount");
		}
		else
		{
			model.addAttribute("msg","<script>alert('Access Denied');</script>");
			return new ModelAndView("index");
		}
		}
		else
		{
			return new ModelAndView("Login");
		}
}


}
