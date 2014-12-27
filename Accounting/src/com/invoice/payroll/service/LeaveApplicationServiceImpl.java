package com.invoice.payroll.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.invoice.payroll.beans.EmployeeBeans;
import com.invoice.payroll.beans.EmployeeLeave;
import com.invoice.payroll.beans.Leave;
import com.invoice.payroll.beans.LeaveApplication;
import com.invoice.payroll.dao.LeaveApplicationDao;



@Component(value="leaveApplicationService")
public class LeaveApplicationServiceImpl implements LeaveApplicationService
{

	LeaveApplicationDao leaveApplicationDao;
	public LeaveApplicationDao getLeaveApplicationDao()
	{
		return leaveApplicationDao;
	}
	@Autowired
	public void setLeaveApplicationDao(LeaveApplicationDao leaveApplicationDao) 
	{
		this.leaveApplicationDao = leaveApplicationDao;
	}

	@Override
	public String retriveEmpName(String empId) 
	{
		return leaveApplicationDao.retriveEmpName(empId);
	}

	@Override
	public String retriveEmpDes(String empId) 
	{
		return leaveApplicationDao.retriveEmpDes(empId);
	}
	@Override
	public List<Leave> retriveLeave() {

		return leaveApplicationDao.retriveLeave();
	}
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int save(LeaveApplication leaveApplication) {

		return leaveApplicationDao.save(leaveApplication);
	}
	@Override
	public List<LeaveApplication> show() {
		
		return leaveApplicationDao.show();
	}
	@Override
	public List<EmployeeLeave> countLeaves() {

		return leaveApplicationDao.countLeaves();
	}
	@Override
	public int approveeleave(String empid, String leaveid,LeaveApplication leaveapplication) {

		return leaveApplicationDao.approveeleave(empid, leaveid, leaveapplication);
	}

	@Override
	public int rejectleave(LeaveApplication leaveapplication) {

		return leaveApplicationDao.rejectleave(leaveapplication);
	}
	@Override
	public List<EmployeeLeave> showApprove() {

		return leaveApplicationDao.showApprove();
	}
	@Override
	public List<EmployeeLeave> totalLeaves(String empId) {

		return leaveApplicationDao.totalLeaves(empId);
	}
	@Override
	public List<LeaveApplication> showApprovedLeaves() {

		return leaveApplicationDao.showApprovedLeaves();
	}
	@Override
	public List<LeaveApplication> showRejectedLeaves() {

		return leaveApplicationDao.showRejectedLeaves();
	}
	@Override
	public List<EmployeeBeans> showEmpID() 
	{
		return leaveApplicationDao.showEmpID();
	}
}
