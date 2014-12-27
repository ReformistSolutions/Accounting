package com.invoice.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.invoice.company.beans.CompanyDetails;
import com.invoice.company.service.CompanyDetailsService;
import com.invoice.login.beans.Login;
import com.invoice.login.service.LoginUserService;
import com.invoice.reports.service.ReportsServiceImpl;


@Controller
public class CompanyController {

	CompanyDetailsService companyDetailsService;
	@Autowired
	ReportsServiceImpl reportsServiceImpl;
	
	 public CompanyDetailsService getCompanyDetailsService() {
		return companyDetailsService;
	}
	 @Autowired
	public void setCompanyDetailsService(CompanyDetailsService companyDetailsService) {
		this.companyDetailsService = companyDetailsService;
	}
	 @Autowired
		LoginUserService lus;
	//compDetails
    @RequestMapping("/compDetails")
   	public ModelAndView compDetails(CompanyDetails companyDetails,ModelMap model)
   	{  
    	return new ModelAndView("Company/company_Details","companyDetails",companyDetails);
   	}
    //addCompany
    @RequestMapping("/addCompany")
   	public ModelAndView addCompany(CompanyDetails companyDetails,ModelMap model)
   	{
    	model.addAttribute("message",companyDetailsService.save(companyDetails));
    	/*return new ModelAndView("Company/company_Details","companyDetails",companyDetails);*/
    	return new ModelAndView("Login");
   	}
    @RequestMapping("/login")
   	public ModelAndView login(ModelMap model)
   	{
    	
    	return new ModelAndView("Login");
   	}
    //edit company
    @RequestMapping("/edircompDetails")
    public ModelAndView editCompany(CompanyDetails companyDetails,ModelMap model,HttpSession session)
    {
    	String index="index";
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{
			if(lus.authontication(l,"Admin"))
			{
				model.addAttribute("userName",l.getUname());
				model.addAttribute("userId",l.getEmpUserId());
		    	companyDetails = companyDetailsService.view(companyDetails).get(0);
		    	return new ModelAndView("Company/edit_CompanyDetails","editcompanyDetails",companyDetails);
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
    //update company
    @RequestMapping("/update")
    public ModelAndView updateCompany(CompanyDetails companyDetails,ModelMap model,HttpSession session)
    {
    	String index="index";
    	Login l=(Login) session.getAttribute("user");
    	int i = companyDetailsService.updateCompanyInfo(companyDetails);
    	if(i>0)
   		{
    		model.addAttribute("userName",l.getUname());
    		model.addAttribute("userId",l.getEmpUserId());
    		model.addAttribute("editcompanyDetails",companyDetails);
   		}
    	model.addAttribute("userName",l.getUname());
		model.addAttribute("userId",l.getEmpUserId());
		model.addAttribute("index", index);
		model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());
    	return new ModelAndView("index");
    }
    /*//checkRegi.do
    @RequestMapping("/checkRegi")
   	public ModelAndView checkRegi(CompanyDetails companyDetails,ModelMap model)
   	{
    	model.addAttribute("count",companyDetailsService.getRegCount());
    	return new ModelAndView("Login");
   	}*/
}
