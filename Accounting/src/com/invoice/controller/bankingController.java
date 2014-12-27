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

import com.invoice.accounting.beans.JournalHeader;

import com.invoice.banking.beans.Deposit;
import com.invoice.banking.beans.Transfer;
import com.invoice.banking.beans.Withdraw;
import com.invoice.banking.service.DepositService;
import com.invoice.banking.service.TransferService;
import com.invoice.banking.service.WithdrawService;
import com.invoice.company.beans.CompanyDetails;
import com.invoice.inventory.service.CreateNewProductService;
import com.invoice.login.beans.Login;
import com.invoice.login.service.LoginUserService;
import com.invoice.reports.service.ReportsServiceImpl;


@Controller
public class bankingController {
	
	String banking = "banking";
	String index="index";
	WithdrawService withdrawService;
	DepositService depositService;
	TransferService transferService;
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

	public TransferService getTransferService() {
		return transferService;
	}
@Autowired
	public void setTransferService(TransferService transferService) {
		this.transferService = transferService;
	}

	public DepositService getDepositService() {
		return depositService;
	}
   
	@Autowired
	public void setDepositService(DepositService depositService) {
		this.depositService = depositService;
	}

	public WithdrawService getWithdrawService() {
		return withdrawService;
	}
	
	@Autowired
	public void setWithdrawService(WithdrawService withdrawService) {
		this.withdrawService = withdrawService;
	}
	@Autowired
	LoginUserService lus;
	
	@RequestMapping(value="/banking", method=RequestMethod.GET)
	public ModelAndView banking(Withdraw withdraw,ModelMap model,HttpSession session)
	{
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Banking"))
		{
			model.addAttribute("banking", banking);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
		model.addAttribute("withdrawList", withdrawService.show());
		model.addAttribute("depositList", depositService.show());
		model.addAttribute("transferList", transferService.show());		
		return new ModelAndView("Banking/ViewsTransactionDetails","withdraw",withdraw);
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
	@RequestMapping(value="newTransaction", method=RequestMethod.GET)
	public ModelAndView transaction(Withdraw withdraw,Deposit deposit,Transfer transfer,ModelMap model,HttpSession session)
	{
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Banking"))
		{ 
			model.addAttribute("banking", banking);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
        model.addAttribute("withdrawCash", withdraw);
        withdraw=withdrawService.autoId();
       model.addAttribute("acList", withdrawService.retriveAccountNos());
        model.addAttribute("depositCash", deposit);
        model.addAttribute("depositCash",depositService.autoId());
        model.addAttribute("transferCash", transfer);
        model.addAttribute("transferCash",transferService.autoId());
		return new ModelAndView("Banking/Withdraw","withdrawCash", withdraw);
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
	
	@RequestMapping(value="withdrawCash")
	public ModelAndView withdrawCash(Withdraw withdraw,JournalHeader journalHeader,ModelMap model,HttpSession session)
	{
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Banking"))
		{ 
			model.addAttribute("banking", banking);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
		model.addAttribute("depositCash", new Deposit());
        model.addAttribute("transferCash", new Transfer());
        int i=0;
		int message = 0;
    	i=withdrawService.save(withdraw,journalHeader); 
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
       
        model.addAttribute("withdrawId",withdrawService.autoId());
        withdraw=withdrawService.editWithdraw(withdraw.getTxtwithVchrNo()).get(0);
       
		return new ModelAndView("Banking/withDrawView","withdrawView",withdraw);
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
	
	@RequestMapping(value="deposit")
	public ModelAndView deposit(Deposit deposit,JournalHeader journalHeader,ModelMap model,HttpSession session)
	{
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Banking"))
		{ 
			model.addAttribute("banking", banking);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
		model.addAttribute("withdrawCash", new Withdraw());
        model.addAttribute("transferCash", new Transfer());
        int i=0;
		int message = 0;
    	i=depositService.save(deposit,journalHeader); 
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
     
        deposit=depositService.editDeposit(deposit.getTxtdepoVchrNo()).get(0);
      
		return new ModelAndView("Banking/depositView","depositView",deposit);
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
 
	@RequestMapping(value="Transfer")
	public ModelAndView transfer(Transfer transfer,JournalHeader journalHeader,ModelMap model,HttpSession session)
	{
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Banking"))
		{
			model.addAttribute("banking", banking);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
		model.addAttribute("withdrawCash", new Withdraw());
		model.addAttribute("depositCash", new Deposit());
		int i=0;
		int message = 0;
    	i=transferService.save(transfer,journalHeader); 
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
       
        transfer=transferService.editTransfer(transfer.getTxttransVchrNo()).get(0);
       
		return new ModelAndView("Banking/transferView","transferView",transfer);	
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
	//withdrawView
	@RequestMapping(value="withdrawView")
	public ModelAndView withdrawView(@RequestParam String voucherNo,Withdraw withdraw,ModelMap model,HttpSession session)
	{
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Banking"))
		{
			model.addAttribute("banking", banking);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
		withdraw=withdrawService.editWithdraw(voucherNo).get(0);
		return new ModelAndView("Banking/withDrawView","withdrawView",withdraw);
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
	
	//depositView
	
	@RequestMapping(value="depositView")
	public ModelAndView depositView(@RequestParam String voucherNo,Deposit deposit,ModelMap model,HttpSession session)
	{
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Banking"))
		{
			model.addAttribute("banking", banking);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
		deposit=depositService.editDeposit(voucherNo).get(0);
		return new ModelAndView("Banking/depositView","depositView",deposit);
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
	
    //transferView
	
	@RequestMapping(value="transferView")
	public ModelAndView transfertView(@RequestParam String voucherNo,Transfer transfer,ModelMap model,HttpSession session)
	{
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Banking"))
		{
			model.addAttribute("banking", banking);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
		transfer=transferService.editTransfer(voucherNo).get(0);
		return new ModelAndView("Banking/transferView","transferView",transfer);
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
	
	//withdrawEdit
	
	@RequestMapping(value="withdrawEdit")
	public ModelAndView withdrawEdit(@RequestParam String voucherNo,Withdraw withdraw,ModelMap model,HttpSession session)
	{
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Banking"))
		{     
			model.addAttribute("userName",l.getUname());
		withdraw=withdrawService.editWithdraw(voucherNo).get(0);
		model.addAttribute("acList", withdrawService.retriveAccountNos());
		return new ModelAndView("Banking/withdrawEdit","withdrawEdit",withdraw);
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
	
	//depositEdit
	
	@RequestMapping(value="depositEdit")
	public ModelAndView depositEdit(@RequestParam String voucherNo,Deposit deposit,ModelMap model,HttpSession session)
	{
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Banking"))
		{   
			model.addAttribute("userName",l.getUname());
		deposit=depositService.editDeposit(voucherNo).get(0);
		 model.addAttribute("acList", withdrawService.retriveAccountNos());
		return new ModelAndView("Banking/depositEdit","depositEdit",deposit);
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
	
	//transferEdit
	
	@RequestMapping(value="transferEdit")
	public ModelAndView transfertEdit(@RequestParam String voucherNo,Transfer transfer,ModelMap model,HttpSession session)
	{
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Banking"))
		{      
			model.addAttribute("banking", banking);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
		transfer=transferService.editTransfer(voucherNo).get(0);
		 model.addAttribute("acList", withdrawService.retriveAccountNos());
		return new ModelAndView("Banking/transferEdit","transferEdit",transfer);
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
	
	//for Displaying views
	@RequestMapping("/banking")
	public ModelAndView showWithdraw(Withdraw withdraw,ModelMap model,HttpSession session)
	{
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Banking"))
		{
			model.addAttribute("banking", banking);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
		model.addAttribute("withdrawList",withdrawService.show());
		return new ModelAndView("Banking/ViewsTransactionDetails","newTransaction",withdraw);
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
	
	//for update withdraw
	@RequestMapping("/updateWithdraw")
	public ModelAndView updateWith(@ModelAttribute Withdraw withdraw, ModelMap model,HttpSession session)
	{
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Banking"))
		{
		int i = withdrawService.updateWithdaw(withdraw);
		if(i>0)
		{
			model.addAttribute("banking", banking);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			model.addAttribute("withdrawList", withdrawService.show());
			model.addAttribute("depositList", depositService.show());
			model.addAttribute("transferList", transferService.show());
			withdraw=withdrawService.editWithdraw(withdraw.getTxtwithVchrNo()).get(0);
		}
		model.addAttribute("userName",l.getUname());
			return new ModelAndView("Banking/withDrawView","withdrawView",withdraw);
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
	
	@RequestMapping("/updateDeposit")
	public ModelAndView updatedepo(@ModelAttribute Deposit deposit, ModelMap model,HttpSession session)
	{
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Banking"))
		{
		int i = depositService.updateDeposit(deposit);
		if(i>0)
		{
			model.addAttribute("banking", banking);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			model.addAttribute("withdrawList", withdrawService.show());
			model.addAttribute("depositList", depositService.show());
			model.addAttribute("transferList", transferService.show());
			deposit=depositService.editDeposit(deposit.getTxtdepoVchrNo()).get(0);    
		}
			return new ModelAndView("Banking/depositView","depositView",deposit);
			
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
	
	@RequestMapping("/updateTransfer")
	public ModelAndView updatetrans(@ModelAttribute Transfer transfer, ModelMap model,HttpSession session)
	{
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Banking"))
		{
		int i = transferService.updateTransfer(transfer);
		if(i>0)
		{
			model.addAttribute("banking", banking);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			model.addAttribute("withdrawList", withdrawService.show());
			model.addAttribute("depositList", depositService.show());
			model.addAttribute("transferList", transferService.show());
			transfer=transferService.editTransfer(transfer.getTxttransVchrNo()).get(0);   
		}
			return new ModelAndView("Banking/transferView","transferView",transfer);
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
	
	@RequestMapping("/withdrawPDF")
   	public ModelAndView downloadPDF(@RequestParam String voucherNo,Withdraw withdraw,CompanyDetails companyDetails,ModelMap model,HttpSession session)
   	{  
		Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Banking"))
		{
			model.addAttribute("banking", banking);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
		withdraw=withdrawService.editWithdraw(voucherNo).get(0);
    	model.addAttribute("compInfo", withdrawService.getInfo(companyDetails).get(0));
    	return new ModelAndView("withdrawPDF" ,"withdraws", withdraw);
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
	
	

@RequestMapping("/depositPDF")
	public ModelAndView downloadPDF(@RequestParam String voucherNo,Deposit deposit,CompanyDetails companyDetails,ModelMap model,HttpSession session)
	{  
	
	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Banking"))
		{
			model.addAttribute("banking", banking);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
	deposit=depositService.editDeposit(voucherNo).get(0);
	model.addAttribute("compInfo", depositService.getInfo(companyDetails).get(0));
	
	return new ModelAndView("depositPDF" ,"deposits", deposit);
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

@RequestMapping("/transferPDF")
public ModelAndView downloadPDF(@RequestParam String voucherNo,Transfer transfer,CompanyDetails companyDetails,ModelMap model,HttpSession session)
{  Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Banking"))
		{
			model.addAttribute("banking", banking);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
transfer=transferService.editTransfer(voucherNo).get(0);
model.addAttribute("compInfo", transferService.getInfo(companyDetails).get(0));

return new ModelAndView("transferPDF" ,"transfers", transfer);
	
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
@RequestMapping("/newReconciliation")

public ModelAndView newreconciliation(Withdraw withdraw,ModelMap model,HttpSession session)
{
	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Banking"))
		{
			model.addAttribute("banking", banking);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
	model.addAttribute("withdrawList", withdrawService.show());
	model.addAttribute("depositList", depositService.show());
	model.addAttribute("transferList", transferService.show());
	
	return new ModelAndView("Banking/viewReconciliation","withdraw",withdraw);
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
@RequestMapping(value="withdrawDelete")

public ModelAndView delete(@RequestParam String voucherNo,Withdraw withdraw,ModelMap model,HttpSession session)
{
	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Banking"))
		{
			model.addAttribute("banking", banking);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			int i=0,delete=0;
			i=withdrawService.delete(voucherNo);
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
	
	model.addAttribute("withdrawList", withdrawService.show());
	model.addAttribute("depositList", depositService.show());
	model.addAttribute("transferList", transferService.show());
	
	return new ModelAndView("Banking/ViewsTransactionDetails","withdraw",withdraw);
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

@RequestMapping(value="depositDelete")

public ModelAndView delete(@RequestParam String voucherNo,Deposit deposit,ModelMap model,HttpSession session)
{
	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Banking"))
		{
			model.addAttribute("banking", banking);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			int i=0,delete=0;
			i=depositService.delete(voucherNo);
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
	
	model.addAttribute("withdrawList", withdrawService.show());
	model.addAttribute("depositList", depositService.show());
	model.addAttribute("transferList", transferService.show());	
	return new ModelAndView("Banking/ViewsTransactionDetails","withdraw",deposit);
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

@RequestMapping(value="transferDelete")

public ModelAndView delete(@RequestParam String voucherNo,Transfer transfer,ModelMap model,HttpSession session)
{
	Login l=(Login) session.getAttribute("user");
		if(lus.chkFlag(l)){
		if(lus.authontication(l,"Banking"))
		{
			model.addAttribute("banking", banking);
			model.addAttribute("userName",l.getUname());
			model.addAttribute("userId",l.getEmpUserId());
			int i=0,delete=0;
			i=transferService.delete(voucherNo);
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
	
	model.addAttribute("withdrawList", withdrawService.show());
	model.addAttribute("depositList", depositService.show());
	model.addAttribute("transferList", transferService.show());
	
	return new ModelAndView("Banking/ViewsTransactionDetails","withdraw",transfer);
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

