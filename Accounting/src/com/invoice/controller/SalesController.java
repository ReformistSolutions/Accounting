package com.invoice.controller;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.invoice.company.beans.CompanyDetails;
import com.invoice.login.beans.Login;
import com.invoice.login.service.LoginUserService;
import com.invoice.purchase.beans.PurchaseQuotation;
import com.invoice.reports.service.ReportsServiceImpl;
import com.invoice.sales.beans.ComposeMail;
import com.invoice.sales.beans.DeliveryChallan;
import com.invoice.sales.beans.DeliveryChallanDetails;
import com.invoice.sales.beans.Details;
import com.invoice.sales.beans.Enquiry;
import com.invoice.sales.beans.EnquiryDetails;
import com.invoice.sales.beans.Estimate;
import com.invoice.sales.beans.Invoice;
import com.invoice.sales.beans.Order;
import com.invoice.sales.beans.Payment;
import com.invoice.sales.beans.Receipts;
import com.invoice.sales.beans.TaxDetailsList;
import com.invoice.sales.service.DeliveryChallanPDF;
import com.invoice.sales.service.DeliveryChallanService;
import com.invoice.sales.service.EnquiryPdf;
import com.invoice.sales.service.EnquiryService;
import com.invoice.sales.service.EstimatePdf;
import com.invoice.sales.service.EstimateService;
import com.invoice.sales.service.InvoiceService;
import com.invoice.sales.service.OrderService;
import com.invoice.sales.service.PaymentService;
import com.invoice.sales.service.ReceiptService;
import com.invoice.sales.service.SalesInvoicePdf;
import com.invoice.sales.service.SalesOrderPdf;
import com.invoice.sales.service.SalesReceiptsPDF;
import com.itextpdf.text.Document;
import com.itextpdf.text.pdf.PdfWriter;


@Controller
//@SessionAttributes("saleUser")
public class  SalesController{
	
	String sales = "sales";
	String index="index";
	String enquiry1 = "enquiry";
	String estimate1 = "estimate";
	String salesorder1 = "salesorder";
	String invoice1 = "invoice";
	String receipts1 = "receipts";
	String deliverychallan1 = "deliverychallan";
	int i=0,message=0;
	HttpServletRequest request;
	EnquiryService enquiryService;
	EstimateService estimateService;
	OrderService orderService;
	InvoiceService invoiceService;
	PaymentService paymentService;
	DeliveryChallanService deliveryChallanService;
	ReceiptService receiptService;	
	@Autowired
	EnquiryPdf enquiryPdf;
	@Autowired
	EstimatePdf estimatePdf;
	@Autowired
	DeliveryChallanPDF deliveryChallanPDF;
	@Autowired
	SalesInvoicePdf salesInvoicePdf;
	@Autowired
	SalesOrderPdf salesOrderPdf;
	@Autowired
	SalesReceiptsPDF salesReceiptsPDF;
	@Autowired
	ReportsServiceImpl reportsServiceImpl;
	
	@Autowired
	LoginUserService lus;
	public ReceiptService getReceiptService() {
		return receiptService;
	}
	@Autowired
	public void setReceiptService(ReceiptService receiptService) {
		this.receiptService = receiptService;
	}
	public EnquiryService getEnquiryService() {
		return enquiryService;
	}
	@Autowired
	public void setEnquiryService(EnquiryService enquiryService) {
		this.enquiryService = enquiryService;
	}
	public EstimateService getEstimateService() {
		return estimateService;
	}
	@Autowired
	public void setEstimateService(EstimateService estimateService) {
		this.estimateService = estimateService;
	}	
	public OrderService getOrderService() {
		return orderService;
	}
	@Autowired
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	
	public InvoiceService getInvoiceService() {
		return invoiceService;
	}
	@Autowired
	public void setInvoiceService(InvoiceService invoiceService) {
		this.invoiceService = invoiceService;
	}	
	public PaymentService getPaymentService() {
		return paymentService;
	}
	@Autowired
	public void setPaymentService(PaymentService paymentService) {
		this.paymentService = paymentService;
	}	
	public DeliveryChallanService getDeliveryChallanService() {
		return deliveryChallanService;
	}
	@Autowired
	public void setDeliveryChallanService(
			DeliveryChallanService deliveryChallanService) {
		this.deliveryChallanService = deliveryChallanService;
	}
	//For Displaying Views
	@RequestMapping("/enquiry")
	public ModelAndView showSales(Enquiry enquiry,ModelMap model,HttpSession session)
	{		
		//String sales="";
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("enquiry",enquiry1);
			model.addAttribute("userName",l.getUname());	
			model.addAttribute("userId",l.getEmpUserId());
			model.addAttribute("salesEnquiryList",enquiryService.show());
			return new ModelAndView("Sales/showEnquiry","salesEnquiry",enquiry);
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
	//enquiry
    @RequestMapping("/estimate")
   	public ModelAndView showEstimates(Estimate salesEstimate,ModelMap model,HttpSession session)
   	{    
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("estimate", estimate1);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
	    	model.addAttribute("estimateList",estimateService.show());
	   		return new ModelAndView("Sales/showEstimates","salesEstimate",salesEstimate);
		}
		else
		{
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
    @RequestMapping("/salesOrder")
   	public ModelAndView showOrders(Order salesOrder,ModelMap model,HttpSession session)
   	{
    		Login l=(Login) session.getAttribute("user");
			if(lus.chkFlag(l)){
			if(lus.authontication(l,"Sales"))
			{
				model.addAttribute("sales",sales);
				model.addAttribute("salesorder", salesorder1);
				model.addAttribute("userName",l.getUname());
				model.addAttribute("userId",l.getEmpUserId());
		    	model.addAttribute("orderList",orderService.show());
		   		return new ModelAndView("Sales/showSalesOrder","salesOrder",salesOrder);
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
	//deliveryChallan
    @RequestMapping("/deliveryChallan")
   	public ModelAndView showChallans(DeliveryChallan deliveryChallan,ModelMap model,HttpSession session)
   	{
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("deliverychallan", deliverychallan1);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
	    	model.addAttribute("challanList",deliveryChallanService.show());
	   		return new ModelAndView("Sales/showDeliveyChallan","deliveryChallan",deliveryChallan);
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
    
    @RequestMapping("/invoice")
   	public ModelAndView showInvoices(Invoice salesinvoice,HttpServletRequest request,ModelMap model,HttpSession session)
   	{    
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("invoice", invoice1);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
	    	model.addAttribute("invoiceList",invoiceService.show());    
	   		return new ModelAndView("Sales/showInvoice","salesInvoice",salesinvoice);
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
    
    @RequestMapping("/payment")
   	public ModelAndView showPayments(Payment payment,ModelMap model,HttpSession session)
   	{
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("receipts",receipts1);
		model.addAttribute("userName",l.getUname());
		model.addAttribute("userId",l.getEmpUserId());
    	model.addAttribute("paymentList",paymentService.show());
   		return new ModelAndView("Sales/showPayment","payments",payment);
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
     //Receipts
    @RequestMapping("/receipts")
	public ModelAndView showReceipts(Receipts receipts,ModelMap model,HttpSession session)
   	{
    	//model.addAttribute("paymentList",paymentService.show());
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("receipts", receipts1);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
	    	model.addAttribute("receiptList", receiptService.show());
	   		return new ModelAndView("Sales/showReceipts","salesReceipts",receipts);
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
    //For Displaying Forms
    //New Enquiry
    @RequestMapping("/newEnquiry")
   	public ModelAndView enquiryHandler(Enquiry enquiry,ModelMap model,HttpSession session)
   	{   
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("enquiry", enquiry1);
		model.addAttribute("userName",l.getUname());		
		model.addAttribute("userId",l.getEmpUserId());
    	enquiry=enquiryService.generateId();	
    	model.addAttribute("productList", enquiryService.retriveProductList());
    	model.addAttribute("customerList", enquiryService.retriveCustomerList());  	
    	return new ModelAndView("Sales/salesEnquiry","salesEnquiry",enquiry);
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
    //Add Enquiry
    @RequestMapping("/addEnquiry")
   	public ModelAndView addEnquiry(Enquiry enquiry,HttpServletRequest request,ModelMap model,HttpSession session)
   	{	 
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("enquiry", enquiry1);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			enquiry.setCreatedBy(l.getEmpUserId());
			i=enquiryService.save(enquiry);
			if(i>=1)
			{
				message=1;
				model.addAttribute("message", message);
				model.addAttribute("msg", enquiryService.ShowAdd());
			}
			else
			{
				message=0;
				model.addAttribute("message", message);
				model.addAttribute("msg", enquiryService.ShowNotAdd());
			}
    		//model.addAttribute("message",enquiryService.save(enquiry)); 
    		request.getSession().setAttribute("salesEnquiry",enquiry);
    		model.addAttribute("salesEnquiryList",enquiryService.show());
			return new ModelAndView("Sales/showEnquiry","salesEnquiry",enquiry);
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
    //Edit Enquiry
    @RequestMapping("/editEnquiry")
   	public ModelAndView editEnquiryHandler(@RequestParam String enquiryID,Enquiry enquiry,ModelMap model,HttpSession session)
   	{   
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("enquiry", enquiry1);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
    	    enquiry=enquiryService.editEnquiry(enquiryID).get(0);    
    	    model.addAttribute("productList", enquiryService.retriveProductList());
    	    model.addAttribute("customerList", enquiryService.retriveCustomerList());
    		return new ModelAndView("Sales/editEnquiry","salesEnquiry",enquiry);
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
    //Update Enquiry  
   	@RequestMapping("/updateEnquiry")
    public ModelAndView updateEnquiry(@ModelAttribute Enquiry salesEnquiry,Model model,HttpSession session)
   	{
   		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("enquiry", enquiry1);
			salesEnquiry.setUpdatedBy(l.getEmpUserId());			
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
		    //model.addAttribute("updatemsg",enquiryService.updateEnquiry(salesEnquiry));
			i=enquiryService.updateEnquiry(salesEnquiry);
		    if(i>=1)
			{
				message=1;
				model.addAttribute("updatemsg", message);
				model.addAttribute("msg", enquiryService.ShowUpdate());
			}
			else
			{
				message=0;
				model.addAttribute("updatemsg", message);
				model.addAttribute("msg", enquiryService.ShowNotUpdate());
			}
		   // salesEnquiry=enquiryService.editEnquiry(salesEnquiry.getTxtEnqId()).get(0); 
		    model.addAttribute("salesEnquiryList",enquiryService.show());
			return new ModelAndView("Sales/showEnquiry","salesEnquiry",salesEnquiry);
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
   	//showEnquiryDetails
   	@RequestMapping("/showEnquiryDetails")
   	public ModelAndView showEnquiryDetails(@RequestParam String enquiryID,HttpServletRequest request,Enquiry enquiry,ModelMap model,HttpSession session)
   	{
   		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("enquiry", enquiry1);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
	   		enquiry=enquiryService.editEnquiry(enquiryID).get(0);    		
	   		return new ModelAndView("Sales/showEnquiryDetails","salesEnquiry",enquiry);
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
    //View Enquiry
   	@RequestMapping("/viewEnquiry")
   	public ModelAndView viewEnquiry(@RequestParam String enquiryID,HttpServletRequest request,Enquiry enquiry,ModelMap model,HttpSession session)
   	{
   		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("enquiry", enquiry1);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
	   		enquiry=enquiryService.editEnquiry(enquiryID).get(0);  
	   		request.getSession().setAttribute("salesEnquiry",enquiry);
	   		return new ModelAndView("Sales/viewEnquiry","salesEnquiry",enquiry);
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
   	//deleteEnquiry
	@RequestMapping("/deleteEnquiry")
   	public ModelAndView deleteEnquiry(@RequestParam String enquiryID,HttpServletRequest request,Enquiry enquiry,ModelMap model,HttpSession session)
   	{
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("enquiry", enquiry1);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
	   		//model.addAttribute("deletemsg", enquiryService.deleteEnquiry(enquiryID)); 
			i=enquiryService.deleteEnquiry(enquiryID);
			 if(i>=1)
				{
					message=1;
					model.addAttribute("deletemsg", message);
					model.addAttribute("msg", enquiryService.ShowDelete());
				}
				else
				{
					message=0;
					model.addAttribute("deletemsg", message);
					model.addAttribute("msg", enquiryService.ShowNotDelete());
				}
	   		model.addAttribute("salesEnquiryList",enquiryService.show());
	   		request.getSession().setAttribute("salesEnquiry",enquiry);
	   		return new ModelAndView("Sales/showEnquiry","salesEnquiry",enquiry);
		}
		else{
			model.addAttribute("sales",sales);
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
    //New Estimate
    @RequestMapping("/newEstimate")
   	public ModelAndView newEstimate(Estimate salesEstimate,ModelMap model,HttpSession session)
   	{
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("estimate", estimate1);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
	    	salesEstimate=estimateService.generateEstId();
	    	model.addAttribute("vatName", estimateService.retriveVat());
	    	model.addAttribute("service", estimateService.retriveService());
	    	model.addAttribute("taxList1", estimateService.retriveTaxList());
	    	model.addAttribute("estimateList",estimateService.retriveProductList());
	    	model.addAttribute("customerList", estimateService.retriveCustomerList());
	    	model.addAttribute("enqList", estimateService.retriveEnqList());
	   		return new ModelAndView("Sales/salesEstimate","salesEstimate",salesEstimate);
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
    //Add Estimate
    @RequestMapping("/addEstimate")
   	public ModelAndView addEstimate(Estimate salesEstimate,Estimate taxList,Estimate linkedTaxList,HttpServletRequest request,ModelMap model,HttpSession session)
   	{
    	//int counter=0;
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("estimate", estimate1);
			salesEstimate.setCreatedBy(l.getEmpUserId());
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
	    	//model.addAttribute("message",estimateService.save(salesEstimate));
	    	i=estimateService.save(salesEstimate);
	    	if(i>=1)
			{
				message=1;
				model.addAttribute("message", message);
				model.addAttribute("msg", enquiryService.ShowAdd());
			}
			else
			{
				message=0;
				model.addAttribute("message", message);
				model.addAttribute("msg", enquiryService.ShowNotAdd());
			}
	    	/*salesEstimate=estimateService.editEstimate(salesEstimate.getTxtEstID()).get(0);
	    	taxList=estimateService.editEstimateTaxDetails(salesEstimate.getTxtEstID()).get(0);
	    	salesEstimate.setTaxList(taxList.getTaxList());
	    	for (TaxDetailsList taxDetails : (taxList.getTaxList())) {
				counter=taxDetails.getCounter();
				if(counter != 0)
				{
					linkedTaxList=estimateService.editEstimateLinkedTaxDetails(salesEstimate.getTxtEstID()).get(0);				    
				    salesEstimate.setLinkedTaxList(linkedTaxList.getLinkedTaxList());
				}
			}		    
	    	request.getSession().setAttribute("salesEstimate",salesEstimate);*/
	    	model.addAttribute("estimateList",estimateService.show());
	   		return new ModelAndView("Sales/showEstimates","salesEstimate",salesEstimate);
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
    //editEstimate
  
@RequestMapping("/editEstimate")
   public ModelAndView editEstimateHandler(@RequestParam String estimateID,Estimate taxList,Estimate linkedTaxList,Estimate estimate,ModelMap model,HttpSession session)
   {
	int counter=0;
	String bln="blank";
	Login l=(Login) session.getAttribute("user");
	if(lus.chkFlag(l)){
	if(lus.authontication(l,"Sales"))
	{
			model.addAttribute("sales",sales);
			model.addAttribute("estimate", estimate1);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			model.addAttribute("vatName", estimateService.retriveVat());
	    	model.addAttribute("service", estimateService.retriveService());
	    	model.addAttribute("estimateList",estimateService.retriveProductList());
	    	model.addAttribute("customerList", estimateService.retriveCustomerList());
	    	model.addAttribute("taxList", estimateService.retriveTaxList());
	    	estimate=estimateService.editEstimate(estimateID).get(0);
	    	 if(estimateService.editEstimateTaxDetails(estimateID) != null)
		    	{
		    		taxList=estimateService.editEstimateTaxDetails(estimateID).get(0);
		    		estimate.setTaxList(taxList.getTaxList());
		    	}	    
		    	else
		    	{
		    		model.addAttribute("bln", bln);
		    	}
		    estimate.setTaxList(taxList.getTaxList());
		    for (TaxDetailsList taxDetails : (taxList.getTaxList())) {
				counter=taxDetails.getCounter();
				if(counter != 0)
				{
					linkedTaxList=estimateService.editEstimateLinkedTaxDetails(estimateID).get(0);	 
				    estimate.setLinkedTaxList(linkedTaxList.getLinkedTaxList());
				}
			}	
		    return new ModelAndView("Sales/editEstimate","salesEstimate",estimate);
		    
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
   //viewEstimate
  @RequestMapping("/viewEstimate")
   public ModelAndView viewEstimateHandler(@RequestParam String estimateID,HttpServletRequest request,Estimate taxList,Estimate linkedTaxList,Estimate estimate,ModelMap model,HttpSession session)
   {
	 /* int counter=0;
	  String bln="blank";*/
	  Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("estimate", estimate1);
			model.addAttribute("userName",l.getUname());	
			model.addAttribute("userId",l.getEmpUserId());
		    estimate=estimateService.editEstimate(estimateID).get(0);
		    /*if(estimateService.editEstimateTaxDetails(estimateID) != null)
	    	{
	    		taxList=estimateService.editEstimateTaxDetails(estimateID).get(0);
	    		estimate.setTaxList(taxList.getTaxList());
	    	}	    
	    	else
	    	{
	    		model.addAttribute("bln", bln);
	    	}
		    for (TaxDetailsList taxDetails : (taxList.getTaxList())) {
				counter=taxDetails.getCounter();
				if(counter != 0)
				{
					linkedTaxList=estimateService.editEstimateLinkedTaxDetails(estimateID).get(0);	 
				    estimate.setLinkedTaxList(linkedTaxList.getLinkedTaxList());
				}
			}	*/	    
		    request.getSession().setAttribute("salesEstimate",estimate);
		    return new ModelAndView("Sales/viewEstimate","salesEstimate",estimate);
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
   //deleteEstimate
   @RequestMapping("/deleteEstimate")
   public ModelAndView deleteEstimate(@RequestParam String estimateID,HttpServletRequest request,Estimate estimate,ModelMap model,HttpSession session)
   {	 
	   Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("estimate", estimate1);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
		    model.addAttribute("deletemsg",estimateService.deleteEstimate(estimateID));
		    i=estimateService.deleteEstimate(estimateID);
		    if(i>=1)
			{
				message=1;
				model.addAttribute("deletemsg", message);
				model.addAttribute("msg", enquiryService.ShowDelete());
			}
			else
			{
				message=0;
				model.addAttribute("deletemsg", message);
				model.addAttribute("msg", enquiryService.ShowNotDelete());
			}
		    model.addAttribute("estimateList",estimateService.show());
	  		return new ModelAndView("Sales/showEstimates","salesEstimate",estimate);
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
   //showEstimateDetails.do
   @RequestMapping("/showEstimateDetails")
   public ModelAndView showEstimateDetails(@RequestParam String estimateID,HttpServletRequest request,Estimate estimate,ModelMap model,HttpSession session)
   {
	   Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("estimate", estimate1);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			estimate=estimateService.editEstimate(estimateID).get(0);	   
			return new ModelAndView("Sales/showEstimateDetails","salesEstimate",estimate);
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
   //Update Enquiry  
  	@RequestMapping("/updateEstimate")
   public ModelAndView updateEstimate(@ModelAttribute Estimate salesEstimate,Estimate taxList,Estimate linkedTaxList,Model model,HttpSession session)
  	{
  		//int counter=0;
  		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("estimate", estimate1);
			salesEstimate.setUpdatedBy(l.getEmpUserId());
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			//model.addAttribute("updatemsg",estimateService.updateEstimate(salesEstimate));	 
			i=estimateService.updateEstimate(salesEstimate);
			if(i>=1)
				{
					message=1;
					model.addAttribute("updatemsg", message);
					model.addAttribute("msg", enquiryService.ShowUpdate());
				}
				else
				{
					message=0;
					model.addAttribute("updatemsg", message);
					model.addAttribute("msg", enquiryService.ShowNotUpdate());
				}
			/*salesEstimate=estimateService.editEstimate(salesEstimate.getTxtEstID()).get(0);
			taxList=estimateService.editEstimateTaxDetails(salesEstimate.getTxtEstID()).get(0);
			salesEstimate.setTaxList(taxList.getTaxList());
			for (TaxDetailsList taxDetails : (taxList.getTaxList())) {
				counter=taxDetails.getCounter();
				if(counter != 0)
				{
				    linkedTaxList=estimateService.editEstimateLinkedTaxDetails(salesEstimate.getTxtEstID()).get(0);		    
				    salesEstimate.setLinkedTaxList(linkedTaxList.getLinkedTaxList());
				}
			}*/
			model.addAttribute("estimateList",estimateService.show());
	   		return new ModelAndView("Sales/showEstimates","salesEstimate",salesEstimate);
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
    //New Order
    @RequestMapping("/newOrder")
   	public ModelAndView newOrder(Order salesorder,ModelMap model,HttpSession session)
   	{
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("salesorder", salesorder1);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
	    	salesorder=orderService.generateOrdId();
	    	model.addAttribute("vatName", estimateService.retriveVat());
	    	model.addAttribute("service", estimateService.retriveService());
	    	model.addAttribute("taxList",orderService.retriveTaxList());
	    	model.addAttribute("customerList", orderService.retriveCustomerList());
	    	model.addAttribute("orderList",orderService.retriveProductList());
	   		return new ModelAndView("Sales/salesOrder","salesOrder",salesorder);
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
    //Add Order
    @RequestMapping("/addSalesOrder")
   	public ModelAndView addSalesOrder(Order salesOrder,Order taxList,Order linkedTaxList,HttpServletRequest request,ModelMap model,HttpSession session)
   	{
    	//int counter=0;
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("salesorder", salesorder1);
			salesOrder.setCreatedBy(l.getEmpUserId());
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			salesOrder.setUpdatedBy(l.getEmpUserId());
	    	//model.addAttribute("message",orderService.save(salesOrder));
	    	i=orderService.save(salesOrder);
	    	if(i>=1)
			{
				message=1;
				model.addAttribute("message", message);
				model.addAttribute("msg", enquiryService.ShowAdd());
			}
			else
			{
				message=0;
				model.addAttribute("message", message);
				model.addAttribute("msg", enquiryService.ShowNotAdd());
			}
	    	/*salesOrder=orderService.editOrder(salesOrder.getTxtSOID()).get(0);
	    	taxList=orderService.editOrderTaxDetails(salesOrder.getTxtSOID()).get(0);
	    	salesOrder.setTaxList(taxList.getTaxList());
	    	for (TaxDetailsList taxDetails : (taxList.getTaxList())) {
				
	    		counter=taxDetails.getCounter();
	    		if(counter !=0)
	    		{
	    			linkedTaxList=orderService.editOrderLinkedTaxDetails(salesOrder.getTxtSOID()).get(0);	    	
	    	    	salesOrder.setLinkedTaxList(linkedTaxList.getLinkedTaxList());	
	    		}
			}	   */ 	    	    	
	    	request.getSession().setAttribute("salesOrder",salesOrder);
	    	model.addAttribute("orderList",orderService.show());
	   		return new ModelAndView("Sales/showSalesOrder","salesOrder",salesOrder);
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
    //View Order    
    @RequestMapping("/viewOrder")
   	public ModelAndView viewOrder(@RequestParam String orderId,Order taxList,Order linkedTaxList,Order salesOrder,HttpServletRequest request,ModelMap model,HttpSession session)
   	{
    	int counter=0;
    	String bln="blank";
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("salesorder", salesorder1);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
	    	salesOrder=orderService.editOrder(orderId).get(0);	    	
	    	if(orderService.editOrderTaxDetails(orderId) !=null)
	    	{
		    	taxList=orderService.editOrderTaxDetails(orderId).get(0);
		    	salesOrder.setTaxList(taxList.getTaxList());
	    	}
	    	else{
	    			model.addAttribute("bln", bln);
	    	}
	    	for (TaxDetailsList taxDetails : (taxList.getTaxList())) {				
	    		counter=taxDetails.getCounter();
	    		if(counter !=0)
	    		{
				    linkedTaxList=orderService.editOrderLinkedTaxDetails(orderId).get(0);		   
				    salesOrder.setLinkedTaxList(linkedTaxList.getLinkedTaxList());
	    		}
	    	}
	    	
	    	request.getSession().setAttribute("salesOrder",salesOrder);
	   		return new ModelAndView("Sales/viewOrder","salesOrder",salesOrder);
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
    //showSalesOrderDetails
    @RequestMapping("/showSalesOrderDetails")
   	public ModelAndView showSalesOrderDetails(@RequestParam String orderId,Order salesOrder,HttpServletRequest request,ModelMap model,HttpSession session)
   	{
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("salesorder", salesorder1);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
	    	salesOrder=orderService.editOrder(orderId).get(0);
	   		return new ModelAndView("Sales/showSalesOrderDetails","salesOrder",salesOrder);
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
    //Edit Order
    @RequestMapping("/editOrder")
   	public ModelAndView editOrder(@RequestParam String orderId,Order taxList,Order linkedTaxList,Order salesOrder,ModelMap model,HttpSession session)
   	{    
    	int counter=0;
    	String bln="blank";
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("salesorder", salesorder1);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			salesOrder.setUpdatedBy(l.getEmpUserId());
			salesOrder=orderService.editOrder(orderId).get(0);
	    	model.addAttribute("vatName", estimateService.retriveVat());
	    	model.addAttribute("service", estimateService.retriveService());
	    	model.addAttribute("customerList", orderService.retriveCustomerList()); 
	    	model.addAttribute("orderList",orderService.retriveProductList());    	   	
	    	model.addAttribute("taxList",orderService.retriveTaxList());
	    	if(orderService.editOrderTaxDetails(orderId) !=null)
	    	{
		    	taxList=orderService.editOrderTaxDetails(orderId).get(0);
		    	salesOrder.setTaxList(taxList.getTaxList());
	    	}
	    	else
	    	{
    			model.addAttribute("bln", bln);
	    	}
	    	for (TaxDetailsList taxDetails : (taxList.getTaxList())) {				
	    		counter=taxDetails.getCounter();
	    		if(counter !=0)
	    		{
				    linkedTaxList=orderService.editOrderLinkedTaxDetails(orderId).get(0);		   
				    salesOrder.setLinkedTaxList(linkedTaxList.getLinkedTaxList());
	    		}
	    	}
	   		return new ModelAndView("Sales/editOrder","salesOrder",salesOrder);
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
    //deleteSalesOrder
    @RequestMapping("/deleteSalesOrder")
   	public ModelAndView deleteSalesOrder(@RequestParam String orderId,Order salesOrder,ModelMap model,HttpSession session)
   	{    
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("salesorder", salesorder1);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
	    	//model.addAttribute("deletemsg", orderService.deleteOrder(orderId));
	    	i=orderService.deleteOrder(orderId);
	    	 if(i>=1)
				{
					message=1;
					model.addAttribute("deletemsg", message);
					model.addAttribute("msg", enquiryService.ShowDelete());
				}
				else
				{
					message=0;
					model.addAttribute("deletemsg", message);
					model.addAttribute("msg", enquiryService.ShowNotDelete());
				}
	    	model.addAttribute("orderList",orderService.show());
	   		return new ModelAndView("Sales/showSalesOrder","salesOrder",salesOrder);
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
    //Update Order
    @RequestMapping("/updateOrder")
    public ModelAndView updateOrder(@ModelAttribute Order salesOrder,Order taxList,Order linkedTaxList,Model model,HttpSession session){
 	   
    	//int counter=0;
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("salesorder", salesorder1);
			salesOrder.setUpdatedBy(l.getEmpUserId());
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			salesOrder.setUpdatedBy(l.getEmpUserId());		
	    	//model.addAttribute("updatemsg",orderService.updateOrder(salesOrder));
	    	i=orderService.updateOrder(salesOrder);
	    	if(i>=1)
			{
				message=1;
				model.addAttribute("updatemsg", message);
				model.addAttribute("msg", enquiryService.ShowUpdate());
			}
			else
			{
				message=0;
				model.addAttribute("updatemsg", message);
				model.addAttribute("msg", enquiryService.ShowNotUpdate());
			}
	    	/*salesOrder=orderService.editOrder(salesOrder.getTxtSOID()).get(0);
	    	taxList=orderService.editOrderTaxDetails(salesOrder.getTxtSOID()).get(0);
	    	salesOrder.setTaxList(taxList.getTaxList());
	    	for (TaxDetailsList taxDetails : (taxList.getTaxList())) {
				
	    		counter=taxDetails.getCounter();
	    		if(counter !=0)
	    		{
	    			linkedTaxList=orderService.editOrderLinkedTaxDetails(salesOrder.getTxtSOID()).get(0);	    	
	    	    	salesOrder.setLinkedTaxList(linkedTaxList.getLinkedTaxList());	
	    		}
			}	*/
	    	model.addAttribute("orderList",orderService.show());
	   		return new ModelAndView("Sales/showSalesOrder","salesOrder",salesOrder);
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
    //newChallan 
    @RequestMapping("/newChallan")
   	public ModelAndView newChallan(DeliveryChallan deliveryChallan,ModelMap model,HttpSession session)
   	{
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("deliverychallan", deliverychallan1);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
	    	deliveryChallan=deliveryChallanService.generateChId();
	    	model.addAttribute("customerList", deliveryChallanService.retriveCustomerList());
	    	model.addAttribute("deliProdList",deliveryChallanService.retriveProductList());
	    	model.addAttribute("invoiceList", deliveryChallanService.retriveInvList());
	    	return new ModelAndView("Sales/salesDeliveryChallan","deliveryChallan",deliveryChallan);
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
    //Edit Delivery Challan
    @RequestMapping("/editDevilveryChallan")
   	public ModelAndView editChallan(@RequestParam String challanId,DeliveryChallan deliveryChallan,ModelMap model,HttpSession session)
   	{
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("deliverychallan", deliverychallan1);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
	    	model.addAttribute("customerList", deliveryChallanService.retriveCustomerList());
	    	model.addAttribute("deliProdList",deliveryChallanService.retriveProductList());
	    	model.addAttribute("invoiceList", deliveryChallanService.retriveInvList());
	    	deliveryChallan=deliveryChallanService.editChallan(challanId).get(0);
	   		return new ModelAndView("Sales/editDeliveryChallan","deliveryChallan",deliveryChallan);
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
    //Update Delivery Challan 
    @RequestMapping("/updateChallan")
    public ModelAndView updateChallan(@ModelAttribute DeliveryChallan deliveryChallan,Model model,HttpSession session)
    {
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{	
			model.addAttribute("sales",sales);
			model.addAttribute("deliverychallan", deliverychallan1);
			deliveryChallan.setUpdatedBy(l.getEmpUserId());
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			model.addAttribute("updatemsg",deliveryChallanService.updateChallan(deliveryChallan));
			i=deliveryChallanService.updateChallan(deliveryChallan);
			  if(i>=1)
				{
					message=1;
					model.addAttribute("updatemsg", message);
					model.addAttribute("msg", enquiryService.ShowUpdate());
				}
				else
				{
					message=0;
					model.addAttribute("updatemsg", message);
					model.addAttribute("msg", enquiryService.ShowNotUpdate());
				}
			model.addAttribute("challanList",deliveryChallanService.show());
	   		return new ModelAndView("Sales/showDeliveyChallan","deliveryChallan",deliveryChallan);
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
    //View Delivery Challan
    @RequestMapping("/viewDevilveryChallan")
   	public ModelAndView viewChallan(@RequestParam String challanId,HttpServletRequest request,DeliveryChallan deliveryChallan,ModelMap model,HttpSession session)
   	{
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("deliverychallan", deliverychallan1);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
	    	deliveryChallan=deliveryChallanService.editChallan(challanId).get(0);
	    	request.getSession().setAttribute("deliveryChallan",deliveryChallan);
	   		return new ModelAndView("Sales/viewDeliveryChallan","deliveryChallan",deliveryChallan);
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
    //deleteDevilveryChallan
    @RequestMapping("/deleteDevilveryChallan")
   	public ModelAndView deleteDevilveryChallan(@RequestParam String challanId,HttpServletRequest request,DeliveryChallan deliveryChallan,ModelMap model,HttpSession session)
   	{
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("deliverychallan", deliverychallan1);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
	    	model.addAttribute("deletemsg",deliveryChallanService.deleteChallan(challanId));
	    	i=deliveryChallanService.deleteChallan(challanId);
	    	 if(i>=1)
				{
					message=1;
					model.addAttribute("deletemsg", message);
					model.addAttribute("msg", enquiryService.ShowDelete());
				}
				else
				{
					message=0;
					model.addAttribute("deletemsg", message);
					model.addAttribute("msg", enquiryService.ShowNotDelete());
				}
	    	model.addAttribute("challanList",deliveryChallanService.show());
	   		return new ModelAndView("Sales/showDeliveyChallan","deliveryChallan",deliveryChallan);
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
    //showChallanDetails
    @RequestMapping("/showChallanDetails")
   	public ModelAndView showChallanDetails(@RequestParam String challanId,HttpServletRequest request,DeliveryChallan deliveryChallan,ModelMap model,HttpSession session)
   	{
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("deliverychallan", deliverychallan1);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
	    	deliveryChallan=deliveryChallanService.editChallan(challanId).get(0);    	
	   		return new ModelAndView("Sales/showChallanDetails","deliveryChallan",deliveryChallan);
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
    //New Invoice 
    @RequestMapping("/newInvoice")
   	public ModelAndView newInvoice(Invoice invoice,ModelMap model,HttpSession session) 
   	{
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("invoice", invoice1);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
	    	invoice=invoiceService.generateInvId();
	    	model.addAttribute("taxList",invoiceService.retriveTaxList());
	    	model.addAttribute("vatName", estimateService.retriveVat());
	    	model.addAttribute("service", estimateService.retriveService());
	    	model.addAttribute("challanList",invoiceService.retriveChlList());
	    	model.addAttribute("invoiceProdList",invoiceService.retriveProductList());
	    	model.addAttribute("customerList", invoiceService.retriveCustomerList());
	    	model.addAttribute("orderList", invoiceService.retriveOrderList());
	    	return new ModelAndView("Sales/salesInvoice","salesInvoice",invoice);
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
    //Add Invoice
    @RequestMapping("/addInvoice")
   	public ModelAndView addInvoice(Invoice invoice,Invoice taxList,HttpServletRequest requestOrder,Invoice linkedTaxList,HttpServletRequest request,ModelMap model,HttpSession session)
   	{
    	//int counter=0;
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{
		if(lus.authontication(l,"Sales"))
		{
			//String orderId=invoice.getOrderId();
			model.addAttribute("sales",sales);
			model.addAttribute("invoice", invoice1);
			invoice.setCreatedBy(l.getEmpUserId());
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
	    	//model.addAttribute("message",invoiceService.save(invoice));
			
			i=invoiceService.save(invoice);
			if(i==0)
			{
				model.addAttribute("message",message);
				//invoice=orderService.editOrder(orderId);
				model.addAttribute("sales",sales);
				model.addAttribute("userName",l.getUname());
				model.addAttribute("userId",l.getEmpUserId());
				model.addAttribute("taxList",invoiceService.retriveTaxList());
		    	model.addAttribute("challanList",invoiceService.retriveChlList());
		    	model.addAttribute("invoiceProdList",invoiceService.retriveProductList());
		    	model.addAttribute("vatName", estimateService.retriveVat());
		    	model.addAttribute("service", estimateService.retriveService());
		    	model.addAttribute("customerList", invoiceService.retriveCustomerList());
				return new ModelAndView("Sales/invoiceFromOrder","salesInvoice",invoice);
			}
			else 
			{
				if(i>=1)
				{
					message=1;
					model.addAttribute("message", message);
					model.addAttribute("msg", enquiryService.ShowAdd());
				}
				else
				{
					message=0;
					model.addAttribute("message", message);
					model.addAttribute("msg", enquiryService.ShowNotAdd());
				}
				/*invoice=invoiceService.editInvoice(invoice.getTxtInvID()).get(0);
		    	request.getSession().setAttribute("salesInvoice",invoice);
		    	taxList=invoiceService.editInvoiceTaxDetails(invoice.getTxtInvID()).get(0);
		    	invoice.setTaxList(taxList.getTaxList());
		    	for (TaxDetailsList taxDetailsList : (taxList.getTaxList())) {
					counter=taxDetailsList.getCounter();					
					if(counter!=0)
					{
						linkedTaxList=invoiceService.editInvoiceLinkedTaxDetails(invoice.getTxtInvID()).get(0);			
						invoice.setLinkedTaxList(linkedTaxList.getLinkedTaxList());
					}
		    	}*/
		    	model.addAttribute("invoiceList",invoiceService.show());    
		   		return new ModelAndView("Sales/showInvoice","salesInvoice",invoice);
			}
		}
		else
		{
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
    //Edit Invoice
    @RequestMapping("/editInvoice")
   	public ModelAndView editInvoice(@RequestParam String invoiceId,Invoice invoice,Invoice taxList,Invoice linkedTaxList,ModelMap model,HttpSession session)
   	{
    	int counter=0;
    	String bln="blank";
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("invoice", invoice1);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			model.addAttribute("vatName", estimateService.retriveVat());
	    	model.addAttribute("service", estimateService.retriveService());
	    	model.addAttribute("taxList",invoiceService.retriveTaxList());
	    	model.addAttribute("challanList",invoiceService.retriveChlList());
	    	model.addAttribute("invoiceProdList",invoiceService.retriveProductList());
	    	model.addAttribute("customerList", invoiceService.retriveCustomerList());
	    	model.addAttribute("orderList", invoiceService.retriveOrderList());
	    	invoice=invoiceService.editInvoice(invoiceId).get(0);
	    	if(invoiceService.editInvoiceTaxDetails(invoiceId) != null)
	    	{
		    	taxList=invoiceService.editInvoiceTaxDetails(invoiceId).get(0);
		    	invoice.setTaxList(taxList.getTaxList());	
	    	}
	    	else
	    	{
	    		model.addAttribute("bln", bln);
	    	}
	    	for (TaxDetailsList taxDetailsList : (taxList.getTaxList())) {
				counter=taxDetailsList.getCounter();					
				if(counter!=0)
				{
					linkedTaxList=invoiceService.editInvoiceLinkedTaxDetails(invoiceId).get(0);			    
					invoice.setLinkedTaxList(linkedTaxList.getLinkedTaxList());
				}
			}	    	
	    	return new ModelAndView("Sales/editInvoice","salesInvoice",invoice);
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
    //Update Invoice
    @RequestMapping("/updateInvoice")
    public ModelAndView updateInvoice(@ModelAttribute Invoice invoice,Invoice taxList,Invoice linkedTaxList,Model model,HttpSession session)
    {
    	//int counter=0;
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("invoice", invoice1);
			invoice.setUpdatedBy(l.getEmpUserId());
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
	 	    model.addAttribute("updatemsg",invoiceService.updateInvoice(invoice));
	 	    i=invoiceService.updateInvoice(invoice);
		 	   if(i>=1)
				{
					message=1;
					model.addAttribute("updatemsg", message);
					model.addAttribute("msg", enquiryService.ShowUpdate());
				}
				else
				{
					message=0;
					model.addAttribute("updatemsg", message);
					model.addAttribute("msg", enquiryService.ShowNotUpdate());
				}
	 	    /*invoice=invoiceService.editInvoice(invoice.getTxtInvID()).get(0);
	 	    taxList=invoiceService.editInvoiceTaxDetails(invoice.getTxtInvID()).get(0);
	    	invoice.setTaxList(taxList.getTaxList());
	    	for (TaxDetailsList taxDetailsList : (taxList.getTaxList())) {
				counter=taxDetailsList.getCounter();					
				if(counter!=0)
				{
					linkedTaxList=invoiceService.editInvoiceLinkedTaxDetails(invoice.getTxtInvID()).get(0);			
					invoice.setLinkedTaxList(linkedTaxList.getLinkedTaxList());
				}
	    	}*/
	 	    model.addAttribute("invoiceList",invoiceService.show());    
	   		return new ModelAndView("Sales/showInvoice","salesInvoice",invoice);
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
    //View Invoice
    @RequestMapping("/viewInvoice")
   	public ModelAndView viewInvoice(@RequestParam String invoiceId,Invoice taxList,Invoice linkedTaxList,HttpServletRequest request,Invoice invoice,ModelMap model,HttpSession session)
   	{
    	int counter=0;
    	String bln="blank";
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("invoice", invoice1);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
	    	invoice=invoiceService.editInvoice(invoiceId).get(0);	    	
	    	if(invoiceService.editInvoiceTaxDetails(invoiceId) != null)
	    	{
		    	taxList=invoiceService.editInvoiceTaxDetails(invoiceId).get(0);
		    	invoice.setTaxList(taxList.getTaxList());	
	    	  	   	
	    	for (TaxDetailsList taxDetailsList : (taxList.getTaxList())) {
				counter=taxDetailsList.getCounter();	
				if(counter!=0)
				{
					linkedTaxList=invoiceService.editInvoiceLinkedTaxDetails(invoiceId).get(0);			    
					invoice.setLinkedTaxList(linkedTaxList.getLinkedTaxList());
				}
			}	
	    	}
	    	else
	    	{
	    		model.addAttribute("bln", bln);
	    	} 
		    request.getSession().setAttribute("salesInvoice",invoice);
	   		return new ModelAndView("Sales/viewInvoice","salesInvoice",invoice);
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
    //deleteInvoice
    @RequestMapping("/deleteInvoice")
   	public ModelAndView deleteInvoice(@RequestParam String invoiceId,float amt,HttpServletRequest request,Invoice invoice,ModelMap model,HttpSession session)
   	{
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("invoice", invoice1);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
	    	model.addAttribute("deletemsg",invoiceService.deleteInvoice(invoiceId,amt));
	    	i=invoiceService.deleteInvoice(invoiceId,amt);
	    	 if(i>=1)
				{
					message=1;
					model.addAttribute("deletemsg", message);
					model.addAttribute("msg", enquiryService.ShowDelete());
				}
				else
				{
					message=0;
					model.addAttribute("deletemsg", message);
					model.addAttribute("msg", enquiryService.ShowNotDelete());
				}
	    	model.addAttribute("invoiceList",invoiceService.show());
	   		return new ModelAndView("Sales/showInvoice","salesInvoice",invoice);
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
    //showInvoiceDetails
    @RequestMapping("/showInvoiceDetails")
   	public ModelAndView showInvoiceDetails(@RequestParam String invoiceId,HttpServletRequest request,Invoice invoice,ModelMap model,HttpSession session)
   	{
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("invoice", invoice1);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
	    	invoice=invoiceService.editInvoice(invoiceId).get(0);    	
	   		return new ModelAndView("Sales/showInvoiceDetails","salesInvoice",invoice);
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
    //apply Payment
    @RequestMapping("/applyPayment")
   	public ModelAndView applyPayment(Payment payment,ModelMap model,HttpSession session)
   	{
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("receipts", receipts1);
   		return new ModelAndView("Sales/applyPayment","applyPayment",payment);
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
   
    //Add Payment
    @RequestMapping("/addPayment")
   	public ModelAndView addPayment(Payment payment,ModelMap model,HttpSession session)
   	{
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{model.addAttribute("sales",sales);
		model.addAttribute("receipts", receipts1);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
	    	model.addAttribute("message",paymentService.save(payment));
	   		return new ModelAndView("Sales/applyPayment","applyPayment",payment);
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
    //newReceipt
    @RequestMapping("/newReceipt")
	public ModelAndView newReceipt(Receipts receipts,ModelMap model,HttpSession session)
   	{
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("receipts", receipts1);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
	    	receipts=receiptService.generateRcptId();
	    	model.addAttribute("accountList",receiptService.retriveAcList());
	    	model.addAttribute("invoiceList",receiptService.retriveInvList());
	   		return new ModelAndView("Sales/salesReceipts","salesReceipts",receipts);
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
    //newReceiptApplyPay
    @RequestMapping("/newReceiptApplyPay")
   	public ModelAndView newReceiptApplyPay(@RequestParam String invoiceId,Receipts receipts,ModelMap model,HttpServletRequest request,HttpSession session)
      	{
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("receipts", receipts1);
   			model.addAttribute("userName",l.getUname());
   			model.addAttribute("userId",l.getEmpUserId());
	       	receipts=receiptService.generateRcptId();	       
	       	receipts.setInvoiceId(invoiceId);
	       	model.addAttribute("accountList",receiptService.retriveAcList());
	       //	model.addAttribute("invoiceList",receiptService.retriveInvList());
	      	return new ModelAndView("Sales/applyPaymentReceipt","salesReceipts",receipts);
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
  //Add Receipt
    @RequestMapping("/addReceipt")
   	public ModelAndView addReceipts(Receipts receipts,ModelMap model,HttpSession session)
   	{	   	    		
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("receipts", receipts1);
			receipts.setCreatedBy(l.getEmpUserId());
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
    		//model.addAttribute("message",receiptService.save(receipts));
    		i=receiptService.save(receipts);
    		if(i>=1)
			{
				message=1;
				model.addAttribute("message", message);
				model.addAttribute("msg", enquiryService.ShowAdd());
			}
			else
			{
				message=0;
				model.addAttribute("message", message);
				model.addAttribute("msg", enquiryService.ShowNotAdd());
			}
    		//receipts=receiptService.editReceipt(receipts.getReceiptsNo()).get(0);
    		model.addAttribute("receiptList", receiptService.show());
	   		return new ModelAndView("Sales/showReceipts","salesReceipts",receipts);
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
    //editReceipt
    @RequestMapping("/editReceipt")
   	public ModelAndView editReceipt(@RequestParam String receiptId,Receipts receipts,ModelMap model,HttpSession session)
    {
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("receipts", receipts1);
			//model.addAttribute("paymentList",paymentService.show());
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
	    	receipts=receiptService.editReceipt(receiptId).get(0);
	    	model.addAttribute("accountList",receiptService.retriveAcList());
	    	model.addAttribute("invoiceList",receiptService.retriveInvList());
	   		return new ModelAndView("Sales/editReceipt","salesReceipts",receipts);
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
    //view Receipts
    @RequestMapping("/viewReceipt")
   	public ModelAndView viewReceipt(@RequestParam String receiptId,Receipts receipts,ModelMap model,HttpSession session)
      	{
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("receipts", receipts1);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
    		receipts=receiptService.editReceipt(receiptId).get(0);
      		return new ModelAndView("Sales/viewReceipt","salesReceipts",receipts);
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
    //deleteReceipt.do?receiptId
    @RequestMapping("/deleteReceipt")
   	public ModelAndView deleteReceipt(@RequestParam String receiptId,Receipts receipts,ModelMap model,HttpSession session)
      	{
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("receipts", receipts1);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	    	
	    	//model.addAttribute("deletemsg", receiptService.deleteReceipt(receiptId));
	    	i=receiptService.deleteReceipt(receiptId);
	    	 if(i>=1)
				{
					message=1;
					model.addAttribute("deletemsg", message);
					model.addAttribute("msg", enquiryService.ShowDelete());
				}
				else
				{
					message=0;
					model.addAttribute("deletemsg", message);
					model.addAttribute("msg", enquiryService.ShowNotDelete());
				}
	    	model.addAttribute("receiptList", receiptService.show());
	   		return new ModelAndView("Sales/showReceipts","salesReceipts",receipts);
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
    //Update Receipt
    @RequestMapping("/updateReceipt")
    public ModelAndView updateReceipt(@ModelAttribute Receipts receipts,Model model,HttpSession session)
    {
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("receipts", receipts1);
			receipts.setUpdatedBy(l.getEmpUserId());
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			model.addAttribute("updatemsg",receiptService.updateReceipt(receipts));
			i=receiptService.updateReceipt(receipts);
			if(i>=1)
			{
				message=1;
				model.addAttribute("updatemsg", message);
				model.addAttribute("msg", enquiryService.ShowUpdate());
			}
			else
			{
				message=0;
				model.addAttribute("updatemsg", message);
				model.addAttribute("msg", enquiryService.ShowNotUpdate());
			}
			model.addAttribute("receiptList", receiptService.show());
	   		return new ModelAndView("Sales/showReceipts","salesReceipts",receipts);
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
    
    //Add Delivery Challan
    @RequestMapping("/addDeliveryChallan")
   	public ModelAndView addDeliveryChallan(DeliveryChallan deliveryChallan,ModelMap model,HttpSession session)
   	{	 
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("deliverychallan", deliverychallan1);
			deliveryChallan.setCreatedBy(l.getEmpUserId());
			model.addAttribute("userId",l.getEmpUserId());
			model.addAttribute("userName",l.getUname());
    		//model.addAttribute("message",deliveryChallanService.save(deliveryChallan));
			i=deliveryChallanService.save(deliveryChallan);
    		if(i>=1)
			{
				message=1;
				model.addAttribute("message", message);
				model.addAttribute("msg", enquiryService.ShowAdd());
			}
			else
			{
				message=0;
				model.addAttribute("message", message);
				model.addAttribute("msg", enquiryService.ShowNotAdd());
			}
    		//deliveryChallan=deliveryChallanService.editChallan(deliveryChallan.getChallanID()).get(0);
    		model.addAttribute("challanList",deliveryChallanService.show());
	   		return new ModelAndView("Sales/showDeliveyChallan","deliveryChallan",deliveryChallan);
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
    //Estimate From Enquiry
    @RequestMapping("/estimateFromEnquiry")
 	public ModelAndView estimateFromEnquiry(Estimate salesEstimate,HttpServletRequest request,ModelMap model,HttpSession session)
   	{	
    	float amt=0;
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("estimate", estimate1);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
	    	salesEstimate=estimateService.generateEstId();
	    	Enquiry salesEnquiry=(Enquiry) request.getSession().getAttribute("salesEnquiry");
	    	salesEstimate.setCustID(salesEnquiry.getCustID());
	    	salesEstimate.setTxtEnqNo(salesEnquiry.getTxtEnqId());
	    	salesEstimate.setTxtCutName(salesEnquiry.getTxtCutName());
	    	salesEstimate.setTxtDate(salesEnquiry.getTxtDate());
	    	List<EnquiryDetails> enqDetails=new ArrayList<EnquiryDetails>();
	    	enqDetails.addAll(salesEnquiry.getEnquiryDetails());
	    	List<Details> prodList=new ArrayList<Details>();
	    	for(EnquiryDetails enqList : enqDetails)
	    	{
	    		Details details=new Details();
	    		details.setSrNo(enqList.getSrNo());
	    		details.setProdId(enqList.getItemId());
	    		details.setItemCode(enqList.getItemCode());
	    		details.setDes(enqList.getDes());
	    		details.setUnit(enqList.getMunit());
	    		details.setQuantity(Integer.parseInt(enqList.getQuantity()));
	    		details.setUnitPrice(enqList.getUnitPrice());
	    		float total=Integer.parseInt(enqList.getQuantity())*enqList.getUnitPrice();
	    		details.setItemTotal(total);
	    		amt=amt+total;
	    		prodList.add(details);
	    	}
	    	salesEstimate.setProductList(prodList);
	    	salesEstimate.setTxtpubNotes(salesEnquiry.getTxtPubNotes());
	    	salesEstimate.setTxtpvtNotes(salesEnquiry.getTxtPvtNotes()); 
	    	salesEstimate.setTxtAmtPayble(amt);
	    	model.addAttribute("taxList", estimateService.retriveTaxList());
	    	model.addAttribute("vatName", estimateService.retriveVat());
	    	model.addAttribute("service", estimateService.retriveService());
	    	model.addAttribute("productList",estimateService.retriveProductList());
	    	model.addAttribute("customerList", estimateService.retriveCustomerList());
	    	return new ModelAndView("Sales/estimateFromEnquiry","salesEstimate",salesEstimate);
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
    
    //Order FRom Estimate
    @RequestMapping("/orderFromEstimate")
 	public ModelAndView orderFromEstimate(Order order,HttpServletRequest request,ModelMap model,HttpSession session)
    {
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("salesorder", salesorder1);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
	    	order=orderService.generateOrdId();
	    	Estimate estimate=(Estimate) request.getSession().getAttribute("salesEstimate");
	    	order.setCustId(estimate.getCustID());
	    	order.setTxtEstID(estimate.getTxtEstID());
	    	order.setTxtCName(estimate.getTxtCutName());
	    	order.setTxtDate(estimate.getTxtDate());
	    	order.setTxtBillAddr(estimate.getTxtBillAddr());
	    	order.setTxtShipAddr(estimate.getTxtShipAddr());	    	
	    	order.setProductList(estimate.getProductList());	    	
	    	order.setTaxList(estimate.getTaxList());	    	
	    	order.setLinkedTaxList(estimate.getLinkedTaxList());	    	
	    	order.setTxtpubNotes(estimate.getTxtpubNotes());
	    	order.setTxtpvtNotes(estimate.getTxtpvtNotes());	
	    	order.setTxtSubTotal(estimate.getTxtAmtPayble());
	    	order.setRadio(estimate.getRadio());
	    	order.setTxtDiscount(estimate.getTxtDiscount());
	    	order.setTxtDisTotal(estimate.getTxtAmtPayble());
	    	order.setTxtTaxTotal(estimate.getTxtTaxTotal());
	    	order.setTxtRoundOff(estimate.getTxtRoundOff());
	    	order.setTxtAmtPayble(estimate.getTxtAmtPayble());
	    	model.addAttribute("vatName", estimateService.retriveVat());
	    	model.addAttribute("service", estimateService.retriveService());
	    	model.addAttribute("taxList", estimateService.retriveTaxList());
	    	model.addAttribute("customerList", orderService.retriveCustomerList());
	    	model.addAttribute("orderList",orderService.retriveProductList());
	    	return new ModelAndView("Sales/orderFromEstimate","salesOrder",order);
	    	
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
    
    //Invoice From Order 
    @RequestMapping("/invoiceFromOrder")
 	public ModelAndView invoiceFromChallan(Invoice invoice,HttpServletRequest requestChallan,HttpServletRequest requestOrder,ModelMap model,HttpSession session)
    {
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("invoice", invoice1);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
	    	invoice=invoiceService.generateInvId();    	
	    	Order order=(Order) requestOrder.getSession().getAttribute("salesOrder");	    	
	    	invoice.setCustId(order.getCustId());
	    	invoice.setTxtCName(order.getTxtCName());   
	    	invoice.setOrderId(order.getTxtSOID());
	    	invoice.setTxtBillAddr(order.getTxtBillAddr());
	    	invoice.setTxtShipAddr(order.getTxtShipAddr());	    	
	    	invoice.setProductList(order.getProductList());	    	
	    	invoice.setTaxList(order.getTaxList());	    	
	    	invoice.setLinkedTaxList(order.getLinkedTaxList());
	    	invoice.setTxtCPONo(order.getTxtCPONo());
	    	invoice.setTxtTransCost(order.getTxtTransCost());
	    	invoice.setTxtpubNotes(order.getTxtpubNotes());
	    	invoice.setTxtpvtNotes(order.getTxtpvtNotes());
	    	invoice.setTxtSubTotal(order.getTxtSubTotal());  
	    	invoice.setRadio(order.getRadio());
	    	invoice.setTxtDiscount(order.getTxtDiscount());
	    	invoice.setTxtDisTotal(order.getTxtDisTotal());
	    	invoice.setTxtTaxTotal(order.getTxtTaxTotal());
	    	invoice.setTxtRoundOff(order.getTxtRoundOff());
	    	invoice.setTxtAmtPayble(order.getTxtAmtPayble());	    	
	    	model.addAttribute("taxList",invoiceService.retriveTaxList());
	    	model.addAttribute("challanList",invoiceService.retriveChlList());
	    	model.addAttribute("invoiceProdList",invoiceService.retriveProductList());
	    	model.addAttribute("vatName", estimateService.retriveVat());
	    	model.addAttribute("service", estimateService.retriveService());
	    	model.addAttribute("customerList", invoiceService.retriveCustomerList());
	    	return new ModelAndView("Sales/invoiceFromOrder","salesInvoice",invoice);
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
    //Challan From Invoice 
    @RequestMapping("/challanFromInvoice")
 	public ModelAndView challanFromInvoice(DeliveryChallan deliveryChallan,HttpServletRequest request,ModelMap model,HttpSession session)
    {
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("deliverychallan", deliverychallan1);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
	    	deliveryChallan=deliveryChallanService.generateChId();
	    	Invoice invoice=(Invoice) request.getSession().getAttribute("salesInvoice");
	    	deliveryChallan.setInvoiceID(invoice.getTxtInvID());
	    	deliveryChallan.setCustId(invoice.getCustId());
	    	deliveryChallan.setCustomerName(invoice.getTxtCName());
	    	deliveryChallan.setBillingAdd(invoice.getTxtBillAddr());
	    	List<Details> invProdList=new ArrayList<Details>();    	
	    	invProdList.addAll(invoice.getProductList());
	    	List<DeliveryChallanDetails> chProdList=new ArrayList<DeliveryChallanDetails>();
	    	for(Details productList:invProdList)
	    	{
	    		DeliveryChallanDetails deliveryChallanDetails=new DeliveryChallanDetails();
	    		deliveryChallanDetails.setSrNo(productList.getSrNo());
	    		deliveryChallanDetails.setProdID(productList.getProdId());
	    		deliveryChallanDetails.setItemCode(productList.getItemCode());
	    		deliveryChallanDetails.setQuantity(productList.getQuantity());
	    		deliveryChallanDetails.setrQty((int) productList.getdQty());
	    		deliveryChallanDetails.setUnit(productList.getUnit());
	    		chProdList.add(deliveryChallanDetails);
	    	}
	    	deliveryChallan.setDeliveryChallandetails(chProdList);
	    	model.addAttribute("taxList",invoiceService.retriveTaxList());
	    	model.addAttribute("customerList", deliveryChallanService.retriveCustomerList());
	    	model.addAttribute("deliProdList",deliveryChallanService.retriveProductList());   		
	    	model.addAttribute("invoiceList", deliveryChallanService.retriveInvList());
	    	return new ModelAndView("Sales/challanFromInvoice","deliveryChallan",deliveryChallan);
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
    // PDF of Enquiry    
    @RequestMapping("/enquiryPDF")
   	public ModelAndView enquiryPDF(@RequestParam String enquiryID,CompanyDetails companyDetails,Enquiry salesEnquiry,ModelMap model,HttpSession session)
   	{  
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{	
			model.addAttribute("sales",sales);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
	    	salesEnquiry=enquiryService.editEnquiry(enquiryID).get(0);  
	    	model.addAttribute("compInfo", enquiryService.getInfo(companyDetails).get(0));
	    	return new ModelAndView("salesEnquiryPDF" ,"salesEnquiry", salesEnquiry);
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
    
    //salesEstimatePDF
    @RequestMapping("/salesEstimatePDF")
   	public ModelAndView salesEstimatePDF(@RequestParam String estimateID,CompanyDetails companyDetails,Estimate taxList,Estimate linkedTaxList,Estimate salesEstimate,ModelMap model,HttpSession session)
   	{  
    	int counter=0;
    //String bln="blank";
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
	    	salesEstimate=estimateService.editEstimate(estimateID).get(0);   
	    	model.addAttribute("compInfo", enquiryService.getInfo(companyDetails).get(0));
	    	if(estimateService.editEstimateTaxDetails(estimateID) != null)
	    	{
	    		taxList=estimateService.editEstimateTaxDetails(estimateID).get(0);
		    	salesEstimate.setTaxList(taxList.getTaxList());
	    	}
	    	for (TaxDetailsList taxDetails : (taxList.getTaxList())) {
				counter=taxDetails.getCounter();
				if(counter != 0)
				{
					linkedTaxList=estimateService.editEstimateLinkedTaxDetails(estimateID).get(0);	 			
					salesEstimate.setLinkedTaxList(linkedTaxList.getLinkedTaxList());					
				}
			}
	    	return new ModelAndView("salesEstimatePDF" ,"salesEstimate", salesEstimate);
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
    //salesOrderPDF
    @RequestMapping("/salesOrderPDF")
   	public ModelAndView salesOrderPDF(@RequestParam String salesOrderID,Order taxList,Order linkedTaxList,CompanyDetails companyDetails,Order salesOrder,ModelMap model,HttpSession session)
   	{  
    	int counter=0;
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
	    	salesOrder=orderService.editOrder(salesOrderID).get(0);
	    	if(orderService.editOrderTaxDetails(salesOrderID) !=null)
	    	{
		    	taxList=orderService.editOrderTaxDetails(salesOrderID).get(0);
		    	salesOrder.setTaxList(taxList.getTaxList());
	    	}
	    	for (TaxDetailsList taxDetails : (taxList.getTaxList())) {				
	    		counter=taxDetails.getCounter();
	    		if(counter !=0)
	    		{
				    linkedTaxList=orderService.editOrderLinkedTaxDetails(salesOrderID).get(0);		   
				    salesOrder.setLinkedTaxList(linkedTaxList.getLinkedTaxList());
	    		}
	    	}
	    	model.addAttribute("compInfo", enquiryService.getInfo(companyDetails).get(0));
	    	return new ModelAndView("salesOrderPDF" ,"salesOrder", salesOrder);
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
    // salesinvoicePDF
    @RequestMapping("/salesinvoicePDF")
   	public ModelAndView salesinvoicePDF(@RequestParam String invoiceId,CompanyDetails companyDetails,Invoice salesInvoice,Invoice taxList,Invoice linkedTaxList,ModelMap model,HttpServletRequest request,HttpSession session)
   	{ 
    	int counter=0;
    	String bln="blank";
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
	    	salesInvoice=invoiceService.editInvoice(invoiceId).get(0);
	    	if(invoiceService.editInvoiceTaxDetails(invoiceId) != null)
	    	{
		    	taxList=invoiceService.editInvoiceTaxDetails(invoiceId).get(0);
		    	salesInvoice.setTaxList(taxList.getTaxList());	
	    	}
	    	else
	    	{
	    		model.addAttribute("bln", bln);
	    	}  
	    	for (TaxDetailsList taxDetails : (taxList.getTaxList())) {
				counter=taxDetails.getCounter();
				if(counter !=0)
				{
					linkedTaxList=invoiceService.editInvoiceLinkedTaxDetails(invoiceId).get(0);			    
				    salesInvoice.setLinkedTaxList(linkedTaxList.getLinkedTaxList());
				}
			}		    
	    	model.addAttribute("compInfo", enquiryService.getInfo(companyDetails).get(0));
	    	return new ModelAndView("salesInvoicePDF" ,"salesInvoice", salesInvoice);
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
    // deliveryChallanPDF
    @RequestMapping("/deliveryChallanPDF")
   	public ModelAndView deliveryChallanPDF(@RequestParam String challanId,CompanyDetails companyDetails,DeliveryChallan deliveryChallan,ModelMap model,HttpSession session)
   	{  
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
	    	deliveryChallan=deliveryChallanService.editChallan(challanId).get(0);
	    	model.addAttribute("compInfo", enquiryService.getInfo(companyDetails).get(0));
	    	return new ModelAndView("deliveryChallanPDF" ,"deliveryChallan", deliveryChallan);
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
    //salesReceiptPDF 
    @RequestMapping("/salesReceiptPDF")
   	public ModelAndView salesReceiptPDF(@RequestParam String receiptId,CompanyDetails companyDetails,Receipts salesReceipts,ModelMap model,HttpSession session)
   	{  
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
	    	salesReceipts=receiptService.editReceipt(receiptId).get(0);
	    	model.addAttribute("compInfo", enquiryService.getInfo(companyDetails).get(0));
	    	return new ModelAndView("salesReceiptsPDF" ,"salesReceipts", salesReceipts);
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
    //retrieveDesc
    @RequestMapping("/retrieveDesc")
   	public ModelAndView retrieveDesc(@RequestParam String productId,ModelMap model,HttpSession session)
   	{
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
	    	model.addAttribute("desc",enquiryService.retriveDesc(productId));
	    	return new ModelAndView("Sales/retrieveDesc");
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
    //retriveQuantity
    @RequestMapping("/retriveQuantity")
   	public ModelAndView retriveQuantity(@RequestParam String productId,ModelMap model,HttpSession session)
   	{
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
	    	model.addAttribute("quantity",orderService.retriveQuantity(productId));
	    	return new ModelAndView("Sales/retriveQuantity");
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
    
    //retriveAddress 
    @RequestMapping("/retriveAddress")
   	public ModelAndView retriveAddress(@RequestParam String customerId,ModelMap model,HttpSession session)
   	{   
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
	    	model.addAttribute("billAddress",estimateService.retriveBillAdd(customerId));
	    	model.addAttribute("shipAddress",estimateService.retriveShipAdd(customerId));
	    	return new ModelAndView("Sales/retriveAddress");
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
    //sendEnqPdfMail   
    @RequestMapping("/sendEnqPdfMail")
   	public ModelAndView sendPdfMail(@RequestParam String custId,@RequestParam String id1,CompanyDetails companyDetails,Enquiry salesEnquiry,ComposeMail composeMail,ModelMap model,HttpSession session,Document doc,HttpServletRequest request,PdfWriter writer,HttpServletResponse response) throws Exception
   	{ 
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("enquiry", enquiry1);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			salesEnquiry=enquiryService.editEnquiry(id1).get(0);  
		    model.addAttribute("compInfo", enquiryService.getInfo(companyDetails).get(0));		  
	    	model.addAttribute("custInfo", enquiryService.retriveCustInfo(custId,id1).get(0));
	    	model.addAttribute("salesEnquiryPDF" , salesEnquiry);
		    model.addAttribute("salesEnquiry",salesEnquiry);
		    enquiryPdf.buildPdfDocument(model, doc, writer, request, response);
	    	return new ModelAndView("Sales/composeMail","composeMail",composeMail);    	
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
    //sendEstPdfMail
    @RequestMapping("/sendEstPdfMail")
   	public ModelAndView sendEstPdfMail(@RequestParam String custId,@RequestParam String id1,Estimate taxList,Estimate linkedTaxList,CompanyDetails companyDetails,Estimate salesEstimate,ComposeMail composeMail,ModelMap model,HttpSession session,Document doc,HttpServletRequest request,PdfWriter writer,HttpServletResponse response) throws Exception
   	{ 
    	int counter=0;
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("estimate", estimate1);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			salesEstimate=estimateService.editEstimate(id1).get(0);   
	    	model.addAttribute("compInfo", enquiryService.getInfo(companyDetails).get(0));
	    	model.addAttribute("custInfo", estimateService.retriveCustInfo(custId,id1).get(0));
	    	if(estimateService.editEstimateTaxDetails(id1) != null)
	    	{
		    	taxList=estimateService.editEstimateTaxDetails(id1).get(0);
		    	salesEstimate.setTaxList(taxList.getTaxList());
		    	for (TaxDetailsList taxDetails : (taxList.getTaxList())) {
					counter=taxDetails.getCounter();
					if(counter != 0)
					{
						linkedTaxList=estimateService.editEstimateLinkedTaxDetails(id1).get(0);	 			
						salesEstimate.setLinkedTaxList(linkedTaxList.getLinkedTaxList());					
					}
				}
	    	}
	    	model.addAttribute("salesEstimatePDF" , salesEstimate);
	    	model.addAttribute("salesEstimate" , salesEstimate);    	
	    	estimatePdf.buildPdfDocument(model, doc, writer, request, response);
	    	return new ModelAndView("Sales/composeMail","composeMail",composeMail);
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
    //sendInvPdfMail
    @RequestMapping("/sendInvPdfMail")
   	public ModelAndView sendInvPdfMail(@RequestParam String custId,@RequestParam String id1,Invoice taxList,Invoice linkedTaxList,CompanyDetails companyDetails,Invoice salesInvoice,ComposeMail composeMail,ModelMap model,HttpSession session,Document doc,HttpServletRequest request,PdfWriter writer,HttpServletResponse response) throws Exception
   	{ 
    	int counter=0;
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("invoice", invoice1);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			salesInvoice=invoiceService.editInvoice(id1).get(0);
	    	model.addAttribute("compInfo", enquiryService.getInfo(companyDetails).get(0));
	    	if(invoiceService.editInvoiceTaxDetails(id1) != null)
	    	{
		    	taxList=invoiceService.editInvoiceTaxDetails(id1).get(0);
		    	salesInvoice.setTaxList(taxList.getTaxList());
		    	for (TaxDetailsList taxDetails : (taxList.getTaxList())) {
					counter=taxDetails.getCounter();
					if(counter !=0)
					{
						linkedTaxList=invoiceService.editInvoiceLinkedTaxDetails(id1).get(0);			    
					    salesInvoice.setLinkedTaxList(linkedTaxList.getLinkedTaxList());
					}
				}	
	    	}
	    	model.addAttribute("salesInvoicePDF",salesInvoice);
	    	model.addAttribute("salesInvoice",salesInvoice);    	
	    	model.addAttribute("custInfo", invoiceService.retriveCustInfo(custId,id1).get(0));
	    	salesInvoicePdf.buildPdfDocument(model, doc, writer, request, response);
	    	return new ModelAndView("Sales/composeMail","composeMail",composeMail);
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
    //sendOrdPdfMail
    @RequestMapping("/sendOrdPdfMail")
   	public ModelAndView sendOrdPdfMail(@RequestParam String custId,@RequestParam String id1,Order taxList,Order linkedTaxList,CompanyDetails companyDetails,Order salesOrder,ComposeMail composeMail,ModelMap model,HttpSession session,Document doc,HttpServletRequest request,PdfWriter writer,HttpServletResponse response) throws Exception
   	{ 
    	int counter=0;
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("salesorder", salesorder1);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			salesOrder=orderService.editOrder(id1).get(0);
		    model.addAttribute("compInfo", enquiryService.getInfo(companyDetails).get(0));
		    if(orderService.editOrderTaxDetails(id1) != null)
		    {
			    taxList=orderService.editOrderTaxDetails(id1).get(0);
		    	salesOrder.setTaxList(taxList.getTaxList());
		    	for (TaxDetailsList taxDetails : (taxList.getTaxList())) {				
		    		counter=taxDetails.getCounter();
		    		if(counter !=0)
		    		{
					    linkedTaxList=orderService.editOrderLinkedTaxDetails(id1).get(0);		   
					    salesOrder.setLinkedTaxList(linkedTaxList.getLinkedTaxList());
		    		}
		    	}
		    }
		    model.addAttribute("salesOrderPDF",salesOrder);
		    model.addAttribute("salesOrder",salesOrder);	  
		    model.addAttribute("custInfo", orderService.retriveCustInfo(custId,id1).get(0));
		    salesOrderPdf.buildPdfDocument(model, doc, writer, request, response);
	    	return new ModelAndView("Sales/composeMail","composeMail",composeMail);
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
    //sendDChlPdfMail
    @RequestMapping("/sendDChlPdfMail")
   	public ModelAndView sendDChlPdfMail(@RequestParam String custId,@RequestParam String id1,CompanyDetails companyDetails,DeliveryChallan deliveryChallan,ComposeMail composeMail,ModelMap model,HttpSession session,Document doc,HttpServletRequest request,PdfWriter writer,HttpServletResponse response) throws Exception
   	{ 
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("deliverychallan", deliverychallan1);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			deliveryChallan=deliveryChallanService.editChallan(id1).get(0);
	    	model.addAttribute("compInfo", enquiryService.getInfo(companyDetails).get(0));
	    	model.addAttribute("deliveryChallanPDF",deliveryChallan);
	    	model.addAttribute("deliveryChallan",deliveryChallan);    	
	    	model.addAttribute("custInfo", deliveryChallanService.retriveCustInfo(custId,id1).get(0));
	    	deliveryChallanPDF.buildPdfDocument(model, doc, writer, request, response);
	    	return new ModelAndView("Sales/composeMail","composeMail",composeMail);
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
    //sendRcptPdfMail
    @RequestMapping("/sendRcptPdfMail")
   	public ModelAndView sendRcptPdfMail(@RequestParam String custId,@RequestParam String id1,CompanyDetails companyDetails,Receipts salesReceipts,ComposeMail composeMail,ModelMap model,HttpSession session,Document doc,HttpServletRequest request,PdfWriter writer,HttpServletResponse response) throws Exception
   	{ 
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("receipts", receipts1);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			salesReceipts=receiptService.editReceipt(id1).get(0);
	    	model.addAttribute("compInfo", enquiryService.getInfo(companyDetails).get(0));
	    	model.addAttribute("salesReceiptsPDF", salesReceipts);
	    	model.addAttribute("salesReceipts", salesReceipts);    	
	    	model.addAttribute("custInfo", receiptService.retriveCustInfo(custId,id1).get(0));
	    	salesReceiptsPDF.buildPdfDocument(model, doc, writer, request, response);
	    	return new ModelAndView("Sales/composeMail","composeMail",composeMail);
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
    //sendMail
    @RequestMapping("/sendMail")
   	public ModelAndView sendMail(ComposeMail composeMail,String id,ModelMap model,HttpSession session)
   	{   
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			//model.addAttribute("custInfo", enquiryService.retriveCustInfo(composeMail.getCustId(), id).get(0));
	    	model.addAttribute("message",enquiryService.sendMail(composeMail));
	    	return new ModelAndView("Sales/composeMail","composeMail",composeMail);
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
    @RequestMapping("/retriveSerTaxID")
   	public ModelAndView retriveTaxID(@RequestParam String taxName,ModelMap model,HttpSession session)
   	{
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			model.addAttribute("serviceTax", estimateService.retriveTaxID(taxName));
			return new ModelAndView("Sales/retriveTax");
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
   	@RequestMapping("/retriveSLinkedTax")
   	public ModelAndView retriveLinkedTax(@RequestParam String taxId,@RequestParam int cnt, ModelMap model,HttpSession session, PurchaseQuotation purchaseQuotation)
   	{
   		//System.out.println("Tax Id="+taxId);
   		int idCounter=cnt;
   		//int staticCounter=counter;
   		//System.out.println(idCounter);
   		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{	
			model.addAttribute("sales",sales);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			model.addAttribute("linkedTaxList", estimateService.retriveLinkedtax(taxId));
			model.addAttribute("taxId", taxId);
			model.addAttribute("idCounter",idCounter);
			//model.addAttribute("staticCounter",staticCounter);
			model.addAttribute("counter", estimateService.getCounter(taxId));
			return new ModelAndView("Sales/retriveLinkedTax");
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
   	//retrieveMUnit
    @RequestMapping("/retrieveMUnit")
   	public ModelAndView retrieveMUnit(@RequestParam String productId,ModelMap model,HttpSession session)
   	{
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
	    	model.addAttribute("unitofmeasure",enquiryService.retriveMUnit(productId));
	    	return new ModelAndView("Sales/retriveMUnit");
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
   	//retriveInvBal
    @RequestMapping("/retriveInvBal")
   	public ModelAndView retriveInvBal(@RequestParam String invoiceId,ModelMap model,HttpSession session)
   	{
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
	    	model.addAttribute("retriveInvBal",receiptService.retriveInvBal(invoiceId));
	    	return new ModelAndView("Sales/retriveInvBal");
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
    //retriveAccount
    @RequestMapping("/retriveAccount")
   	public ModelAndView retriveAccount(@RequestParam String invoiceId,ModelMap model,HttpSession session)
   	{
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
	    	model.addAttribute("retriveAccount",receiptService.retriveAccount(invoiceId));
	    	return new ModelAndView("Sales/retriveAccount");
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
    //retriveToAccount.do?paymentMode
    @RequestMapping("/retriveToAccount")
   	public ModelAndView retriveToAccount(@RequestParam String paymentMode,ModelMap model,HttpSession session)
   	{
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
	    	model.addAttribute("retriveToAccount",receiptService.retriveToAccount(paymentMode));
	    	return new ModelAndView("Sales/retriveToAccount");
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
    //retrieveUnitPrice
    @RequestMapping("/retrieveUnitPrice")
   	public ModelAndView retrieveUnitPrice(@RequestParam String productId,ModelMap model,HttpSession session)
   	{
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
	    	model.addAttribute("unitPrice",estimateService.retriveUnitPrice(productId));
	    	return new ModelAndView("Sales/retrieveUnitPrice");
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
    //receivedPaymentHistory.do?invoiceId receivedPaymentHistory
    @RequestMapping("/receivedPaymentHistory")
   	public ModelAndView receivedPaymentHistory(@RequestParam String invoiceId,Receipts salesReceipt,ModelMap model,HttpSession session)
   	{
    	String resp="blank";
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			model.addAttribute("receiptsList",invoiceService.showReceipts(invoiceId));
			if(invoiceService.showReceipts(invoiceId) == null)
			{				
				model.addAttribute("resp",resp);
			}
			else
			{
				salesReceipt=invoiceService.showReceipts(invoiceId).get(0);
			}
	    	return new ModelAndView("Sales/receivedPaymentHistory","salesReceipt",salesReceipt);
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
    //retriveInvProducts.do?invoiceId
    @RequestMapping("/retriveInvProducts")
   	public ModelAndView retriveInvProducts(@RequestParam String invoiceId,HttpServletRequest request,ModelMap model,HttpSession session)
   	{
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("invoice", invoice1);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
		    model.addAttribute("invProductList",invoiceService.retriveInvDetails(invoiceId));
		    model.addAttribute("deliProdList",deliveryChallanService.retriveProductList());
	   		return new ModelAndView("Sales/retriveInvDetails");
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
    //retriveCustomerName.do?invoiceId
    @RequestMapping("/retriveCustomerName")
   	public ModelAndView retriveCustomerName(@RequestParam String invoiceId,HttpServletRequest request,ModelMap model,HttpSession session)
   	{
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Sales"))
		{
			model.addAttribute("sales",sales);
			model.addAttribute("invoice", invoice1);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
		    model.addAttribute("cName",invoiceService.retriveCustomerName(invoiceId));
		    model.addAttribute("customerList", deliveryChallanService.retriveCustomerList());
	   		return new ModelAndView("Sales/retriveCustomerName");
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
}