package com.invoice.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.invoice.accounting.beans.AddNewTax;
import com.invoice.accounting.beans.ComposeMail;

import com.invoice.accounting.beans.Createnewexpense;
import com.invoice.accounting.beans.JournalHeader;
import com.invoice.accounting.beans.LinkedTax;
import com.invoice.accounting.beans.NewAccount;
import com.invoice.accounting.beans.AddNewAuditor;
import com.invoice.accounting.beans.NewAccountGroup;
import com.invoice.accounting.beans.NewCreditNote;
import com.invoice.accounting.beans.NewDebitNote;
import com.invoice.accounting.service.AccountGroupService;
import com.invoice.accounting.service.AddNewAccountService;
import com.invoice.accounting.service.AddTaxService;
import com.invoice.accounting.service.AuditorService;
import com.invoice.accounting.service.CreateexpenseService;

import com.invoice.accounting.service.CreditNotesService;
import com.invoice.accounting.service.DebitNotesService;
import com.invoice.accounting.service.JournalEntryService;
import com.invoice.company.beans.CompanyDetails;
import com.invoice.inventory.service.CreateNewProductService;
import com.invoice.login.beans.Login;
import com.invoice.login.service.LoginUserService;
import com.invoice.reports.service.ReportsServiceImpl;

@Controller
public class accountingController {
		
	String index="index";
	String accounting="accounting";
	CreditNotesService creditNotesService;
	DebitNotesService debitNotesService;
	AddNewAccountService addNewAccountService;
	AccountGroupService accountGroupService;
	AddTaxService addTaxService;
	AuditorService auditorService;
	JournalEntryService journalEntryService;
	CreateexpenseService createexpenseService;
	CreateNewProductService createNewProductService;
	
	public CreateNewProductService getCreateNewProductService() {
		return createNewProductService;
	}
	@Autowired
	public void setCreateNewProductService(
			CreateNewProductService createNewProductService) {
		this.createNewProductService = createNewProductService;
	}
	@Autowired
	ReportsServiceImpl reportsServiceImpl;
   public CreateexpenseService getCreateexpenseService() {
		return createexpenseService;
	}
    @Autowired
	public void setCreateexpenseService(CreateexpenseService createexpenseService) {
		this.createexpenseService = createexpenseService;
	}

	@Autowired
	public void setJournalEntryService(JournalEntryService journalEntryService) {
		this.journalEntryService = journalEntryService;
	}

	public AddTaxService getAddTaxService() {
		return addTaxService;
	}
   
	@Autowired
	public void setAddTaxService(AddTaxService addTaxService) {
		this.addTaxService = addTaxService;
	}

	public AuditorService getAuditorService() {
		return auditorService;
	}
	
	@Autowired
	public void setAuditorService(AuditorService auditorService) {
		this.auditorService = auditorService;
	}
	
	public AccountGroupService getAccountGroupService() {
		return accountGroupService;
	}
    @Autowired
	public void setAccountGroupService(AccountGroupService accountGroupService) {
		this.accountGroupService = accountGroupService;
	}

	public AddNewAccountService getAddNewAccountService() {
		return addNewAccountService;
	}
	
	@Autowired
	public void setAddNewAccountService(AddNewAccountService addNewAccountService) {
		this.addNewAccountService = addNewAccountService;
	}
	public DebitNotesService getDebitNotesService() {
		return debitNotesService;
	}
	@Autowired
	public void setDebitNotesService(DebitNotesService debitNotesService) {
		this.debitNotesService = debitNotesService;
	}
	public CreditNotesService getCreditNotesService() {
		return creditNotesService;
	}
    
	@Autowired
	public void setCreditNotesService(CreditNotesService creditNotesService) {
		this.creditNotesService = creditNotesService;
	}
    @Autowired
	LoginUserService lus;
	
    @RequestMapping(value="addNewAuditor")
    public ModelAndView createAccount(AddNewAuditor addnewAuditor, ModelMap model,HttpSession session)
    {
    	
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			model.addAttribute("msg",auditorService.addnewAuditor(addnewAuditor));
			return new ModelAndView("Accounting/ViewAduitors","viewAuditdata",addnewAuditor);	
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
    
    @RequestMapping(value="/addsalpurTax")
	public ModelAndView addsalpurTax(AddNewTax addNewTax,LinkedTax linkedTax,ModelMap model,HttpSession session){
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			model.addAttribute("message",addTaxService.save(addNewTax,linkedTax));
			model.addAttribute("addNeTax",addNewTax);
	    	return new ModelAndView("Accounting/Taxes");
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
    
    
    
    @RequestMapping(value="/addNew")
	public ModelAndView addnewsalTax(AddNewTax addNewTax,LinkedTax linkedTax,ModelMap model,HttpSession session){
		
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
	    	addNewTax=addTaxService.genrateID();
	    	model.addAttribute("addNeTax",addNewTax);
	    	return new ModelAndView("Accounting/AddNewTax");
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
    
    @RequestMapping(value="createexpense")
    public ModelAndView createnewexpense(Createnewexpense createnewexpense,ModelMap model,HttpSession session){
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			model.addAttribute("expList", createexpenseService.showexpense());
			return new ModelAndView("Accounting/RecordExpense","recordexpense",createnewexpense);
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
    
    @RequestMapping(value="newexpense")
    public ModelAndView createexpense(Createnewexpense createnewexpense,ModelMap model,HttpSession session){
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			model.addAttribute("EXPID", createexpenseService.generateExpID());
			model.addAttribute("expenselist1", createexpenseService.retrivepaidfrom());
            model.addAttribute("expenselist", createexpenseService.retriveexpensetype());
			return new ModelAndView("Accounting/CreateNewExpense","createexpense",createnewexpense);
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
    @RequestMapping(value="addcreateexpense")
    public ModelAndView create(Createnewexpense createnewexpense,ModelMap model,HttpSession session){
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			int i=0;
			int message = 0;
	    	i=createexpenseService.save(createnewexpense); 
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
			createnewexpense=createexpenseService.editexpense(createnewexpense.getExpid()).get(0);
			return new ModelAndView("Accounting/viewexpense","expenseView",createnewexpense);		
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
    
    @RequestMapping(value="/expenseView")
   	public ModelAndView viewexpense(@RequestParam String expid,Createnewexpense createnewexpense,ModelMap model,HttpSession session){
   		  
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
    	createnewexpense=createexpenseService.editexpense(expid).get(0);
        return new ModelAndView("Accounting/viewexpense","expenseView",createnewexpense);
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
    
    @RequestMapping(value="/editexpense")
 	public ModelAndView editexp(@RequestParam String expid,Createnewexpense createnewexpense,ModelMap model,HttpSession session){
 		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{	
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
 		createnewexpense=createexpenseService.editexpense(expid).get(0);
 		model.addAttribute("expenselist1",createexpenseService.retrivepaidfrom());
 		model.addAttribute("expenselist",createexpenseService.retriveexpensetype());
 		return new ModelAndView("Accounting/editexpense","ExpenseView", createnewexpense);
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
    
    @RequestMapping("/updateexpense")
    public ModelAndView updateexp(@ModelAttribute Createnewexpense createnewexpense,ModelMap model,HttpSession session){
  		    
  		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			int i=0;
			int update = 0;
	    	i=createexpenseService.updateexpense(createnewexpense);
	    	System.out.println(i);
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
     		createnewexpense=createexpenseService.editexpense(createnewexpense.getExpid()).get(0);
     		 return new ModelAndView("Accounting/viewexpense","expenseView",createnewexpense);		
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
    
    
    @RequestMapping("/delexpense")
	 public ModelAndView delexpense(@RequestParam String expid,Createnewexpense createnewexpense,ModelMap model,HttpSession session){
		 Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			int i=0,delete=0;
			i=createexpenseService.delete(expid);
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
	   	
	   	model.addAttribute("expList", createexpenseService.showexpense());
		return new ModelAndView("Accounting/RecordExpense","recordexpense",createnewexpense);				
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
    
     @RequestMapping(value="createGroupAccount")
        	public ModelAndView createGroupAccount(NewAccountGroup newAccountGroup,ModelMap model,HttpSession session){
    		
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{
    	String Sel=newAccountGroup.getTxtParentacntgrp();
    	if(Sel.equals("p"))
    	{
    		model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			    int i=0;
				int message = 0;
		    	i=accountGroupService.save(newAccountGroup); 
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
    	
    	return new ModelAndView("Accounting/ViewAccountGroup","viewGrpAccount",newAccountGroup);
    	}
    	else
    	{
    		model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			int i=0;
			int message = 0;
	    	i=accountGroupService.save(newAccountGroup); 
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
    	
    		newAccountGroup=accountGroupService.viewsAccountGrop(newAccountGroup.getTxtsAccGrpNo()).get(0);
    		return new ModelAndView("Accounting/Viewsubaccountgroup","viewGrpAccount",newAccountGroup);    	
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

    @RequestMapping(value="createAccount")
    public ModelAndView createAccount(NewAccount newAccount, ModelMap model,HttpSession session){
		
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			int i=0;
			int message = 0;
	    	i=addNewAccountService.save(newAccount); 
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
       
        model.addAttribute("accountList",addNewAccountService.showAccount());
	     model.addAttribute("accountsList",addNewAccountService.showsAccount());
		return new ModelAndView("Accounting/ChartOfAccounts","accoLists",newAccount);
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
    
    @RequestMapping(value="newDebitNotes")
    public ModelAndView newDebitNote(NewDebitNote newDebitNote,JournalHeader journalHeader,ModelMap model,HttpSession session){
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
		model.addAttribute("message",debitNotesService.save(newDebitNote, journalHeader));
   		newDebitNote=debitNotesService.editdebit(newDebitNote.getTxtVoucherNo()).get(0);
		return new ModelAndView("Accounting/ViewDebitNotes","viewDebit",newDebitNote);
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
 
	@RequestMapping(value="/newCreditNote")
	public ModelAndView newCreditNote(NewCreditNote newCreditNote,JournalHeader journalHeader,ModelMap model,HttpSession session){
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
		model.addAttribute("message",creditNotesService.save(newCreditNote, journalHeader));
   		newCreditNote=creditNotesService.viewCredit(newCreditNote.getTxtVoucherNo()).get(0);
		return new ModelAndView("Accounting/ViewCreditNotes","viewCerdit",newCreditNote);
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
	
	
	//Update Group Account
  	@RequestMapping("/updateGroupAccount")
    public ModelAndView updateGroupAccount(@ModelAttribute NewAccountGroup newAccountGroup,ModelMap model,HttpSession session){
  		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			int i=0;
			int update = 0;
	    	i=accountGroupService.updateGroupAccount(newAccountGroup);
	    	System.out.println(i);
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
  		    newAccountGroup=accountGroupService.viewAccountGrop(newAccountGroup.getTxtAccGrpNo()).get(0);
   	 		return new ModelAndView("Accounting/ViewAccountGroup","viewGrpAccount",newAccountGroup);
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
  	
  	@RequestMapping("/updatesGroupAccount")
    public ModelAndView updatesGroupAccount(@ModelAttribute NewAccountGroup newAccountGroup,ModelMap model,HttpSession session){
  		    
  		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			int i=0;
			int update = 0;
	    	i=accountGroupService.updatesGroupAccount(newAccountGroup);
	    	System.out.println(i);
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
     		newAccountGroup=accountGroupService.viewsAccountGrop(newAccountGroup.getTxtsAccGrpNo()).get(0);
       		return new ModelAndView("Accounting/Viewsubaccountgroup","viewGrpAccount",newAccountGroup);
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
  	
  	@RequestMapping("/updateAccount")
  	
  	public ModelAndView updatepAccount(@ModelAttribute NewAccount newAccount,ModelMap model,HttpSession session){
  		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			int i=0;
			int update = 0;
	    	i=addNewAccountService.updatepaccount(newAccount);
	    	System.out.println(i);
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
  		newAccount=addNewAccountService.viewAccountList(newAccount.getTxtNewAccNo()).get(0);
  		return new ModelAndView("Accounting/ViewAccount","viewStaticAccount",newAccount);
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
  	
@RequestMapping("/updatesubAccount")
  	
  	public ModelAndView updatesAccount(@ModelAttribute NewAccount newAccount,ModelMap model,HttpSession session){
	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{	
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			int i=0;
			int update = 0;
	    	i=addNewAccountService.updatesaccount(newAccount);
	    	System.out.println(i);
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
  		newAccount=addNewAccountService.viewsAccountList(newAccount.getTxtNewAccNo()).get(0);
  		return new ModelAndView("Accounting/ViewAccount","viewStaticAccount",newAccount);
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
  	
	//Update Debit Notes 
	
   	@RequestMapping("/updateDebitNotes")
    public ModelAndView editdebittnote(@ModelAttribute NewDebitNote newDebitNote ,ModelMap model,HttpSession session){
   		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{	
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
   		model.addAttribute("message",debitNotesService.updateDebitNotes(newDebitNote));
   		return new ModelAndView("Accounting/ViewDebitNotes","viewDebit",newDebitNote);
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
   		//Update credit Notes 
   	
   	@RequestMapping("/updateCreditNote")
    public ModelAndView updateCreditNote(@ModelAttribute NewCreditNote newCreditNote ,ModelMap model,HttpSession session){
   		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{	
   		int i=creditNotesService.updateCreditNotes(newCreditNote);
   		if(i>0){
   			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
   		    model.addAttribute("message",creditNotesService.viewCredit(newCreditNote.getTxtVoucherNo()).get(0));
   		    return new ModelAndView("Accounting/ViewCreditNotes","viewCerdit",newCreditNote);
   		}
		return null;  	
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
//Update Auditors
   	
   	@RequestMapping("/updateAuditor")
    public ModelAndView UpdateNewAuditors(@ModelAttribute AddNewAuditor addNewAuditor,ModelMap model,HttpSession session){
   		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{	
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
   		model.addAttribute("message",auditorService.update(addNewAuditor));
   		return new ModelAndView("Accounting/ViewAduitors","viewAuditdata",addNewAuditor);  		
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

 // Edit data of Account List 
 	@RequestMapping(value="/editAccountList")
 	public ModelAndView editAccountList(@RequestParam int accountID,NewAccount newAccount,ModelMap model,HttpSession session){
 		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{	
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
 		newAccount=addNewAccountService.viewAccountList(accountID).get(0);
 		model.addAttribute("grpList",addNewAccountService.retrivepGroupName());
 		
 		return new ModelAndView("Accounting/EditAccount","editlistAccount", newAccount);
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
 	@RequestMapping(value="/editsAccountList")
 	public ModelAndView editsAccountList(@RequestParam int accountID,NewAccount newAccount,ModelMap model,HttpSession session){
 		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
 		newAccount=addNewAccountService.viewsAccountList(accountID).get(0);
 		
 		model.addAttribute("grpsList",addNewAccountService.retrivesGroupName());
 		return new ModelAndView("Accounting/EditSubAccount","editslistAccount", newAccount);
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
 // Edit data of Account Group 
	@RequestMapping(value="/editAccountGroup")
	public ModelAndView editAccountGroup(@RequestParam String groupID,NewAccountGroup newAccountGroup,ModelMap model,HttpSession session){
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
		newAccountGroup=accountGroupService.viewAccountGrop(groupID).get(0);
		return new ModelAndView("Accounting/EditAccountGroup","editGrpAccount", newAccountGroup);
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
	
	@RequestMapping(value="/editsAccountGroup")
	public ModelAndView editsAccountGroup(@RequestParam String groupID,NewAccountGroup newAccountGroup,ModelMap model,HttpSession session){
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
		newAccountGroup=accountGroupService.viewsAccountGrop(groupID).get(0);
		model.addAttribute("grpList",addNewAccountService.retrivepGroupName());
		return new ModelAndView("Accounting/editsubaccountgroup","editsGrpAccount", newAccountGroup);
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
	// Edit data of Credit Notes 
	@RequestMapping(value="/editCreditNote")
	public ModelAndView editCreditNote(@RequestParam String voucherID,NewCreditNote creditNote,ModelMap model,HttpSession session){
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
		model.addAttribute("acccountList",creditNotesService.retriveAccountNo());
		
		creditNote=creditNotesService.viewCredit(voucherID).get(0);
		return new ModelAndView("Accounting/EditCreditNotes","editcreditnote", creditNote);
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
	// Edit data of Debit Notes 
		@RequestMapping(value="/editDebitNotes")
		public ModelAndView editDebitNotes(@RequestParam String voucherID,NewDebitNote newDebitNote,ModelMap model,HttpSession session){
			Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
		    model.addAttribute("editList",debitNotesService.retriveAccountNos());
			newDebitNote=debitNotesService.editdebit(voucherID).get(0);
			return new ModelAndView("Accounting/EditDebitNotes","editdebittnote", newDebitNote);
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
		// Edit data of Auditors 
		@RequestMapping(value="/editAuditors")
		public ModelAndView editAuditors(@RequestParam String auditID,AddNewAuditor newAuditor,ModelMap model,HttpSession session){
			Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			newAuditor=auditorService.viewAuditors(auditID).get(0);
			return new ModelAndView("Accounting/EditAuditor","updateNwAuditor", newAuditor);
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
	 
	@RequestMapping(value="/newGroupfAccount",method=RequestMethod.GET)
	public ModelAndView newGroupfAccount(NewAccountGroup newAccountGroup, ModelMap model,HttpSession session){
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
		model.addAttribute("pgrpID",accountGroupService.genrateAccID());
		model.addAttribute("sgrpID",accountGroupService.genratesAccID());
		model.addAttribute("grpList",addNewAccountService.retrivepGroupName());

		model.addAttribute("createGrpAccount", newAccountGroup);
		return new ModelAndView("Accounting/NewAccountGroup","createGrpAccount",newAccountGroup);
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
	
	@RequestMapping(value="/auditors")
	public ModelAndView auditors(AddNewAuditor addNewAuditor, ModelMap model,HttpSession session){
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
		model.addAttribute("auditorList",auditorService.show());
		return new ModelAndView("Accounting/Auditor","AddNewAuditor",addNewAuditor);
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
	@RequestMapping(value="/newAuditorsinvitation",method=RequestMethod.GET)
	public ModelAndView addNnewAuditors(AddNewAuditor newAuditor, ModelMap model,HttpSession session){
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
	newAuditor=auditorService.generateID();
		model.addAttribute("newAuditors", newAuditor);
		return new ModelAndView("Accounting/NewAuditor");
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
	@RequestMapping(value="/taxesform",method=RequestMethod.GET)
	public ModelAndView taxesinfo(ModelMap model,HttpSession session){
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
		AddNewTax addtax= new AddNewTax();
		model.addAttribute("taxesList", addtax);
		return new ModelAndView("Accounting/Taxes");
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
   //View For Debit Notes Plugins
	
    @RequestMapping(value="/debitnote")
	public ModelAndView debitnote(NewDebitNote newDebitNote,ModelMap model,HttpSession session){
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
    	model.addAttribute("debitNotesList", debitNotesService.showDebit());
		return new ModelAndView("Accounting/DebitNotes","NewDebitNote",newDebitNote);
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
    //view For Group Of Account Plugins
    @RequestMapping(value="/frmAccountGroups")
	public ModelAndView frmAccountGroup(NewAccountGroup newAccountGroup, ModelMap model,HttpSession session){
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
		model.addAttribute("listOfGroup", accountGroupService.showgroupAccount());
		model.addAttribute("listOfsGroup", accountGroupService.showgroupsAccount());
		return new ModelAndView("Accounting/AccountGroups","newGroupAcc", newAccountGroup);}
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
    //View For Account List Plugins
 
    @RequestMapping("/accounting")
    public ModelAndView showAccountList(NewAccount newAccount,ModelMap model,HttpSession session)
    {
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
    	model.addAttribute("accountList",addNewAccountService.showAccount());
    	model.addAttribute("accountsList",addNewAccountService.showsAccount());
    	return new ModelAndView("Accounting/ChartOfAccounts", "accoLists", newAccount);
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
     //View Credit Notes Credit Notes in Plugin
    @RequestMapping(value="/creditnote")
	public ModelAndView creditnote(NewCreditNote newCreditNote, ModelMap model,HttpSession session){
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
    	model.addAttribute("creditList",creditNotesService.showCredit());
    	
		return new ModelAndView("Accounting/CreditNotes","NewCreditNote",newCreditNote);
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
   
    @RequestMapping(value="/newDebitNote",method=RequestMethod.GET)
	public ModelAndView newDebittnote(NewDebitNote newDebitNote,ModelMap model,HttpSession session){
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
    	newDebitNote=debitNotesService.genrateID();
    	model.addAttribute("acclists",debitNotesService.retriveAccountNos());
		model.addAttribute("newdebitnote", newDebitNote);
		return new ModelAndView("Accounting/NewDebitNote");
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
    @RequestMapping(value="/newCreditNote",method=RequestMethod.GET)
	public ModelAndView newcreditnote(NewCreditNote newCreditNote, ModelMap model,HttpSession session){
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
    	newCreditNote=creditNotesService.genrateID();
    	model.addAttribute("acList",creditNotesService.retriveAccountNo());
		model.addAttribute("newcreditnote", newCreditNote);
		return new ModelAndView("Accounting/NewCreditNote");
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
    @RequestMapping(value="/newAccount",method=RequestMethod.GET)
	public ModelAndView newAccount(NewAccount newAccount, ModelMap model,HttpSession session)
	{
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
    	newAccount=addNewAccountService.genrateAccID();
		model.addAttribute("grpList",addNewAccountService.retrivepGroupName());
		model.addAttribute("grpsList",addNewAccountService.retrivesGroupName());
        model.addAttribute("createAccount",newAccount);
		return new ModelAndView("Accounting/NewAccount");
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
    @RequestMapping(value="/viewAduitors")
    public ModelAndView viewAduditorsdetails(@RequestParam String auditID,AddNewAuditor addNewAuditor,CompanyDetails companyDetails,ModelMap model,HttpSession session){
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
    	addNewAuditor=auditorService.viewAuditors(auditID).get(0);
    	return new ModelAndView("Accounting/ViewAduitors","viewAuditdata",addNewAuditor);		
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
    //All View Static Pages Coding
    @RequestMapping(value="/viewDebitNote")
   	public ModelAndView viewDebitNote(NewDebitNote debitNote,ModelMap model,HttpSession session){
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
   		model.addAttribute("viewDebit",debitNote);
   		return new ModelAndView("Accounting/ViewDebitNotes");
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
    
   	//View Static Gropup View
    @RequestMapping(value="/viewAccGroup")
	   	public ModelAndView viewAccountGroup(@RequestParam String groupID,NewAccountGroup newAccountGroup,ModelMap model,HttpSession session){
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{    
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
	   		newAccountGroup=accountGroupService.viewAccountGrop(groupID).get(0);
	   		
	   		return new ModelAndView("Accounting/ViewAccountGroup","viewGrpAccount",newAccountGroup);
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
    
    @RequestMapping(value="/viewSubAccGroup")
   	public ModelAndView viewsAccountGroup(@RequestParam String groupID,NewAccountGroup newAccountGroup,ModelMap model,HttpSession session){
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{  
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
   		newAccountGroup=accountGroupService.viewsAccountGrop(groupID).get(0);
   		return new ModelAndView("Accounting/Viewsubaccountgroup","viewGrpAccount",newAccountGroup);
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
    
    //Static View of Account List 
    
    @RequestMapping(value="/viewAccountList")
   	public ModelAndView viewAccountList(@RequestParam int accountID,NewAccount newAccount,ModelMap model,HttpSession session){
   		  
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
    	newAccount=addNewAccountService.viewAccountList(accountID).get(0);
        return new ModelAndView("Accounting/ViewAccount","viewStaticAccount",newAccount);
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
    @RequestMapping(value="/viewsAccountList")
   	public ModelAndView viewsAccountList(@RequestParam int accountID,NewAccount newAccount,ModelMap model,HttpSession session){
    	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{ 
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
    	newAccount=addNewAccountService.viewsAccountList(accountID).get(0);
        return new ModelAndView("Accounting/ViewSubaccount","viewsubStaticAccount",newAccount);
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
    //Static View on viewCreditNote
	@RequestMapping("/viewCreditNote")
   	public ModelAndView viewCreditNote(@RequestParam String voucherID,NewCreditNote newCreditNote,ModelMap model,HttpSession session)
   	{
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
   		newCreditNote=creditNotesService.viewCredit(voucherID).get(0);
   		return new ModelAndView("Accounting/ViewCreditNotes","viewCerdit",newCreditNote);
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
	@RequestMapping(value="/viewAccounts")
	   	public ModelAndView viewAccounts(NewAccount newAccount,ModelMap model,HttpSession session){
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{ 
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
	   		model.addAttribute("viewAccount",newAccount);
	   		return new ModelAndView("Accounting/ViewAccount");
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
   	// Static View Debit Notes
   	@RequestMapping("/debitNotesView")
   	public ModelAndView debitNotesView(@RequestParam String voucherID,NewDebitNote newDebitNote,ModelMap model,HttpSession session)
   	{  		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
   		newDebitNote=debitNotesService.editdebit(voucherID).get(0);
   		return new ModelAndView("Accounting/ViewDebitNotes","viewDebit",newDebitNote);
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
   	//PDF for Auditors
   	@RequestMapping("/auditorPDF")
   	public ModelAndView auditorPDF(@RequestParam String auditID,AddNewAuditor newAuditor,CompanyDetails companyDetails,ModelMap model,HttpSession session)
   	{  
   		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
    	model.addAttribute("compInfo",auditorService.getInfo(companyDetails).get(0));
   		newAuditor=auditorService.viewAuditors(auditID).get(0);
   		return new ModelAndView("auditorPDF","viewAuditdata",newAuditor);
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
   	
   	//PDF For Credit Notes 
   	@RequestMapping("/creditNotesPDF")
   	public ModelAndView creditNotesPDF(@RequestParam String voucherID,NewCreditNote newCreditNote,CompanyDetails companyDetails,ModelMap model,HttpSession session)
   	{  
   		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{ 
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
    	newCreditNote=creditNotesService.viewCredit(voucherID).get(0);
    	model.addAttribute("compInfo",creditNotesService.getInfo(companyDetails).get(0));
    	
    	return new ModelAndView("creditNotesPDF","viewCerdit", newCreditNote);
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
   	
	//PDF For Debit Notes  
   	@RequestMapping("/debitNotesPDF")
   	public ModelAndView debitNotesPDF(@RequestParam String voucherID,NewDebitNote newDebitNote,CompanyDetails companyDetails,ModelMap model,HttpSession session)
   	{  
   		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{ 
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
   		newDebitNote=debitNotesService.editdebit(voucherID).get(0);
   		model.addAttribute("compInfo",debitNotesService.getInfo(companyDetails).get(0));
    	return new ModelAndView("debitNotesPDF","viewDebit", newDebitNote);
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
   	
  //PDF For accountPDF 
   	@RequestMapping("/accountPDF")
   	public ModelAndView accountPDF(@RequestParam int accountID,NewAccount newAccount,CompanyDetails companyDetails,ModelMap model,HttpSession session)
   	{  
   		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
   		newAccount=addNewAccountService.viewAccountList(accountID).get(0);
        model.addAttribute("compInfo",addNewAccountService.getInfo(companyDetails).get(0));
   		
    	return new ModelAndView("newAccountPDF","viewStaticAccount", newAccount);
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
   	@RequestMapping("/subaccountPDF")
   	public ModelAndView accountsPDF(@RequestParam int accountID,NewAccount newAccount,CompanyDetails companyDetails,ModelMap model,HttpSession session)
   	{  
   		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{ 
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
   		newAccount=addNewAccountService.viewsAccountList(accountID).get(0);
   		model.addAttribute("compInfo",addNewAccountService.getInfo(companyDetails).get(0));
   		

    	return new ModelAndView("subAccountPDF","viewsubStaticAccount", newAccount);
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
   	
  //PDF For Account Group 
   	@RequestMapping("/groupAccountPDF")
   	public ModelAndView groupAccountPDF(@RequestParam String groupID,NewAccountGroup newAccountGroup,CompanyDetails companyDetails,ModelMap model,HttpSession session)
   	{  
   		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
   		newAccountGroup=accountGroupService.viewAccountGrop(groupID).get(0);
   		model.addAttribute("compInfo",accountGroupService.getInfo(companyDetails).get(0));
    	return new ModelAndView("newGropuAccPDF","viewGrpAccount", newAccountGroup);
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
   	@RequestMapping("/subgroupAccountPDF")
   	public ModelAndView groupsAccountPDF(@RequestParam String groupID,NewAccountGroup newAccountGroup,CompanyDetails companyDetails,ModelMap model,HttpSession session)
   	{
   		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
   		newAccountGroup=accountGroupService.viewsAccountGrop(groupID).get(0);
   		model.addAttribute("compInfo",accountGroupService.getInfo(companyDetails).get(0));
    	return new ModelAndView("subGropuAccPDF","viewGrpAccount", newAccountGroup);

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
 
   	
   	//PDF For Journal Entry journalEntryPDF
   	@RequestMapping("/journalEntryPDF")
   	public ModelAndView journalEntryPDF(@RequestParam String voucher_No,JournalHeader journalHeader,CompanyDetails companyDetails, ModelMap model,HttpSession session)
   	{  
   		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
   		journalHeader=journalEntryService.viewjournal(voucher_No).get(0);
   		model.addAttribute("compInfo",creditNotesService.getInfo(companyDetails).get(0));
    	return new ModelAndView("journalEntPDF","viewJournal", journalHeader);
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
   	
   	// Journal Header And Detail 
   	@RequestMapping(value="/journal")
	public ModelAndView journalView(JournalHeader journalHeader,ModelMap model,HttpSession session){		
   		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
		model.addAttribute("journalList",journalEntryService.show());
		return new ModelAndView("Accounting/JournalEntry","journalHeader",journalHeader);
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
	@RequestMapping(value="/newJournalEntry",method=RequestMethod.GET)
	public ModelAndView newEntryview(JournalHeader journalHeader, ModelMap model,HttpSession session)
	{
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
		model.addAttribute("accountlist",journalEntryService.retriveaccount());
		journalHeader=journalEntryService.generateId();
		return new ModelAndView("Accounting/JournalHeaderDetails","newJournal",journalHeader);
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
	
	@RequestMapping(value="/newJournalHead")
	public ModelAndView addnewEntryview(JournalHeader journalHeader, ModelMap model,HttpSession session){
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			int i=0;
			int message = 0;
	    	i=journalEntryService.saveJournalEntry(journalHeader); 
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
		
		model.addAttribute("journalList",journalEntryService.show());
		return new ModelAndView("Accounting/JournalEntry","journalHeader",journalHeader);
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
	 @RequestMapping(value="/viewJournalEntry")
	   	public ModelAndView viewjournal( @RequestParam String voucher_No,JournalHeader journalHeader,ModelMap model,HttpSession session){
		 Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{ 
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			journalHeader= journalEntryService.viewjournal(voucher_No).get(0);
			
	   		return new ModelAndView("Accounting/viewJournal","viewJournal", journalHeader);
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
	 @RequestMapping(value="/editJournalEntry")
	   	public ModelAndView editjournal(@RequestParam String voucher_No ,JournalHeader journalheader,ModelMap model,HttpSession session){
		 Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{ 	
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
		 model.addAttribute("accountlist",journalEntryService.retriveaccount());  
	    	journalheader=journalEntryService.viewjournal(voucher_No).get(0);;
	   		
	   		return new ModelAndView("Accounting/EditJouranl","editJournal", journalheader);
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
	 @RequestMapping(value="/updateJouranl")
		public ModelAndView updatejouranl(JournalHeader journalHeader ,ModelMap model,HttpSession session){
		 Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{	
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
		 model.addAttribute("msg",journalEntryService.updatejournal(journalHeader));
		model.addAttribute("viewJournal",journalHeader);
	
	return new ModelAndView("Accounting/viewJournal");
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
	 
	 @RequestMapping(value="/simpleAccount",method=RequestMethod.GET)
		public ModelAndView simpleAccount(JournalHeader journalHeader,ModelMap model,HttpSession session)
		{
		 Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{ 	
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			model.addAttribute("journalList", journalEntryService.show());
			return new ModelAndView("Accounting/AccountingEntries","journalHeader",journalHeader);
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
	 //Delete Group Account
		 @RequestMapping("/deleteAccountGroup")
		 public ModelAndView deleteRecord(@RequestParam String groupID,NewAccountGroup newAccountGroup,ModelMap model,HttpSession session){
			Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			int i=0,delete=0;
			i=accountGroupService.deletegroup(groupID);
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
		   	
			model.addAttribute("listOfGroup", accountGroupService.showgroupAccount());
			return new ModelAndView("Accounting/AccountGroups","newGroupAcc",newAccountGroup);				
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
		 @RequestMapping("/deletesAccountGroup")
		 public ModelAndView deletesRecord(@RequestParam String groupID,NewAccountGroup newAccountGroup,ModelMap model,HttpSession session){
			 Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			int i=0,delete=0;
			i=accountGroupService.deletesgroup(groupID);
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
		   	
		   	
			model.addAttribute("listOfsGroup", accountGroupService.showgroupsAccount());
			return new ModelAndView("Accounting/AccountGroups","newGroupAcc",newAccountGroup);				
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
		 
		 @RequestMapping("/deletepAccount")
		 
		 public ModelAndView deletepaccount(@RequestParam int accountID,NewAccount newAccount,ModelMap model,HttpSession session)
		 {
			 Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			int i=0,delete=0;
			i=addNewAccountService.deletepAccount(accountID);
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
			 
			 model.addAttribute("accountList",addNewAccountService.showAccount());
		     model.addAttribute("accountsList",addNewAccountService.showsAccount());
		     return new ModelAndView("Accounting/ChartOfAccounts","accoLists",newAccount);
		    	
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
 @RequestMapping("/deletesAccount")
		 
		 public ModelAndView deletesaccount(@RequestParam int accountID,NewAccount newAccount,ModelMap model,HttpSession session)
		 {
	        Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			int i=0,delete=0;
			i=addNewAccountService.deletesAccount(accountID);
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
			 model.addAttribute("accountList",addNewAccountService.showAccount());
		     model.addAttribute("accountsList",addNewAccountService.showsAccount());
		     return new ModelAndView("Accounting/ChartOfAccounts","accoLists",newAccount);
		    	
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
		 //Delete Debit Notes 
		 @RequestMapping(value="/deleteDebitNotes")
			public ModelAndView deleteDebitNotes(@RequestParam String voucherID,NewDebitNote newDebitNote,ModelMap model,HttpSession session){
			Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			    model.addAttribute("message",debitNotesService.deletedebit(voucherID));
		    	model.addAttribute("debitNotesList", debitNotesService.showDebit());
				return new ModelAndView("Accounting/DebitNotes","NewDebitNote",newDebitNote);
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
		 //Delete Credit Notes
		 @RequestMapping(value="/deleteCreditNote")
			public ModelAndView deleteCreditNote(@RequestParam String voucherID,NewCreditNote newCreditNote, ModelMap model,HttpSession session){
			
			 Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			    model.addAttribute("message",creditNotesService.deleteCredit(voucherID));
		    	model.addAttribute("creditList",creditNotesService.showCredit());
		    	
				return new ModelAndView("Accounting/CreditNotes","NewCreditNote",newCreditNote);
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
		 //Delete Auditor
		 @RequestMapping(value="/deleteAuditor")
			public ModelAndView deleteAuditor(@RequestParam String auditID,AddNewAuditor newAuditor,ModelMap model,HttpSession session){
			 Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			    model.addAttribute("message",auditorService.deleteaAuditor(auditID));
				model.addAttribute("auditorList",auditorService.show());
				return new ModelAndView("Accounting/Auditor","auditorform", newAuditor);
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
		 
		 //Delete Journal Entry
		 @RequestMapping(value="/deleteJournalEntry")
			public ModelAndView deleteJournalEntry(@RequestParam String journal_Id,JournalHeader journalHeader,ModelMap model,HttpSession session){		
			 Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			int i=0,delete=0;
			i=journalEntryService.delete(journal_Id);
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
			   
				model.addAttribute("journalList",journalEntryService.show());
				return new ModelAndView("Accounting/JournalEntry","journalHeader",journalHeader);
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
		 
		 // Email Sending composeMaileCr
		 @RequestMapping(value="composeMaileCr")

		 public ModelAndView composeMaileCr(ComposeMail composeMail,ModelMap model,HttpSession session)
		 {
			 Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
		 	return new ModelAndView("Accounting/composeMail","composeMail",composeMail);
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

		 @RequestMapping(value="asendMail")

		 public ModelAndView sendmail(ComposeMail composeMail,ModelMap model,HttpSession session)
		 {
			Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
		 	model.addAttribute("message",creditNotesService.sendMail(composeMail));
		 	
		 	return new ModelAndView("Accounting/composeMail","composeMail",composeMail);
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
		 //Email Sending for composemailDr
		 @RequestMapping(value="composemailDr")
		 public ModelAndView composemailDr(ComposeMail composeMail,ModelMap model,HttpSession session)
		 {
			 Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
		 	return new ModelAndView("Accounting/composeMail","composeMail",composeMail);
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
		 //Email for Sending auditorEntryMail
		 
		 @RequestMapping(value="auditorEntryMail")
		 public ModelAndView auditorEntryMail(ComposeMail composeMail,ModelMap model,HttpSession session)
		 {
			Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
		 	return new ModelAndView("Accounting/composeMail","composeMail",composeMail);
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
		 //Email for accountEmail  
		 @RequestMapping(value="accountEmail")
		 public ModelAndView accountEmail(ComposeMail composeMail,ModelMap model,HttpSession session)
		 {
			 Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
		 	return new ModelAndView("Accounting/composeMail","composeMail",composeMail);
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
		 //Email For Account List
		 @RequestMapping(value="accountOneEmail")
		 public ModelAndView accountOneEmail(ComposeMail composeMail,ModelMap model,HttpSession session)
		 {Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
		 	return new ModelAndView("Accounting/composeMail","composeMail",composeMail);
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
		 // Email For journalEntryEmail
		 @RequestMapping(value="journalEntryEmail")
		 public ModelAndView journalEntryEmail(ComposeMail composeMail,ModelMap model,HttpSession session)
		 {
			 Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Accounting"))
		{
			model.addAttribute("accounting",accounting);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
		 	return new ModelAndView("Accounting/composeMail","composeMail",composeMail);
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