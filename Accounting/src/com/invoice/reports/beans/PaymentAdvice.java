package com.invoice.reports.beans;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.FactoryUtils;
import org.apache.commons.collections.list.LazyList;

public class PaymentAdvice 
{

	private String emp_Id;
	private String salitation;
	private String f_Name;
	private String m_Name;
	private String lName;
	private String accNo;
	private String bank_name;
	private float amount;
	private float total;
	@SuppressWarnings("unchecked")
	private List<PaymentAdviceDetails> adviceList = LazyList.decorate(new ArrayList<PaymentAdviceDetails>(),FactoryUtils.instantiateFactory(PaymentAdviceDetails.class));
	
	
	public String getEmp_Id() {
		return emp_Id;
	}
	public void setEmp_Id(String emp_Id) {
		this.emp_Id = emp_Id;
	}
	public String getSalitation() {
		return salitation;
	}
	public void setSalitation(String salitation) {
		this.salitation = salitation;
	}
	public String getF_Name() {
		return f_Name;
	}
	public void setF_Name(String f_Name) {
		this.f_Name = f_Name;
	}
	public String getM_Name() {
		return m_Name;
	}
	public void setM_Name(String m_Name) {
		this.m_Name = m_Name;
	}
	public String getlName() {
		return lName;
	}
	public void setlName(String lName) {
		this.lName = lName;
	}
	public String getAccNo() {
		return accNo;
	}
	public void setAccNo(String accNo) {
		this.accNo = accNo;
	}
	public String getBank_name() {
		return bank_name;
	}
	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
	}
	public float getAmount() {
		return amount;
	}
	public void setAmount(float amount) {
		this.amount = amount;
	}
	public float getTotal() {
		return total;
	}
	public void setTotal(float total) {
		this.total = total;
	}
	public List<PaymentAdviceDetails> getAdviceList() {
		return adviceList;
	}
	public void setAdviceList(List<PaymentAdviceDetails> adviceList) {
		this.adviceList = adviceList;
	}
}
