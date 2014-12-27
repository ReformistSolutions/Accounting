package com.invoice.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.invoice.company.service.CompanyDetailsService;
import com.invoice.login.beans.Login;
import com.invoice.login.service.LoginUserService;
import com.invoice.reports.service.ReportsServiceImpl;

@Controller
@SessionAttributes("user")
public class LoginController {
	
	@Autowired
	LoginUserService lus;
	@Autowired
	ReportsServiceImpl reportsServiceImpl;
	CompanyDetailsService companyDetailsService;
	@Autowired
	LoginUserService loginUserService;
	
	 public CompanyDetailsService getCompanyDetailsService() {
		return companyDetailsService;
	}
	 @Autowired
	public void setCompanyDetailsService(CompanyDetailsService companyDetailsService) {
		this.companyDetailsService = companyDetailsService;
	}
	
	@RequestMapping("/login.do")
	public ModelAndView login(ModelMap model)
	{		
		model.addAttribute("count", loginUserService.Count());
		return new ModelAndView("Login",model);
	}
	
	@RequestMapping("/loginuser")
	public String autho(HttpServletRequest req,Model model,HttpSession session )
	{	
			String index="index";
			String userName=req.getParameter("txtUname");
			String pass=req.getParameter("txtPassword");
			Login l=lus.authontication(userName, pass);
			if(l==null)
			{
				model.addAttribute("count", loginUserService.Count());
				model.addAttribute("error","<script> alert('Please Enter Correct Credintials.');</script>");
				return "Login";
			}
			else
			{
				model.addAttribute("count", loginUserService.Count());
				model.addAttribute("userName",l.getUname());
				model.addAttribute("userId",l.getEmpUserId());
				session.setAttribute("user",l);
				session.setAttribute("flag",true);
				model.addAttribute("index", index);
				model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());
				return "index";
			}
		
	}
	@RequestMapping("/logout")
	public String logout(HttpSession session,ModelMap model)
	{
		model.addAttribute("count", loginUserService.Count());
		Login l=(Login) session.getAttribute("user");
		l.setFlag(false);
		return "Login";
	}
	
}
