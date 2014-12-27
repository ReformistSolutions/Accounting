<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Breakup For Employee</title>   
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
<div id="wrapper">
<%@ include file="../header.jsp" %> 
	<div id="container">
		<%@ include file="innerHeader.jsp" %>
				<form:form action="" cssClass="form-inline" modelAttribute="">
					<br> 						
		             	<div class="col-md-12">
		             		<div class="panel">
		             			<div class="panel-body">
		             			<h4 align="center">Breakup for Employee</h4>
		             			<h6 align="center">For Months</h6>
		             			
		             			<div class="table-responsive">
				                                <table class="table table-striped">
				                                    <thead>
				                                        <tr>
				                                            <th>PayHead</th>
				                                            <th>Basic</th>
				                                            <th>House Rent Allowance</th>
				                                            <th>Dearness Allowance</th>
				                                            <th>Travelling Allowance</th>
				                                            <th>Bonus</th>
				                                            <th>Total(INR)</th>
				                                        </tr>
				                                    </thead>
				                                    <tbody>
				                                        <tr class="odd gradeX">
				                                            <td></td>
				                                            <td></td>
				                                            <td></td>
				                                            <td></td>
				                                            <td></td>
				                                            <td></td>
				                                            <td></td>
				                                        </tr>				                                    
				                                        </tbody>
				                                </table>
				                            </div>
				                    <div>
				                    	<h5 align="right">Generated on : </h5>
				                    </div>
		             			</div>
		             		</div>
		             	</div>	
				</form:form>
	</div>
</div>
</body>
</html>