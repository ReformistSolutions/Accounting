package com.invoice.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
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

import com.invoice.company.beans.CompanyDetails;
import com.invoice.login.beans.Login;
import com.invoice.login.service.LoginUserService;
import com.invoice.payroll.beans.BreakupByEmployee;
import com.invoice.payroll.beans.ComposeMail;
import com.invoice.payroll.beans.EmployeeBeans;
import com.invoice.payroll.beans.Leave;
import com.invoice.payroll.beans.LeaveApplication;
import com.invoice.payroll.beans.Payhead;
import com.invoice.payroll.beans.ProcessPayroll;
import com.invoice.payroll.beans.SalaryBeans;
import com.invoice.payroll.beans.UploadFile;
import com.invoice.payroll.beans.VeriableTemp;
import com.invoice.payroll.service.EmployeeService;
import com.invoice.payroll.service.EmployeedetailPdf;
import com.invoice.payroll.service.InitiateProcessService;
import com.invoice.payroll.service.LeaveApplicationService;
import com.invoice.payroll.service.PayheadService;
import com.invoice.payroll.service.SalaryService;
import com.invoice.reports.service.ReportsServiceImpl;
import com.itextpdf.text.Document;
import com.itextpdf.text.pdf.PdfWriter;
@Controller
public class EmployeeController {
	
	String payroll = "payroll";
	String index="index";
	@Autowired
	EmployeedetailPdf employeedetailPdf;
	
	EmployeeService empservice;	
	@Autowired
	ReportsServiceImpl reportsServiceImpl;
	public EmployeeService getEmpservice() {
		return empservice;
	}
	@Autowired
	public void setEmpservice(EmployeeService empservice) {
		this.empservice = empservice;
	}
	
	InitiateProcessService itiateProcessService; 
	public InitiateProcessService getItiateProcessService() {
		return itiateProcessService;
	}
	@Autowired
	public void setItiateProcessService(InitiateProcessService itiateProcessService) {
		this.itiateProcessService = itiateProcessService;
	}
	SalaryService salaryService;
	public SalaryService getSalaryService() {
		return salaryService;
	}
	@Autowired
	public void setSalaryService(SalaryService salaryService) {
		this.salaryService = salaryService;
	}
	PayheadService payheadService;	
	public PayheadService getPayheadService() {
		return payheadService;
	}
	@Autowired
	public void setPayheadService(PayheadService payheadService) {
		this.payheadService = payheadService;
	}
	LeaveApplicationService leaveApplicationService;
	public LeaveApplicationService getLeaveApplicationService() {
		return leaveApplicationService;
	}
	@Autowired
	public void setLeaveApplicationService(
			LeaveApplicationService leaveApplicationService) {
		this.leaveApplicationService = leaveApplicationService;
	}
	@Autowired
	LoginUserService lus;
	
	
	@RequestMapping(value = "/payroll")
	public ModelAndView viewPayroll(ProcessPayroll processPayroll,ModelMap model,EmployeeBeans employeeBeans,HttpSession session)
	{	
		
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Payroll"))
		{	
			String yes="yes";
		    String no="no";
			
		    DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");	     
		    Date date = new Date();	     
		    String dt=dateFormat.format(date);
		    
			List<ProcessPayroll> pdate = empservice.processDate();
			for (ProcessPayroll processPayroll2 : pdate) 
			{
				String procDt = processPayroll2.getSchuduleDate();
				String procM=procDt.substring(0,7);
				String currdtM=(dt.substring(0,7)).toString();
				if(procM.equals(currdtM))
				{
					model.addAttribute("result",yes);
					model.addAttribute("processDate", procDt);
				}
				else
				{
					model.addAttribute("result", no);
				}
			}
/*			String Active = "active";
			if(empservice.salaryProcess()!=null)
			{
				model.addAttribute("active",Active);
			}
*/			model.addAttribute("payroll", payroll);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			model.addAttribute("empList", empservice.salaryProcess());
			model.addAttribute("comDate", empservice.shwoCompdate());
		model.addAttribute("totalcnt",empservice.cnttotal());
		model.addAttribute("statuscnt",empservice.cntactive());
		model.addAttribute("inactivecnt",empservice.cntinactive());
		return  new ModelAndView("Payroll/ManagePayroll");
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

	@RequestMapping(value = "/users")
	public ModelAndView showusers(EmployeeBeans employeeBeans,UploadFile uploadFile,ModelMap model,HttpSession session)
	{
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Payroll"))
		{
			model.addAttribute("payroll", payroll);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			model.addAttribute("adminList", empservice.showAdmin());
		model.addAttribute("empList",empservice.show());	
		model.addAttribute("empLists",empservice.inactiveshow());
		return new ModelAndView("Payroll/Employees","employeeBeans",employeeBeans);
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
	
	@RequestMapping(value = "/addEmployee", method = RequestMethod.GET)
	public ModelAndView viewAddNewEmp(EmployeeBeans emp,ModelMap model,HttpSession session) 
	{
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Payroll"))
		{
			model.addAttribute("payroll", payroll);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			model.addAttribute("newEmployee", emp);			
			emp=empservice.generateId();
			model.addAttribute("deptList", empservice.retriveDept());
			model.addAttribute("desigList", empservice.retriveDesig());
			//model.addAttribute("payheadList", empservice.showPayhead(type));
			return  new ModelAndView("Payroll/NewEmployee","newEmployee",emp) ;
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
	
	@RequestMapping(value="retrivePayheads")
	public ModelAndView retrivePayheads(@RequestParam String type,ModelMap model,HttpSession session)
	{
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Payroll"))
		{
			model.addAttribute("payroll", payroll);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			model.addAttribute("payheadList", empservice.showPayhead(type));
			return  new ModelAndView("Payroll/retrivePayheads") ;
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
		@RequestMapping(value="addEmployee")
	    public ModelAndView savesaldtls(EmployeeBeans emp,SalaryBeans salaryBeans, ModelMap model,String emId,HttpSession session)
		{
			Login l=(Login) session.getAttribute("user");
			if(lus.chkFlag(l))
			{ 
			if(lus.authontication(l,"Payroll"))
			{
				model.addAttribute("payroll", payroll);
				model.addAttribute("userName",l.getUname());
				model.addAttribute("userId",l.getEmpUserId());
				int i=0,msg=0;
				i=empservice.saveEmployeedtls(emp,salaryBeans);
				/*if(i==0)
				{
					model.addAttribute("count", msg);
					model.addAttribute("payroll", payroll);
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
					model.addAttribute("newEmployee", emp);
					emp=empservice.generateId();
					return  new ModelAndView("Payroll/NewEmployee","newEmployee",emp) ;
				}
				else 
				{*/
					if(i>=1)
					{
						msg=1;
						model.addAttribute("msg", msg);
						model.addAttribute("msg1", empservice.ShowAdd());
					}
					else
					{
						msg=0;
						model.addAttribute("msg", msg);
						model.addAttribute("msg1", empservice.ShowNotAdd());
					}
				//model.addAttribute("msgs",empservice.getPasword(emId));
				//model.addAttribute("empView", empservice.showEmployee(emp.getTxtEmpId()));
				EmployeeBeans emp1= empservice.showEmployee(emp.getTxtEmpId()).get(0);
				model.addAttribute("leaveList", empservice.showLeaves(emp.getTxtEmpId()));
				model.addAttribute("salList", empservice.showSal(emp.getTxtEmpId()));
				return new ModelAndView("Payroll/employeeDetails","empView",emp1);
				//}
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
		@RequestMapping("editLeave")
		public ModelAndView deleteLeave(@RequestParam String empid,String leaveid,Leave leave,EmployeeBeans employeeBeans, ModelMap model,HttpSession session)
		{
			Login l=(Login) session.getAttribute("user");
			if(lus.chkFlag(l)){ 
			if(lus.authontication(l,"Payroll"))
			{
				model.addAttribute("payroll", payroll);
				model.addAttribute("userName",l.getUname());
				model.addAttribute("userId",l.getEmpUserId());
				leave = empservice.editLeave(empid, leaveid).get(0);
				return new ModelAndView("Payroll/editLeaves","leaves",leave);				
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
		@RequestMapping("updateLeaves")
		public ModelAndView updateLeaves(Leave leave,ModelMap model,EmployeeBeans employeeBeans,HttpSession session)
		{
			Login l=(Login) session.getAttribute("user");
			if(lus.chkFlag(l)){ 
			if(lus.authontication(l,"Payroll"))
			{
				
			int i = empservice.updateLeave(leave);
	   		if(i>0) 
	   		{
	   		
	   			model.addAttribute("leaves", leave);
	   		}
	   		model.addAttribute("payroll", payroll);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
	   		EmployeeBeans emp1= empservice.showEmployee(leave.getTxtEmpId()).get(0);
			model.addAttribute("leaveList", empservice.showLeaves(leave.getTxtEmpId()));
			model.addAttribute("salList", empservice.showSal(leave.getTxtEmpId()));
			return new ModelAndView("Payroll/employeeDetails","empView",emp1);
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
		
		@RequestMapping(value="managetime")
	    public ModelAndView managetime(EmployeeBeans emp, ModelMap model,HttpSession session)
		{	
			Login l=(Login) session.getAttribute("user");
			if(lus.chkFlag(l)){
			if(lus.authontication(l,"Payroll"))
			{
				model.addAttribute("payroll", payroll);
				model.addAttribute("userName",l.getUname());
				model.addAttribute("userId",l.getEmpUserId());
			model.addAttribute("empList",empservice.show());
			return new ModelAndView("Payroll/ManageTime","timemanage",emp);
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
		
		@RequestMapping(value="salarydtl")
	    public ModelAndView saldtls(EmployeeBeans emp, ModelMap model,HttpSession session)
		{		
			Login l=(Login) session.getAttribute("user");
			if(lus.chkFlag(l)){
			if(lus.authontication(l,"Payroll"))
			{
				model.addAttribute("payroll", payroll);
				model.addAttribute("userName",l.getUname());
				model.addAttribute("userId",l.getEmpUserId());
				return new ModelAndView("Payroll/SalaryDetails","saldtl",emp);
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
		 //All View Static Pages Coding
		 @RequestMapping(value="/viewemp")
		  public ModelAndView viewemp( @RequestParam String emp_ID ,EmployeeBeans employeeBeans,SalaryBeans salaryBeans,ModelMap model,HttpSession session)
		 {
			 Login l=(Login) session.getAttribute("user");
				if(lus.chkFlag(l)){
				if(lus.authontication(l,"Payroll"))
				{
					model.addAttribute("payroll", payroll);
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
					employeeBeans=empservice.showEmployee(emp_ID).get(0);
					model.addAttribute("leaveList", empservice.showLeaves(emp_ID));
					model.addAttribute("salList", empservice.showSal(emp_ID));
				
					model.addAttribute("empView",employeeBeans);
					return new ModelAndView("Payroll/viewemployee","empView", employeeBeans);
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
		 @RequestMapping("viewSalarySlip")	
		 public ModelAndView viewSalarySlip(@RequestParam String emp_ID,EmployeeBeans employeeBeans,ModelMap model,HttpSession session)
		 {
			 Login l=(Login) session.getAttribute("user");
				if(lus.chkFlag(l)){
				if(lus.authontication(l,"Payroll"))
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
					try{
						model.addAttribute("payroll", payroll);
						model.addAttribute("userName",l.getUname());
						model.addAttribute("userId",l.getEmpUserId());
					employeeBeans=empservice.showEmployee(emp_ID).get(0); 
					model.addAttribute("eList",empservice.showEarning(emp_ID, month, year)); 
					model.addAttribute("dList", empservice.showDeduction(emp_ID, month, year)); 
					model.addAttribute("nList", empservice.showNetSalary(emp_ID, month, year));
					model.addAttribute("eAmt", empservice.showEarningAmount(emp_ID, month, year));
					model.addAttribute("dAmt", empservice.showDeductionAmount(emp_ID, month, year));
					model.addAttribute("daysDeduc",empservice.showDaysDeduction(emp_ID, month, year));
				}catch(Exception e)
				 {
					String msg = "No";
					model.addAttribute("msg",msg);
					model.addAttribute("payroll", payroll);
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
					model.addAttribute("empList",empservice.show());	
					model.addAttribute("empLists",empservice.inactiveshow());
					return new ModelAndView("Payroll/Employees","employeeBeans",employeeBeans);
				 }
					return new ModelAndView("Payroll/ViewSalarySlip","viewSalarySlip",employeeBeans);
					
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
			 //All View Edit Pages Coding
		 @RequestMapping(value="/editEmployee")
		   	public ModelAndView editemployee( @RequestParam String emp_ID,EmployeeBeans employeeBeans,ModelMap model,HttpSession session)
		 {
			 Login l=(Login) session.getAttribute("user");
				if(lus.chkFlag(l)){
				if(lus.authontication(l,"Payroll"))
				{
					employeeBeans=empservice.showEmployee(emp_ID).get(0);
					String paytype = employeeBeans.getPayType();
			   		if(paytype.equalsIgnoreCase("Bank"))
			   		{
			   			model.addAttribute("bank",paytype);
			   		}
					model.addAttribute("payroll", payroll);
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
			 		return new ModelAndView("Payroll/EditEmployee","editEmployee", employeeBeans);
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
		 //All View Update Pages Coding
		 @RequestMapping(value="/updateEmployee")
   			public String updateemployee(EmployeeBeans employeeBeans, ModelMap model,HttpSession session)
		 {
			 Login l=(Login) session.getAttribute("user");
				if(lus.chkFlag(l)){
				if(lus.authontication(l,"Payroll"))
				{
					int i = empservice.updateEmployeedtl(employeeBeans);
			   		if(i>0)		
			   		{
			   			//employeeBeans = empservice.showEmployee(employeeBeans.getTxtEmpId()).get(0);
			   			model.addAttribute("employeeBeans", employeeBeans);
			   		}
			   		model.addAttribute("payroll", payroll);
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
			   		employeeBeans=empservice.showEmployee(employeeBeans.getTxtEmpId()).get(0);
			   		
			   		model.addAttribute("leaveList", empservice.showLeaves(employeeBeans.getTxtEmpId()));
					//model.addAttribute("salList", empservice.showSal(employeeBeans.getTxtEmpId()));
					model.addAttribute("empView",employeeBeans);
			   		return "Payroll/viewemployee";
				}
				else
				{
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
					model.addAttribute("index", index);
					model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());
					model.addAttribute("msg","<script>alert('Access Denied');</script>");
					return "index";
				}
				}
				else
				{
					return "Login";
				}	
		   	}

		 //All view for Delete details
		 
		 @RequestMapping(value="/deleteEmployee")
			public ModelAndView deleteemployee(EmployeeBeans employeeBeans,SalaryBeans salaryBeans, String emp_ID, ModelMap model,HttpSession session)
		 {
			 String msg = "true";
			 Login l=(Login) session.getAttribute("user");
				if(lus.chkFlag(l)){
				if(lus.authontication(l,"Payroll"))
				{
					model.addAttribute("msg",msg);
					model.addAttribute("payroll", payroll);
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
					int i=0,msg1=0;
					i=empservice.delete(emp_ID);
					if(i>=1)
					{
						msg1=1;
						model.addAttribute("msg1", msg1);
						model.addAttribute("msg", empservice.ShowDelete());
					}
					else
					{
						msg1=0;
						model.addAttribute("msg1", msg1);
						model.addAttribute("msg", empservice.ShowNotDelete());
					}
					model.addAttribute("adminList", empservice.showAdmin());
					model.addAttribute("empList",empservice.show());
					model.addAttribute("empLists",empservice.inactiveshow());
					return new ModelAndView("Payroll/Employees");
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

		//restoreEmp 
		 @RequestMapping(value="/restoreEmp")
			public ModelAndView restoreEmp(String emp_ID, ModelMap model,HttpSession session)
		 {
			 String msg = "true";
			 Login l=(Login) session.getAttribute("user");
				if(lus.chkFlag(l)){
				if(lus.authontication(l,"Payroll"))
				{
					model.addAttribute("msg",msg);
					model.addAttribute("payroll", payroll);
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
					int i=0,restore=0;
					i=empservice.restoreEmp(emp_ID);
					if(i>=1)
					{
						restore=1;
						model.addAttribute("restore", restore);
						model.addAttribute("msg", empservice.ShowRestore());
					}
					else
					{
						restore=0;
						model.addAttribute("restore", restore);
						model.addAttribute("msg", empservice.ShowNotRestore());
					}
					model.addAttribute("adminList", empservice.showAdmin());
					model.addAttribute("empList",empservice.show());
					model.addAttribute("empLists",empservice.inactiveshow());
					return new ModelAndView("Payroll/Employees");
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
		 
		 @RequestMapping("/employeedetailPDF")
			public ModelAndView downloadPDF(@RequestParam String emp_ID,EmployeeBeans employeeBeans,ProcessPayroll processPayroll,SalaryBeans salaryBeans,CompanyDetails companyDetails,ModelMap model,HttpSession session)
			{  
			 Login l=(Login) session.getAttribute("user");
				if(lus.chkFlag(l)){
				if(lus.authontication(l,"Payroll"))
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
					model.addAttribute("payroll", payroll);
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
			 	 employeeBeans=empservice.showEmployee(emp_ID).get(0);
			 	 model.addAttribute("compInfo",salaryService.getInfo(companyDetails).get(0));
			 	 employeeBeans = empservice.viewSalary(emp_ID).get(0);
			 	 processPayroll = empservice.showDaysDeduction(emp_ID, month, year).get(0);			 	 
			 	 model.addAttribute("nList", empservice.showNetSalary(emp_ID,month,year));
			 	 model.addAttribute("eAmt", empservice.showEarningAmount(emp_ID,month,year));
			 	 model.addAttribute("dAmt", empservice.showDeductionAmount(emp_ID,month,year));
			 	 //model.addAttribute("daysDeduc",empservice.showDaysDeduction(emp_ID, month, year));
			 	 return new ModelAndView("employeedetailPDF" ,"employeedetail", employeeBeans);
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
		 
		 
		 @RequestMapping("/composeMail")
		 public ModelAndView composeemail(@RequestParam String emp_ID,EmployeeBeans employeeBeans,CompanyDetails companyDetails,ComposeMail composeMail,ModelMap model,HttpSession session,Document doc,PdfWriter writer,HttpServletRequest request,HttpServletResponse response) throws Exception 
			{ 
			 /*String loginEmpId="";*/
			 Login l=(Login) session.getAttribute("user");
				if(lus.chkFlag(l))
				{
				if(lus.authontication(l,"Payroll"))
				{
					/*loginEmpId =l.getEmpUserId();*/

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
					model.addAttribute("payroll", payroll);
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
			 	 employeeBeans=empservice.showEmployee(emp_ID).get(0);
			 	 model.addAttribute("compInfo",salaryService.getInfo(companyDetails).get(0));
			 	 employeeBeans = empservice.viewSalary(emp_ID).get(0);			 	 
			 	 model.addAttribute("nList", empservice.showNetSalary(emp_ID,month,year));
			 	 model.addAttribute("eAmt", empservice.showEarningAmount(emp_ID,month,year));
			 	 model.addAttribute("dAmt", empservice.showDeductionAmount(emp_ID,month,year));
			 	model.addAttribute("employeedetailPDF", employeeBeans);
			 	model.addAttribute("employeedetail", employeeBeans);
					composeMail = empservice.composeMail(emp_ID).get(0);
					employeedetailPdf.buildPdfDocument(model, doc, writer, request, response);
					return new ModelAndView("Payroll/composeMail","composeMail", composeMail);
				}
				else
				{
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
					model.addAttribute("index", index);
					model.addAttribute("msg","<script>alert('Access Denied');</script>");
					return new ModelAndView("index");
				}
				}
				else
				{
					return new ModelAndView("Login");
				}
			}

		 @RequestMapping("/paySendMail")
			public ModelAndView sendmail(ComposeMail composeMail,ModelMap model,HttpSession session)
			{  	
			 //String loginEmpId="";
			 Login l=(Login) session.getAttribute("user");
				if(lus.chkFlag(l)){
				if(lus.authontication(l,"Payroll"))
				{					
					model.addAttribute("payroll", payroll);
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
			 	 model.addAttribute("message",empservice.sendMail(l.getEmpUserId(), composeMail)); 
			 	 return new ModelAndView("Payroll/composeMail","composeMail", composeMail);
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
		 @RequestMapping("/leaveDetails")
		 public ModelAndView leaveDetails(LeaveApplication leaveApplication,ModelMap model,HttpSession session)
		 {
			 Login l=(Login) session.getAttribute("user");
				if(lus.chkFlag(l)){
				if(lus.authontication(l,"Payroll"))
				{
					model.addAttribute("payroll", payroll);
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
					model.addAttribute("leaveDetailsList", leaveApplicationService.show());
					model.addAttribute("approvelist", leaveApplicationService.showApprove());
					model.addAttribute("approveLeaves", leaveApplicationService.showApprovedLeaves());
					model.addAttribute("rejectedLeaves", leaveApplicationService.showRejectedLeaves());
					return new ModelAndView("Payroll/LeaveDetails","",leaveApplication);
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
		 @RequestMapping("/approveLeave")
		 public ModelAndView approveLeave(@RequestParam String empid,String leaveid,LeaveApplication leaveApplication,ModelMap model,HttpSession session)
		 {
			 /*String approve = "approve";*/
			 Login l=(Login) session.getAttribute("user");
				if(lus.chkFlag(l)){
				if(lus.authontication(l,"Payroll"))
				{
					model.addAttribute("payroll", payroll);
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
					int i=0,approve=0;
					i=leaveApplicationService.approveeleave(empid, leaveid, leaveApplication);
					if(i>=1)
					{
						approve=1;
						model.addAttribute("approve", approve);
						model.addAttribute("msg", empservice.ShowApproved());
					}
					else
					{
						approve=0;
						model.addAttribute("approve", approve);
						model.addAttribute("msg", empservice.ShowNotApproved());
					}
					model.addAttribute("approvelist", leaveApplicationService.showApprove());
					model.addAttribute("leaveDetailsList", leaveApplicationService.show());
					model.addAttribute("approveLeaves", leaveApplicationService.showApprovedLeaves());
					model.addAttribute("rejectedLeaves", leaveApplicationService.showRejectedLeaves());
					return new ModelAndView("Payroll/LeaveDetails","",leaveApplication);
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
		 
		 @RequestMapping("/rejectLeave")
		 public ModelAndView rejectLeave(LeaveApplication leaveApplication,ModelMap model,HttpSession session)
		 {
			 /*String approve = "approve";*/
			 Login l=(Login) session.getAttribute("user");
				if(lus.chkFlag(l)){
				if(lus.authontication(l,"Payroll"))
				{
					model.addAttribute("payroll", payroll);
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
					int i=0,reject=0;
					i=leaveApplicationService.rejectleave(leaveApplication);
					if(i>=1)
					{
						reject=1;
						model.addAttribute("reject", reject);
						model.addAttribute("msg", empservice.ShowRejected());
					}
					else
					{
						reject=0;
						model.addAttribute("reject", reject);
						model.addAttribute("msg", empservice.ShowNotRejected());
					}
					model.addAttribute("approvelist", leaveApplicationService.showApprove());
					model.addAttribute("leaveDetailsList", leaveApplicationService.show());
					model.addAttribute("approveLeaves", leaveApplicationService.showApprovedLeaves());
					model.addAttribute("rejectedLeaves", leaveApplicationService.showRejectedLeaves());
					return new ModelAndView("Payroll/LeaveDetails","",leaveApplication);
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
		 
		 @RequestMapping("/leaveApplication")
		 public ModelAndView leaveApplication(LeaveApplication leaveApplication, ModelMap model,HttpSession session)
		 {
			 	Login l=(Login) session.getAttribute("user");
				if(lus.chkFlag(l)){
				if(lus.authontication(l,"Payroll"))
				{									
					model.addAttribute("payroll", payroll);
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
					model.addAttribute("empid", leaveApplicationService.showEmpID());
					model.addAttribute("leaveList", leaveApplicationService.retriveLeave());
					return new ModelAndView("Payroll/LeaveApplication","leaveApplication",leaveApplication);
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
		 @RequestMapping("/addLeaveApplication")
		 public ModelAndView addLeaveApplication(LeaveApplication leaveApplication, ModelMap model,HttpSession session)
		 {
			Login l=(Login) session.getAttribute("user");
			if(lus.chkFlag(l)){
			if(lus.authontication(l,"Payroll"))
			{
				model.addAttribute("payroll", payroll);
				model.addAttribute("userName",l.getUname());
				model.addAttribute("userId",l.getEmpUserId());
				int i=0,message=0;
				
				i=leaveApplicationService.save(leaveApplication);
				if(i==0)
				{
					model.addAttribute("message", message);
					model.addAttribute("payroll", payroll);
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
					model.addAttribute("empid", leaveApplicationService.showEmpID());
					model.addAttribute("leaveList", leaveApplicationService.retriveLeave());
					return new ModelAndView("Payroll/LeaveApplication","leaveApplication",leaveApplication);
				}
				else
				{
					if(i>=1)
					{
						message=1;
						model.addAttribute("message", message);
						model.addAttribute("msg", empservice.ShowAdd());
					}
					else
					{
						message=0;
						model.addAttribute("message", message);
						model.addAttribute("msg", empservice.ShowNotAdd());
					}
					model.addAttribute("leaveDetailsList", leaveApplicationService.show());
					model.addAttribute("approvelist", leaveApplicationService.showApprove());
					model.addAttribute("approveLeaves", leaveApplicationService.showApprovedLeaves());
					model.addAttribute("rejectedLeaves", leaveApplicationService.showRejectedLeaves());
					return new ModelAndView("Payroll/LeaveDetails");
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
		 
		 @RequestMapping("/payrollSetting")
		 public ModelAndView payrollSetting(ModelMap model,HttpSession session)
		 {
			 Login l=(Login) session.getAttribute("user");
				if(lus.chkFlag(l)){
				if(lus.authontication(l,"Payroll"))
				{
					model.addAttribute("payroll", payroll);
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
					model.addAttribute("payheadlist", payheadService.show());
					return new ModelAndView("Payroll/PayrollSetting",model);
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
		 @RequestMapping("/NewPayHeads")
		 public ModelAndView NewPayHeads(Payhead payhead,ModelMap model,HttpSession session)
		 {
			 Login l=(Login) session.getAttribute("user");
				if(lus.chkFlag(l))
				{
				if(lus.authontication(l,"Payroll"))
				{
					payhead = payheadService.generateID();
					model.addAttribute("payroll", payroll);
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
					return new ModelAndView("Payroll/NewPayhead","newpayhead",payhead);
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
		
		 @RequestMapping("/addPayhead")
		 public ModelAndView addPayhead(Payhead payhead,ModelMap model,HttpSession session)
		 {
			Login l=(Login) session.getAttribute("user");
			if(lus.chkFlag(l)){
			if(lus.authontication(l,"Payroll"))
			{
				model.addAttribute("payroll", payroll);
				model.addAttribute("userName",l.getUname());
				model.addAttribute("userId",l.getEmpUserId());
				int i=0,message=0;
				i=payheadService.save(payhead);
				if(i>=1)
				{
					message=1;
					model.addAttribute("message", message);
					model.addAttribute("msg", empservice.ShowAdd());
				}
				else
				{
					message=0;
					model.addAttribute("message", message);
					model.addAttribute("msg", empservice.ShowNotAdd());
				}
				model.addAttribute("payheadlist", payheadService.show());
				return new ModelAndView("Payroll/PayrollSetting","newpayhead",payhead);
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
		 @RequestMapping("editPayhead")
		 public ModelAndView editPayhead(@RequestParam String payheadId,Payhead payhead,ModelMap model,HttpSession session)
		 {
			Login l=(Login) session.getAttribute("user");
			if(lus.chkFlag(l)){
			if(lus.authontication(l,"Payroll"))
			{
				model.addAttribute("payroll", payroll);
				model.addAttribute("userName",l.getUname());
				model.addAttribute("userId",l.getEmpUserId());
				payhead = payheadService.view(payheadId).get(0);
				String apType = payhead.getApplicable_type();
				model.addAttribute("apType", apType);
				String applicable = payhead.getGetvalue();
				model.addAttribute("applicable",applicable);
				String affectedSal = payhead.getGetyesno();
				model.addAttribute("affectedSal", affectedSal);
				return new ModelAndView("Payroll/EditPayhead","editpayhead",payhead);
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
		 @RequestMapping("viewPayhead")
		 public ModelAndView viewPayhead(@RequestParam String payheadId,Payhead payhead,ModelMap model,HttpSession session)
		 {
			Login l=(Login) session.getAttribute("user");
			if(lus.chkFlag(l)){
			if(lus.authontication(l,"Payroll"))
			{
				model.addAttribute("payroll", payroll);
				model.addAttribute("userName",l.getUname());
				model.addAttribute("userId",l.getEmpUserId());
				payhead = payheadService.view(payheadId).get(0); 
				return new ModelAndView("Payroll/ViewPayhead","viewpayhead",payhead);
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
		 
		 @RequestMapping("updatePayhead")
		 public String updatePayhead(Payhead payhead,ModelMap model,HttpSession session)
		 {
			 Login l=(Login) session.getAttribute("user");
			if(lus.chkFlag(l)){
			if(lus.authontication(l,"Payroll"))
			{
				int i=0,update=0;
				i = payheadService.updatePayHead(payhead);
				if(i>=1)
				{
					update=1;
					model.addAttribute("update", update);
					model.addAttribute("msg", empservice.ShowUpdate());
				}
				else
				{
					update=0;
					model.addAttribute("update", update);
					model.addAttribute("msg", empservice.ShowNotUpdate());
				}
		   		if(i>0)
		   		{
		   			model.addAttribute("viewpayhead", payhead);
		   			model.addAttribute("payroll", payroll);
					model.addAttribute("payheadlist", payheadService.show());
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
		   		}
		   		return "Payroll/PayrollSetting";
			}	
			else
			{
				model.addAttribute("userName",l.getUname());
				model.addAttribute("userId",l.getEmpUserId());
				model.addAttribute("index", index);
				model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());
				model.addAttribute("msg","<script>alert('Access Denied');</script>");
				return "index";
			}
			}
			else
			{
				return "Login";
			}
		 }
		 
		 @RequestMapping("deletePayhead")
		 public ModelAndView deletePayhead(@RequestParam String payheadId,Payhead payhead,ModelMap model, HttpSession session)
		 {
			Login l=(Login) session.getAttribute("user");
			if(lus.chkFlag(l)){
			if(lus.authontication(l,"Payroll"))
			{
				model.addAttribute("payroll", payroll);
				model.addAttribute("userName",l.getUname());
				model.addAttribute("userId",l.getEmpUserId());
				int i=0,delete=0;
				i = payheadService.delete(payheadId);
				if(i>=1)
				{
					delete=1;
					model.addAttribute("delete", delete);
					model.addAttribute("msg", empservice.ShowDelete());
				}
				else
				{
					delete=0;
					model.addAttribute("delete", delete);
					model.addAttribute("msg", empservice.ShowNotDelete());
				}
				model.addAttribute("payheadlist", payheadService.show());
				return new ModelAndView("Payroll/PayrollSetting",model);
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
		 
		 @RequestMapping("/breakupBy")
		 public ModelAndView breakupBy(BreakupByEmployee breakupByEmployee,EmployeeBeans employeeBeans,ModelMap model,HttpSession session)
		 {
			 Login l=(Login) session.getAttribute("user");
				if(lus.chkFlag(l)){
				if(lus.authontication(l,"Payroll"))
				{
					model.addAttribute("payroll", payroll);
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
					//by salary
					model.addAttribute("payhedList",empservice.showBreakupheadList());
					model.addAttribute("empList",empservice.empList());
					model.addAttribute("payamtList", empservice.showBreakupamtList());
					
					model.addAttribute("payhedListW",empservice.showBreakupheadListW());
					model.addAttribute("empListW",empservice.empListW());
					model.addAttribute("payamtListW", empservice.showBreakupamtListW());
					
					//by wages
					/*model.addAttribute("payhedList",empservice.showBreakupheadList());
					model.addAttribute("empList",empservice.empList());
					model.addAttribute("payamtList", empservice.showBreakupamtList());*/
					return new ModelAndView("Payroll/BreakupByEmployee","breakupByEmployee",breakupByEmployee);
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
		 @RequestMapping("/breakupFor")
		 public ModelAndView breakupFor(ModelMap model,HttpSession session)
		 {
			 Login l=(Login) session.getAttribute("user");
				if(lus.chkFlag(l)){
				if(lus.authontication(l,"Payroll"))
				{
					model.addAttribute("payroll", payroll);
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
			 return new ModelAndView("Payroll/BreakupForEmployee",model);
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
		 @RequestMapping("/initialProcess")
		 public ModelAndView initialProcess(ModelMap model,HttpSession session)
		 {
			 Login l=(Login) session.getAttribute("user");
				if(lus.chkFlag(l))
				{
				if(lus.authontication(l,"Payroll"))
				{
					model.addAttribute("payroll", payroll);
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
					model.addAttribute("verialbeList", empservice.showVeriableName());
					model.addAttribute("empList", empservice.salaryProcess());
					model.addAttribute("accountList",itiateProcessService.showAccountList());
					return new ModelAndView("Payroll/InitialProcess");
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
		 @RequestMapping("processConfirm")
		 public ModelAndView processConfirm(ProcessPayroll processPayroll,ModelMap model,HttpSession session)
		 {
			Login l=(Login) session.getAttribute("user");
			if(lus.chkFlag(l))
			{
			if(lus.authontication(l,"Payroll"))
			{
				model.addAttribute("payroll", payroll);
				model.addAttribute("userName",l.getUname());
				model.addAttribute("userId",l.getEmpUserId());
				model.addAttribute("payListConfirm", empservice.showConfirmPayroll());
				return new ModelAndView("Payroll/InitialProcessConfirm","processConfirm",processPayroll);
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
		 @RequestMapping("retriveEmpDetails")
		 public ModelAndView retriveEmpDetails(@RequestParam String empId,ModelMap model,HttpSession session)
		 {
			 Login l=(Login) session.getAttribute("user");
				if(lus.chkFlag(l)){
				if(lus.authontication(l,"Payroll"))
				{
					model.addAttribute("payroll", payroll);
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
					model.addAttribute("txtempName", leaveApplicationService.retriveEmpName(empId));
					model.addAttribute("txtDesignation", leaveApplicationService.retriveEmpDes(empId));
			    	return new ModelAndView("Payroll/retriveEmpDetails");
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
		 @RequestMapping("retriveTotalLeaves")
		 public ModelAndView retriveTotalLeaves(@RequestParam String empId,ModelMap model,HttpSession session)
		 {
			 Login l=(Login) session.getAttribute("user");
				if(lus.chkFlag(l)){
				if(lus.authontication(l,"Payroll"))
				{
					model.addAttribute("payroll", payroll);
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
					model.addAttribute("totalleaves", leaveApplicationService.totalLeaves(empId));
			    	return new ModelAndView("Payroll/retriveLeaves");
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
		 @RequestMapping("/retriveAccountName")
		 public ModelAndView retriveAccountName(@RequestParam String paytype,ModelMap model,HttpSession session)
		 {
			 Login l=(Login) session.getAttribute("user");
				if(lus.chkFlag(l)){
				if(lus.authontication(l,"Payroll"))
				{
					model.addAttribute("payroll", payroll);
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
					String paytypename = paytype;
					model.addAttribute("paytypename", paytypename);
					model.addAttribute("accountList", payheadService.retriveAccountName(paytype));
			    	return new ModelAndView("Payroll/retriveAccountName");
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
		 @RequestMapping("veriable_temp")
		 public ModelAndView veriable_temp(VeriableTemp veriableTemp,ModelMap model,HttpSession session)
		 {
			 Login l=(Login) session.getAttribute("user");
				if(lus.chkFlag(l)){
				if(lus.authontication(l,"Payroll"))
				{
					model.addAttribute("payroll", payroll);
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
					model.addAttribute("message", itiateProcessService.save(veriableTemp));
					model.addAttribute("verialbeList", empservice.showVeriableName());
					model.addAttribute("empList", empservice.salaryProcess());
					model.addAttribute("accountList",itiateProcessService.showAccountList());
					return new ModelAndView("Payroll/InitialProcess");
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
		 //retriveVeriables
		 @RequestMapping("retriveVeriables")
		 public ModelAndView retriveVeriables(@RequestParam String empid ,ModelMap model,HttpSession session)
		 {
			 Login l=(Login) session.getAttribute("user");
				if(lus.chkFlag(l)){
				if(lus.authontication(l,"Payroll"))
				{
					model.addAttribute("payroll", payroll);
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
					model.addAttribute("verialbeList", itiateProcessService.showVeriableName(empid));
					return new ModelAndView("Payroll/retriveVariable");
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
		 @RequestMapping("salaryApplicable")
		 public ModelAndView salaryApplicable(ProcessPayroll processPayroll,ModelMap model,HttpSession session)
		 {
			 Login l=(Login) session.getAttribute("user");
				if(lus.chkFlag(l)){
				if(lus.authontication(l,"Payroll"))
				{	
					model.addAttribute("payroll", payroll);
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
					model.addAttribute("message", itiateProcessService.saveSProcess(processPayroll));
					//model.addAttribute("payList", empservice.processPayroll());
					//model.addAttribute("empList", empservice.salaryProcess());	
					//model.addAttribute("payList", itiateProcessService.showPayrollprocess());
					//processPayroll = itiateProcessService.showPayrollprocess().get(0);
					//return new ModelAndView("Payroll/InitialProcess","salaryApplicable",processPayroll);
					
					String yes="yes";
				    String no="no";
					
				    DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");	     
				    Date date = new Date();	     
				    String dt=dateFormat.format(date);
				    List<ProcessPayroll> pdate = empservice.processDate();
					for (ProcessPayroll processPayroll2 : pdate) 
					{
						String procDt = processPayroll2.getSchuduleDate();
						String procM=procDt.substring(0,7);
						String currdtM=(dt.substring(0,7)).toString();
						if(procM.equals(currdtM))
						{
							model.addAttribute("result",yes);
							model.addAttribute("processDate", procDt);
						}
						else
						{
							model.addAttribute("result", no);							
						}
					}
					
					model.addAttribute("payroll", payroll);
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
					model.addAttribute("totalcnt",empservice.cnttotal());
					model.addAttribute("statuscnt",empservice.cntactive());
					model.addAttribute("inactivecnt",empservice.cntinactive());
					return  new ModelAndView("Payroll/ManagePayroll");
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
		
		 @RequestMapping("retriveSalaryslip")
		 public ModelAndView retriveSalaryslip(@RequestParam String month,String year,String empid,EmployeeBeans employeeBeans,ModelMap model,HttpSession session)
		 {
			 Login l=(Login) session.getAttribute("user");
				if(lus.chkFlag(l)){
				if(lus.authontication(l,"Payroll"))
				{
					model.addAttribute("payroll", payroll);
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
					model.addAttribute("viewSalarySlip", empservice.retriveSalarySlip(month, year, empid));
					model.addAttribute("eList",empservice.showEarning(empid, Integer.parseInt(month), Integer.parseInt(year)));	
					model.addAttribute("dList", empservice.showDeduction(empid,Integer.parseInt(month), Integer.parseInt(year)));
					model.addAttribute("eAmt", empservice.showEarningAmount(empid, Integer.parseInt(month), Integer.parseInt(year)));
					model.addAttribute("dAmt", empservice.showDeductionAmount(empid, Integer.parseInt(month), Integer.parseInt(year)));
					model.addAttribute("nList", empservice.showNetSalary(empid, Integer.parseInt(month), Integer.parseInt(year)));
					return new ModelAndView("Payroll/retriveSalarySlip");
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
		@RequestMapping("newLeaves")
		public ModelAndView newLeaves(Leave leave,ModelMap model,HttpSession session)
		{
			 Login l=(Login) session.getAttribute("user");
				if(lus.chkFlag(l)){
				if(lus.authontication(l,"Payroll"))
				{
					model.addAttribute("message", empservice.saveLeaves(leave));
					model.addAttribute("payroll", payroll);
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
					EmployeeBeans emp1= empservice.showEmployee(leave.getTxtEmpId()).get(0);
					model.addAttribute("leaveList", empservice.showLeaves(leave.getTxtEmpId()));
					model.addAttribute("salList", empservice.showSal(leave.getTxtEmpId()));
					return new ModelAndView("Payroll/employeeDetails","empView",emp1);
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
		//showProfile
		 @RequestMapping(value="/showProfile")
		  public ModelAndView showProfile( @RequestParam String empId ,EmployeeBeans employeeBeans,SalaryBeans salaryBeans,ModelMap model,HttpSession session)
		 {
			 Login l=(Login) session.getAttribute("user");
				if(lus.chkFlag(l)){
				if(lus.authontication(l,"Payroll"))
				{
					model.addAttribute("payroll", payroll);
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
					employeeBeans=empservice.showEmployee(empId).get(0);
					model.addAttribute("salList", empservice.showSal(empId));
					model.addAttribute("empView",employeeBeans);
					return new ModelAndView("Payroll/viewemployee","empView", employeeBeans);
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
		 //employeeProfile empId empName
		 @RequestMapping(value="/employeeProfile")
		  public ModelAndView employeeProfile(@RequestParam String empId,@RequestParam String empName,EmployeeBeans employeeBeans,SalaryBeans salaryBeans,ModelMap model,HttpSession session)
		 {
			 String record="Blank";
			 Login l=(Login) session.getAttribute("user");
				if(lus.chkFlag(l)){
					model.addAttribute("empId", empId);
					model.addAttribute("empName", empName);
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
					model.addAttribute("payroll", payroll);
					if(empservice.showEmployee(empId) != null)
					{
						employeeBeans=empservice.showEmployee(empId).get(0);						
					}
					else
					{
						model.addAttribute("record", record);
					}
					return new ModelAndView("Payroll/employeeProfile","employeeBeans",employeeBeans);
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
		 //addChangePassword.do
		 @RequestMapping(value="/addChangePassword")
		  public ModelAndView addChangePassword(EmployeeBeans employeeBeans,SalaryBeans salaryBeans,ModelMap model,HttpServletRequest request,HttpSession session)
		 {
			 Login l=(Login) session.getAttribute("user");
				if(lus.chkFlag(l)){
					int i= empservice.changePassword(employeeBeans);
					if(i>0)
					{
						model.addAttribute("res", i);
						request.getSession().invalidate();
						return new ModelAndView("Login");
					}
					else
					{
						model.addAttribute("payroll", payroll);
						model.addAttribute("userName",l.getUname());
						model.addAttribute("userId",l.getEmpUserId());
						model.addAttribute("res", i);
						model.addAttribute("payroll", payroll);
						return new ModelAndView("Payroll/employeeProfile","employeeBeans",employeeBeans);
					}					
				}
				else
				{
					request.getSession().invalidate();
					model.addAttribute("userName",l.getUname());
					model.addAttribute("userId",l.getEmpUserId());
					model.addAttribute("index", index);
					model.addAttribute("custInvChart", reportsServiceImpl.showAllInvoices());
					model.addAttribute("msg","<script>alert('Access Denied');</script>");
					return new ModelAndView("index");
				}
		   	}
		 //addDepartment
		@RequestMapping(value="/addDepartment")
		 public ModelAndView addDepartment(@RequestParam String deptName,String deptDesc,EmployeeBeans beans,ModelMap model,HttpSession session)
		 {
			 Login l=(Login) session.getAttribute("user");
				if(lus.chkFlag(l)){
				if(lus.authontication(l,"Payroll"))
				{
					model.addAttribute("message",empservice.saveDepartment(deptName, deptDesc));
					model.addAttribute("deptList", empservice.retriveDept());
					return  new ModelAndView("Payroll/retriveDept");
					//return  new ModelAndView("Payroll/NewEmployee","newEmployee",beans) ;
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
		//addDesignation
				@RequestMapping(value="/addDesignation")
				 public ModelAndView addDesignation(@RequestParam String desigName,String desigDesc,EmployeeBeans beans,ModelMap model,HttpSession session)
				 {
					 Login l=(Login) session.getAttribute("user");
						if(lus.chkFlag(l)){
						if(lus.authontication(l,"Payroll"))
						{
							model.addAttribute("message",empservice.saveDesignation(desigName, desigDesc));							
							model.addAttribute("desigList", empservice.retriveDesig());
							return  new ModelAndView("Payroll/retriveDesig");
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
				@RequestMapping(value="/retriveUserName")
				 public ModelAndView retriveUserName(@RequestParam String userName,EmployeeBeans beans,ModelMap model,HttpSession session)
				 {
					 Login l=(Login) session.getAttribute("user");
						if(lus.chkFlag(l)){
						if(lus.authontication(l,"Payroll"))
						{
							model.addAttribute("UN", empservice.retriveUserName(userName));						
							model.addAttribute("desigList", empservice.retriveDesig());
							return  new ModelAndView("Payroll/retriveUserName");
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
				@RequestMapping(value="/upload",method=RequestMethod.POST)
				public ModelAndView uploadFile(EmployeeBeans uploadFile,ModelMap model,HttpSession session,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
				{
					Login l=(Login) session.getAttribute("user"); 
					if(lus.chkFlag(l)){
					if(lus.authontication(l,"Payroll"))
					{
						System.out.println("in control"); 
					//	int i=0,message=0;						
						/*i=empservice.uploadFile(uploadFile, request, response); 
						if(i>0)
						{
							message=1;
							model.addAttribute("message", message);
						}
						else
						{ 
							message=0;
							model.addAttribute("message", message);
						}*/
						//model.addAttribute("file", empservice.uploadFile(uploadFile));
						model.addAttribute("adminList", empservice.showAdmin());
						model.addAttribute("empList",empservice.show());
						model.addAttribute("empLists",empservice.inactiveshow());
						return  new ModelAndView("Payroll/Employees");
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
}