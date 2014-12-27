package com.invoice.payroll.service;

import java.util.List;

import com.invoice.payroll.beans.EmployeeBeans;
import com.invoice.payroll.beans.EmployeeLeave;
import com.invoice.payroll.beans.Leave;
import com.invoice.payroll.beans.LeaveApplication;

public interface LeaveApplicationService {

	public int save(LeaveApplication leaveApplication);
	public List<LeaveApplication> show();
	public String retriveEmpName(String empId);
	public String retriveEmpDes(String empId);
	public List<Leave> retriveLeave();
	public List<EmployeeLeave> countLeaves();
	public int approveeleave(String empid,String leaveid,LeaveApplication leaveapplication);
	public List<EmployeeLeave> showApprove();	
	public List<LeaveApplication> showApprovedLeaves();
	public List<LeaveApplication> showRejectedLeaves();
	public int rejectleave(LeaveApplication leaveapplication);
	public List<EmployeeLeave> totalLeaves(String empId);	
	public List<EmployeeBeans> showEmpID();
}
