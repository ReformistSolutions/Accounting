<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,java.text.*" %>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Salary Slip</title>
<link rel="icon" href="<c:url value="/resources/images/favicon.ico" />" type="image/icon">
<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/css/sb-admin.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/css/font-awesome.min.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/assets/plugins/Font-Awesome/css/font-awesome.css"/>" rel="stylesheet" type="text/css">
<script src="<c:url value="/resources/assets/plugins/jquery-2.0.3.min.js"/>" type="text/javascript"></script>
<%-- <script src="<c:url value="/resources/assets/plugins/bootstrap/js/bootstrap.min.js"/>" type="text/javascript"></script> --%>
<script src="<c:url value="/resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js"/>" type="text/javascript"></script>
<link rel="stylesheet" href="<c:url value="http://cdn.oemdith.co.uk/morris-0.4.3.min.css"/>">
<script type="text/javascript">
function backs()
{
window.history.back();
}
</script>
<script>
function urlSubmit(url,target)
{
	if(target=="1")
		{
		
			window.location.assign(url);
		}
	else
		{
			window.open(url,target);
		}

}
</script>
<script type="text/javascript">
$(document).ready(function(){
$("#print").hover(
		  function(){
		    $(this).animate({width: 50,height: 50}, 300);
		  },
		  function(){
		      $(this).animate({width: 30,height: 30}, 300);
		});
$("#mail").hover(
		  function(){
		    $(this).animate({width: 50,height: 50}, 300);
		  },
		  function(){
		      $(this).animate({width: 35,height: 35}, 300);
		});
});
</script>
<script type="text/javascript">
function showSalarySlip()

	{
		var month = "", year = "";
		var e = document.getElementById("month");
		month = e.options[e.selectedIndex].value;
		var e1 = document.getElementById("year");
		year = e1.options[e1.selectedIndex].value;
		var empID = document.getElementById("empID").value;
		var xmlhttp;
		if (window.XMLHttpRequest) 
		{
			xmlhttp = new XMLHttpRequest();
		} 
		else 
		{
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) 
			{
				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) 
				{
					document.getElementById("showSalSlip").innerHTML = xmlhttp.responseText;
				}
			}
		}
		xmlhttp.open("GET", "retriveSalaryslip.do?month=" + month + "&year="+ year + "&empid=" + empID + "", true);
		xmlhttp.send();
	}
</script>
<script type="text/javascript">
function showMonth()
{
	var month = document.getElementById("month").value;
	switch (month) {
	case '1':
		document.getElementById("showM").value = "January";
		break;
	case '2':
		document.getElementById("showM").value = "February";
		break;		
	case '3':
		document.getElementById("showM").value = "March";
		break;
	case '4':
		document.getElementById("showM").value = "April";
		break;
	case '5':
		document.getElementById("showM").value = "May";
		break;
	case '6':
		document.getElementById("showM").value = "June";
		break;
	case '7':
		document.getElementById("showM").value = "July";
		break;
	case '8':
		document.getElementById("showM").value = "Augest";
		break;
	case '9':
		document.getElementById("showM").value = "September";
		break;
	case '10':
		document.getElementById("showM").value = "October";
		break;
	case '11':
		document.getElementById("showM").value = "November";
		break;
	case '12':
		alert("December");
		document.getElementById("showM").value = "February";
		break;
	default:
		break;
	}
}
</script>
</head>
<body style="overflow-x: hidden;" onload="totalDeduction()">
<div id="wrapper">
		<%@include file="../header.jsp"%>
		<div class="page-wrapper">
		<!-- <div class="container"> -->
			<%@include file="innerHeader.jsp"%>
			<div class="col-md-12">
						<div class="panel panel-default">
						<div class="panel-body">
						<div class="col-md-10">
						<ul class="breadcrumb">
							<li class="active"><small></small>&nbsp;Salary<small>&nbsp;Slip</small>
		             	</ul>
		             	</div>
			             	<div class="col-md-2"> 
			             	<button name="back" class="btn btn-primary btn-large" onclick="backs()" data-toggle="tooltip" data-placement="left" title="Back"><i class="fa fa-reply"></i> Back</button>			   
			             	</div>
		             	</div>
		             	</div>
		</div>
		<br>
		<form:form cssClass="form-horizontal" action="" modelAttribute="viewSalarySlip">
		<div class="col-md-12">
			<div class="panel panel-default">	
				<div class="panel-body"> 
					<div class="col-md-12" align="right">
					    <div >
					      <a onclick="urlSubmit('employeedetailPDF.do?emp_ID=${viewSalarySlip.txtEmpId}','_blank')" title="Print" data-toggle="tooltip" data-placement="left" title="Print"><img id="print" alt="" src="<c:url value="/resources/images/print.png" />" width="25px" height="25px"></a>
					      <a onclick="urlSubmit('composeMail.do?emp_ID=${viewSalarySlip.txtEmpId}',1)" title="E-Mail" data-toggle="tooltip" data-placement="left" title="E-Mail"><img id="mail" alt="" src="<c:url value="/resources/images/email.png" />" width="25px" height="25px"></a>
					      <%-- <a href="#"><img alt="" src="<c:url value="/resources/images/button_cancel.ico" />" width="25px" height="25px"></a> --%>
					      <!-- <button type="submit" class="btn btn-default">Print</button> -->
					      <!-- <button type="submit" class="btn btn-default">Email</button> -->
					      <!-- <button type="submit" class="btn btn-default">Cancel</button> -->
						</div>
  					</div>  
					<div class="row">	
					<div>
					    <label class="col-md-3 control-label">Select Month : </label>
					    <div class="col-md-2">
					    <select class="form-control" id="month" onchange="showMonth();">
					    	<option>---Select---</option>
					    	<option>---Select---</option>
										<option value="1">January</option>
										<option value="2">February</option>
										<option value="3">March</option>
										<option value="4">April</option>
										<option value="5">May</option>
										<option value="6">June</option>
										<option value="7">July</option>
										<option value="8">Augest</option>
										<option value="9">September</option>
										<option value="10">October</option>
										<option value="11">November</option>
										<option value="12">December</option>					    	
					    </select>
					    </div>
					</div>
					<div>
					    <label class="col-md-2 control-label">Select Year : </label>
					    <div class="col-md-2">
					    <select class="form-control" id="year">  
					    	<option>---Select---</option>
					    	<option value="2011">2011</option><option value="2012">2012</option>
					    	<option value="2013">2013</option><option value="2014">2014</option>
					    	<option value="2015">2015</option><option value="2016">2016</option>
					    </select>
					    </div>
					</div>	
					<div> 
					<%-- <a href="#"  onclick="showSalarySlip();"><img alt="" src="<c:url value="/resources/images/forward.png" />" width="25px" height="25px"></a> --%> 
					<%-- <input type="image" onclick="showSalarySlip();" src="<c:url value="/resources/images/forward.png" />" width="25px" height="25px" alt="Submit"> --%>
					<input type="button" onclick="showSalarySlip();" value="Go" class="btn btn-default">
					<input type="hidden" value="${viewSalarySlip.txtEmpId}" id="empID">
					</div>
					</div><br>					
					<div >
					<div class="row">
							<div class="col-md-12" align="center">
								<h4>Salary Slip</h4>
								<%
 									Calendar cal = Calendar.getInstance();
									int year = cal.get(Calendar.YEAR);
									String month = new SimpleDateFormat("MMMMMMM").format(cal.getTime());
								%>   
								<span class="xsmall light">For month : <b><input type="text" id="showM" style="border: none; width: 80px;" readonly="readonly" value="<%=month %>"><input type="text" style="border: none;width: 80px;" readonly="readonly" value="<%=year%>"></b></span> <br />
							</div>
						</div>
						<input type="hidden" value="${viewSalarySlip.monthNo}" id="month">
						<hr>					
					<div id="showSalSlip">
					<div class="row">
						<div class="col-md-6"><div class="col-md-3"></div>
							Employee ID : 
							 ${viewSalarySlip.txtEmpId}
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
					</div><br>
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
											
											<c:forEach items="${daysDeduc}" var="daysDeduc">
												<tr>	
													<td>${daysDeduc.deductionNamee}</td>
													<td  style="float: right;"> ${daysDeduc.deductionAmt}</td>
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
					</div>
					</div>
				</div>
			</div>
		</div>
		</form:form>
		</div>
</div>
</body>
</html>