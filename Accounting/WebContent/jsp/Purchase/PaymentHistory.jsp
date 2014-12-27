<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>	
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Payment History</title>
<link rel="icon" href="<c:url value="/resources/images/favicon.ico" />" type="image/icon">
<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/css/sb-admin.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/css/table.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/css/table.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/css/font-awesome.min.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/assets/css/main.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/assets/css/theme.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/assets/css/MoneAdmin.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/assets/plugins/Font-Awesome/css/font-awesome.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/assets/plugins/Font-Awesome/css/font-awesome.css" />" rel="stylesheet" type="text/css">

<script src="<c:url value="/resources/assets/plugins/jquery-2.0.3.min.js" />" type="text/javascript"></script>
<script src="<c:url value="/resources/assets/plugins/bootstrap/js/bootstrap.min.js" />" type="text/javascript"></script>
<script src="<c:url value="/resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js" />" type="text/javascript"></script>
<script src="<c:url value="/resources/assets/plugins/dataTables/jquery.dataTables.js" />" type="text/javascript"></script>
<script src="<c:url value="/resources/assets/plugins/dataTables/dataTables.bootstrap.js" />" type="text/javascript"></script>
     <script>
         $(document).ready(function () {
             $('#dataTables-example').dataTable(); 
         });
    </script>
</head>
<body>			
						<div class="col-md-12">
						<div class="panel">
						<div class="panel-body">
						<div class="col-md-10">
						<ul class="breadcrumb">
							<li class="active"><small><i class="fa fa-2x fa-table"></i></small>&nbsp;Payment<small>&nbsp;History</small>
		             	</ul>
		             	</div>
		             	</div>
		             	</div>
		             </div>
		             <div class="col-md-12">
							<div class="panel">
							<div class="panel-body">
		             <div class="table-responsive">
										<table class="table table-striped table-bordered table-hover" id="dataTables-example">										
										<thead>						
										<tr>
											<%-- <th colspan="4" align="center">ENQUIRY ID : ${detailEnquiry.enqID}&nbsp;&nbsp;VENDER NAME : ${detailEnquiry.supplierName}</th> --%>
										</tr>
											<tr> 												
												<td align="center">Voucher No</td>
												<td align="center">Purchases No</td>
												<td align="center">Date</td>
												<!-- <td align="center">Account Name</td> -->
												<td align="center">Amount(INR)</td>											
											</tr> 
										</thead>
										<tbody>
										<c:forEach items="${paylist}" var="detailList">
											<tr>
												<td>${detailList.voucherNo}</td>
												<td>${detailList.orderId}</td> 
												<td>${detailList.date }</td>
												<%-- <td>${detailList.accountNo }</td> --%>
												<td>${detailList.amount}</td>
											</tr> 
											</c:forEach>
											</tbody>
										</table>							
							</div>
						</div>
						</div>
						</div>		        
</body>
</html>