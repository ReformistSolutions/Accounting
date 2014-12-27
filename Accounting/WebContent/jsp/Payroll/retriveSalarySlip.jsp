<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

				<div>
					<c:if test="${ not empty viewSalarySlip}">
					<c:forEach items="${viewSalarySlip}" var="viewSalarySlip" > 
					<div class="row">
						<div class="col-md-6"><div class="col-md-3"></div>
							Employee ID : 
							${viewSalarySlip.empId}	
						</div>	
						<div class="col-md-6 pull right"><!-- <div class="col-md-3"></div> -->			
							Name :
							${viewSalarySlip.txtfname}&nbsp;${viewSalarySlip.txtmname}&nbsp;${viewSalarySlip.txtlname}
						</div>
					</div><br>
					<div class="row">
						<div class="col-md-6"><div class="col-md-3"></div>
							Department : 
							${viewSalarySlip.dept}
						</div>	
						<div class="col-md-6 pull right"><!-- <div class="col-md-3"></div> -->			
							Designation :
							${viewSalarySlip.designation}
						</div>	
					</div><br>
					<div class="row">
						<div class="col-md-6"><div class="col-md-3"></div>
							PF Account Number : 
							${viewSalarySlip.txtPFNo}
						</div>	
						<div class="col-md-6 pull right"><!-- <div class="col-md-3"></div> -->			
							Date of Joining :
							${viewSalarySlip.JDdt}
						</div>
					</div><br>	
					<div class="row">
						<div class="col-md-6"><div class="col-md-3"></div>
							ESI Account Number : 
							${viewSalarySlip.txtEsi}
						</div>	
						<div class="col-md-6 pull right"><!-- <div class="col-md-3"></div> -->			
							Bank Account Number :
							${viewSalarySlip.txtBankNo}
						</div>		
					</div>
					</c:forEach>
					<br>
					<div class="row"><div class="col-sm-1"></div>
						<div class="col-md-5">
							<div class="panel panel-info">
						    	<div class="panel-heading">Earnings</div>
						    	<div class="panel-body">
						    		<div class="table-responsive" style="width: 90%;">	
										<table class="table" id="tableID">
											<thead>
												<tr>
													<th>Earnings</th> 
													<th style="float: right;">Amount</th>
												</tr>
											</thead>
											<tbody>
											<c:forEach items="${eList}" var="eList">
												<tr>
													<td>${eList.payheadname}</td>
													<td style="float: right;">${eList.payamt}</td>
												</tr>
											</c:forEach>
											</tbody>	
											<tfoot>
												<tr>
													<th>Total Earnings</th> 
													<th style="float: right;">${eAmt}</th>
												</tr>
											</tfoot>
											
										</table>
									</div>
						    	</div>
							</div>
						</div>
						<div class="col-md-5" >
							<div class="panel panel-info">
						    	<div class="panel-heading">Deductions</div>
						    	<div class="panel-body">
						    		<div class="table-responsive" style="width: 90%;">	
										<table class="table" id="tableID">
											<thead>
												<tr>
													<th>Deductions</th> 
													<th style="float: right;">Amount</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${dList}" var="dList">
												<tr>	
													<td>${dList.payheadname}</td>
													<%-- <td>${dList.daysname}</td> --%>
													<td style="float: right;">${dList.payamt}</td>
												</tr>	
											</c:forEach>
											</tbody>
											<tfoot>
												<tr>	
													<th>Total Deductions</th> 
													<th style="float: right;">${dAmt}</th>
												</tr>
											</tfoot>
										</table>
									</div>
						    	</div>
							</div>
						</div>											
					</div> 
					<div class="row" > 
						<div class="col-md-5">						
						</div>
						<div class="col-md-5">
							<label style="float: right;">Net Pay : ${nList}</label> 
						</div>
					</div>
					</c:if>
					<c:if test="${empty viewSalarySlip}">
					
					<h5>Record Cannot be located or do not exit.</h5>
					
					</c:if>
					</div>