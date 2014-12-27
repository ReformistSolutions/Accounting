package com.invoice.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.invoice.login.beans.Login;
import com.invoice.login.service.LoginUserService;
import com.invoice.reports.service.ReportsServiceImpl;

@Controller
public class dashboardController {

	String index = "index";
	@Autowired
	LoginUserService lus;
	@Autowired
	ReportsServiceImpl reportsServiceImpl;
	
	@RequestMapping(value="index")
	public ModelAndView index(HttpSession session,ModelMap model)
	{
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l))
		{
			model.addAttribute("index", index);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());
			return new ModelAndView("index");
		}
		else
		{
			return new ModelAndView("Login");
		}
	}
}