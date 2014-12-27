package com.invoice.controller;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.invoice.accounting.beans.JournalHeader;
import com.invoice.company.beans.CompanyDetails;
import com.invoice.login.beans.Login;
import com.invoice.login.service.LoginUserService;
import com.invoice.purchase.beans.ComposeMail;
import com.invoice.purchase.beans.PurchaseEnquiry;
import com.invoice.purchase.beans.PurchaseEnquiryDetails;
import com.invoice.purchase.beans.PurchaseOrder;
import com.invoice.purchase.beans.PurchaseQuotation;
import com.invoice.purchase.beans.PurchaseVoucher;
import com.invoice.purchase.beans.Purchases;
import com.invoice.purchase.beans.Vender;
import com.invoice.purchase.beans.purchaseDetails;
import com.invoice.purchase.service.EnquiryService;
import com.invoice.purchase.service.PurchaseEnquiryPdf;
import com.invoice.purchase.service.PurchaseOrderPDF;
import com.invoice.purchase.service.PurchaseOrderService;
import com.invoice.purchase.service.PurchaseQuotationPdf;
import com.invoice.purchase.service.PurchaseService;
import com.invoice.purchase.service.PurchaseVoucherPdf;
import com.invoice.purchase.service.PurchasesPDF;
import com.invoice.purchase.service.QuotationService;
import com.invoice.purchase.service.VoucherService;
import com.invoice.purchase.service.venderService;
import com.invoice.sales.beans.TaxDetailsList;
import com.itextpdf.text.Document;
import com.itextpdf.text.pdf.PdfWriter;


@Controller
public class purchaseContoller {
	
	
	/* Autowired Start */
	HttpServletRequest request;	
	EnquiryService purchaseEnquiryService;
	PurchaseService purchaseService;
	JdbcTemplate jdbcTemplate;
	@Autowired
	PurchaseEnquiryPdf purchaseEnquiryPdf;
	@Autowired
	PurchaseQuotationPdf purchaseQuotationPdf;
	@Autowired
	PurchaseOrderPDF purchaseOrderPDF;
	@Autowired
	PurchasesPDF purchasesPDF;
	@Autowired
	PurchaseVoucherPdf voucherPdf;
	
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	@Autowired
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	public PurchaseService getPurchaseService() {
		return purchaseService;
	}
	@Autowired
	public void setPurchaseService(PurchaseService purchaseService) {
		this.purchaseService = purchaseService;
	}
	PurchaseEnquiry purchaseEnq=new PurchaseEnquiry();
	public EnquiryService getPurchaseEnquiryService() {
		return purchaseEnquiryService;
	}
	@Autowired
	public void setPurchaseEnquiryService(EnquiryService purchaseEnquiryService) {
		this.purchaseEnquiryService = purchaseEnquiryService;
	}
	QuotationService purchaseQuotationService;	
	public QuotationService getPurchaseQuotationService() {
		return purchaseQuotationService;
	}
	@Autowired
	public void setPurchaseQuotationService(
			QuotationService purchaseQuotationService) {
		this.purchaseQuotationService = purchaseQuotationService;
	}
	@Autowired
	PurchaseOrderService pOrderService;
	String purchase = "purchase";
	String vendor = "vendor";
	String enquiry = "enquiry";
	String quotation = "quotation";
	String order = "order";
	String purchases1 = "purchases1";
	String voucher = "voucher";
	/*public PurchaseOrderService getOrderService() {
		return pOrderService;
	}
	@Autowired
	public void setOrderService(PurchaseOrderService orderService) {
		this.pOrderService = orderService;
	}*/
	VoucherService voucherService;
	public VoucherService getVoucherService() {
		return voucherService;
	}
	@Autowired
	public void setVoucherService(VoucherService voucherService) {
		this.voucherService = voucherService;
	}
	venderService pVenderService;	
	public venderService getpVenderService() {
		return pVenderService;
	}
	@Autowired
	public void setpVenderService(venderService pVenderService) {
		this.pVenderService = pVenderService;
	}
	@Autowired
	LoginUserService lus;
	/* Autowired End */
	
	/* Show Forms Starts */
		
	
	/* Show Forms Starts */
	@RequestMapping(value="/purchase")
	public ModelAndView showPurchase(PurchaseEnquiry purchaseEnquiry,ModelMap model,HttpSession session)
	{ 
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Purchase"))
		{
			model.addAttribute("purchase",purchase);	
			model.addAttribute("vendor", vendor);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			model.addAttribute("venderList", pVenderService.showCustomer());
			return new ModelAndView("Purchase/showVender");
		}
		else{
			model.addAttribute("purchase",purchase);
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
	@RequestMapping(value="/purchaseEnquiry")
	public ModelAndView showEnquiry(PurchaseEnquiry purchaseEnquiry,ModelMap model,HttpSession session)
	{
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{
			if(lus.authontication(l,"Purchase"))
			{
				model.addAttribute("purchase",purchase);	
				model.addAttribute("enquiry", enquiry);
				model.addAttribute("userName",l.getUname());
				model.addAttribute("userId",l.getEmpUserId());
				model.addAttribute("enquiryList", purchaseEnquiryService.showEnquiry());		
				return new ModelAndView("Purchase/ShowEnquiry","PurchaseEnquiry",purchaseEnquiry);
			}
			else
			{
				model.addAttribute("purchase",purchase);			
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
	@RequestMapping(value="/purchaseQuotation") 
	public ModelAndView showQuotation(PurchaseQuotation purchaseQuotation,ModelMap model,HttpSession session)
	{
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{
			if(lus.authontication(l,"Purchase"))
			{		
				model.addAttribute("purchase",purchase);
				model.addAttribute("quotation", quotation);
				model.addAttribute("userName",l.getUname());
				model.addAttribute("userId",l.getEmpUserId());
				model.addAttribute("quoationLIst", purchaseQuotationService.showQuotation());
				return new ModelAndView("Purchase/ShowQuotations","PurchaseQuotation",purchaseQuotation);
			}
			else
			{
				model.addAttribute("purchase",purchase);			
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
	@RequestMapping(value="/purchaseOrder")
	public ModelAndView showOrder(PurchaseOrder purchaseOrder,HttpServletRequest request,ModelMap model,HttpSession session)
	{		
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{			
			if(lus.authontication(l,"Purchase"))
			{
				model.addAttribute("purchase",purchase);	
				model.addAttribute("order", order);
				model.addAttribute("userName",l.getUname());
				model.addAttribute("userId",l.getEmpUserId());
				model.addAttribute("orderList", pOrderService.showOrder());		
				return new ModelAndView("Purchase/ShowOrders","purchaseOrder",purchaseOrder);
			}
			else
			{
				model.addAttribute("purchase",purchase);			
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
	//purchases
	@RequestMapping(value="/purchases")
	public ModelAndView showpurchases(Purchases purchases,HttpServletRequest request,ModelMap model,HttpSession session)
	{		
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{			
			if(lus.authontication(l,"Purchase"))
			{
				//String yes = "yes", no = "no";
				model.addAttribute("purchase",purchase);		
				model.addAttribute("purchases1", purchases1);
				model.addAttribute("userName",l.getUname());
				model.addAttribute("userId",l.getEmpUserId());
				model.addAttribute("purchaseList", purchaseService.showPurchases());			    
				return new ModelAndView("Purchase/showPurchases","purchases",purchases);
			}
			else{
				model.addAttribute("purchase",purchase);			
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
	@RequestMapping(value="purchaseVoucher")
	public ModelAndView showVoucher(PurchaseVoucher purchaseVoucher,ModelMap model,HttpSession session)
	{
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{if(lus.authontication(l,"Purchase"))
		{
			model.addAttribute("purchase",purchase);	
			model.addAttribute("voucher", voucher);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			model.addAttribute("voucherList", voucherService.showVoucher());
			return new ModelAndView("Purchase/showVoucher","purchasevoucher",purchaseVoucher);
		}
		else{
			model.addAttribute("purchase",purchase);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("msg","<script>alert('Access Denied');</script>");
			return new ModelAndView("index");
		}
		}
		else
		{
			return new ModelAndView("Login");
		}
	}
	@RequestMapping(value="/purchaseVender")
	public ModelAndView showVender(Vender ve,ModelMap model,HttpSession session) 
	{
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{if(lus.authontication(l,"Purchase"))
		{
			model.addAttribute("purchase",purchase);
			model.addAttribute("vendor", vendor);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
		model.addAttribute("venderList", pVenderService.showCustomer());
		return new ModelAndView("Purchase/showVender");
		}
		else{
			model.addAttribute("purchase",purchase);			
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
	/* Show Forms End */
	
	/* New Forms Starts */
	@RequestMapping(value="/NewPurchaseEnquiry", method=RequestMethod.GET)
	public ModelAndView createEnquiry(PurchaseEnquiry pEnquiry,ModelMap model,HttpSession session)
	{
		//pEnquiry = purchaseEnquiryService.autoID();
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{if(lus.authontication(l,"Purchase"))
		{
			model.addAttribute("purchase",purchase);
			model.addAttribute("enquiry", enquiry);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			model.addAttribute("enqID",purchaseEnquiryService.autoID());
			model.addAttribute("productList",purchaseEnquiryService.showProduct());		
			model.addAttribute("venderList", purchaseEnquiryService.showVenders());
			return new ModelAndView("Purchase/PurchaseEnquiry","purchaseEnquiry",pEnquiry);
		}
		else{
			model.addAttribute("purchase",purchase);			
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
	@RequestMapping(value="/NewPurchaseQuotation", method=RequestMethod.GET)
	public ModelAndView createQuotation(PurchaseQuotation purchaseQuotation,ModelMap model,HttpSession session)
	{
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{if(lus.authontication(l,"Purchase"))
		{
			model.addAttribute("purchase",purchase);
			model.addAttribute("quotation", quotation);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			purchaseQuotation.setCreatedBy(l.getEmpUserId());			
			model.addAttribute("vatName", purchaseQuotationService.retriveVat());
		    model.addAttribute("service", purchaseQuotationService.retriveService());
			model.addAttribute("productList",purchaseQuotationService.showProduct());
			model.addAttribute("quotationId",purchaseQuotationService.autoId());
			model.addAttribute("taxList",purchaseQuotationService.showTaxes());			
			model.addAttribute("venderList", purchaseQuotationService.showVenders());		
			return new ModelAndView("Purchase/PurchaseQuotation","purchaseQuotation",purchaseQuotation);
		}
		else{
			model.addAttribute("purchase",purchase);			
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
	@RequestMapping(value="/NewPurchaseOrder", method=RequestMethod.GET)
	public ModelAndView createOrder(PurchaseOrder purchaseOrder,ModelMap model,HttpSession session)
	{	
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{if(lus.authontication(l,"Purchase"))
		{
			model.addAttribute("purchase",purchase);	
			model.addAttribute("order", order);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			model.addAttribute("vatName", pOrderService.retriveVat());
	    	model.addAttribute("service", pOrderService.retriveService());
			model.addAttribute("productList",pOrderService.showProduct());
			model.addAttribute("orderId", pOrderService.autoId());
			model.addAttribute("taxList",pOrderService.showTaxes());
			//purchaseOrder = pOrderService.autoId();
			model.addAttribute("venderList", pOrderService.showVenders());
			model.addAttribute("journalID", pOrderService.generateId());
			return new ModelAndView("Purchase/PurchaseOrder","purchaseOrder",purchaseOrder);
		}
		else{
			model.addAttribute("purchase",purchase);			
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
	//newPurchase
	@RequestMapping(value="/newPurchase", method=RequestMethod.GET)
	public ModelAndView newPurchase(Purchases purchases,ModelMap model,HttpSession session)
	{	
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{if(lus.authontication(l,"Purchase"))
		{
			model.addAttribute("purchase",purchase);	
			model.addAttribute("purchases1",purchases1);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			purchases=purchaseService.generateId();
			model.addAttribute("productList",purchaseService.showProduct());
			model.addAttribute("taxList",purchaseService.showTaxes());			
			model.addAttribute("venderList", purchaseService.showVenders());
			return new ModelAndView("Purchase/newPurchase","purchases",purchases);
		}
		else{
			model.addAttribute("purchase",purchase);			
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
	
	@RequestMapping(value="/NewPurchaseVoucher", method=RequestMethod.GET)
	public ModelAndView createVoucher(PurchaseVoucher purchaseVoucher,ModelMap model,HttpSession session)
	{	
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{if(lus.authontication(l,"Purchase"))
		{
			model.addAttribute("purchase",purchase);	
			model.addAttribute("voucher", voucher);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			model.addAttribute("accountList",voucherService.showAccountNo());
			model.addAttribute("voucherId", voucherService.autoId());
			//purchaseVoucher = voucherService.autoId();
			model.addAttribute("purchaseList", voucherService.showPurchaseId());			
			return new ModelAndView("Purchase/PurchaseVoucher","purchaseVoucher",purchaseVoucher);
		}
		else{
			model.addAttribute("purchase",purchase);			
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
	@RequestMapping(value="/NewVender")
	public ModelAndView createVender(Vender vender,ModelMap model,HttpSession session)
	{
		//model.addAttribute("venderId",pVenderService.auto());
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{if(lus.authontication(l,"Purchase"))
		{
			model.addAttribute("purchase",purchase);
			model.addAttribute("vendor", vendor);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			vender = pVenderService.auto();
			return new ModelAndView("Purchase/NewVender","createvender",vender);
		}
		else{
			model.addAttribute("purchase",purchase);			
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
	/* New Forms End */
	
	/* Add Operation Starts*/
	@RequestMapping(value="/addPurchaseEnquiry")
	public ModelAndView addEnquiry(PurchaseEnquiry purchaseEnquiry,HttpServletRequest request,ModelMap model,HttpSession session)
	{
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{if(lus.authontication(l,"Purchase"))
		{
			int i=0;
			int message = 0;
			model.addAttribute("purchase",purchase);
			model.addAttribute("enquiry", enquiry);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			purchaseEnquiry.setCreatedBy(l.getEmpUserId());
			i=purchaseEnquiryService.saveEquiry(purchaseEnquiry);
			if(i>=1)
			{
				message=1;
				model.addAttribute("message", message);
				model.addAttribute("msg", purchaseEnquiryService.ShowAdd());
			}
			else
			{
				message=0;
				model.addAttribute("message", message);
				model.addAttribute("msg", purchaseEnquiryService.ShowNotAdd());
			}
			
			/*purchaseEnquiry=purchaseEnquiryService.view(purchaseEnquiry.getEnqID()).get(0);
			request.getSession().setAttribute("purchaseEnquiry", purchaseEnquiry);*/
			model.addAttribute("enquiryList", purchaseEnquiryService.showEnquiry());		
			return new ModelAndView("Purchase/ShowEnquiry","PurchaseEnquiry",purchaseEnquiry);
		}
		else{
			model.addAttribute("purchase",purchase);			
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
	@RequestMapping(value="/addPurchaseQuotation")
	public ModelAndView addQuotation(PurchaseQuotation purchaseQuotation,PurchaseQuotation taxList,PurchaseQuotation linkedTaxList,HttpServletRequest request,ModelMap model,HttpSession session)
	{
		int i=0;
		int message=0;
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{if(lus.authontication(l,"Purchase"))
		{
			model.addAttribute("purchase",purchase);	
			model.addAttribute("quotation", quotation);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			purchaseQuotation.setCreatedBy(l.getEmpUserId());
			i=purchaseQuotationService.saveQuotation(purchaseQuotation);
			if(i>=1)
			{
				message=1;
				model.addAttribute("message", message);
				model.addAttribute("msg", purchaseEnquiryService.ShowAdd());
			}
			else
			{
				message=0;
				model.addAttribute("message", message);
				model.addAttribute("msg", purchaseEnquiryService.ShowNotAdd());
			}
			/*purchaseQuotation = purchaseQuotationService.viewQuotaion(purchaseQuotation.getTxyQuotationNo()).get(0);			
			taxList=purchaseQuotationService.editPurQuotTaxDetails(purchaseQuotation.getTxyQuotationNo()).get(0);
			purchaseQuotation.setTaxList(taxList.getTaxList());
			for (TaxDetailsList taxDetails : (taxList.getTaxList())) {
				counter=taxDetails.getCounter();
				if(counter != 0)
				{
				    linkedTaxList=purchaseQuotationService.editPurQuotLinkedTaxDetails(purchaseQuotation.getTxyQuotationNo()).get(0);		    
				    purchaseQuotation.setLinkedTaxList(linkedTaxList.getLinkedTaxList());
				}
			}*/
			request.getSession().setAttribute("purchaseQuotation", purchaseQuotation);
			model.addAttribute("quoationLIst", purchaseQuotationService.showQuotation());
			return new ModelAndView("Purchase/ShowQuotations","PurchaseQuotation",purchaseQuotation);
		}
		else{
			model.addAttribute("purchase",purchase);			
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
	@RequestMapping(value="/addPurchaseOrder")
	public ModelAndView addOrder(PurchaseOrder purchaseOrder,JournalHeader journalHeader,HttpServletRequest request,ModelMap model,HttpSession session)
	{
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{if(lus.authontication(l,"Purchase"))
		{
			int i=0,message=0;
			model.addAttribute("purchase",purchase);
			model.addAttribute("order", order);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			purchaseOrder.setCreatedBy(l.getEmpUserId());
			i=pOrderService.saveOrder(purchaseOrder, journalHeader);
			if(i>=1)
			{
				message=1;
				model.addAttribute("message", message);
				model.addAttribute("msg", purchaseEnquiryService.ShowAdd());
			}
			else
			{
				message=0;
				model.addAttribute("message", message);
				model.addAttribute("msg", purchaseEnquiryService.ShowNotAdd());
			}
			model.addAttribute("journalID", pOrderService.generateId());
			//purchaseOrder = pOrderService.viewOrder(purchaseOrder.getTxtPurchaseOrdNo()).get(0);
			request.getSession().setAttribute("purchaseOrder",purchaseOrder);
			model.addAttribute("orderList", pOrderService.showOrder());		
			return new ModelAndView("Purchase/ShowOrders","purchaseOrder",purchaseOrder);
		}
		else{
			model.addAttribute("purchase",purchase);			
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
	//addPurchase
	@RequestMapping(value="/addPurchase")
	public ModelAndView addPurchase(Purchases purchases,Purchases taxList,Purchases linkedTaxList,HttpServletRequest request,ModelMap model,HttpSession session)
	{
		//int counter=0;
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{if(lus.authontication(l,"Purchase"))
		{
			model.addAttribute("purchase",purchase);	
			model.addAttribute("purchases1", purchases1);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			purchases.setCreatedBy(l.getEmpUserId());
			int i=0,message=0;
			i=purchaseService.save(purchases);
			if(i>=1)
			{
				message=1;
				model.addAttribute("message", message);
				model.addAttribute("msg", purchaseEnquiryService.ShowAdd());
			}
			else
			{
				message=0;
				model.addAttribute("message", message);
				model.addAttribute("msg", purchaseEnquiryService.ShowNotAdd());
			}
			/*purchases = purchaseService.editPurchase(purchases.getTxtPurchaseNo()).get(0);
			taxList=purchaseService.editPurTaxDetails(purchases.getTxtPurchaseNo()).get(0);
			purchases.setTaxList(taxList.getTaxList());
			for (TaxDetailsList taxDetails : (taxList.getTaxList())) {
				counter=taxDetails.getCounter();
				if(counter != 0)
				{
				    linkedTaxList=purchaseService.editPurLinkedTaxDetails(purchases.getTxtPurchaseNo()).get(0);		    
				    purchases.setLinkedTaxList(linkedTaxList.getLinkedTaxList());
				}
			}*/
			request.getSession().setAttribute("purchases",purchases);
			 model.addAttribute("purchaseList", purchaseService.showPurchases());		
				return new ModelAndView("Purchase/showPurchases","purchases",purchases);
		}
		else{
			model.addAttribute("purchase",purchase);			
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
	//viewPurchases
	@RequestMapping(value="/viewPurchases")
	public ModelAndView viewPurchases(@RequestParam String purchaseId,Purchases purchases,Purchases taxList,Purchases linkedTaxList,HttpServletRequest request,ModelMap model,HttpSession session)
	{
		int counter=0;
		String bln ="blank", yes = "yes", no = "no";
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{	if(lus.authontication(l,"Purchase"))
		{
			model.addAttribute("purchase",purchase);	
			model.addAttribute("purchases1", purchases1);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			purchases = purchaseService.editPurchase(purchaseId).get(0);
			if(purchaseService.editPurTaxDetails(purchaseId)!=null)
			{
				taxList=purchaseService.editPurTaxDetails(purchaseId).get(0);
				purchases.setTaxList(taxList.getTaxList());
			}
			else
			{
				model.addAttribute("bln", bln);
			}
			
			for (TaxDetailsList taxDetails : (taxList.getTaxList())) {
				counter=taxDetails.getCounter();
				if(counter != 0)
				{
				    linkedTaxList=purchaseService.editPurLinkedTaxDetails(purchaseId).get(0);		    
				    purchases.setLinkedTaxList(linkedTaxList.getLinkedTaxList());
				}
			}
			request.getSession().setAttribute("purchases",purchases);
			if(yes.equalsIgnoreCase(purchases.getPayamtYes()))
			{				
				model.addAttribute("yes", yes);
			}
			else
			{
				no = purchases.getPayamtNo();
				model.addAttribute("no", no);
			}
			return new ModelAndView("Purchase/viewPurchase","purchases",purchases);
		}
		else{
			model.addAttribute("purchase",purchase);			
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
//	/editPurchases
	@RequestMapping(value="/editPurchases")
	public ModelAndView editPurchases(@RequestParam String purchaseId,Purchases purchases,Purchases taxList,Purchases linkedTaxList,HttpServletRequest request,ModelMap model,HttpSession session)
	{
		int counter=0;
		String bln = "blank";
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{	if(lus.authontication(l,"Purchase"))
		{	
			model.addAttribute("purchase",purchase);
			model.addAttribute("purchases1", purchases1);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			purchases = purchaseService.editPurchase(purchaseId).get(0);
			if(purchaseService.editPurTaxDetails(purchaseId)!=null)
			{
				taxList=purchaseService.editPurTaxDetails(purchaseId).get(0);
				purchases.setTaxList(taxList.getTaxList());
			}
			else
			{
				model.addAttribute("bln", bln);
			}
			
			for (TaxDetailsList taxDetails : (taxList.getTaxList())) {
				counter=taxDetails.getCounter();
				if(counter != 0)
				{
				    linkedTaxList=purchaseService.editPurLinkedTaxDetails(purchaseId).get(0);		    
				    purchases.setLinkedTaxList(linkedTaxList.getLinkedTaxList());
				}
			}
			model.addAttribute("productList",purchaseService.showProduct());
			model.addAttribute("taxList",purchaseService.showTaxes());			
			model.addAttribute("venderList", purchaseService.showVenders());
			//request.getSession().setAttribute("purchases",purchases);
			return new ModelAndView("Purchase/editPurchase","purchases",purchases);
		}
		else{
			model.addAttribute("purchase",purchase);			
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
	//updatePurchase
	@RequestMapping(value="/updatePurchase")
	public ModelAndView updatePurchase(Purchases purchases,Purchases taxList,Purchases linkedTaxList,HttpServletRequest request,ModelMap model,HttpSession session)
	{
		//int counter=0;
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{		if(lus.authontication(l,"Purchase"))
		{	
			model.addAttribute("purchase",purchase);	
			model.addAttribute("purchases1", purchases1);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			purchases.setUpdatedBy(l.getEmpUserId());
			int i=0,update=0;
			i=purchaseService.updatePurchase(purchases);
			if(i>=1)
			{
				update=1;
				model.addAttribute("update", update);
				model.addAttribute("msg", purchaseEnquiryService.ShowUpdate());
			}
			else
			{
				update=0;
				model.addAttribute("update", update);
				model.addAttribute("msg", purchaseEnquiryService.ShowNotUpdate());
			}
			/*taxList=purchaseService.editPurTaxDetails(purchases.getTxtPurchaseNo()).get(0);
			purchases.setTaxList(taxList.getTaxList());
			for (TaxDetailsList taxDetails : (taxList.getTaxList())) {
				counter=taxDetails.getCounter();
				if(counter != 0)
				{
				    linkedTaxList=purchaseService.editPurLinkedTaxDetails(purchases.getTxtPurchaseNo()).get(0);		    
				    purchases.setLinkedTaxList(linkedTaxList.getLinkedTaxList());
				}
			}*/
			request.getSession().setAttribute("purchases",purchases);
			 model.addAttribute("purchaseList", purchaseService.showPurchases());		
				return new ModelAndView("Purchase/showPurchases","purchases",purchases);
		}
		else{
			model.addAttribute("purchase",purchase);			
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
	//deletePurchases
	@RequestMapping(value="/deletePurchases")
	public ModelAndView deletePurchases(@RequestParam String purchaseId,@RequestParam float amt,Purchases purchases,HttpServletRequest request,ModelMap model,HttpSession session)
	{		
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{if(lus.authontication(l,"Purchase"))
		{
			model.addAttribute("purchase",purchase);	
			model.addAttribute("purchases1", purchases1);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			int i=0,delete=0;
			i=purchaseService.delete(purchaseId,amt);
			if(i>=1)
			{
				delete=1;
				model.addAttribute("delete", delete);
				model.addAttribute("msg", purchaseEnquiryService.ShowDelete());
			}
			else
			{
				delete=0;
				model.addAttribute("delete", delete);
				model.addAttribute("msg", purchaseEnquiryService.ShowNotDelete());
			}
		    model.addAttribute("purchaseList", purchaseService.showPurchases());		
			return new ModelAndView("Purchase/showPurchases","purchases",purchases);
		}
		else{
			model.addAttribute("purchase",purchase);			
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
	@RequestMapping(value="/addVoucher")
	public ModelAndView addVoucher(PurchaseVoucher purchaseVoucher,ModelMap model,HttpSession session)
	{
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{if(lus.authontication(l,"Purchase"))
		{
			model.addAttribute("purchase",purchase);
			
			model.addAttribute("userName",l.getUname());
			model.addAttribute("voucher", voucher);
			model.addAttribute("userId",l.getEmpUserId());
			purchaseVoucher.setCreadtedBy(l.getEmpUserId());
			int i=0,message=0;
			i=voucherService.saveVoucher(purchaseVoucher);
			if(i>=1)
			{
				message=1;
				model.addAttribute("message", message);
				model.addAttribute("msg", purchaseEnquiryService.ShowAdd());
			}
			else
			{
				message=0;
				model.addAttribute("message", message);
				model.addAttribute("msg", purchaseEnquiryService.ShowNotAdd());
			}
		//	purchaseVoucher = voucherService.viewEnquiry(purchaseVoucher.getVoucherNo()).get(0);
			model.addAttribute("voucherList", voucherService.showVoucher());
			return new ModelAndView("Purchase/showVoucher","purchasevoucher",purchaseVoucher);
		}
		else{
			model.addAttribute("purchase",purchase);			
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
	@RequestMapping(value="/addVender")
	public ModelAndView addVender(Vender vender,ModelMap model,HttpSession session)
	{	
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{if(lus.authontication(l,"Purchase"))
		{
			model.addAttribute("purchase",purchase);	
			model.addAttribute("vendor", vendor);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			int i=0,message=0;
			i=pVenderService.saveVender(vender);
			if(i>=1)
			{
				message=1;
				model.addAttribute("message", message);
				model.addAttribute("msg", purchaseEnquiryService.ShowAdd());
			}
			else
			{
				message=0;
				model.addAttribute("message", message);
				model.addAttribute("msg", purchaseEnquiryService.ShowNotAdd());
			}
			//vender = pVenderService.viewVender(vender.getTxtCustID()).get(0);	
			model.addAttribute("venderList", pVenderService.showCustomer());
			return new ModelAndView("Purchase/showVender","viewvender",vender);			
		}
		else
		{
			model.addAttribute("purchase",purchase);			
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
	/* Add Operation End */
	
	/* View Forms Starts */ 
	@RequestMapping(value="/pViewEnquiry")
	public ModelAndView viewEnquiry(@RequestParam String enquiryId,HttpServletRequest request,PurchaseEnquiry purchaseEnquiry,ModelMap model,HttpSession session)
	{
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{if(lus.authontication(l,"Purchase"))
		{
			model.addAttribute("purchase",purchase);	
			model.addAttribute("enquiry", enquiry);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
		purchaseEnquiry=purchaseEnquiryService.view(enquiryId).get(0);
		request.getSession().setAttribute("purchaseEnquiry", purchaseEnquiry);
		return new ModelAndView("Purchase/viewEnquiry","viewenquiry",purchaseEnquiry);
		}
		else{
			model.addAttribute("purchase",purchase);			
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
	@RequestMapping(value="/viewQuotation")
	public ModelAndView viewQuotation(@RequestParam String quoationId,PurchaseQuotation taxList,PurchaseQuotation linkedTaxList,HttpServletRequest request,PurchaseQuotation purchaseQuotation,ModelMap model,HttpSession session)
	{
		String bln ="blank";
		int counter=0;
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{if(lus.authontication(l,"Purchase"))
		{
			model.addAttribute("purchase",purchase);
			model.addAttribute("quotation", quotation);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
		purchaseQuotation = purchaseQuotationService.viewQuotaion(quoationId).get(0);
		if(purchaseQuotationService.editPurQuotTaxDetails(quoationId)!=null)
		{
		taxList=purchaseQuotationService.editPurQuotTaxDetails(quoationId).get(0);
		purchaseQuotation.setTaxList(taxList.getTaxList());
		}
		else
		{
			model.addAttribute("bln", bln);
		}
		/*taxList=purchaseQuotationService.editPurQuotTaxDetails(quoationId).get(0);
		purchaseQuotation.setTaxList(taxList.getTaxList());*/
		for (TaxDetailsList taxDetails : (taxList.getTaxList())) {
			counter=taxDetails.getCounter();
			if(counter != 0)
			{
			    linkedTaxList=purchaseQuotationService.editPurQuotLinkedTaxDetails(quoationId).get(0);		    
			    purchaseQuotation.setLinkedTaxList(linkedTaxList.getLinkedTaxList());
			}
		}
		request.getSession().setAttribute("purchaseQuotation", purchaseQuotation);
		return new ModelAndView("Purchase/viewQuotation","viewquotation",purchaseQuotation);
		}
		else{
			model.addAttribute("purchase",purchase);			
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
	@RequestMapping(value="/pViewOrder") 
	public ModelAndView viewPOrder(@RequestParam String orderID,HttpServletRequest request,PurchaseOrder taxList,PurchaseOrder linkedTaxList,PurchaseOrder purchaseOrder,ModelMap model,HttpSession session)
	{
		int counter=0;
		String bln ="blank";
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{
		if(lus.authontication(l,"Purchase"))
		{
			model.addAttribute("purchase",purchase);	
			model.addAttribute("order", order);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			purchaseOrder = pOrderService.editOrder(orderID).get(0);
			if(pOrderService.editPurOrdTaxDetails(orderID)!= null)
			{
				taxList=pOrderService.editPurOrdTaxDetails(orderID).get(0);
				purchaseOrder.setTaxList(taxList.getTaxList()); 
			}
			else
			{
				model.addAttribute("bln", bln);
			}
			/*taxList=pOrderService.editPurOrdTaxDetails(orderID).get(0);
			purchaseOrder.setTaxList(taxList.getTaxList());*/			
			for (TaxDetailsList taxDetailsList : (taxList.getTaxList())) {
				counter=taxDetailsList.getCounter();
				if(counter != 0)
				{
					linkedTaxList=pOrderService.editPurOrdLinkedTaxDetails(orderID).get(0);
					purchaseOrder.setLinkedTaxList(linkedTaxList.getLinkedTaxList());
				}
			}			
			request.getSession().setAttribute("purchaseOrder",purchaseOrder); 
			return new ModelAndView("Purchase/viewOrder","vieweorder",purchaseOrder);
		}
		else{
			model.addAttribute("purchase",purchase);			
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
	@RequestMapping(value="viewVoucher")
	public ModelAndView viewVoucher(@RequestParam String voucherNo,PurchaseVoucher purchaseVoucher,ModelMap model,HttpSession session)
	{
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{if(lus.authontication(l,"Purchase"))
		{
			model.addAttribute("purchase",purchase);	
			model.addAttribute("voucher", voucher);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			purchaseVoucher = voucherService.viewEnquiry(voucherNo).get(0);	
			return new ModelAndView("Purchase/viewVoucher","viewvoucher",purchaseVoucher);
		}
		else{
			model.addAttribute("purchase",purchase);			
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
	@RequestMapping(value="viewVender")
	public ModelAndView viewVender(@RequestParam String venderNo,Vender vender,ModelMap model,HttpSession session)
	{
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{if(lus.authontication(l,"Purchase"))
		{
			model.addAttribute("purchase",purchase);	
			model.addAttribute("vendor", vendor);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
		vender = pVenderService.viewVender(venderNo).get(0);	
		return new ModelAndView("Purchase/viewVender","viewvender",vender);
		}
		else{
			model.addAttribute("purchase",purchase);			
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
	
	/* View Forms End */
	
	/* Edit Forms Starts */
	@RequestMapping(value="/editPurchaseEnquiry")
	public ModelAndView editEnquiry(@RequestParam String enquiryId,PurchaseEnquiry purchaseEnquiry,ModelMap model,HttpSession session)
	{	
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{if(lus.authontication(l,"Purchase"))
		{
			model.addAttribute("purchase",purchase);	
			model.addAttribute("enquiry", enquiry);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			purchaseEnquiry=purchaseEnquiryService.view(enquiryId).get(0);
			model.addAttribute("productList",purchaseEnquiryService.showProduct());
			model.addAttribute("venderList", purchaseEnquiryService.showVenders());
			return new ModelAndView("Purchase/editEnquiry","editEnquiry",purchaseEnquiry);
		}
		else{
			model.addAttribute("purchase",purchase);			
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
	@RequestMapping(value="/editQuotation")
	public ModelAndView editQuotaion(@RequestParam String quoationId,PurchaseQuotation taxList,PurchaseQuotation linkedTaxList,PurchaseQuotation purchaseQuotation,ModelMap model,HttpSession session)
	{
		int counter=0;
		String bln = "blank";
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{if(lus.authontication(l,"Purchase"))
		{
			model.addAttribute("purchase",purchase);	
			model.addAttribute("quotation", quotation);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			purchaseQuotation = purchaseQuotationService.viewQuotaion(quoationId).get(0);
			model.addAttribute("vatName", purchaseQuotationService.retriveVat());
	    	model.addAttribute("service", purchaseQuotationService.retriveService());
			model.addAttribute("pList",purchaseQuotationService.showProduct());  
			model.addAttribute("venderList", purchaseQuotationService.showVenders());
			model.addAttribute("taxList",purchaseQuotationService.showTaxes());
			if(purchaseQuotationService.editPurQuotTaxDetails(quoationId)!=null)
			{
			taxList=purchaseQuotationService.editPurQuotTaxDetails(quoationId).get(0);
			purchaseQuotation.setTaxList(taxList.getTaxList());
			}
			else
			{
				model.addAttribute("bln", bln);
			}
			for (TaxDetailsList taxDetails : (taxList.getTaxList())) {
			counter=taxDetails.getCounter();
			if(counter != 0)
			{
			    linkedTaxList=purchaseQuotationService.editPurQuotLinkedTaxDetails(quoationId).get(0);		    
			    purchaseQuotation.setLinkedTaxList(linkedTaxList.getLinkedTaxList());
			}
		}
		return new ModelAndView("Purchase/editQuotation","editQuoatation",purchaseQuotation);
		}
		else{
			model.addAttribute("purchase",purchase);			
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
	@RequestMapping(value="/editPurchaseOrder")
	public ModelAndView editPOrder(@RequestParam String orderID,PurchaseOrder taxList,PurchaseOrder linkedTaxList,PurchaseOrder purchaseOrder,ModelMap model,HttpSession session)
	{
		int counter=0;
		String bln = "blank";
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{if(lus.authontication(l,"Purchase"))
		{
			model.addAttribute("purchase",purchase);	
			model.addAttribute("order", order);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			purchaseOrder.setUpdatedBy(l.getEmpUserId());			
			purchaseOrder = pOrderService.editOrder(orderID).get(0);
			model.addAttribute("vatName", pOrderService.retriveVat());
	    	model.addAttribute("service", pOrderService.retriveService());
			model.addAttribute("pOrderList",pOrderService.showProduct());
			model.addAttribute("venderList", pOrderService.showVenders());
			model.addAttribute("taxList",pOrderService.showTaxes());
			if(pOrderService.editPurOrdTaxDetails(orderID)!=null)
			{
				taxList=pOrderService.editPurOrdTaxDetails(orderID).get(0);
				purchaseOrder.setTaxList(taxList.getTaxList());
			}
			else
			{
				model.addAttribute("bln", bln);
			}
						
			for (TaxDetailsList taxDetailsList : (taxList.getTaxList())) {
				counter=taxDetailsList.getCounter();
				if(counter != 0)
					{
						linkedTaxList=pOrderService.editPurOrdLinkedTaxDetails(orderID).get(0);
						purchaseOrder.setLinkedTaxList(linkedTaxList.getLinkedTaxList());
					}
		}	
		return new ModelAndView("Purchase/editOrder","editorder",purchaseOrder);
		}
		else{
			model.addAttribute("purchase",purchase);			
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
	@RequestMapping(value="editVoucher")
	public ModelAndView editVoucher(@RequestParam String voucherNo,PurchaseVoucher purchaseVoucher,ModelMap model,HttpSession session)
	{
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{if(lus.authontication(l,"Purchase"))
		{
			model.addAttribute("purchase",purchase);	
			model.addAttribute("voucher", voucher);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			purchaseVoucher = voucherService.viewEnquiry(voucherNo).get(0);
			model.addAttribute("accountList",voucherService.showAccountNo());
			return new ModelAndView("Purchase/editVoucher","editvoucher",purchaseVoucher);
		}
		else{
			model.addAttribute("purchase",purchase);			
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
	@RequestMapping(value="editVender")
	public ModelAndView editVender(@RequestParam String venderNo,Vender vender,ModelMap model,HttpSession session)
	{
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{if(lus.authontication(l,"Purchase"))
		{
			model.addAttribute("purchase",purchase);
			model.addAttribute("vendor", vendor);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			vender = pVenderService.viewVender(venderNo).get(0);			
			return new ModelAndView("Purchase/editVender","editvender",vender);
		}
		else{
			model.addAttribute("purchase",purchase);			
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
	/* Edit Forms End */
	
	/* Linking Forms Starts */
	@RequestMapping(value="/quotation")
	public ModelAndView viewQuotation(PurchaseQuotation purchaseQuotation,HttpServletRequest request,ModelMap model,HttpSession session)
	{
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{if(lus.authontication(l,"Purchase"))
		{
			model.addAttribute("purchase",purchase);	
			model.addAttribute("quotation", quotation);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			PurchaseEnquiry purchaseEnquiry=(PurchaseEnquiry) request.getSession().getAttribute("purchaseEnquiry");
			purchaseQuotation.setVenderID(purchaseEnquiry.getVenderID());
			purchaseQuotation.setTxtCustName(purchaseEnquiry.getSupplierName());
			String enqid = purchaseEnquiry.getEnqID();
			purchaseQuotation.setSelEnquiryNo(enqid); 
			purchaseQuotation.setTxtQuotationDate(purchaseEnquiry.getEnqDate());
			List<PurchaseEnquiryDetails> qList = new ArrayList<PurchaseEnquiryDetails>();
			qList.addAll(purchaseEnquiry.getPurchasenquiryDetails());
			List<purchaseDetails> pList = new ArrayList<purchaseDetails>();
			for(PurchaseEnquiryDetails enList : qList)
			{
				purchaseDetails pDetails = new purchaseDetails();
				pDetails.setSrNo(enList.getSrNo());
				pDetails.setProdId(enList.getProdId());
				pDetails.setItemCode(enList.getItemCode());
				pDetails.setDes(enList.getDes());
				pDetails.setUnit(enList.getUnit());
				pDetails.setQuantity(Integer.parseInt(enList.getQuantity()));
				pList.add(pDetails);			
			}
			purchaseQuotation.setProductList(pList);		
			purchaseQuotation.setTxtPubNotes(purchaseEnquiry.getPubNotes());
			purchaseQuotation.setTxtPvtNotes(purchaseEnquiry.getPriNotes());
			
			model.addAttribute("qutProdList",purchaseQuotationService.showProduct());
			model.addAttribute("venderList", purchaseQuotationService.showVenders());
			model.addAttribute("quotationId",purchaseQuotationService.autoId());
			model.addAttribute("taxList",purchaseQuotationService.showTaxes());
			model.addAttribute("vatName", purchaseQuotationService.retriveVat());
	    	model.addAttribute("service", purchaseQuotationService.retriveService());
			return new ModelAndView("Purchase/PurchaseQuotationLink","purchaseQuotation",purchaseQuotation);
		}
		else{
			model.addAttribute("purchase",purchase);			
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
	@RequestMapping(value="order")
	public ModelAndView viewOrder(PurchaseOrder purchaseOrder,HttpServletRequest request,ModelMap model,HttpSession session)
	{		
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{if(lus.authontication(l,"Purchase"))
		{
			model.addAttribute("purchase",purchase);	
			model.addAttribute("order", order);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			purchaseOrder=pOrderService.autoId();
			PurchaseQuotation purchaseQuotation=(PurchaseQuotation) request.getSession().getAttribute("purchaseQuotation");
			purchaseOrder.setSelSupplierName(purchaseQuotation.getTxtCustName());
			purchaseOrder.setVenderID(purchaseQuotation.getVenderID());
			purchaseOrder.setSelQuotatonNo(purchaseQuotation.getTxyQuotationNo());
			purchaseOrder.setTxtPurcaseDate(purchaseQuotation.getTxtQuotationDate());
			purchaseOrder.setTxtAreaAddress(purchaseQuotation.getTxtBillingTo());
			purchaseOrder.setProductList(purchaseQuotation.getProductList());
/*			purchaseOrder.setSelQuotatonNo(purchaseQuotation.getOrderCreated());
*//*			purchaseOrder.setTaxList(purchaseQuotation.getTaxList());
			purchaseOrder.setLinkedTaxList(purchaseQuotation.getLinkedTaxList());
*/			
			purchaseOrder.setTxtPubNotes(purchaseQuotation.getTxtPubNotes());
			purchaseOrder.setTxtPvtNotes(purchaseQuotation.getTxtPvtNotes());
			purchaseOrder.setTxtSubTotal(purchaseQuotation.getTxtSubTotal());
/*			purchaseOrder.setRadio(purchaseQuotation.getRadio());
			purchaseOrder.setTxtDiscount(purchaseQuotation.getTxtDiscount());
			purchaseOrder.setTxtDisTotal(purchaseQuotation.getTxtDisTotal());
			purchaseOrder.setTxtTaxTotal(purchaseQuotation.getTxtTaxTotal());
			purchaseOrder.setTxtRoundOff(purchaseQuotation.getTxtRoundOff());
*/			purchaseOrder.setTxtAmtPayble(purchaseQuotation.getTxtAmtPayble());
			model.addAttribute("productList",purchaseQuotationService.showProduct());
			model.addAttribute("venderList", pOrderService.showVenders());
			model.addAttribute("taxList",pOrderService.showTaxes());
			model.addAttribute("vatName", pOrderService.retriveVat());
	    	model.addAttribute("service", pOrderService.retriveService());
			return new ModelAndView("Purchase/PurchaseOrderLink","purchaseOrder",purchaseOrder);
		}
		else{
			model.addAttribute("purchase",purchase);			
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
	@RequestMapping(value="/purchasePayment")
	public ModelAndView newVoucher(PurchaseVoucher purchaseVoucher,HttpServletRequest request,ModelMap model,HttpSession session)
	{
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{if(lus.authontication(l,"Purchase"))
		{
			model.addAttribute("purchase",purchase);	
			model.addAttribute("voucher", voucher);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			Purchases purchases=(Purchases) request.getSession().getAttribute("purchases");
			purchaseVoucher.setOrderId(purchases.getTxtPurchaseNo());
			model.addAttribute("accountList",voucherService.showAccountNo());
			model.addAttribute("voucherId", voucherService.autoId());
			return new ModelAndView("Purchase/PurchaseVoucherLink","purchaseVoucher",purchaseVoucher);
		}
		else{
			model.addAttribute("purchase",purchase);			
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
	@RequestMapping(value="/purpayment")
	public ModelAndView viewVoucher(PurchaseVoucher purchaseVoucher,@RequestParam String purchaseId,ModelMap model,HttpSession session)
	{
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{if(lus.authontication(l,"Purchase"))
		{
			model.addAttribute("purchase",purchase);		
			model.addAttribute("voucher", voucher);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			purchaseVoucher.setOrderId(purchaseId);
			model.addAttribute("accountList",voucherService.showAccountNo());
			model.addAttribute("voucherId", voucherService.autoId());
			return new ModelAndView("Purchase/ApplyVoucher","applyVoucher",purchaseVoucher);
		}
		else{
			model.addAttribute("purchase",purchase);			
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
	//convertToPurchase
	@RequestMapping(value="/convertToPurchase")
	public ModelAndView convertToPurchases(@RequestParam String orderID,Purchases purchases,PurchaseOrder taxList,PurchaseOrder linkedTaxList,PurchaseOrder purchaseOrder,ModelMap model,HttpSession session)
	{
		int counter=0;
		String bln = "blank";
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{if(lus.authontication(l,"Purchase"))
		{
			model.addAttribute("purchase",purchase);	
			model.addAttribute("purchases1", purchases1);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			purchases=purchaseService.generateId();
			purchaseOrder=pOrderService.editOrder(orderID).get(0);
			purchases.setVenderID(purchaseOrder.getVenderID());
			purchases.setSelSupplierName(purchaseOrder.getSelSupplierName());
			purchases.setSelOrderID(purchaseOrder.getTxtPurchaseOrdNo());
			purchases.setTxtPurchaseDate(purchaseOrder.getTxtPurcaseDate());
			purchases.setTxtDueDate(purchaseOrder.getTxtDueDate());
			purchases.setTxtAreaAddress(purchaseOrder.getTxtAreaAddress());
			purchases.setProductList(purchaseOrder.getProductList());
			purchases.setTxtPubNotes(purchaseOrder.getTxtPubNotes());
			purchases.setTxtPvtNotes(purchaseOrder.getTxtPvtNotes());
			purchases.setTxtSubTotal(purchaseOrder.getTxtSubTotal());
			purchases.setRadio(purchaseOrder.getRadio());
			purchases.setTxtDiscount(purchaseOrder.getTxtDiscount());
			purchases.setTxtDisTotal(purchaseOrder.getTxtDisTotal());
			if(pOrderService.editPurOrdTaxDetails(orderID)!=null)
			{
				taxList=pOrderService.editPurOrdTaxDetails(orderID).get(0);
				purchases.setTaxList(taxList.getTaxList());
			}
			else
			{
				model.addAttribute("bln", bln);
			}
					
			for (TaxDetailsList taxDetailsList : (taxList.getTaxList())) 
			{
				counter=taxDetailsList.getCounter();
				if(counter != 0)
					{
						linkedTaxList=pOrderService.editPurOrdLinkedTaxDetails(orderID).get(0);
						purchases.setLinkedTaxList(linkedTaxList.getLinkedTaxList());
					}
			}	
			purchases.setTxtTaxTotal(purchaseOrder.getTxtTaxTotal());
			purchases.setTxtRoundOff(purchaseOrder.getTxtRoundOff());
			purchases.setTxtAmtPayble(purchaseOrder.getTxtAmtPayble());
			model.addAttribute("productList",purchaseService.showProduct());
			model.addAttribute("taxList",purchaseService.showTaxes());			
			model.addAttribute("venderList", purchaseService.showVenders());
			return new ModelAndView("Purchase/newPurchaseLink","purchases",purchases);
		}
		else{
			model.addAttribute("purchase",purchase);			
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
	/* Linking Forms End */
	
	/* Update Forms Starts */
   	@RequestMapping("/updatePurchaseEnquiry")
   	public ModelAndView updatePurchaseEnquiry(@ModelAttribute PurchaseEnquiry purchaseEnquiry,HttpServletRequest request,ModelMap model,HttpSession session)
   	{
   		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{if(lus.authontication(l,"Purchase"))
		{
			model.addAttribute("purchase",purchase);	
			model.addAttribute("enquiry", enquiry);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			purchaseEnquiry.setUpdatedBy(l.getEmpUserId());
			int i=0,update=0;
			i=purchaseEnquiryService.updateEnquiry(purchaseEnquiry);
			if(i>=1)
			{
				update=1;
				model.addAttribute("update", update);
				model.addAttribute("msg", purchaseEnquiryService.ShowUpdate());
			}
			else
			{
				update=0;
				model.addAttribute("update", update);
				model.addAttribute("msg", purchaseEnquiryService.ShowNotUpdate());
			}
			model.addAttribute("enquiryList", purchaseEnquiryService.showEnquiry());		
			return new ModelAndView("Purchase/ShowEnquiry","PurchaseEnquiry",purchaseEnquiry);
		}
		else{
			model.addAttribute("purchase",purchase);			
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
   	@RequestMapping("/updatePurchaseQuotation")
   	public ModelAndView updatePurchaseQuotaion(@ModelAttribute PurchaseQuotation purchaseQuotation,PurchaseQuotation taxList,PurchaseQuotation linkedTaxList,HttpServletRequest request,ModelMap model,HttpSession session)
   	{
   		//int counter=0;
   		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{if(lus.authontication(l,"Purchase"))
		{
			model.addAttribute("purchase",purchase);
			model.addAttribute("quotation", quotation);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			purchaseQuotation.setUpdatedBy(l.getEmpUserId());
			int i=0,update=0;
			i=purchaseQuotationService.updateQuotation(purchaseQuotation);
			if(i>=1)
			{
				update=1;
				model.addAttribute("update", update);
				model.addAttribute("msg", purchaseEnquiryService.ShowUpdate());
			}
			else
			{
				update=0;
				model.addAttribute("update", update);
				model.addAttribute("msg", purchaseEnquiryService.ShowNotUpdate());
			}
			/*purchaseQuotation = purchaseQuotationService.viewQuotaion(purchaseQuotation.getTxyQuotationNo()).get(0); 
			taxList=purchaseQuotationService.editPurQuotTaxDetails(purchaseQuotation.getTxyQuotationNo()).get(0);
			purchaseQuotation.setTaxList(taxList.getTaxList());
			for (TaxDetailsList taxDetails : (taxList.getTaxList())) {
				counter=taxDetails.getCounter();
				if(counter != 0)
				{
				    linkedTaxList=purchaseQuotationService.editPurQuotLinkedTaxDetails(purchaseQuotation.getTxyQuotationNo()).get(0);		    
				    purchaseQuotation.setLinkedTaxList(linkedTaxList.getLinkedTaxList());
				}
			}*/
			request.getSession().setAttribute("purchaseQuotation", purchaseQuotation);
			model.addAttribute("quoationLIst", purchaseQuotationService.showQuotation());
			return new ModelAndView("Purchase/ShowQuotations","PurchaseQuotation",purchaseQuotation);
		}
		else{
			model.addAttribute("purchase",purchase);			
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
   	@RequestMapping(value="/updatePurchaseOrder")
   	public ModelAndView updatePurchaseOrder(@ModelAttribute PurchaseOrder purchaseOrder,PurchaseOrder taxList,PurchaseOrder linkedTaxList,HttpServletRequest request,ModelMap model,HttpSession session)
   	{
   		//int counter=0;
   		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{if(lus.authontication(l,"Purchase"))
		{		
			model.addAttribute("purchase",purchase);	
			model.addAttribute("order", order);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId()); 	
			purchaseOrder.setUpdatedBy(l.getEmpUserId());
			int i=0,update=0;
			i=pOrderService.updateOrder(purchaseOrder);
			if(i>=1)
			{
				update=1;
				model.addAttribute("update", update);
				model.addAttribute("msg", purchaseEnquiryService.ShowUpdate());
			}
			else
			{
				update=0;
				model.addAttribute("update", update);
				model.addAttribute("msg", purchaseEnquiryService.ShowNotUpdate());
			}
   			/*purchaseOrder = pOrderService.viewOrder(purchaseOrder.getTxtPurchaseOrdNo()).get(0);
   			taxList=pOrderService.editPurOrdTaxDetails(purchaseOrder.getTxtPurchaseOrdNo()).get(0);
			purchaseOrder.setTaxList(taxList.getTaxList());			
			for (TaxDetailsList taxDetailsList : (taxList.getTaxList())) {
				counter=taxDetailsList.getCounter();
				if(counter != 0)
				{
					linkedTaxList=pOrderService.editPurOrdLinkedTaxDetails(purchaseOrder.getTxtPurchaseOrdNo()).get(0);
					purchaseOrder.setLinkedTaxList(linkedTaxList.getLinkedTaxList());
				}
			}*/
			request.getSession().setAttribute("purchaseOrder",purchaseOrder);
			model.addAttribute("orderList", pOrderService.showOrder());		
			return new ModelAndView("Purchase/ShowOrders","purchaseOrder",purchaseOrder);
		}
		else{
			model.addAttribute("purchase",purchase);			
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
   	@RequestMapping(value="/updateVoucher")
   	public ModelAndView updateVoucher(@ModelAttribute PurchaseVoucher purchaseVoucher, ModelMap model,HttpSession session)
   	{
   		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{ if(lus.authontication(l,"Purchase"))
		{  	
			model.addAttribute("purchase",purchase);	
			model.addAttribute("voucher", voucher);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
	   		int i=0,update=0;
			i=voucherService.updateVoucher(purchaseVoucher);
			if(i>=1)
			{
				update=1;
				model.addAttribute("update", update);
				model.addAttribute("msg", purchaseEnquiryService.ShowUpdate());
			}
			else
			{
				update=0;
				model.addAttribute("update", update);
				model.addAttribute("msg", purchaseEnquiryService.ShowNotUpdate());
			}
	   		//purchaseVoucher = voucherService.viewEnquiry(purchaseVoucher.getVoucherNo()).get(0);	
	   		model.addAttribute("voucherList", voucherService.showVoucher());
			return new ModelAndView("Purchase/showVoucher","purchasevoucher",purchaseVoucher);
		}
		else{
			model.addAttribute("purchase",purchase);			
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
   	@RequestMapping(value="/updateVender")
   	public ModelAndView updateVender(@ModelAttribute Vender vender, ModelMap model,HttpSession session)
   	{
   		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{if(lus.authontication(l,"Purchase"))
		{
			model.addAttribute("purchase",purchase);	
			model.addAttribute("vendor", vendor);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			int i=0,update=0;
			i=pVenderService.updateVender(vender);
			if(i>=1)
			{
				update=1;
				model.addAttribute("update", update);
				model.addAttribute("msg", purchaseEnquiryService.ShowUpdate());
			}
			else
			{
				update=0;
				model.addAttribute("update", update);
				model.addAttribute("msg", purchaseEnquiryService.ShowNotUpdate());
			}
   			model.addAttribute("viewvender", vender);   		
	   		model.addAttribute("venderList", pVenderService.showCustomer());
			return new ModelAndView("Purchase/showVender");
		}
		else{
			model.addAttribute("purchase",purchase);			
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
	/* Update Forms End */
   	
   	/* PDF Starts */
   	
   	@RequestMapping(value="/purchaseEnquiryPDF")
   	public ModelAndView purchaseEnquiryPDF(@RequestParam String enqID,PurchaseEnquiry purchaseEnquiry,CompanyDetails companyDetailss,ModelMap model,HttpSession session)
   	{
   		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{if(lus.authontication(l,"Purchase"))
		{
						
			model.addAttribute("enquiry", enquiry);	
			model.addAttribute("userName",l.getUname());	
			model.addAttribute("userId",l.getEmpUserId());	
	   		purchaseEnquiry = purchaseEnquiryService.view(enqID).get(0); 
	   		model.addAttribute("compInfo", purchaseEnquiryService.getInfo(companyDetailss).get(0));
	   		return new ModelAndView("purchaseEnquiryPDF","viewenquiry",purchaseEnquiry);
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
   	@RequestMapping(value="/purchaseQuotationPDF")
   	public ModelAndView purchaseQuotationPDF(@RequestParam String quotationID,PurchaseQuotation taxList,PurchaseQuotation linkedTaxList,CompanyDetails companyDetailss,PurchaseQuotation purchaseQuotation,ModelMap model,HttpSession session)
   	{
   		//int counter=0;
   		//String bln = "blank";
   		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{if(lus.authontication(l,"Purchase"))
		{
						
			model.addAttribute("quotation", quotation);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
	   		purchaseQuotation = purchaseQuotationService.viewQuotaion(quotationID).get(0);
	   		model.addAttribute("compInfo", purchaseQuotationService.getInfo(companyDetailss).get(0));
	   		/*if(purchaseQuotationService.editPurQuotTaxDetails(quotationID)!=null)
	   		{
	   			taxList=purchaseQuotationService.editPurQuotTaxDetails(quotationID).get(0);
				purchaseQuotation.setTaxList(taxList.getTaxList());				
	   		}
	   		else
			{
				model.addAttribute("bln", bln);
			}
			for (TaxDetailsList taxDetails : (taxList.getTaxList())) {
				counter=taxDetails.getCounter();
				if(counter != 0)
				{
				    linkedTaxList=purchaseQuotationService.editPurQuotLinkedTaxDetails(quotationID).get(0);		    
				    purchaseQuotation.setLinkedTaxList(linkedTaxList.getLinkedTaxList());
				}
			}*/
	   		return new ModelAndView("purchaseQuotationPDF","viewquotation",purchaseQuotation);
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
   	@RequestMapping(value="/purchaseOrderPDF")
   	public ModelAndView purchaseOrderPDF(@RequestParam String orderID,PurchaseOrder taxList,PurchaseOrder linkedTaxList,CompanyDetails companyDetailss,PurchaseOrder purchaseOrder,ModelMap model,HttpSession session)
   	{
   		int counter=0;
   		String bln = "blank";
   		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{if(lus.authontication(l,"Purchase"))
		{
						
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
	   		purchaseOrder = pOrderService.editOrder(orderID).get(0);
	   		model.addAttribute("compInfo", purchaseQuotationService.getInfo(companyDetailss).get(0));
	   		if(pOrderService.editPurOrdTaxDetails(orderID)!=null)
	   		{
	   			taxList=pOrderService.editPurOrdTaxDetails(orderID).get(0);
				purchaseOrder.setTaxList(taxList.getTaxList());				
	   		}
	   		else
			{
				model.addAttribute("bln", bln);
			}
	   					
			for (TaxDetailsList taxDetailsList : (taxList.getTaxList())) {
				counter=taxDetailsList.getCounter();
				if(counter != 0)
				{
					linkedTaxList=pOrderService.editPurOrdLinkedTaxDetails(orderID).get(0);
					purchaseOrder.setLinkedTaxList(linkedTaxList.getLinkedTaxList());
				}
			}		
	   		return new ModelAndView("purchaseOrderPDF","vieweorder",purchaseOrder);
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
   	//purchasePDF
	@RequestMapping(value="/purchasePDF")
   	public ModelAndView purchasePDF(@RequestParam String purchaseId,Purchases purchases,Purchases taxList,Purchases linkedTaxList,CompanyDetails companyDetailss,ModelMap model,HttpSession session)
   	{
   			int counter=0;
   			String bln = "blank";
			Login l=(Login) session.getAttribute("user");
			if(lus.chkFlag(l))
			{if(lus.authontication(l,"Purchase"))
			{		
					
				model.addAttribute("userName",l.getUname());
				model.addAttribute("userId",l.getEmpUserId());
				purchases = purchaseService.editPurchase(purchaseId).get(0);
				model.addAttribute("compInfo", purchaseService.getInfo(companyDetailss).get(0));
				if(purchaseService.editPurTaxDetails(purchaseId)!=null)
		   		{
					taxList=purchaseService.editPurTaxDetails(purchaseId).get(0);
					purchases.setTaxList(taxList.getTaxList());				
		   		}
		   		else
				{
					model.addAttribute("bln", bln);
				}
				
				for (TaxDetailsList taxDetails : (taxList.getTaxList())) {
					counter=taxDetails.getCounter();
					if(counter != 0)
					{
					    linkedTaxList=purchaseService.editPurLinkedTaxDetails(purchaseId).get(0);		    
					    purchases.setLinkedTaxList(linkedTaxList.getLinkedTaxList());
					}
				}
   		return new ModelAndView("purchasePDF","purchases",purchases);
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
   	@RequestMapping(value="/purchaseVoucherPDF")
   	public ModelAndView purchaseVoucherPDF(@RequestParam String voucherID,CompanyDetails companyDetailss,PurchaseVoucher purchaseVoucher,ModelMap model,HttpSession session)
   	{
   		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{if(lus.authontication(l,"Purchase"))
		{
				
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
	   		purchaseVoucher = voucherService.viewEnquiry(voucherID).get(0);
	   		model.addAttribute("compInfo", purchaseQuotationService.getInfo(companyDetailss).get(0));
	   		return new ModelAndView("purchaseVoucherPDF","viewvoucher",purchaseVoucher);
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
   	/* PDF End */
   	
   	/* Details Start*/
   	
   	@RequestMapping(value="/detailEnquiry", method=RequestMethod.GET)
   	public ModelAndView detailEnquiry(@RequestParam String enquiryId,PurchaseEnquiry pEnquiry,ModelMap model,HttpSession session)
   	{   		
   		//model.addAttribute("detailList", purchaseEnquiryService.view(enquiryId));
   		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{if(lus.authontication(l,"Purchase"))
		{
			model.addAttribute("purchase",purchase);
			model.addAttribute("enquiry", enquiry);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
   		pEnquiry = purchaseEnquiryService.view(enquiryId).get(0); 
   		return new ModelAndView("Purchase/DetailEnquiry","detailEnquiry",pEnquiry);
		}
		else{
			model.addAttribute("purchase",purchase);			
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
   	@RequestMapping(value="/detailQuotation", method=RequestMethod.GET)
   	public ModelAndView detailQuotation(@RequestParam String quoationId,PurchaseQuotation pDetails,ModelMap model,HttpSession session)
   	{   
   		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{if(lus.authontication(l,"Purchase"))
		{
			model.addAttribute("purchase",purchase);	
			model.addAttribute("quotation", quotation);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
   		pDetails = purchaseQuotationService.viewQuotaion(quoationId).get(0); 
   		return new ModelAndView("Purchase/DetailQuotation","detailQuotation",pDetails);
		}
		else{
			model.addAttribute("purchase",purchase);			
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
   	@RequestMapping(value="/detailOrder", method=RequestMethod.GET)
   	public ModelAndView detailsOrder(@RequestParam String orderID,PurchaseOrder pDetails,ModelMap model,HttpSession session)
   	{   
   		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{if(lus.authontication(l,"Purchase"))
		{
			model.addAttribute("purchase",purchase);	
			model.addAttribute("order", order);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
	   		pDetails = pOrderService.editOrder(orderID).get(0); 
	   		return new ModelAndView("Purchase/DetailOrder","detailOrder",pDetails);
		}
		else{
			model.addAttribute("purchase",purchase);			
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
   	//purchaseDetails.do?purchaseId
   	@RequestMapping(value="/purchaseDetails", method=RequestMethod.GET)
   	public ModelAndView purchaseDetails(@RequestParam String purchaseId,Purchases purchases,ModelMap model,HttpSession session)
   	{   
   		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{if(lus.authontication(l,"Purchase"))
		{
			model.addAttribute("purchase",purchase);	
			model.addAttribute("purchases", purchases);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			purchases = purchaseService.editPurchase(purchaseId).get(0);
			return new ModelAndView("Purchase/purchaseDetails","purchases",purchases);
		}
		else{
			model.addAttribute("purchase",purchase);			
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
   	/* Details End*/
   	
   	/* retrive desc */
   	
   	@RequestMapping("/retrievePurDesc")
   	public ModelAndView retrieveDesc(@RequestParam String productId,ModelMap model,HttpSession session)
   	{    
   		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{if(lus.authontication(l,"Purchase"))
		{
		model.addAttribute("purchase",purchase);
		model.addAttribute("userName",l.getUname());
		model.addAttribute("userId",l.getEmpUserId());
    	model.addAttribute("desc",purchaseEnquiryService.retriveDesc(productId));
    	model.addAttribute("unit", purchaseEnquiryService.retriveUnit(productId));
    	model.addAttribute("desc",purchaseQuotationService.retriveDesc(productId));
    	model.addAttribute("desc",pOrderService.retriveDesc(productId));
    	return new ModelAndView("Purchase/retrieveDesc");
		}
		else{
			model.addAttribute("purchase",purchase);			
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
   	@RequestMapping("/retriveTaxID")
   	public ModelAndView retriveTaxID(@RequestParam String taxName,ModelMap model,HttpSession session)
   	{
   		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{if(lus.authontication(l,"Purchase"))
		{
			model.addAttribute("purchase",purchase);			
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			model.addAttribute("serviceTax", purchaseQuotationService.retriveTaxID(taxName));
			return new ModelAndView("Purchase/retriveTax");
		}
		else{
			model.addAttribute("purchase",purchase);			
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
   	@RequestMapping("/retriveLinkedTax")
   	public ModelAndView retriveLinkedTax(@RequestParam String taxId, ModelMap model,HttpSession session, PurchaseQuotation purchaseQuotation)
   	{
   		//System.out.println("Tax Id="+taxId);
   		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))		
		{if(lus.authontication(l,"Purchase"))
		{	
			model.addAttribute("purchase",purchase);			
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			model.addAttribute("linkedTaxList", purchaseQuotationService.retriveLinkedtax(taxId));
			model.addAttribute("taxId", taxId);
			model.addAttribute("counter", purchaseQuotationService.getCounter(taxId));
			return new ModelAndView("Purchase/retriveLinkedTax");
		}
		else{
			model.addAttribute("purchase",purchase);			
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

   	@RequestMapping("/retrivePurAdd")
   	public ModelAndView retriveAdd(@RequestParam String venderId,ModelMap model,HttpSession session)
   	{
   		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{if(lus.authontication(l,"Purchase"))
		{
			model.addAttribute("purchase",purchase);			
		model.addAttribute("userName",l.getUname());
		model.addAttribute("userId",l.getEmpUserId());	
    	model.addAttribute("billingAdd",purchaseQuotationService.retriveAdd(venderId));
    	model.addAttribute("shippingAdd", purchaseQuotationService.retriveShippiing(venderId));
    	return new ModelAndView("Purchase/retriveAdd");
		}
		else{
			model.addAttribute("purchase",purchase);			
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
   	@RequestMapping("/retriveBankAcNo")
   	public ModelAndView retriveBankAcNo(@RequestParam String venderId,ModelMap model,HttpSession session)
   	{
   		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{if(lus.authontication(l,"Purchase"))
		{
			model.addAttribute("purchase",purchase);			
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
   		model.addAttribute("bankAcNo",pOrderService.retrriveBankAcNo(venderId));
   		return new ModelAndView("Purchase/retriveBankAcNo");
		}
		else{
			model.addAttribute("purchase",purchase);			
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
   	@RequestMapping("/retriveFromAccount")
   	public ModelAndView retriveFromAccount(@RequestParam String paymode,ModelMap model,HttpSession session)
   	{
   		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{if(lus.authontication(l,"Purchase"))
		{
			model.addAttribute("purchase",purchase);			
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			model.addAttribute("accList", voucherService.retriveAccount(paymode));
			return new ModelAndView("Purchase/retriveAccount");
		}
		else{
			model.addAttribute("purchase",purchase);			
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
   	@RequestMapping("/retriveAvlBalance")
   	public ModelAndView retriveAvlBalance(@RequestParam String orderId,ModelMap model,HttpSession session)
   	{
   		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{if(lus.authontication(l,"Purchase"))
		{
			model.addAttribute("purchase",purchase);			
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			model.addAttribute("avlBalance", voucherService.avlBalance(orderId));
			return new ModelAndView("Purchase/retriveavlBalance");
		}
		else{
			model.addAttribute("purchase",purchase);			
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
	@RequestMapping("/retrievePurUnitPrice")
   	public ModelAndView retrieveUnitPrice(@RequestParam String productId,ModelMap model,HttpSession session)
   	{
   		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{if(lus.authontication(l,"Purchase"))
		{
			model.addAttribute("purchase",purchase);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			model.addAttribute("productId",purchaseQuotationService.retriveUnitPrice(productId));
			model.addAttribute("productId",pOrderService.retriveUnitPrice(productId));
			model.addAttribute("productId",purchaseService.retriveUnitPrice(productId)); 
			return new ModelAndView("Purchase/retriveUnitPrice");
		}
		else{
			model.addAttribute("purchase",purchase);			
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
   	
   	
   	/* retrive desc end */
   	
   	/* delete start */
   	
   	@RequestMapping("/deletePurchaseEnquiry")
   	public ModelAndView deleteEnquiry(@RequestParam String enquiryId,PurchaseEnquiry purchaseEnquiry,ModelMap model,HttpSession session)
   	{
   		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{if(lus.authontication(l,"Purchase"))
		{
			model.addAttribute("purchase",purchase);	
			model.addAttribute("enquiry", enquiry);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
   		int i=0,delete=0;
		i=purchaseEnquiryService.delete(enquiryId);
		if(i>=1)
		{
			delete=1;
			model.addAttribute("delete", delete);
			model.addAttribute("msg", purchaseEnquiryService.ShowDelete());
		}
		else
		{
			delete=0;
			model.addAttribute("delete", delete);
			model.addAttribute("msg", purchaseEnquiryService.ShowNotDelete());
		}
   		model.addAttribute("enquiryList", purchaseEnquiryService.showEnquiry());
   		return new ModelAndView("Purchase/ShowEnquiry","PurchaseEnquiry",purchaseEnquiry);
		}
		else{
			model.addAttribute("purchase",purchase);			
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
   	@RequestMapping("/deleteQuotation")
   	public ModelAndView deleteQuot(@RequestParam String quotId,PurchaseQuotation purchaseQuotation,ModelMap model,HttpSession session)
   	{
   		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{if(lus.authontication(l,"Purchase"))
		{
			model.addAttribute("purchase",purchase);	
			model.addAttribute("quotation", quotation);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
   		int i=0,delete=0;
		i=purchaseQuotationService.delete(quotId);
		if(i>=1)
		{
			delete=1;
			model.addAttribute("delete", delete);
			model.addAttribute("msg", purchaseEnquiryService.ShowDelete());
		}
		else
		{
			delete=0;
			model.addAttribute("delete", delete);
			model.addAttribute("msg", purchaseEnquiryService.ShowNotDelete());
		}
   		model.addAttribute("quoationLIst", purchaseQuotationService.showQuotation());
   		return new ModelAndView("Purchase/ShowQuotations","PurchaseQuotation",purchaseQuotation);
		}
		else{
			model.addAttribute("purchase",purchase);			
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
   	@RequestMapping("/deletePurchaseOrder")
   	public ModelAndView deleteOrder(@RequestParam String orderID,PurchaseOrder purchaseOrder,ModelMap model,HttpSession session)
   	{
   		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{if(lus.authontication(l,"Purchase"))
		{
			model.addAttribute("purchase",purchase);	
			model.addAttribute("order", order);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
   		int i=0,delete=0;
		i=pOrderService.delete(orderID);
		if(i>=1)
		{
			delete=1;
			model.addAttribute("delete", delete);
			model.addAttribute("msg", purchaseEnquiryService.ShowDelete());
		}
		else
		{
			delete=0;
			model.addAttribute("delete", delete);
			model.addAttribute("msg", purchaseEnquiryService.ShowNotDelete());
		}
   		model.addAttribute("orderList", pOrderService.showOrder());		
		return new ModelAndView("Purchase/ShowOrders","purchaseOrder",purchaseOrder);
		}
		else{
			model.addAttribute("purchase",purchase);			
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
   	@RequestMapping("/deleteVoucher")
   	public ModelAndView deleteVoucher(@RequestParam String voucherId,@RequestParam float amt,PurchaseVoucher purchaseVoucher,ModelMap model,HttpSession session)
   	{
   		
   		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{if(lus.authontication(l,"Purchase"))
		{
			model.addAttribute("purchase",purchase);
			model.addAttribute("voucher", voucher);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
   		int i=0,delete=0;
		i=voucherService.delete(voucherId,amt);
		if(i>=1)
		{
			delete=1;
			model.addAttribute("delete", delete);
			model.addAttribute("msg", purchaseEnquiryService.ShowDelete());
		}
		else
		{
			delete=0;
			model.addAttribute("delete", delete);
			model.addAttribute("msg", purchaseEnquiryService.ShowNotDelete());
		}
   		model.addAttribute("voucherList", voucherService.showVoucher());
		return new ModelAndView("Purchase/showVoucher","purchasevoucher",purchaseVoucher);
		}
		else{
			model.addAttribute("purchase",purchase);			
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
   	@RequestMapping("/deleteVender")
   	public ModelAndView denleteVender(@RequestParam String venderID,Vender vender, ModelMap model,HttpSession session)
   	{
   		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{if(lus.authontication(l,"Purchase"))
		{
			model.addAttribute("purchase",purchase);	
			model.addAttribute("vendor", vendor);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
	   		int i=0,delete=0;
			i=pVenderService.delete(venderID);
			if(i>=1)
			{
				delete=1;
				model.addAttribute("delete", delete);
				model.addAttribute("msg", purchaseEnquiryService.ShowDelete());
			}
			else
			{
				delete=0;
				model.addAttribute("delete", delete);
				model.addAttribute("msg", purchaseEnquiryService.ShowNotDelete());
			}
	   		model.addAttribute("venderList", pVenderService.showCustomer());
			return new ModelAndView("Purchase/showVender");
		}
		else{
			model.addAttribute("purchase",purchase);		
			model.addAttribute("vendor", vendor);
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
   	@RequestMapping("/activeVender")
   	public ModelAndView activeVender(@RequestParam String venderID,Vender vender, ModelMap model,HttpSession session)
   	{
   		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{if(lus.authontication(l,"Purchase"))
		{
			model.addAttribute("purchase",purchase);
			model.addAttribute("vendor", vendor);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
	   		int i=0,restore=0;
			i=pVenderService.activeDelete(venderID);
			if(i>=1)
			{
				restore=1;
				model.addAttribute("restore", restore);
				model.addAttribute("msg", purchaseEnquiryService.ShowRestore());
			}
			else
			{
				restore=0;
				model.addAttribute("restore", restore);
				model.addAttribute("msg", purchaseEnquiryService.ShowNotRestore());
			}
	   		model.addAttribute("venderList", pVenderService.showCustomer());
			return new ModelAndView("Purchase/showVender");
		}
		else{
			model.addAttribute("purchase",purchase);	
			model.addAttribute("vendor", vendor);
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
   	/* delete end*/
   	
   	/* Compose Mail Start*/   	
   	@RequestMapping("/purchaseEnquiryMail")
   	public ModelAndView Enquirycompose_Mail(@RequestParam String vendId,@RequestParam String id1,PurchaseEnquiry purchaseEnquiry,CompanyDetails companyDetailss,ComposeMail composeMail, ModelMap model,HttpSession session,Document doc,HttpServletRequest request,PdfWriter writer,HttpServletResponse response) throws Exception
   	{
   		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{if(lus.authontication(l,"Purchase"))
		{			
			model.addAttribute("purchase",purchase);	
			model.addAttribute("enquiry", enquiry);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			purchaseEnquiry = purchaseEnquiryService.view(id1).get(0); 
	   		model.addAttribute("compInfo", purchaseEnquiryService.getInfo(companyDetailss).get(0)); 
	   		model.addAttribute("vendInfo", purchaseEnquiryService.retrriveVenderInfo(vendId,id1).get(0)); 
	   		model.addAttribute("purchaseEnquiryPDF",purchaseEnquiry);
			model.addAttribute("viewenquiry",purchaseEnquiry);
			purchaseEnquiryPdf.buildPdfDocument(model, doc, writer, request, response);
	   		return new ModelAndView("Purchase/composeMail","composeMail",composeMail);
		}
		else{
			model.addAttribute("purchase",purchase);			
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

	//purchaseQuotationcompose_Mail
   	@RequestMapping("/purchaseQuotationcompose_Mail")
   	public ModelAndView purchaseQuotationcompose_Mail(@RequestParam String vendId,@RequestParam String id1,PurchaseQuotation taxList,PurchaseQuotation linkedTaxList,PurchaseQuotation purchaseQuotation,CompanyDetails companyDetailss,ComposeMail composeMail, ModelMap model,HttpSession session,Document doc,HttpServletRequest request,PdfWriter writer,HttpServletResponse response) throws Exception
   	{
   		int counter=0;
   		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{if(lus.authontication(l,"Purchase"))
		{
			model.addAttribute("purchase",purchase);	
			model.addAttribute("quotation", quotation);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());	
			purchaseQuotation = purchaseQuotationService.viewQuotaion(id1).get(0);
	   		model.addAttribute("compInfo", purchaseQuotationService.getInfo(companyDetailss).get(0));
	   		model.addAttribute("vendInfo", purchaseQuotationService.retrriveVenderInfo(vendId,id1).get(0));   	
	   		if(purchaseQuotationService.editPurQuotTaxDetails(id1)!=null)
	   		{
	   		taxList=purchaseQuotationService.editPurQuotTaxDetails(id1).get(0);
			purchaseQuotation.setTaxList(taxList.getTaxList());
			for (TaxDetailsList taxDetails : (taxList.getTaxList())) {
				counter=taxDetails.getCounter();
				if(counter != 0)
				{
				    linkedTaxList=purchaseQuotationService.editPurQuotLinkedTaxDetails(id1).get(0);		    
				    purchaseQuotation.setLinkedTaxList(linkedTaxList.getLinkedTaxList());
				}
			}
	   		}
			model.addAttribute("purchaseQuotationPDF",purchaseQuotation);
			model.addAttribute("viewquotation",purchaseQuotation);	   		
			purchaseQuotationPdf.buildPdfDocument(model, doc, writer, request, response);	   			
	   		return new ModelAndView("Purchase/composeMail","composeMail",composeMail);
		}
		else{
			model.addAttribute("purchase",purchase);			
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
   	//pOrdercompose_Mail
	@RequestMapping("/pOrdercompose_Mail")
   	public ModelAndView pOrdercompose_Mail(@RequestParam String vendId,@RequestParam String id1,PurchaseOrder taxList,PurchaseOrder linkedTaxList,PurchaseOrder purchaseOrder,CompanyDetails companyDetailss,ComposeMail composeMail, ModelMap model,HttpSession session,Document doc,HttpServletRequest request,PdfWriter writer,HttpServletResponse response) throws Exception
   	{
		int counter=0;
   		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{if(lus.authontication(l,"Purchase"))
		{
			model.addAttribute("purchase",purchase);		
			model.addAttribute("order", order);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			purchaseOrder = pOrderService.editOrder(id1).get(0);
	   		model.addAttribute("compInfo", purchaseQuotationService.getInfo(companyDetailss).get(0));
	   		model.addAttribute("vendInfo", pOrderService.retrriveVenderInfo(vendId,id1).get(0)); 
	   		if(pOrderService.editPurOrdTaxDetails(id1)!=null)
	   		{
	   		taxList=pOrderService.editPurOrdTaxDetails(id1).get(0);
			purchaseOrder.setTaxList(taxList.getTaxList());			
			for (TaxDetailsList taxDetailsList : (taxList.getTaxList())) {
				counter=taxDetailsList.getCounter();
				if(counter != 0)
				{
					linkedTaxList=pOrderService.editPurOrdLinkedTaxDetails(id1).get(0);
					purchaseOrder.setLinkedTaxList(linkedTaxList.getLinkedTaxList());
				}
			}		
	   		}
			model.addAttribute("purchaseOrderPDF", purchaseOrder);
			model.addAttribute("vieweorder", purchaseOrder);
			purchaseOrderPDF.buildPdfDocument(model, doc, writer, request, response);
	   		return new ModelAndView("Purchase/composeMail","composeMail",composeMail);
		}
		else{
			model.addAttribute("purchase",purchase);			
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
   	//purchasecompose_Mail
	@RequestMapping("/purchasecompose_Mail")
   	public ModelAndView purchasecompose_Mail(@RequestParam String vendId,@RequestParam String id1,Purchases linkedTaxList,Purchases taxList,Purchases purchases,CompanyDetails companyDetailss,ComposeMail composeMail, ModelMap model,HttpSession session,Document doc,HttpServletRequest request,PdfWriter writer,HttpServletResponse response) throws Exception
   	{
		int counter=0;
   		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{if(lus.authontication(l,"Purchase"))
		{
			model.addAttribute("purchase",purchase);	
			model.addAttribute("purchases1", purchases1);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			purchases = purchaseService.editPurchase(id1).get(0);
			model.addAttribute("compInfo", purchaseService.getInfo(companyDetailss).get(0));
			model.addAttribute("vendInfo", purchaseService.retrriveVenderInfo(vendId,id1).get(0)); 
			if(purchaseService.editPurTaxDetails(id1)!=null)
			{
			taxList=purchaseService.editPurTaxDetails(id1).get(0);
			purchases.setTaxList(taxList.getTaxList());
			for (TaxDetailsList taxDetails : (taxList.getTaxList())) {
				counter=taxDetails.getCounter();
				if(counter != 0)
				{
				    linkedTaxList=purchaseService.editPurLinkedTaxDetails(id1).get(0);		    
				    purchases.setLinkedTaxList(linkedTaxList.getLinkedTaxList());
				}
			}
			}
			model.addAttribute("purchasePDF", purchases); 
			model.addAttribute("purchases", purchases); 		
			purchasesPDF.buildPdfDocument(model, doc, writer, request, response);	   		  		
	   		return new ModelAndView("Purchase/composeMail","composeMail",composeMail);
		}
		else{
			model.addAttribute("purchase",purchase);			
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
   //purchaseVouchercompose_Mail
	@RequestMapping("/purchaseVouchercompose_Mail")
   	public ModelAndView purchaseVouchercompose_Mail(@RequestParam String vendId,@RequestParam String id1,PurchaseVoucher purchaseVoucher,CompanyDetails companyDetailss,ComposeMail composeMail, ModelMap model,HttpSession session,Document doc,HttpServletRequest request,PdfWriter writer,HttpServletResponse response) throws Exception
   	{
   		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{if(lus.authontication(l,"Purchase"))
		{
			model.addAttribute("purchase",purchase);		
			model.addAttribute("voucher", voucher);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			purchaseVoucher = voucherService.viewEnquiry(id1).get(0);
	   		model.addAttribute("compInfo", purchaseQuotationService.getInfo(companyDetailss).get(0));
	   		model.addAttribute("vendInfo", voucherService.retrriveVenderInfo(vendId,id1).get(0));  
	   		model.addAttribute("purchaseVoucherPDF", purchaseVoucher); 
			model.addAttribute("viewvoucher", purchaseVoucher);
			voucherPdf.buildPdfDocument(model, doc, writer, request, response);	   		 		
	   		return new ModelAndView("Purchase/composeMail","composeMail",composeMail);
		}
		else{
			model.addAttribute("purchase",purchase);			
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
	
   	@RequestMapping("/purchaseSendMail")
   	public ModelAndView purchaseSendMail(ComposeMail composeMail,ModelMap model,HttpSession session)
   	{   
   		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{if(lus.authontication(l,"Purchase"))
		{
			model.addAttribute("purchase",purchase);	
			model.addAttribute("purchases1", purchases1);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
	    	model.addAttribute("message",purchaseEnquiryService.sendMail(composeMail));
	    	return new ModelAndView("Sales/composeMail","composeMail",composeMail);
		}
		else{
			model.addAttribute("purchase",purchase);			
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
   	/* Compose Mail End */
   	
   	//paymentHistory
   	@RequestMapping("/paymentHistory")
   	public ModelAndView paymentHistory(@RequestParam String purchaseNo,ModelMap model, HttpSession session)
   	{
   		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{if(lus.authontication(l,"Purchase"))
		{
			model.addAttribute("purchase",purchase);
			model.addAttribute("purchases1", purchases1);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			model.addAttribute("paylist", purchaseService.retrivePaymentHistory(purchaseNo));
			return new ModelAndView("Purchase/PaymentHistory");
		}
		else{
			model.addAttribute("purchase",purchase);			
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