<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,java.text.*" %>

<div>
<c:if test="${not empty paymentsList}">	


<div align="right">
<label>Vender : </label>
<c:forEach items="${paymentsList}" var="paymentsList" end="0" begin="0">
<label>${paymentsList.selSupplierName}</label>
</c:forEach>
</div>
						<div class="table-responsive row">
							<table class="table table-striped b-t text-small">
								<thead>
									<tr>
										<th>Voucher</th>
										<th>Party's Name</th>
										<th>Date</th>
										<th>Due On</th>			
										<th>Pending Amount (INR)</th>	
										<th>Overdue by Days</th>							
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${paymentsList}" var="paymentsList">
								<tr>
										<td>${paymentsList.txtPurchaseNo}</td>
										<td>${paymentsList.selSupplierName}</td>
										<td>${paymentsList.paymentDate}</td>										
										<td>${paymentsList.txtDueDate}</td>
										<td align="right">${paymentsList.txtAmtPayble}</td>
										<td>-</td> 
								</tr>
								</c:forEach>
								
								</tbody>
								<tfoot>
									<tr>
										<td></td>
										<td></td> 
										<td></td>
										<td align="right"><b>Grand Total</b></td>
										<c:forEach items="${paymentsList}" var="paymentsList" end="0" begin="0">
										<td align="right"><b>INR ${paymentsList.total}</b></td>
										</c:forEach>
									</tr>
								</tfoot>
							</table>
							<br>
						</div>
						
								
			</c:if>
			<c:if test="${empty paymentsList}">
			<h5>Record Cannot be located or do not exit.</h5>
			</c:if>
			</div>