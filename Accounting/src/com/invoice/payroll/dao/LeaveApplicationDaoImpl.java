package com.invoice.payroll.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.invoice.payroll.beans.EmployeeBeans;
import com.invoice.payroll.beans.EmployeeLeave;
import com.invoice.payroll.beans.Leave;
import com.invoice.payroll.beans.LeaveApplication;


@Component(value="leaveApplicationDao")
public class LeaveApplicationDaoImpl implements LeaveApplicationDao
{
	String sql;
	JdbcTemplate jdbcTemplate;	
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	@Autowired
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Override
	public String retriveEmpName(String empId) {

		try{
		String sql="select f_Name from employee_registration where emp_ID='"+empId+"' ";
		String add = jdbcTemplate.queryForObject(sql, String.class);
		return add;
		}catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public String retriveEmpDes(String empId) {

		try{
		String sql="select desName from vdesignation  where emp_ID='"+empId+"' ";
		String add = jdbcTemplate.queryForObject(sql, String.class);
		return add;
		}catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public List<Leave> retriveLeave() {

		try{
		sql = "select * from comp_leave " ;
		final List<Leave> leaveList=getJdbcTemplate().query(sql, new RowMapper<Leave>() {
			private List<Leave> lList=new ArrayList<Leave>();
			public Leave mapRow(ResultSet rs,int rowNo)throws SQLException
			{
				Leave leave=new Leave();
				leave.setLeaveId(rs.getString("leave_id"));
				leave.setLeaveName(rs.getString("leave_name"));
				lList.add(leave);
				return leave;
			}	
		});		
			return leaveList;
		}catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public int save(LeaveApplication leaveApplication) {

		try
		{
		int  i=0;
		String empid = leaveApplication.getTxtempId();
		String leaveID = leaveApplication.getTxtLeavetype();
		int noDays = leaveApplication.getTxtNoDays();
		
		int days = jdbcTemplate.queryForObject("select leave_balance from employee_leave where leave_id='"+leaveID+"' AND emp_id='"+empid+"'", Integer.class);
		
		if(noDays > days)
		{
			return 0;
		}
		else
		{
			sql = "insert into leaveapplication(empId,empName,designation,dateapplication,leaveType,noofdays,fromdate,todate,reason,approvestatus) value('"+leaveApplication.getTxtempId()+"','"+leaveApplication.getTxtempName()+"','"+leaveApplication.getTxtDesignation()+"','"+leaveApplication.getTxtDateApplication()+"','"+leaveApplication.getTxtLeavetype()+"','"+leaveApplication.getTxtNoDays()+"','"+leaveApplication.getTxtfrmDate()+"','"+leaveApplication.getTxttoDaate()+"','"+leaveApplication.getTxtReason()+"','"+leaveApplication.getTxtApprovStatus()+"') ";
			i=jdbcTemplate.update(sql);
			if(i>0)
			{
				return 1;
			}
			else
			{
				return 0;
			}
		}
		
		}catch(Exception e)
		{
			System.out.println(e);
			return 0;
		}
	}
	@Override
	public List<LeaveApplication> show() {

		try{
		String sql = "select * from vleaves where approvestatus = 'Pending' " ;
		final List<LeaveApplication> leaveList=getJdbcTemplate().query(sql, new RowMapper<LeaveApplication>(){
			private List<LeaveApplication> leaveAppliList = new ArrayList<LeaveApplication>();	
			public LeaveApplication mapRow(ResultSet rs, int rowNo) throws SQLException {
				
				LeaveApplication leaveApplication = new LeaveApplication();
				leaveApplication.setTxtempId(rs.getString("empId"));
				leaveApplication.setTxtempName(rs.getString("empName"));
				leaveApplication.setTxtDateApplication(rs.getString("dateapplication"));
				leaveApplication.setLeaveId(rs.getString("leave_id"));
				leaveApplication.setTxtLeavetype(rs.getString("leave_name"));
				leaveApplication.setTxtNoDays(rs.getInt("noofdays"));
				leaveApplication.setTxtfrmDate(rs.getString("fromdate"));
				leaveApplication.setTxttoDaate(rs.getString("todate"));
				leaveApplication.setTxtReason(rs.getString("reason"));
				
				leaveAppliList.add(leaveApplication);
				return leaveApplication;
			}
		}); 
		return leaveList;
		}catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public List<EmployeeLeave> countLeaves() {

		try{
		String sql  = "select e1.f_Name,sum(e.total)as totalLeaves,sum(e.leave_taken) as totalUsed, sum(e.leave_balance) as totalPending from employee_leave e, employee_registration e1 where e.emp_id = e1.emp_ID group by e.emp_id";
		final List<EmployeeLeave> empleaveList=getJdbcTemplate().query(sql, new RowMapper<EmployeeLeave>(){
			private List<EmployeeLeave> leaveempiList = new ArrayList<EmployeeLeave>();	
			public EmployeeLeave mapRow(ResultSet rs, int rowNo) throws SQLException {
				
				EmployeeLeave employeeLeave = new EmployeeLeave();
				employeeLeave.setEmpid(rs.getString("f_Name"));
				employeeLeave.setTotal(rs.getInt("totalLeaves"));
				employeeLeave.setLeavetaken(rs.getInt("totalUsed"));
				employeeLeave.setLeavebal(rs.getInt("totalPending"));
				leaveempiList.add(employeeLeave);
				return employeeLeave;
			}
		}); 
		return empleaveList;
		}catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public int approveeleave(String empid,String leaveid,LeaveApplication leaveapplication) {

		try{
		String st = "Approve";
		int j=0;
		
		String sql= "SELECT comp_leave.leave_id FROM comp_leave where comp_leave.leave_id = '"+leaveid+"' ";
		String leaveType = jdbcTemplate.queryForObject(sql, String.class);
		
		String sql1= "SELECT comp_leave.no_leaves FROM comp_leave where comp_leave.leave_id = '"+leaveType+"' ";
		String total = jdbcTemplate.queryForObject(sql1, String.class);
		
		String sql2= "SELECT noofdays FROM leaveapplication where empId = '"+empid+"' AND leaveType = '"+leaveType+"' AND approvestatus = 'Pending' ";
		String nodays = jdbcTemplate.queryForObject(sql2, String.class);
		
		String sql3 = "SELECT ('"+total+"' - '"+nodays+"') as balance FROM comp_leave l where l.leave_id =  '"+leaveid+"' ";
		String balance = jdbcTemplate.queryForObject(sql3, String.class);
		
		sql = "update employee_leave set leave_balance = '"+balance+"',"+"leave_taken = '"+nodays+"',"+"status = '"+st+"' where emp_id = '"+empid+"' AND leave_id = '"+leaveid+"' " ;
		j=jdbcTemplate.update(sql);
		
		sql = "update leaveapplication set approvestatus = '"+st+"' where empId = '"+empid+"' AND leaveType = '"+leaveType+"' ";
		int i=jdbcTemplate.update(sql);
		if(j>0 && i>=1)
	       {
			return 1;
	      }
	       else
	       {
	    	   return 0;
	       }
		}catch(Exception e)
		{
			System.out.println(e); 
			return 0;
		}
	}
	
	@Override
	public int rejectleave(LeaveApplication leaveapplication)
	{
		try{
		String st = "Reject";
		int i=0,j=0;
		String leaveid = leaveapplication.getLeaveId();
		String empid = leaveapplication.getTxtempId();
		String reason = leaveapplication.getRejection();
		
		String sql= "SELECT comp_leave.leave_id FROM comp_leave where comp_leave.leave_id = '"+leaveid+"' ";
		String leaveType = jdbcTemplate.queryForObject(sql, String.class);
		
		/*String sql1= "SELECT comp_leave.no_leaves FROM comp_leave where comp_leave.leave_id = '"+leaveType+"' ";
		String total = jdbcTemplate.queryForObject(sql1, String.class);
		*/
		String sql3 = "SELECT l.no_leaves FROM comp_leave l where l.leave_id =  '"+leaveid+"' ";
		String balance = jdbcTemplate.queryForObject(sql3, String.class);
		
		String sql1 = "update employee_leave set leave_balance = '"+balance+"',"+"status = '"+st+"' where emp_id = '"+empid+"' AND leave_id = '"+leaveid+"' " ;
		j=jdbcTemplate.update(sql1);		
		
		String sql2 = "update leaveapplication set approvestatus = '"+st+"',"+"rejection_reason='"+reason+"' where empId = '"+empid+"' AND leaveType = '"+leaveType+"' AND approvestatus = 'Pending' ";
		i=jdbcTemplate.update(sql2);
		
		if(j>0 && i>0)
	       {
			return 1;
	      }
	       else
	       {
	    	   return 0;
	       }
		}catch(Exception e)
		{
			System.out.println(e);
			return 0;
		}
	}
	@Override
	public List<EmployeeLeave> showApprove() {

		try{
		String sql = "select e1.emp_ID,e1.f_Name,sum(e.total)as totalLeaves,sum(e.leave_taken) as totalUsed, sum(e.leave_balance) as totalPending from employee_leave e, employee_registration e1 where e1.status='Active' and e.emp_id = e1.emp_ID group by e.emp_id ";
		final List<EmployeeLeave> empleaveList=getJdbcTemplate().query(sql, new RowMapper<EmployeeLeave>(){
			private List<EmployeeLeave> leaveempList = new ArrayList<EmployeeLeave>();	
			public EmployeeLeave mapRow(ResultSet rs, int rowNo) throws SQLException {
				
				EmployeeLeave employeeleave = new EmployeeLeave();
				employeeleave.setEmployeeid(rs.getString("emp_ID")); 
				employeeleave.setEmpid(rs.getString("f_Name"));
				employeeleave.setTotal(rs.getInt("totalLeaves"));
				employeeleave.setLeavetaken(rs.getInt("totalUsed"));
				employeeleave.setLeavebal(rs.getInt("totalPending"));
				leaveempList.add(employeeleave);
				return employeeleave;
			}
		}); 
		return empleaveList;	
		}catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public List<EmployeeLeave> totalLeaves(String empId) {
		
		try{
		sql = "select leave_name,leave_balance from vemployeeleaves where emp_id = '"+empId+"'" ;
		final List<EmployeeLeave> leaveList=getJdbcTemplate().query(sql, new RowMapper<EmployeeLeave>() {
			private List<EmployeeLeave> lList=new ArrayList<EmployeeLeave>();
			public EmployeeLeave mapRow(ResultSet rs,int rowNo)throws SQLException
			{
				EmployeeLeave leave=new EmployeeLeave();
				leave.setLeaveid(rs.getString("leave_name"));
				leave.setLeavebal(rs.getInt("leave_balance"));
				lList.add(leave);
				return leave;
			}	
		});		
			return leaveList;
		}catch(Exception e)
		{
			return null;
		}
	}
	@Override
	public List<LeaveApplication> showApprovedLeaves() {

		try{
		String sql = "select * from vleaves where approvestatus = 'Approve'  " ;
		final List<LeaveApplication> empleaveList=getJdbcTemplate().query(sql, new RowMapper<LeaveApplication>(){
			private List<LeaveApplication> leaveempList = new ArrayList<LeaveApplication>();	
			public LeaveApplication mapRow(ResultSet rs, int rowNo) throws SQLException {
				
				LeaveApplication employeeleave = new LeaveApplication();
				employeeleave.setTxtempName(rs.getString("empName"));
				employeeleave.setTxtDateApplication(rs.getString("dateapplication"));
				employeeleave.setTxtLeavetype(rs.getString("leave_name"));
				employeeleave.setTxtNoDays(rs.getInt("noofdays"));
				employeeleave.setTxtfrmDate(rs.getString("fromdate"));
				employeeleave.setTxttoDaate(rs.getString("todate"));
				employeeleave.setTxtReason(rs.getString("reason"));				
				employeeleave.setTxtApprovStatus(rs.getString("approvestatus")); 
				leaveempList.add(employeeleave);
				return employeeleave;
			}
		}); 
		return empleaveList;
		}catch(Exception e)
		{
			System.out.println(e);
			return null;
		}
	}
	@Override
	public List<LeaveApplication> showRejectedLeaves() {

		try{
		String sql = "select * from vleaves where approvestatus = 'Reject'  " ;
		final List<LeaveApplication> empleaveList=getJdbcTemplate().query(sql, new RowMapper<LeaveApplication>(){
			private List<LeaveApplication> leaveempList = new ArrayList<LeaveApplication>();	
			public LeaveApplication mapRow(ResultSet rs, int rowNo) throws SQLException {
				
				LeaveApplication employeeleave = new LeaveApplication();
				employeeleave.setTxtempName(rs.getString("empName"));
				employeeleave.setTxtDateApplication(rs.getString("dateapplication"));
				employeeleave.setTxtLeavetype(rs.getString("leave_name"));
				employeeleave.setTxtNoDays(rs.getInt("noofdays"));
				employeeleave.setTxtfrmDate(rs.getString("fromdate"));
				employeeleave.setTxttoDaate(rs.getString("todate"));
				employeeleave.setTxtReason(rs.getString("rejection_reason"));				
				employeeleave.setTxtApprovStatus(rs.getString("approvestatus"));
				
				leaveempList.add(employeeleave);
				return employeeleave;
			}
		}); 
		return empleaveList;
		}catch(Exception e)
		{
			return null;
		}
		}
	@Override
	public List<EmployeeBeans> showEmpID() 
	{
		try{
			sql = "select emp_ID from employee_registration where status = 'Active' ";
			final List<EmployeeBeans> empList=getJdbcTemplate().query(sql, new RowMapper<EmployeeBeans>() {
				private List<EmployeeBeans> EList=new ArrayList<EmployeeBeans>();
				public EmployeeBeans mapRow(ResultSet rs,int rowNo)throws SQLException
				{
					EmployeeBeans emp=new EmployeeBeans();
					emp.setEmpId(rs.getString("emp_ID"));
					EList.add(emp);
					return emp;
				}	
			});		
				return empList;
			}catch(Exception e)
			{
				return null;
			}
	}
}