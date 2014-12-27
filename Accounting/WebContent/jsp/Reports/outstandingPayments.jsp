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
<title>Outstanding Payments</title>
<link rel="icon" href="<c:url value="/resources/images/favicon.ico" />"	type="image/icon">
<link href="<c:url value="resources/css/bootstrap.css" />"	rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/css/sb-admin.css" />"	rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/css/table.css" />" rel="stylesheet"	type="text/css" />
<link href="<c:url value="resources/css/font-awesome.min.css" />" 	rel="stylesheet" type="text/css">
<link href="<c:url value="resources/assets/css/main.css" />" 	rel="stylesheet" type="text/css">
<link href="<c:url value="resources/assets/css/theme.css" />"	rel="stylesheet" type="text/css">
<link href="<c:url value="resources/assets/css/MoneAdmin.css" />" 	rel="stylesheet" type="text/css">
<link href="<c:url value="resources/assets/plugins/Font-Awesome/css/font-awesome.css" />" 	rel="stylesheet" type="text/css">
<script src="<c:url value="resources/assets/plugins/jquery-2.0.3.min.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js" />" type="text/javascript"></script>
<link href="<c:url value="/resources/datepicker/css/datepicker.css"  />" rel="stylesheet" type="text/css"/>	
<script src="<c:url value="resources/assets/plugins/tableToExcel.js" />" type="text/javascript"></script>
<script src="<c:url value="http://code.jquery.com/jquery-git2.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/jspdf.debug.js" />" type="text/javascript"></script>

<script type="text/javascript">
	function backs() {
		window.history.back();
	}
</script>
<script type="text/javascript">
function showOutstandingPayments()
{
	var venderID = document.getElementById("venderID").value;
	var startdate = document.getElementById("dp1").value;
	var enddate = document.getElementById("dp2").value;
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
				document.getElementById("showPayments").innerHTML = xmlhttp.responseText;
			}
		}
	}
	xmlhttp.open("GET", "retriveOutstandingPayments.do?venderID=" + venderID + "&startdate="+ startdate + "&enddate=" + enddate, true);
	xmlhttp.send();
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
<script type='text/javascript'>
            function htmltopdf() {
                var pdf = new jsPDF('p', 'pt', 'letter');
                source = $('#htmlexportPDF')[0]; //table Id
                specialElementHandlers = { 
                    '#bypassme': function (element, renderer) {
                        return true
                    }
                };
                margins = { //table margins and width
                    top: 80,
                    bottom: 60,
                    left: 40,
                    width: 522
                };
                pdf.fromHTML(
                source, 
                margins.left,
                margins.top, { 
                    'width': margins.width, 
                    'elementHandlers': specialElementHandlers
                },

                function (dispose) {
                    pdf.save('Employee Leave Card.pdf'); //Filename
                }, margins);
            }

        </script>
<script type="text/javascript">
            // When the document is ready
            $(document).ready(function () {
            	
                $('#dp1').datepicker({
                    format: "yyyy/mm/dd"
                });                
                $('#dp2').datepicker({
                    format: "yyyy/mm/dd"
                });
            });
            $( document ).ready(function() {
            	  $('#dp1').datepicker({ format: "yyyy-mm-dd" }).on('changeDate', function(ev){
            	    $(this).datepicker('hide');
           	});
            	});
            $( document ).ready(function() {
          	  $('#dp2').datepicker({ format: "yyyy-mm-dd" }).on('changeDate', function(ev){
          	    $(this).datepicker('hide');
          	});
          	});
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
									<li class="active"><small>Outstanding Payments</small>
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
						<div class="panel panel-info">
							<div class="panel-heading">
								<h4 class="panel-title">Filter</h4>
							</div>
								<div class="row">
									<div class="form-group">
										<br />
										<div class="col-md-1"></div>
										<div class="col-md-3">
											<select class="form-control" id="venderID"> 
												<option>Vender Name</option>
												<c:forEach items="${venderList}" var="venderList">
													<option value="${venderList.txtCustID}">${venderList.txtCustName}</option>
												</c:forEach>
											</select>
										</div>
										<div class="col-md-2">
											<input type="text" id="dp1" class="form-control parsley-validated" placeholder="Start date">
										</div>
										<div class="col-md-2">
											<input type="text" id="dp2" class="form-control parsley-validated" placeholder="End date">
										</div>
										<div class="col-md-1">
											<input type="button" onclick="showOutstandingPayments();" value="Search" class="btn btn-primary">
										</div>
										<div class="col-md-2">
											<input type="button" class="btn btn-primary" onclick="tableToExcel('testTable', '')" value="Export to Excel">
										</div>
									</div>
								</div><br>
						</div>
			</div>
			<%-- <div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="row">
							<div>
								<div class="col-md-1"><label>Venders&nbsp;: </label></div>
								<div class="col-md-2">
									<select class="form-control" id="venderID"> 
										<option>---Select---</option>
										<c:forEach items="${venderList}" var="venderList">
										<option value="${venderList.txtCustID}">${venderList.txtCustName}</option>
										</c:forEach>
									</select>
								</div>
								<div class="col-sm-2"><label>Start&nbsp;Date&nbsp;: </label></div>
								<div class="col-sm-2">
									<input type="text" id="dp1" class="form-control">
								</div>
								<div class="col-sm-2"><label>End&nbsp;Date&nbsp;: </label></div>								
								<div class="col-sm-2">
									<input type="text" id="dp2" class="form-control">
								</div>
							</div> 
							<div class="col-md-1">
								<input type="button" onclick="showOutstandingPayments();" value="Go" class="btn btn-default">
							</div>
							<br><br><br>
							<div align="right">
					     		 <input type="button" class="btn btn-primary btn-xs" onclick="tableToExcel('testTable', '')" value="Export to Excel">
					     		 <a href="#"><img alt="" src="<c:url value="/resources/images/filetype_pdf.ico" />" width="25px" height="25px"></a>
					     		 <a href="#"><img alt="" src="<c:url value="/resources/images/e_mail.ico" />" width="25px" height="25px"></a>
					   		</div>
						</div>						
					</div>
				</div>
			</div> --%>
			<br>  			
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-body">
					<c:if test="${not empty paymentsList}">
					
					<div id="testTable">
					<div id="showPayments">
					<div align="right">
<label>Vender : </label>
<c:forEach items="${paymentsList}" var="paymentsList" end="0" begin="0">
<label>All Venders</label>
</c:forEach>
</div>
						<div class="table-responsive row" id="htmlexportPDF">
							<table class="table table-striped b-t text-small" >
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
										<td style="text-align: right;">${paymentsList.txtAmtPayble}</td>
                                    		<c:choose>
                                    			<c:when test="${paymentsList.overduedays >=1}">
                                    				<td style="text-align: right;">${paymentsList.overduedays}</td>
                                    			</c:when>
                                    			<c:otherwise>
                                    				<td style="text-align: right;">-</td>
                                    			</c:otherwise>
                                    		</c:choose>
										
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
										<td></td>
									</tr>
								</tfoot>
							</table>
							<br>
						</div>
						</div>
						<div class="row">
						<hr>
						   <div class="col-lg-8">
								${compName}
							</div>
							<%
							 DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");	     
						     Date date = new Date();	     
						     String dt=dateFormat.format(date);
							%>
							<div class="col-lg-4" align="right">
								<span class="xsmall light">Generated on : <%=dt%></span>
							</div>
							</div>
					
				</div>
				</c:if>
				<c:if test="${empty paymentsList}">
				<h5>Record Cannot be located or do not exit.</h5>
				</c:if>
			</div>
			</div>
			</div>
		</div>
	</div>
	<script src="<c:url value="/resources/datepicker/js/bootstrap-datepicker.js" />"></script>
</body>
</html>