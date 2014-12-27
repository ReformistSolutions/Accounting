package com.invoice.accounting.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.invoice.accounting.beans.AddNewAuditor;
import com.invoice.accounting.beans.ComposeMail;
import com.invoice.accounting.dao.AuditorDao;
import com.invoice.company.beans.CompanyDetails;
import com.invoice.newuser.beans.NewUserBean;

public class AuditorServiceImpl implements AuditorService{

	AuditorDao auditordao;
	
	public AuditorDao getAuditordao() {
		return auditordao;
	}
	@Autowired
	public void setAuditordao(AuditorDao auditordao) {
		this.auditordao = auditordao;
	}
	
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int addnewAuditor(AddNewAuditor addnewAuditor)
	{
		int i=auditordao.addnewAuditor(addnewAuditor);
		if(i>0)
		{
			return (1);
		}
		else
		{
			return (0);
		}	
	}
	@Override
	public List<AddNewAuditor> show() {
		List<AddNewAuditor> auditorList=new ArrayList<AddNewAuditor>();
		auditorList= auditordao.show();
		return auditorList;
	}
	@Override
	public List<AddNewAuditor> viewAuditors(String auditID) {
		
		return auditordao.viewAuditors(auditID);
	}
	@Override
	public AddNewAuditor generateID() {
		
		return auditordao.generateID();
	}
	
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int update(AddNewAuditor addNewAuditor) {
		
		return auditordao.update(addNewAuditor);
	}
	@Override
	public int deleteaAuditor(String auditID) {
		return auditordao.deleteaAuditor(auditID);
	}
	@Override
	public List<NewUserBean> ViewNewUser() {
		return auditordao.ViewNewUser();
	}
	@Override
	public List<CompanyDetails> getInfo(CompanyDetails companyDetails) {
		return auditordao.getInfo(companyDetails);
	}
	@Override
	public int sendMail(ComposeMail composeMail) {
		return auditordao.sendMail(composeMail);
	}
}