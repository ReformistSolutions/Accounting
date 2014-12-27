<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib  uri="http://www.springframework.org/tags/form" prefix="form" %>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
   <%@page import="java.text.SimpleDateFormat"%>
   <%@ page import="javax.servlet.*,java.text.*" %>
   <%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Manage Payroll</title>
<link rel="icon" href="<c:url value="/resources/images/favicon.ico" />" type="image/icon">
<link href="<c:url value="resources/css/bootstrap.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/css/sb-admin.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/css/table.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/css/table.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/css/font-awesome.min.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="resources/assets/css/main.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="resources/assets/css/theme.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="resources/assets/css/MoneAdmin.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="resources/assets/plugins/Font-Awesome/css/font-awesome.css" />" rel="stylesheet" type="text/css">
<script src="<c:url value="resources/assets/plugins/jquery-2.0.3.min.js" />" type="text/javascript"></script>
<%-- <script src="<c:url value="resources/assets/plugins/bootstrap/js/bootstrap.min.js" />" type="text/javascript"></script> --%>
<script src="<c:url value="resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/dataTables/jquery.dataTables.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/dataTables/dataTables.bootstrap.js" />" type="text/javascript"></script>

     <script>
         $(document).ready(function () {
             $('#dataTables-example1').dataTable();
             $('#dataTables-example2').dataTable();
             $('#dataTables-example3').dataTable();
             $('#dataTables-example4').dataTable();
             $('#dataTables-example5').dataTable();
             
         });
    </script>
</head>	
<body style="overflow-x: hidden;">
<div id="wrapper">
	<%@include file="../header.jsp"%>
	<div class="page-wrapper">
		<%@include file="innerHeader.jsp"%>	
	<form:form action="" modelAttribute="initialProcess">
				<br>
			<div class="col-md-12">	
				<div class="panel panel-default">
						<div class="panel-body">
          	<div class="col-md-6">
            <ol class="breadcrumb">
             <li class="active"><i class="fa fa-inr"></i> Manage Payroll</li>             
             </ol>
             </div>
             <div class="col-md-6">
             <a href="users.do"> <button type="button" class="btn btn-primary " value="" data-toggle="tooltip" data-placement="top" title="Employees"><small><i class="fa fa-1x fa-user"></i></small> Employees</button></a>
             <div class="btn-group">
		 	  <button data-toggle="dropdown" class="btn dropdown-toggle btn btn-primary"><i class="fa fa-file-text"></i>  Manage <span class="caret"></span></button>
			  <ul class="dropdown-menu"    >
				<li><a href="leaveDetails.do" data-toggle="tooltip" data-placement="top" title="Leave Setails">Leave Details</a></li>
				<li><a href="payrollSetting.do" data-toggle="tooltip" data-placement="top" title="Payroll Setting">Payroll Setting</a></li>
			  </ul>
		     </div>
		     <div class="btn-group">
			  <button data-toggle="dropdown" class="btn dropdown-toggle"><i class="fa fa-file-text-o"></i>  Payroll Report <span class="caret"></span></button>
			  <ul class="dropdown-menu">
			  	<li><a href="paymentAdvice.do" data-toggle="tooltip" data-placement="top" title="Payment Advice">Payment Advice</a></li>	
				<li><a href="breakupBy.do" data-toggle="tooltip" data-placement="top" title="Breakup by Employee">Breakup by Employee</a></li>	
			  </ul>
			</div>
		     </div>
		     <div class="col-md-4">
		   	
             </div>
			</div>
			</div>
		</div>
		<div class="col-md-12">	
			<br>
		<div class="row first-column">
		<c:choose>
		<c:when test="${result == 'yes'}">	
			<div class="col-md-8">
		<div class="panel panel-default">	
    	<div class="panel-heading">Payroll Status by Months</div>
    		<div class="panel-body">    		
	  				<div>
	  						<%
							 String dformat=new SimpleDateFormat("MMMMMM yyyy").format(new java.util.Date());								 
							%>	
    						<%=dformat %><br>
	        				Processed on ${processDate}
	        				<div style="float:right;"><a href="processConfirm.do"> <button type="button" class="btn btn-default " value=""><small></small>View Details</button></a>
	  						</div>
	  				</div>
			</div>				
		</div>
		</div>	
		</c:when>
		<c:otherwise> 
			<c:if test="${ not empty empList}" >
			<div class="col-md-8">
			<div class="panel panel-default">
    		<div class="panel-heading">Payroll Status by Months</div>
    			<div class="panel-body">
    				<div> 
    						${comDate}<br>
	        				Not yet proceeds
	        				<div style="float:right;"><a href="initialProcess.do"> <button type="button" class="btn btn-primary " value=""><small></small>Initiate Process</button></a>
	  						</div>
	  				</div>	  				
				</div>				
			</div>
			</div>
			</c:if>
			<c:if test="${empty empList}" >
			<div class="col-md-8">
			</div>
			</c:if>
		
		</c:otherwise>
		</c:choose> 
		
	<div class="col-md-4 pull right">
		<div class="panel panel-default">
    			<div class="panel-body">
						<div><label>Total Employees:</label>&nbsp;&nbsp;${totalcnt}</div>
						<div><label id="activeemp">Joined This Months:&nbsp;&nbsp;${statuscnt}</label></div>
						<div><label id="activeemp">Left This Months:&nbsp;&nbsp;${inactivecnt}</label></div>
				</div>
			</div>
	</div>		
</div></div>
</form:form> 
</div>
</div>	
</body>
</html>