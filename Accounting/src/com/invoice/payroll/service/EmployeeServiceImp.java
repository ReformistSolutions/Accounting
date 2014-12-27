package com.invoice.payroll.service;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.invoice.payroll.beans.BreakupByEmployee;
import com.invoice.payroll.beans.ComposeMail;
import com.invoice.payroll.beans.EmployeeBeans;
import com.invoice.payroll.beans.EmployeeLeave;
import com.invoice.payroll.beans.Leave;
import com.invoice.payroll.beans.Payhead;
import com.invoice.payroll.beans.ProcessPayroll;
import com.invoice.payroll.beans.SalaryBeans;
import com.invoice.payroll.dao.EmployeeDao;


@Component(value="empservice")
public class EmployeeServiceImp implements EmployeeService
{
	
	private  EmployeeDao empDao;
    private GenPassword gn;
	public GenPassword getGn() {
		return gn;
	}
	
	@Autowired
	public void setGn(GenPassword gn) {
		this.gn = gn;
	}
	private JdbcTemplate jdbcTemplate;   
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	@Autowired
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	public EmployeeDao getEmpDao() {
		return empDao;
	}
	@Autowired
	public void setEmpDao(EmployeeDao empDao) {
		this.empDao = empDao;
	}
	
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int saveEmployeedtls(EmployeeBeans emp,SalaryBeans salaryBeans) 
	
	{
		String pass=gn.getPasword(emp.getPassword());
		return empDao.saveEmployeedtls(emp, salaryBeans, pass);
		
	}
	
	@Override
	public EmployeeBeans generateId() {
		
		return empDao.generateId();
	}
	@Override
	public List<EmployeeBeans> show() {
		
		return empDao.show();
	}
	@Override
	public List<EmployeeBeans> showEmployee(String emp_ID) {
		
		return empDao.showEmployee(emp_ID);
	}
	
	@Transactional(rollbackFor=Exception.class)
	@Override 
	public int updateEmployeedtl(EmployeeBeans employeeBeans) {
		
		return empDao.updateEmployeedtl(employeeBeans);
	}
	
	@Override
	public List<EmployeeBeans> inactiveshow() {
		
		return empDao.inactiveshow();
	}
	@Override
	public int cntactive() {
		
		return empDao.cntactive();
	}
	@Override
	public int cntinactive() {
		
		return empDao.cntinactive();
	}
	@Override
	public int cnttotal() {
		
		return empDao.cnttotal();
	}
	@Override
	public EmployeeBeans showEmployeeEmpID(String txtEmpId) {
	
		return empDao.showEmployeeEmpIdDao(txtEmpId);
	
 	}
	@Override
	public List<Payhead> showPayhead(String type) {
		
		return empDao.showPayhead(type);
	}
	@Override
	public List<EmployeeLeave> showLeaves(String emp_ID) {

		return empDao.showLeaves(emp_ID);
	}
	@Override
	public List<SalaryBeans> showSal(String emp_ID) {

		return empDao.showSal(emp_ID);
	}
	@Override
	public List<BreakupByEmployee> showBreakByEmp() {

		return empDao.showBreakByEmp();
	}
	@Override
	public List<EmployeeBeans> salaryProcess() {

		return empDao.salaryProcess(); 
	}
	@Override
	public List<Payhead> showVeriableName() {

		return empDao.showVeriableName(); 
	}
	@Override
	public List<EmployeeBeans> processPayroll() {

		return empDao.processPayroll();
	}
	@Override
	public List<SalaryBeans> showEarning(String emp_ID,int month,int year) 
	{
				
		return empDao.showEarning(emp_ID,month,year);
	}
	@Override
	public List<SalaryBeans> showDeduction(String emp_ID,int month,int year) {

		return empDao.showDeduction(emp_ID, month, year);
	}
	@Override
	public String showNetSalary(String emp_ID,int month,int year) {

		return empDao.showNetSalary(emp_ID,month,year);
	}
	@Override
	public String showEarningAmount(String emp_ID,int month,int year) {

		return empDao.showEarningAmount(emp_ID,month,year);
	}
	@Override
	public float showDeductionAmount(String emp_ID,int month,int year) {

		return empDao.showDeductionAmount(emp_ID,month,year);
	}
	@Override
	public List<EmployeeBeans> viewSalary(String emp_ID) {

		return empDao.viewSalary(emp_ID);
	}
	@Override
	public List<EmployeeBeans> retriveSalarySlip(String month, String year,String empid) {

		return empDao.retriveSalarySlip(month, year, empid);
	}

	@Override
	public List<ProcessPayroll> showConfirmPayroll() {
		
		return empDao.showConfirmPayroll();
	}
	@Override
	public List<ProcessPayroll> showDaysDeduction(String emp_ID, int month,int year) {

		return empDao.showDaysDeduction(emp_ID, month, year);
	}
	@Override
	public int delete(String emp_ID) {

		return empDao.delete(emp_ID);
	}
	@Override
	public List<ProcessPayroll> processDate() {

		return empDao.processDate(); 
	}
	@Override
	public int saveLeaves(Leave leave) 
	{
		return empDao.saveLeaves(leave);
	}
	@Override
	public List<Leave> editLeave(String empid, String leaveid) 
	{

		return empDao.editLeave(empid, leaveid);
	}
	@Override
	public int updateLeave(Leave leave) 
	{
		return empDao.updateLeave(leave);
	}
	@Override
	public List<SalaryBeans> showBreakupheadList() {

		return empDao.showBreakupheadList();
	}
	@Override
	public List<SalaryBeans> showBreakupamtList() {

		return empDao.showBreakupamtList();
	}
	@Override
	public List<ComposeMail> composeMail(String emp_ID) 
	{
		return empDao.composeMail(emp_ID);
	}
	@Override
	public int sendMail(String loginEmpId, ComposeMail composeMail) {
		
		return empDao.sendMail(loginEmpId, composeMail);
	}

	@Override
	public List<EmployeeBeans> showAdmin() {

		return empDao.showAdmin();
	}

	@Override
	public String shwoCompdate() {

		return empDao.shwoCompdate();
	}

	@Override
	public int restoreEmp(String emp_ID) {
		
		return empDao.restoreEmp(emp_ID);
	}

	@Override
	public List<EmployeeBeans> empList() {
		
		return empDao.empList();
	}

	@Override
	public int changePassword(EmployeeBeans employeeBeans) {
		
		return empDao.changePassword(employeeBeans);
	}	
	@Override
	public String ShowAdd() 
	{
		return empDao.ShowAdd();
	}
	@Override
	public String ShowDelete() 
	{
		return empDao.ShowDelete();
	}
	@Override
	public String ShowUpdate() 
	{
		return empDao.ShowUpdate();
	}
	@Override
	public String ShowRestore() 
	{
		return empDao.ShowRestore();
	}
	@Override
	public String ShowNotAdd() 
	{
		return empDao.ShowNotAdd();
	}
	@Override
	public String ShowNotDelete() 
	{
		return empDao.ShowNotDelete();
	}
	@Override
	public String ShowNotUpdate() 
	{
		return empDao.ShowNotUpdate();
	}
	@Override
	public String ShowNotRestore() 
	{
		return empDao.ShowNotRestore();
	}

	@Override
	public String ShowApproved() 
	{
		return empDao.ShowApproved();
	}

	@Override
	public String ShowRejected() 
	{
		return empDao.ShowRejected();
	}

	@Override
	public String ShowNotApproved() 
	{
		return empDao.ShowNotApproved();
	}

	@Override
	public String ShowNotRejected() 
	{
		return empDao.ShowNotRejected();
	}

	@Override
	public int saveDepartment(String deptName,String deptDesc) 
	{
		return empDao.saveDepartment(deptName, deptDesc);
	}

	@Override
	public List<EmployeeBeans> retriveDept() 
	{
		return empDao.retriveDept();
	}

	@Override
	public int saveDesignation(String desigName, String desigDesc) 
	{
		return empDao.saveDesignation(desigName, desigDesc);
	}

	@Override
	public List<EmployeeBeans> retriveDesig() 
	{
		return empDao.retriveDesig();
	}

	@Override
	public int retriveUserName(String userName) 
	{
		return empDao.retriveUserName(userName);
	}

	@Override
	public int retriveVeriables(String empid) 
	{
		return empDao.retriveVeriables(empid);
	}
	@Override
	public List<SalaryBeans> showBreakupheadListW() 
	{
		return empDao.showBreakupheadListW();
	}
	@Override
	public List<SalaryBeans> showBreakupamtListW() 
	{
		return empDao.showBreakupamtListW();
	}
	@Override
	public List<EmployeeBeans> empListW() 
	{
		return empDao.empListW();
	}
} 