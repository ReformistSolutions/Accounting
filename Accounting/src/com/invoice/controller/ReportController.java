package com.invoice.controller;

import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.invoice.accounting.beans.Taxes;
import com.invoice.accounting.service.CreateexpenseService;
import com.invoice.company.beans.CompanyDetails;
import com.invoice.inventory.service.CreateNewProductService;
import com.invoice.inventory.service.IssueForProductionService;
import com.invoice.inventory.service.ReceiveforSalesService;
import com.invoice.inventory.service.RecordTransferredService;
import com.invoice.inventory.service.RecordWastageService;
import com.invoice.inventory.service.WarehouseService;
import com.invoice.login.beans.Login;
import com.invoice.login.service.LoginUserService;
import com.invoice.payroll.beans.BreakupByEmployee;
import com.invoice.payroll.beans.EmployeeBeans;
import com.invoice.payroll.beans.SalaryBeans;
import com.invoice.payroll.service.EmployeeService;
import com.invoice.purchase.beans.ComposeMail;
import com.invoice.reports.beans.PaymentAdvice;
import com.invoice.reports.service.PaymentAdvicePDF;
import com.invoice.reports.service.ReportsService;
import com.invoice.reports.service.ReportsServiceImpl;
import com.invoice.reports.service.paymentAdviceService;
import com.invoice.sales.service.EnquiryService;
import com.itextpdf.text.Document;
import com.itextpdf.text.pdf.PdfWriter;


@Controller
public class ReportController 
{
	String reports="reports";
	String index="index";
	@Autowired
	LoginUserService lus;
	@Autowired
	ReportsService reportsService;
	@Autowired
	paymentAdviceService paymentAdviceService;
	@Autowired
	EnquiryService enquiryService;
	@Autowired
	CreateNewProductService createNewProductService;
	@Autowired
	PaymentAdvicePDF paymentAdvicePDF;
	
	@Autowired
	RecordWastageService recordWastageService;
    
	@Autowired
	CreateexpenseService createexpenseService;
	 
	@Autowired
	IssueForProductionService issueForProductionService;
	 
	@Autowired
	ReceiveforSalesService receiveForSalesService;
	
	@Autowired
	RecordTransferredService recordTransferredService;
	
	@Autowired
	WarehouseService warehouseService;
	@Autowired
	ReportsServiceImpl reportsServiceImpl;
	EnquiryService purchaseEnquiryService;
	
	public EnquiryService getEnquiryService() {
		return enquiryService;
	}
	@Autowired
	public void setEnquiryService(EnquiryService enquiryService) {
		this.enquiryService = enquiryService;
	}
	public ReportsService getReportsService() {
		return reportsService;
	}
	@Autowired
	public void setReportsService(ReportsService reportsService) {
		this.reportsService = reportsService;
	}
	
	
	EmployeeService empservice;	
	public EmployeeService getEmpservice() {
		return empservice;
	}
	@Autowired
	public void setEmpservice(EmployeeService empservice) {
		this.empservice = empservice;
	}
	@RequestMapping("reports")
	public ModelAndView reports(ModelMap model,HttpSession session)
	{		
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{
		if(lus.authontication(l,"Reports"))
		{
			model.addAttribute("reports",reports);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			return new ModelAndView("Reports/reportsIndex");
		}
		else{
			model.addAttribute("index", index);
			model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());	
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			model.addAttribute("msg","<script>alert('Access Denied');</script>");
			return new ModelAndView("index");
		}
		}
		else
		{
			return new ModelAndView("Login");
		}
	}	
	//balanceSheet
	@RequestMapping("balanceSheet")
	public ModelAndView balanceSheet(ModelMap model,HttpSession session)
	{
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
			if(lus.authontication(l,"Reports"))
			{
				model.addAttribute("reports",reports);
				model.addAttribute("userName",l.getUname());	
				model.addAttribute("userId",l.getEmpUserId());
				return new ModelAndView("Reports/balanceSheet");
			}
			else{
				model.addAttribute("index", index);
				model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());	
				model.addAttribute("userName",l.getUname());
				model.addAttribute("userId",l.getEmpUserId());
				model.addAttribute("msg","<script>alert('Access Denied');</script>");
				return new ModelAndView("index");
			}
			}
			else
			{
				return new ModelAndView("Login");
			}
	}
	//profitAndLoss
	@RequestMapping("profitAndLoss")
	public ModelAndView profitAndLoss(ModelMap model,HttpSession session)
	{
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
			if(lus.authontication(l,"Reports"))
			{
				model.addAttribute("reports",reports);
				model.addAttribute("userName",l.getUname());	
				model.addAttribute("userId",l.getEmpUserId());
				return new ModelAndView("Reports/profitAndLoss");
			}
			else{
				model.addAttribute("index", index);
				model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());	
				model.addAttribute("userName",l.getUname());
				model.addAttribute("userId",l.getEmpUserId());
				model.addAttribute("msg","<script>alert('Access Denied');</script>");
				return new ModelAndView("index");
			}
			}
			else
			{
				return new ModelAndView("Login");
			}
	}
	//taxesReports
	@RequestMapping(value="/taxesReports",method=RequestMethod.GET)
	public ModelAndView taxesinfo(Taxes taxes,ModelMap model,HttpSession session){
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
			if(lus.authontication(l,"Reports"))
			{
				model.addAttribute("reports",reports);
				model.addAttribute("userName",l.getUname());
				model.addAttribute("userId",l.getEmpUserId());				
				model.addAttribute("salesTaxList", reportsService.showSalesTotalTax());
				model.addAttribute("salesLinkedTaxList", reportsService.showSalesTotalLinkedTax());	
				model.addAttribute("purchaseTaxList", reportsService.showPurTotalTax());
				model.addAttribute("purchaseLinkedTaxList", reportsService.showPurTotalLinkedTax());		
				return new ModelAndView("Reports/taxesReports","taxes",taxes);
			}
			else{
				model.addAttribute("index", index);
				model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());	
				model.addAttribute("userName",l.getUname());
				model.addAttribute("userId",l.getEmpUserId());
				model.addAttribute("msg","<script>alert('Access Denied');</script>");
				return new ModelAndView("index");
			}
			}
			else
			{
				return new ModelAndView("Login");
			}
	}
//	/trialBalance
	@RequestMapping(value="/trialBalance",method=RequestMethod.GET)
	public ModelAndView trialBalance(Taxes taxes,ModelMap model,HttpSession session){
		
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
			if(lus.authontication(l,"Reports"))
			{
				model.addAttribute("reports",reports);
				model.addAttribute("userName",l.getUname());
				model.addAttribute("userId",l.getEmpUserId());	
				return new ModelAndView("Reports/trialBalance");
			}
			else{
				model.addAttribute("index", index);
				model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());
				model.addAttribute("userName",l.getUname());
				model.addAttribute("userId",l.getEmpUserId());
				model.addAttribute("msg","<script>alert('Access Denied');</script>");
				return new ModelAndView("index");
			}
			}
			else
			{
				return new ModelAndView("Login");
			}
	}
	//salesRegister
	@RequestMapping(value="/salesRegister",method=RequestMethod.GET)
	public ModelAndView salesRegister(Taxes taxes,ModelMap model,HttpSession session){
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
			if(lus.authontication(l,"Reports"))
			{
				model.addAttribute("reports",reports);
				model.addAttribute("userName",l.getUname());
				model.addAttribute("userId",l.getEmpUserId());	
				return new ModelAndView("Reports/salesRegister");
			}
			else{
				model.addAttribute("index", index);
				model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());			
				model.addAttribute("userName",l.getUname());
				model.addAttribute("userId",l.getEmpUserId());
				model.addAttribute("msg","<script>alert('Access Denied');</script>");
				return new ModelAndView("index");
			}
			}
			else
			{
				return new ModelAndView("Login");
			}
	}
	//outstandingReceipts
	@RequestMapping(value="/outstandingReceipts",method=RequestMethod.GET)
	public ModelAndView outstandingReceipts(ModelMap model,HttpSession session){
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
			if(lus.authontication(l,"Reports"))
			{
				model.addAttribute("reports",reports);
				model.addAttribute("userName",l.getUname());
				model.addAttribute("userId",l.getEmpUserId());	
				model.addAttribute("outsReceiptList", reportsService.showOutstandingReceipts());	
				model.addAttribute("outsReceiptTotal", reportsService.getOSReceiptsTotal());
				model.addAttribute("customerList", enquiryService.retriveCustomerList());  	
				return new ModelAndView("Reports/outstandingReceipts");
			}
			else{
				model.addAttribute("index", index);
				model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());
				model.addAttribute("userName",l.getUname());
				model.addAttribute("userId",l.getEmpUserId());
				model.addAttribute("msg","<script>alert('Access Denied');</script>");
				return new ModelAndView("index");
			}
			}
			else
			{
				return new ModelAndView("Login");
			}
	}
	//"retrieveOsReceipts.do?custId="+custId+"frmDate="+frmDate+"toDate="+toDate
	@RequestMapping(value="/retrieveOsReceipts",method=RequestMethod.GET)
	public ModelAndView retrieveOsReceipts(String custId,String frmDate,String toDate,ModelMap model,HttpSession session){
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
			if(lus.authontication(l,"Reports"))
			{
				model.addAttribute("reports",reports);
				model.addAttribute("userName",l.getUname());
				model.addAttribute("userId",l.getEmpUserId());	
				model.addAttribute("outsReceiptList", reportsService.custOutstandingReceipts(custId, frmDate, toDate));	
				model.addAttribute("outsReceiptTotal", reportsService.custOSReceiptsTotal(custId, frmDate, toDate));
			
				//model.addAttribute("customerList", enquiryService.retriveCustomerList());  	
				return new ModelAndView("Reports/custOutstandingReceipts");
			}
			else{
				model.addAttribute("index", index);
				model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());	
				model.addAttribute("userName",l.getUname());
				model.addAttribute("userId",l.getEmpUserId());
				model.addAttribute("msg","<script>alert('Access Denied');</script>");
				return new ModelAndView("index");
			}
			}
			else
			{
				return new ModelAndView("Login");
			}
	}
	//showPaymentAdvice
		@RequestMapping("paymentAdvice")
		public ModelAndView paymentAdvice(ModelMap model,HttpSession session)
		{
			Calendar cal = Calendar.getInstance();
			int month = cal.get(Calendar.MONTH)+1;				
			int year = cal.get(Calendar.YEAR);
			if(month == 0)
			{
				month = 12;
				year--;
			}
			else
			{
				//month--;
			}
			Login l=(Login) session.getAttribute("user");
			if(lus.chkFlag(l)){
				if(lus.authontication(l,"Reports"))
				{
					model.addAttribute("reports",reports);
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
					model.addAttribute("payList",paymentAdviceService.showPaymentAdvice(month,year));
					model.addAttribute("compName",paymentAdviceService.showCompanyName());
					return new ModelAndView("Reports/paymentAdvice");
				}
				else{
					model.addAttribute("index", index);
					model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());		
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
					model.addAttribute("msg","<script>alert('Access Denied');</script>");
					return new ModelAndView("index");
				}
				}
				else
				{
					return new ModelAndView("Login");
				}
		}
		//breakupBy
		@RequestMapping("breakupByemp")
		public ModelAndView breakupBy(ModelMap model,HttpSession session)
		{
			Login l=(Login) session.getAttribute("user");
			if(lus.chkFlag(l)){
				if(lus.authontication(l,"Reports"))
				{
					model.addAttribute("reports",reports);
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());		
					model.addAttribute("payheadName",empservice.showBreakupheadList());
					model.addAttribute("payamtList", empservice.showBreakupamtList());
					return new ModelAndView("Reports/breakupbyEmployee");
				}
				else{
					model.addAttribute("index", index);
					model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());		
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
					model.addAttribute("msg","<script>alert('Access Denied');</script>");
					return new ModelAndView("index");
				}
				}
				else
				{
					return new ModelAndView("Login");
				}
		}
		//retrivePaymentAdvice
		@RequestMapping("retrivePaymentAdvice")
		public ModelAndView retrivePaymentAdvice(@RequestParam String month,String year,PaymentAdvice paymentAdvice,ModelMap model,HttpSession session)
		{
			Login l=(Login) session.getAttribute("user");
			if(lus.chkFlag(l)){
				if(lus.authontication(l,"Reports"))
				{
					model.addAttribute("reports",reports);
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
					model.addAttribute("payList",paymentAdviceService.retrivePaymentAdvice(month,year));
					model.addAttribute("compName",paymentAdviceService.showCompanyName());
					return new ModelAndView("Reports/retrivePaymentAdvice");
				}
				else{
					model.addAttribute("index", index);
					model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());			
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
					model.addAttribute("msg","<script>alert('Access Denied');</script>");
					return new ModelAndView("index");
				}
				}
				else
				{
					return new ModelAndView("Login");
				}
		}
		//retriveBreakupbyEmployee
		@RequestMapping("retriveBreakupbyEmployee")
		public ModelAndView retriveBreakupbyEmployee(@RequestParam String month,String year,PaymentAdvice paymentAdvice,ModelMap model,HttpSession session)
		{
			Login l=(Login) session.getAttribute("user");
			if(lus.chkFlag(l)){
				if(lus.authontication(l,"Reports"))
				{
					model.addAttribute("reports",reports);
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
					return new ModelAndView("Reports/retriveBreakupEmployee");
				}
				else{
					model.addAttribute("index", index);
					model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());		
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
					model.addAttribute("msg","<script>alert('Access Denied');</script>");
					return new ModelAndView("index");
				}
				}
				else
				{
					return new ModelAndView("Login");
				}
		}
		@RequestMapping("outstandingPayments") //@RequestParam String month,String year,
		public ModelAndView outstandingPayments(ModelMap model,HttpSession session)
		{
			Login l=(Login) session.getAttribute("user");
			if(lus.chkFlag(l)){
				if(lus.authontication(l,"Reports"))
				{
					model.addAttribute("reports",reports);
					model.addAttribute("paymentsList",reportsService.outstandingPayments());
					model.addAttribute("venderList", reportsService.retriveVender());
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
					model.addAttribute("compName",paymentAdviceService.showCompanyName());
					return new ModelAndView("Reports/outstandingPayments");
				}
				else{
					model.addAttribute("index", index);
					model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());		
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
					model.addAttribute("msg","<script>alert('Access Denied');</script>");
					return new ModelAndView("index");
				}
				}
				else
				{
					return new ModelAndView("Login");
				}
		}
		//retriveOutstandingPayments
		@RequestMapping("retriveOutstandingPayments")
		public ModelAndView retriveOutstandingPayments(@RequestParam String venderID,String startdate,String enddate,ModelMap model,HttpSession session)
		{
			Login l=(Login) session.getAttribute("user");
			if(lus.chkFlag(l)){
				if(lus.authontication(l,"Reports"))
				{
					model.addAttribute("reports",reports);
					model.addAttribute("paymentsList", reportsService.retrivePayments(venderID, startdate, enddate));
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
					model.addAttribute("compName",paymentAdviceService.showCompanyName());
					return new ModelAndView("Reports/retriveOutstandingPayments");
				}
			else{
				model.addAttribute("index", index);
				model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());			
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
					model.addAttribute("msg","<script>alert('Access Denied');</script>");
					return new ModelAndView("index");
				}
			}
			else
			{
				return new ModelAndView("Login");
			}
		}
		//outstandingPaymentsPDF
		@RequestMapping("outstandingPaymentsPDF")
		public ModelAndView outstandingPaymentsPDF(ModelMap model,HttpSession session)
		{
			Login l=(Login) session.getAttribute("user");
			if(lus.chkFlag(l)){
				if(lus.authontication(l,"Reports"))
				{
					model.addAttribute("reports",reports);
					//model.addAttribute("paymentsList", reportsService.retrivePayments(venderID, startdate, enddate));
					model.addAttribute("compName",paymentAdviceService.showCompanyName());
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
					return new ModelAndView("outstandingPaymentsPDF");
				}
				else
				{
					model.addAttribute("index", index);
					model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());	
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
					model.addAttribute("msg","<script>alert('Access Denied');</script>");
					return new ModelAndView("index");
				}
				}
				else
				{
					return new ModelAndView("Login");
				}
		}
		@RequestMapping("Productwisestock")
		public ModelAndView productstock(ModelMap model,HttpSession session)
		{
			Login l=(Login) session.getAttribute("user");
			if(lus.chkFlag(l)){
				if(lus.authontication(l,"Reports"))
				{
					model.addAttribute("reports",reports);
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());	
					model.addAttribute("showproductlists",createNewProductService.show());
					model.addAttribute("prodID",reportsService.retriveProduct());
					return new ModelAndView("Reports/Productwisestock");
				}
				else{
					model.addAttribute("index", index);
					model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());		
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
					model.addAttribute("msg","<script>alert('Access Denied');</script>");
					return new ModelAndView("index");
				}
				}
				else
				{
					return new ModelAndView("Login");
				}
		}
		
		
		
		@RequestMapping("Stockwastage")
		public ModelAndView stockwastage(ModelMap model,HttpSession session)
		{
			Login l=(Login) session.getAttribute("user");
			if(lus.chkFlag(l)){
				if(lus.authontication(l,"Reports"))
				{
					model.addAttribute("reports",reports);
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());	
					model.addAttribute("stockwaste",reportsService.showwaste());		
					return new ModelAndView("Reports/Stoctwastage");
				}
				else{
					model.addAttribute("index", index);
					model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());		
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
					model.addAttribute("msg","<script>alert('Access Denied');</script>");
					return new ModelAndView("index");
				}
				}
				else
				{
					return new ModelAndView("Login");
				}
		}
		
		@RequestMapping("retrivestockwastage")
		public ModelAndView retrivestockwastage(@RequestParam String fromdate,String todate, ModelMap model,HttpSession session)
		{
			Login l=(Login) session.getAttribute("user");
			if(lus.chkFlag(l)){
				if(lus.authontication(l,"Reports"))
				{
					model.addAttribute("reports",reports);
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());	
					model.addAttribute("stockwastelist",reportsService.retrivestockwaste(fromdate, todate));
					return new ModelAndView("Reports/retrivestockwastage");
				}
				else{
					model.addAttribute("index", index);
					model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());	
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
					model.addAttribute("msg","<script>alert('Access Denied');</script>");
					return new ModelAndView("index");
				}
				}
				else
				{
					return new ModelAndView("Login");
				}
		}
		
		@RequestMapping("Warehosestock")
		public ModelAndView warehousestock(ModelMap model,HttpSession session)
		{
			Login l=(Login) session.getAttribute("user");
			if(lus.chkFlag(l)){
				if(lus.authontication(l,"Reports"))
				{
					model.addAttribute("reports",reports);
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());	
					model.addAttribute("showproductlists",createNewProductService.show());
					model.addAttribute("wareID",issueForProductionService.retriveWareHouse());
			    	model.addAttribute("wareID",receiveForSalesService.retriveWareHouse());
			    	model.addAttribute("wareID",recordWastageService.retriveWareHouse());
			    	model.addAttribute("wareID",recordTransferredService.retriveWareHouse());
					return new ModelAndView("Reports/Warehousewisestock");
				}
				else
				{
					model.addAttribute("index", index);
					model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());	
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
					model.addAttribute("msg","<script>alert('Access Denied');</script>");
					return new ModelAndView("index");
				}
				}
				else
				{
					return new ModelAndView("Login");
				}
		}
		
		@RequestMapping("expensereports")
		public ModelAndView expense(ModelMap model,HttpSession session)
		{
			Login l=(Login) session.getAttribute("user");
			if(lus.chkFlag(l)){
				if(lus.authontication(l,"Reports"))
				{
					model.addAttribute("reports",reports);
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());	
					model.addAttribute("expreports", reportsService.showexp());
					return new ModelAndView("Reports/Expensereports");
				}
				else
				{
					model.addAttribute("index", index);
					model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());		
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
					model.addAttribute("msg","<script>alert('Access Denied');</script>");
					return new ModelAndView("index");
				}
				}
				else
				{
					return new ModelAndView("Login");
				}
		}
		
		@RequestMapping("retriveWarehouseDetails")
		public ModelAndView retriveWarehouseDetails(@RequestParam String warehouseId,ModelMap model,HttpSession session)
		{
			Login l=(Login) session.getAttribute("user");
			if(lus.chkFlag(l)){
				if(lus.authontication(l,"Reports"))
				{
					model.addAttribute("reports",reports);
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());	
					model.addAttribute("showproductlists", createNewProductService.showwarehouseDetails(warehouseId));
					return new ModelAndView("Reports/retriveWarehouseDetails");
				}
				else
				{
					model.addAttribute("index", index);
					model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());	
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
					model.addAttribute("msg","<script>alert('Access Denied');</script>");
					return new ModelAndView("index");
				}
				}
				else
				{
					return new ModelAndView("Login");
				}
		}
		
		@RequestMapping("banktransaction")
		public ModelAndView bankdetails(ModelMap model,HttpSession session)
		{
			Login l=(Login) session.getAttribute("user");
			if(lus.chkFlag(l)){
				if(lus.authontication(l,"Reports"))
				{
					model.addAttribute("reports",reports);
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());	
					model.addAttribute("banklist", reportsService.showbankdetails());
					return new ModelAndView("Reports/Bankrecords");
				}
				else
				{
					model.addAttribute("index", index);
					model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());			
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
					model.addAttribute("msg","<script>alert('Access Denied');</script>");
					return new ModelAndView("index");
				}
				}
				else
				{
					return new ModelAndView("Login");
				}
		}
		
		@RequestMapping("retriveBankdetails")
		public ModelAndView retriveBankdetails(@RequestParam String transactionType,ModelMap model,HttpSession session)
		{
			Login l=(Login) session.getAttribute("user");
			if(lus.chkFlag(l)){
				if(lus.authontication(l,"Reports"))
				{
					model.addAttribute("reports",reports);
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());	
					model.addAttribute("banktypeList",reportsService.showtype(transactionType));
					return new ModelAndView("Reports/retriveBankdetails");
				}
				else
				{
					model.addAttribute("index", index);
					model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());			
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
					model.addAttribute("msg","<script>alert('Access Denied');</script>");
					return new ModelAndView("index");
				}
				}
				else
				{
					return new ModelAndView("Login");
				}
		}
		
		@RequestMapping("Stocktransfer")
		public ModelAndView Stocktransfer(ModelMap model,HttpSession session)
		{
			Login l=(Login) session.getAttribute("user");
			if(lus.chkFlag(l)){
				if(lus.authontication(l,"Reports"))
				{
					model.addAttribute("reports",reports);
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());	
					model.addAttribute("stocktransfer", reportsService.showtransferstk());
					return new ModelAndView("Reports/StockTransferReports");
				}
				else
				{
					model.addAttribute("index", index);
					model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());		
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
					model.addAttribute("msg","<script>alert('Access Denied');</script>");
					return new ModelAndView("index");
				}
				}
				else
				{
					return new ModelAndView("Login");
				}
		}
		
		@RequestMapping("retriveTransferstock")
		public ModelAndView retriveTransferstock(@RequestParam String fromdate,String todate,ModelMap model,HttpSession session)
		{
			Login l=(Login) session.getAttribute("user");
			if(lus.chkFlag(l)){
				if(lus.authontication(l,"Reports"))
				{
					model.addAttribute("reports",reports);
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());	
					model.addAttribute("stocktransferlist",reportsService.retrivestocktransfer(fromdate, todate));
					return new ModelAndView("Reports/retriveTransferstock");
				}
				else
				{
					model.addAttribute("index", index);
					model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());		
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
					model.addAttribute("msg","<script>alert('Access Denied');</script>");
					return new ModelAndView("index");
				}
				}
				else
				{
					return new ModelAndView("Login");
				}
		}
		@RequestMapping("inventoyvaluation")
		public ModelAndView inventoyvaluation(ModelMap model,HttpSession session)
		{
			Login l=(Login) session.getAttribute("user");
			if(lus.chkFlag(l)){
				if(lus.authontication(l,"Reports"))
				{
					model.addAttribute("reports",reports);
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
			model.addAttribute("productList",reportsService.show());
			model.addAttribute("wareID",reportsService.retriveWareHouse());
			return new ModelAndView("Reports/InventoryValuation");
				}
				else
				{
					model.addAttribute("index", index);
					model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());		
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
					model.addAttribute("msg","<script>alert('Access Denied');</script>");
					return new ModelAndView("index");
				}
				}
				else
				{
					return new ModelAndView("Login");
				}
		}
		
		@RequestMapping("retriveinventoryvaluation")
		public ModelAndView retriveinventoryvaluation(@RequestParam String warehouseId,ModelMap model,HttpSession session)
		{
			Login l=(Login) session.getAttribute("user");
			if(lus.chkFlag(l)){
				if(lus.authontication(l,"Reports"))
				{
					model.addAttribute("reports",reports);
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
			model.addAttribute("productList", reportsService.showvaluation(warehouseId));
			return new ModelAndView("Reports/retriveinventoryvaluation");
				}
				else
				{
					model.addAttribute("index", index);
					model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());		
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
					model.addAttribute("msg","<script>alert('Access Denied');</script>");
					return new ModelAndView("index");
				}
				}
				else
				{
					return new ModelAndView("Login");
				}
		}
		
		@RequestMapping("customerpending")
		public ModelAndView customerpending(ModelMap model,HttpSession session)
		{
			Login l=(Login) session.getAttribute("user");
			if(lus.chkFlag(l)){
				if(lus.authontication(l,"Reports"))
				{
					model.addAttribute("reports",reports);
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
			model.addAttribute("customers", enquiryService.retriveCustomerList()); 
			model.addAttribute("customerList", reportsService.showsalessorder());
			return new ModelAndView("Reports/Customerpendingorder");
				}
				else
				{
					model.addAttribute("index", index);
					model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());		
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
					model.addAttribute("msg","<script>alert('Access Denied');</script>");
					return new ModelAndView("index");
				}
				}
				else
				{
					return new ModelAndView("Login");
				}
		}
		
		@RequestMapping("retrivecustpending")
		public ModelAndView retrivecustpending (@RequestParam String custID,String frmdate,String todate,ModelMap model,HttpSession session)
		{
			
			Login l=(Login) session.getAttribute("user");
			if(lus.chkFlag(l)){
				if(lus.authontication(l,"Reports"))
				{
					model.addAttribute("reports",reports);
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
			model.addAttribute("customerList", reportsService.showcustomer(custID, frmdate, todate));
			return new ModelAndView("Reports/Retrivecustpending");
				}
				else
				{
					model.addAttribute("index", index);
					model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());		
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
					model.addAttribute("msg","<script>alert('Access Denied');</script>");
					return new ModelAndView("index");
				}
				}
				else
				{
					return new ModelAndView("Login");
				}
		}
		
		@RequestMapping("productpending")
		public ModelAndView productpending(ModelMap model,HttpSession session)
		{
			Login l=(Login) session.getAttribute("user");
			if(lus.chkFlag(l)){
				if(lus.authontication(l,"Reports"))
				{
					model.addAttribute("reports",reports);
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
			model.addAttribute("productpendingList", reportsService.showsalessorder());
			model.addAttribute("prodID",reportsService.retriveProduct());
			return new ModelAndView("Reports/Productpendingorder");
				}
				else
				{
					model.addAttribute("index", index);
					model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());		
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
					model.addAttribute("msg","<script>alert('Access Denied');</script>");
					return new ModelAndView("index");
				}
				}
				else
				{
					return new ModelAndView("Login");
				}
		}
		
		@RequestMapping("retrivependingproduct")
		public ModelAndView retrivependingproduct(@RequestParam String productId,String fromdate,String todate,ModelMap model,HttpSession session)
		{
			Login l=(Login) session.getAttribute("user");
			if(lus.chkFlag(l)){
				if(lus.authontication(l,"Reports"))
				{
					model.addAttribute("reports",reports);
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
			model.addAttribute("productpendingList",reportsService.showproducts(productId, fromdate, todate));
			return new ModelAndView("Reports/Retriveprductpending");
				}
				else
				{
					model.addAttribute("index", index);
					model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());		
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
					model.addAttribute("msg","<script>alert('Access Denied');</script>");
					return new ModelAndView("index");
				}
				}
				else
				{
					return new ModelAndView("Login");
				}
		}
		@RequestMapping("retriveProductwise")
		public ModelAndView retriveProductwise(@RequestParam String productType,ModelMap model,HttpSession session)
		{
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
			if(lus.authontication(l,"Reports"))
			{
				model.addAttribute("reports",reports);
				model.addAttribute("userName",l.getUname());
				model.addAttribute("userId",l.getEmpUserId());	
				model.addAttribute("producttypelists",reportsService.showproducts(productType));
				return new ModelAndView("Reports/retriveProductwise");
			}
			else
			{
				model.addAttribute("index", index);
				model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());			
				model.addAttribute("userName",l.getUname());
				model.addAttribute("userId",l.getEmpUserId());
				model.addAttribute("msg","<script>alert('Access Denied');</script>");
				return new ModelAndView("index");
			}
			}
			else
			{
				return new ModelAndView("Login");
			}
		}
		
		@RequestMapping(value="/paymentAdvicePDF")
	   	public ModelAndView paymentAdvicePDF(PaymentAdvice paymentAdvice,CompanyDetails companyDetailss,ModelMap model,HttpSession session)
	   	{
	   		Login l=(Login) session.getAttribute("user");
			if(lus.chkFlag(l))
			{if(lus.authontication(l,"Reports"))
			{
				Calendar cal = Calendar.getInstance();
				int month = cal.get(Calendar.MONTH)+1;
				int year = cal.get(Calendar.YEAR);
				if(month == 0)
				{
					month = 12;
					year--;
				}
				else
				{
					//month--;
				}
				model.addAttribute("reports",reports);
				model.addAttribute("userName",l.getUname());
				model.addAttribute("userId",l.getEmpUserId());
				//model.addAttribute("payDetails",paymentAdviceService.showPaymentAdvice(month,year).get(0));
				paymentAdvice = paymentAdviceService.retriveAdviceDetails(month, year).get(0);
				String bankName="";
				float total = 0;
				List<PaymentAdvice> paylist = paymentAdviceService.showPaymentAdvice(month, year);
				for (PaymentAdvice paymentAdvice2 : paylist)
				{
					bankName = paymentAdvice2.getBank_name(); 
					total = paymentAdvice2.getTotal();
				}
				model.addAttribute("bankName", bankName);
				model.addAttribute("total", total);
				model.addAttribute("compName",paymentAdviceService.showCompanyName());
				model.addAttribute("compInfo", paymentAdviceService.getInfo(companyDetailss).get(0));
				return new ModelAndView("paymentAdvicePDF","paymentAdvice",paymentAdvice);
			}
			else{
							
				model.addAttribute("userName",l.getUname());
				model.addAttribute("userId",l.getEmpUserId());
				model.addAttribute("msg","<script>alert('Access Denied');</script>");
				return new ModelAndView("index");
			}
			}
			else
			{
				return new ModelAndView("Login");
			}
	   	}
		
		@RequestMapping(value="/breakupbyPDF")
	   	public ModelAndView breakupbyPDF(EmployeeBeans employeeBeans,SalaryBeans salaryBeans,BreakupByEmployee breakupByEmployee,CompanyDetails companyDetailss,ModelMap model,HttpSession session)
	   	{
	   		Login l=(Login) session.getAttribute("user");
			if(lus.chkFlag(l))
			{if(lus.authontication(l,"Reports"))
			{
				model.addAttribute("reports",reports);
				model.addAttribute("userName",l.getUname());
				model.addAttribute("userId",l.getEmpUserId());
				model.addAttribute("payhedList",empservice.showBreakupheadList());
				model.addAttribute("empList",empservice.empList());
				model.addAttribute("payamtList", empservice.showBreakupamtList());
				
				model.addAttribute("payhedListW",empservice.showBreakupheadListW());
				model.addAttribute("empListW",empservice.empListW());
				model.addAttribute("payamtListW", empservice.showBreakupamtListW());
				
				model.addAttribute("compInfo", paymentAdviceService.getInfo(companyDetailss).get(0));
				return new ModelAndView("breakupbyPDF","breakupByEmployee",breakupByEmployee);
			}
			else{
							
				model.addAttribute("userName",l.getUname());
				model.addAttribute("userId",l.getEmpUserId());
				model.addAttribute("msg","<script>alert('Access Denied');</script>");
				return new ModelAndView("index");
			}
			}
			else
			{
				return new ModelAndView("Login");
			}
	   	}
		//paymentAdviceMail
		@RequestMapping(value="/composeMailPA")
	   	public ModelAndView composeMailPA(PaymentAdvice paymentAdvice,ComposeMail composeMail,CompanyDetails companyDetailss,ModelMap model,HttpSession session,Document doc,HttpServletRequest request,PdfWriter writer,HttpServletResponse response) throws Exception
	   	{
			String attachment = "Payment Advice.pdf";
	   		Login l=(Login) session.getAttribute("user");
			if(lus.chkFlag(l))
			{if(lus.authontication(l,"Reports"))
			{
				Calendar cal = Calendar.getInstance();
				int month = cal.get(Calendar.MONTH)+1;
				int year = cal.get(Calendar.YEAR);
				if(month == 0)
				{
					month = 12;
					year--;
				}
				else
				{
					//month--;
				}
				model.addAttribute("reports",reports);
				model.addAttribute("userName",l.getUname()); 
				model.addAttribute("userId",l.getEmpUserId());
				model.addAttribute("paymentAdvicePDF", paymentAdvice);
				model.addAttribute("paymentAdvice", paymentAdvice);
				model.addAttribute("attachment", attachment);
				model.addAttribute("compInfo", paymentAdviceService.getInfo(companyDetailss).get(0));
				paymentAdvice = paymentAdviceService.retriveAdviceDetails(month, year).get(0);
				model.addAttribute("paymentAdvice", paymentAdviceService.retriveAdviceDetails(month, year).get(0));
				String bankName="";
				float total = 0;
				List<PaymentAdvice> paylist = paymentAdviceService.showPaymentAdvice(month, year);
				for (PaymentAdvice paymentAdvice2 : paylist)
				{
					bankName = paymentAdvice2.getBank_name();
					total = paymentAdvice2.getTotal();
				}
				model.addAttribute("bankName", bankName);
				model.addAttribute("total", total);
				model.addAttribute("compName",paymentAdviceService.showCompanyName());
				paymentAdvicePDF.buildPdfDocument(model, doc, writer, request, response);
				return new ModelAndView("Reports/composeMail","composeMail",composeMail);
			}
			else{
							
				model.addAttribute("userName",l.getUname());
				model.addAttribute("userId",l.getEmpUserId());
				model.addAttribute("msg","<script>alert('Access Denied');</script>");
				return new ModelAndView("index");
			}
			}
			else
			{
				return new ModelAndView("Login");
			}
	   	}
		@RequestMapping("/paymentAdviceMail")
	   	public ModelAndView paymentAdviceMail(ComposeMail composeMail,ModelMap model,HttpSession session)
	   	{   
	   		Login l=(Login) session.getAttribute("user");
			if(lus.chkFlag(l))
			{if(lus.authontication(l,"Reports"))
			{
				model.addAttribute("reports",reports);
				model.addAttribute("userName",l.getUname()); 
				model.addAttribute("userId",l.getEmpUserId()); 
		    	model.addAttribute("message",reportsService.sendMail(composeMail));
		    	return new ModelAndView("Reports/composeMail","composeMail",composeMail);
			}
			else{
				model.addAttribute("reports",reports); 
				model.addAttribute("userName",l.getUname()); 
				model.addAttribute("userId",l.getEmpUserId()); 
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
