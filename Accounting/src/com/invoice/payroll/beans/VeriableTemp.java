package com.invoice.payroll.beans;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.FactoryUtils;
import org.apache.commons.collections.list.LazyList;

public class VeriableTemp {

	private String emp_id;	
	@SuppressWarnings("unchecked")
	private List<VeriableList> veriableList = LazyList.decorate(new ArrayList<VeriableList>(),FactoryUtils.instantiateFactory(VeriableList.class));
	private String payhead_id;
	private String amount;
	
	public String getPayhead_id() {
		return payhead_id;
	}
	public void setPayhead_id(String payhead_id) {
		this.payhead_id = payhead_id;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}
	public List<VeriableList> getVeriableList() {
		return veriableList;
	}
	public void setVeriableList(List<VeriableList> veriableList) {
		this.veriableList = veriableList;
	}
}
