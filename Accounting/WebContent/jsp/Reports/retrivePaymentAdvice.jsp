<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div>
<c:if test="${ not empty payList}">
	<div>
		<hr>
		<strong>The Manager</strong><br> <br> <br> Dear Sir,
		<p>
			<strong><u>Payment Advice from ${compName} A/C <c:forEach items="${payList}" var="payList" begin="0" end="0">${payList.bank_name}</c:forEach> for </u></strong><br> Please make the payroll transfer from above account to the below mentioned account numbers towards employee salary
		</p>
	</div>
	<div class="table-responsive row">
		<table class="table table-striped b-t text-small">
			<thead>
				<tr>
					<th>Employee ID.</th>
					<th>Name of the Employee</th>
					<th>Account No.</th>
					<th>Bank Name</th>
					<th class="text-right">Amount (INR)</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${payList}" var="payList">
					<tr>
						<td>${payList.emp_Id}</td>
						<td>${payList.salitation} ${payList.f_Name} ${payList.m_Name} ${payList.lName}</td>
						<td>${payList.accNo}</td>
						<td>${payList.bank_name}</td>
						<td class="text-right">INR ${payList.amount}</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td align="right"><b>Total</b></td>
					<c:forEach items="${payList}" var="payList" begin="0" end="0">
						<td align="right"><b>INR ${payList.total}</b></td>
					</c:forEach>
				</tr>
			</tfoot>
		</table>
		<br>
	</div>
	<span class='light'>Your Sincerely</span>
	<p>
		<b>For ${compName}</b><br> <br> <br> Authorised Signatory
	</p>
	</c:if>
	<c:if test="${empty payList}">

		<h5>Record Cannot be located or do not exit.</h5>

	</c:if>
</div>