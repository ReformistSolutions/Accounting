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
             $('#dataTables-example1').dataTable(); 
             $('#dataTables-example2').dataTable();
         });
    </script>
   
</head>
<body>
<c:choose>
	<c:when test="${resp !='blank' }">
		<form:form action="" cssClass="form-inline" modelAttribute="salesReceipt">
					<br>			
						<div class="col-md-12">
						<div class="panel">
						<div class="panel-body">
						<div class="col-md-10">
						<ul class="breadcrumb">
							<li class="active"><small><i class="fa fa-2x fa-table"></i></small>&nbsp;Payment<small>&nbsp;Details</small>
		             	</ul>
		             	</div>
		             	</div>
		             	</div>
		             </div>
		             <div class="col-md-12">
							<div class="panel">
							<div class="panel-body">
		             <div class="table-responsive">
										<table class="table table-striped table-bordered table-hover" id="dataTables-example1">
										<thead>
										<tr>
											<th colspan="8" style="text-align: center;"><u>INVOICE NO</u>:&nbsp;${salesReceipt.invoiceId}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<u>CUSTOMER NAME</u>:&nbsp;${salesReceipt.customer_Name}</th>
										</tr>
										<tr>
                                            <th>Receipt No</th>
                                            <th>Invoice No</th>
                                            <th>Date</th>
                                            <th>Payment Mode</th>
                                            <th>Amount(INR)</th> 
                                                                                
                                        </tr>
                                    </thead>
                                    	<tbody>
                                    	<c:choose>
                                    		<c:when test="${not empty receiptsList}">
	                                    		<c:forEach items="${receiptsList}" var="receiptsList">
			                                        <tr class="odd gradeX">
			                                            <td>${receiptsList.receiptsNo}</td>
			                                            <td>${receiptsList.invoiceId}</td>
			                                            <td>${receiptsList.date}</td>  
			                                            <td>${receiptsList.payMode}</td>                                             
			                                           	<td>${receiptsList.amount}</td>
			                                        </tr>
	                                     		</c:forEach>
                                    		</c:when>   
                                    		<c:when test="${empty receiptsList}">
												 <label id="no" style = "color:green;">Payment Not Yet Received...!!!</label>
												 <script type="text/javascript">	
												  $('#no').fadeOut(4000, function() 
												{
												  });
												</script>
                                    		</c:when>                                 		
                                    </c:choose>
                                    </tbody>
								</table>
											
							</div>
						</div>
						</div>
						</div>
		             
	</form:form>
	</c:when>
	<c:otherwise>
		<form:form action="" cssClass="form-inline" modelAttribute="salesReceipt">
					<br>			
						<div class="col-md-12">
						<div class="panel">
						<div class="panel-body">
						<div class="col-md-10">
						<ul class="breadcrumb">
							<li class="active"><small><i class="fa fa-2x fa-table"></i></small>&nbsp;Payment<small>&nbsp;Details</small>
		             	</ul>
		             	</div>
		             	</div>
		             	</div>
		             </div>
		             <div class="col-md-12">
							<div class="panel">
							<div class="panel-body">
		             <div class="table-responsive">
										<table class="table table-striped table-bordered table-hover">
										<thead>
										<tr>
											<th colspan="5" style="text-align: center;"><u>INVOICE NO</u>:&nbsp;${salesReceipt.invoiceId}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<u>CUSTOMER NAME</u>:&nbsp;${salesReceipt.customer_Name}</th>
										</tr>
										<tr>
                                            <th>Receipt No</th>
                                            <th>Invoice No</th>
                                            <th>Date</th>
                                            <th>Payment Mode</th>
                                            <th>Amount</th> 
                                                                                
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<tr>
                                    		<td colspan="5">
                                    			<h5>Payment History is Not Available</h5>
                                    		</td>
                                    	</tr>
                                    </tbody>
								</table>
							</div>
						</div>
						</div>
						</div>
		             
	</form:form>
	</c:otherwise>
</c:choose>
	
</body>
</html>


