<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,java.text.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Details</title>
<link rel="icon" href="<c:url value="/resources/images/favicon.ico" />"	type="image/icon">
<link href="<c:url value="resources/css/bootstrap.css" />"	rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/css/sb-admin.css" />"	rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/css/table.css" />" rel="stylesheet"	type="text/css" />
<link href="<c:url value="resources/css/table.css" />" rel="stylesheet" 	type="text/css" />
<link href="<c:url value="resources/css/font-awesome.min.css" />" 	rel="stylesheet" type="text/css">
<link href="<c:url value="resources/assets/css/main.css" />" 	rel="stylesheet" type="text/css">
<link href="<c:url value="resources/assets/css/theme.css" />"	rel="stylesheet" type="text/css">
<link href="<c:url value="resources/assets/css/MoneAdmin.css" />" 	rel="stylesheet" type="text/css">
<link href="<c:url value="resources/assets/plugins/Font-Awesome/css/font-awesome.css" />" 	rel="stylesheet" type="text/css">
<script src="<c:url value="resources/assets/plugins/jquery-2.0.3.min.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js" />" type="text/javascript"></script>
<script type="text/javascript">
	function backs() {
		window.history.back();
	}
</script>
<script type="text/javascript">
function showBreakupEmp()
{
	var month = "";
	var e = document.getElementById("month");
	month = e.options[e.selectedIndex].value;
	var e1 = document.getElementById("year");
	year = e1.options[e1.selectedIndex].value;
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
				document.getElementById("showBreakupEmployee").innerHTML = xmlhttp.responseText;
			}
		}
	}
	xmlhttp.open("GET", "retriveBreakupbyEmployee.do?month=" + month + "&year="+ year, true);
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
<body style="overflow-x: hidden;"> 
	<div id="wrapper">
		<%@include file="../header.jsp"%>
		<div class="page-wrapper">
		<%@include file="innerHeader.jsp"%>
			<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="col-md-8">
								<ul class="breadcrumb">
									<li class="active"><small>Breakup by Employee</small>
								</ul>
							</div>
							<div class="col-md-3">
							<button name="back" class="btn btn-primary btn-large" onclick="backs()"><i class="fa fa-reply"></i> Back</button>	
        					 </div>
						</div>
					</div>
				</div>
			<br>
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="row">
							<div>
								<div class="col-md-2"><label>Select Month : </label></div>								
								<div class="col-md-2">
									<select class="form-control" id="month" onchange="showMonth();">
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
								<div class="col-md-2"><label>Select Year : </label></div>								
								<div class="col-md-2">
									<select class="form-control" id="year">
										<option>---Select---</option>
										<option value="2011">2011</option>
										<option value="2012">2012</option>
										<option value="2013">2013</option>
										<option value="2014">2014</option>
										<option value="2015">2015</option>
										<option value="2016">2016</option>
									</select>
								</div>
							</div> 
							<div class="col-md-3">
								<input type="button" onclick="showBreakupEmp();" value="Go" class="btn btn-default">
							</div>
							<div align="right">
					     		 <a href="#"><img alt="" src="<c:url value="/resources/images/filetype_pdf.ico" />" width="25px" height="25px"></a>
					     		 <a href="#"><img alt="" src="<c:url value="/resources/images/e_mail.ico" />" width="25px" height="25px"></a>
					   		</div>
						</div>
					</div>
				</div>
			</div>
			<br>
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="row">
							<div class="col-md-12" align="center">
								<h3>Breakup by Employee</h3>
								<%
									Calendar cal = Calendar.getInstance();
									int year = cal.get(Calendar.YEAR);
									String month = new SimpleDateFormat("MMMMMMM").format(cal.getTime());
								%>   
								<span class="xsmall light">For month : <b><input type="text" id="showM" style="border: none; width: 80px;" readonly="readonly" value="<%=month %>"><input type="text" style="border: none;width: 80px;" readonly="readonly" value="<%=year%>"></b></span> <br />
							</div>
						</div>
						<div id="showBreakupEmployee">
							<div class="table-responsive row">
							<table class="table table-striped b-t text-small">
								<thead>								
									<tr>
									<th>Name</th>
									<c:forEach items="${payheadName}" var="payheadName">
										<th>${payheadName.payheadid}</th>
									</c:forEach>
									<th>Total (INR)</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${payamtList}" var="payamtList">
									<tr>
										<td>${payamtList.empid}</td>
										<td>${payamtList.payamt}</td>
									</tr>
								</c:forEach>
										<!-- <tr>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td  class="text-right"></td>
									</tr> -->
								</tbody>								
							</table>
							<br>
						</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>