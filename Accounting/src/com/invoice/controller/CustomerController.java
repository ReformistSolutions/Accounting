package com.invoice.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.invoice.customer.beans.Customer;
import com.invoice.customer.service.CustomerService;
import com.invoice.login.beans.Login;
import com.invoice.login.service.LoginUserService;
import com.invoice.reports.service.ReportsServiceImpl;
import com.invoice.sales.service.EnquiryService;

@Controller
public class CustomerController {

	int i=0,message=0;
	String sales = "sales";
	String index = "index";
	CustomerService customerService;
	@Autowired
	LoginUserService lus;
	@Autowired
	ReportsServiceImpl reportsServiceImpl;
	EnquiryService enquiryService;
	public EnquiryService getEnquiryService() {
		return enquiryService;
	}
	@Autowired
	public void setEnquiryService(EnquiryService enquiryService) {
		this.enquiryService = enquiryService;
	}
	public CustomerService getCustomerService() {
		return customerService;
	}
    @Autowired
	public void setCustomerService(CustomerService customerService) {
		this.customerService = customerService;
	}
	String customer1 = "customer";
    
    @RequestMapping(value="/sales" ,method = RequestMethod.GET)
	public ModelAndView customerDetails(Customer customer,ModelMap model,HttpSession session) {	
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
			if(lus.authontication(l,"Sales"))
			{
				model.addAttribute("sales",sales);
				model.addAttribute("customer", customer1);
				model.addAttribute("userName",l.getUname());
				model.addAttribute("userId",l.getEmpUserId());
				model.addAttribute("customerList", customerService.show());
				return new ModelAndView("Sales/showCustomers","customerAddedList",customer);
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
    //add new customer
	@RequestMapping(value="newCustomer", method=RequestMethod.GET)
	public ModelAndView newCustomer(Customer customer,ModelMap model,HttpSession session){
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
			if(lus.authontication(l,"Sales"))
			{
				model.addAttribute("sales",sales);
				model.addAttribute("customer", customer1);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			customer=customerService.generateId();
       		return new ModelAndView("Sales/addNewCustomer","newCustomer",customer);
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
    //insert
	@RequestMapping(value="addCustomer")
	public ModelAndView addCustomer(Customer customer,ModelMap model,HttpSession session){
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
			if(lus.authontication(l,"Sales"))
			{
				model.addAttribute("sales",sales);
				model.addAttribute("customer", customer1);
				model.addAttribute("userName",l.getUname());
				model.addAttribute("userId",l.getEmpUserId());
			    //model.addAttribute("message",customerService.save(customer));
			    i=customerService.save(customer);
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
			    model.addAttribute("customerList", customerService.show());
				return new ModelAndView("Sales/showCustomers","customerAddedList",customer);
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
	//edit
	@RequestMapping(value="/editCustomer")
	public ModelAndView editCustomerHandler(@RequestParam String customerID,Customer customer,ModelMap model,HttpSession session)
   	{  
		
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
			if(lus.authontication(l,"Sales"))
			{
				model.addAttribute("sales",sales);
				model.addAttribute("customer", customer1);
		customer=customerService.editCustomer(customerID).get(0);   
		model.addAttribute("userName",l.getUname());
		model.addAttribute("userId",l.getEmpUserId());
    	return new ModelAndView("Sales/editCustomer","editCustomer",customer);
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
	//view
   	@RequestMapping(value="/viewCustomer")
	public ModelAndView viewCustomerDetails(@RequestParam String customerID,HttpServletRequest request,Customer customer,ModelMap model,HttpSession session)
	{
   		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
			if(lus.authontication(l,"Sales"))
				
			{
				model.addAttribute("sales",sales);
				model.addAttribute("customer", customer1);
				model.addAttribute("userName",l.getUname());
				model.addAttribute("userId",l.getEmpUserId());
				customer=customerService.editCustomer(customerID).get(0);   
				return new ModelAndView("Sales/viewCustomerDetails","viewCustomerDetails",customer);
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
   	@RequestMapping("/updateCustomer")
    public ModelAndView updateCustomer(@ModelAttribute Customer customer,ModelMap model,HttpSession session){
   		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
			if(lus.authontication(l,"Sales"))
			{
				model.addAttribute("sales",sales);
				model.addAttribute("customer", customer1);
				//model.addAttribute("message",customerService.update(customer)); 	
				i=customerService.update(customer);
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
				model.addAttribute("userName",l.getUname());
				model.addAttribute("userId",l.getEmpUserId());
				model.addAttribute("viewCustomerDetails",customer); 	  
 	   			model.addAttribute("customerList", customerService.show()); 	   			
 	   			return new ModelAndView("Sales/showCustomers","customerAddedList",customer);
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
   	
    @RequestMapping("/customerPDF")
   	public ModelAndView customerPDF(@RequestParam String customerID,Customer customer,ModelMap model,HttpSession session)
   	{ 
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
			if(lus.authontication(l,"Sales"))
			{
				model.addAttribute("sales",sales);
				model.addAttribute("customer", customer1);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			customer=customerService.editCustomer(customerID).get(0);    	
    	return new ModelAndView("customerPDF" ,"viewCustomerDetails", customer);
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
    //deleteCustomer
    @RequestMapping("/deleteCustomer")
	public ModelAndView deleteCustomer(@RequestParam String customerID,Customer customer,ModelMap model,HttpSession session)
   	{ 
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
			if(lus.authontication(l,"Sales"))
			{
				model.addAttribute("sales",sales);
				model.addAttribute("customer", customer1);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			//model.addAttribute("message",customerService.deleteCustomer(customerID));
			i=customerService.deleteCustomer(customerID);
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
	    	model.addAttribute("customerList", customerService.show());
			return new ModelAndView("Sales/showCustomers","customerAddedList",customer);
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
    
    @RequestMapping("/activeCustomer")
	public ModelAndView inactiveCustomer(@RequestParam String customerID,Customer customer,ModelMap model,HttpSession session)
   	{ 
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
			if(lus.authontication(l,"Sales"))
			{
				model.addAttribute("sales",sales);
				model.addAttribute("customer", customer1);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			//model.addAttribute("message",customerService.deleteCustomer(customerID));
			i=customerService.inactiveCustomer(customerID);
			if(i>=1)
			{
				message=1;
				model.addAttribute("restoremsg", message);
				model.addAttribute("msg", enquiryService.ShowRestore());
			}
			else
			{
				message=0;
				model.addAttribute("restoremsg", message);
				model.addAttribute("msg", enquiryService.ShowNotRestrore());
			}
	    	model.addAttribute("customerList", customerService.show());
			return new ModelAndView("Sales/showCustomers","customerAddedList",customer);
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
   	
}
