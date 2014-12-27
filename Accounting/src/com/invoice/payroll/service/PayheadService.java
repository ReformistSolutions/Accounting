package com.invoice.payroll.service;

import java.util.List;

import com.invoice.payroll.beans.Payhead;

public interface PayheadService {

	public Payhead generateID();
	public int save(Payhead payhead);
	public List<Payhead> show();
	public List<Payhead> view(String payheadId);
	public int updatePayHead(Payhead payhead);
	public int delete(String payheadId);
	public List<Payhead> retriveAccountName(String paytype);
}