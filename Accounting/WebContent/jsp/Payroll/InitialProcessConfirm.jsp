<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Attendances</title>   
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
<script src="<c:url value="/resources/assets/plugins/jquery-2.0.3.min.js" />" type="text/javascript"></script>
<%-- <script src="<c:url value="/resources/assets/plugins/bootstrap/js/bootstrap.min.js" />" type="text/javascript"></script> --%>
<script src="<c:url value="/resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js" />" type="text/javascript"></script>
<link href="<c:url value="/resources/datepicker/css/datepicker.css"  />" rel="stylesheet" type="text/css"/>	
<script type="text/javascript">
function backs()
{
	window.history.back();
}
</script>
</head>
<body style="overflow-x: hidden;">
<div id="wrapper">
<%@ include file="../header.jsp" %> 
<div class="page-wrapper">
		<%@ include file="innerHeader.jsp" %>
				<div class="col-md-12">	
				<div class="panel panel-default">
					<div class="panel-body">
		          	<div class="col-md-8">
			            <ol class="breadcrumb">
			             <li class="active"><i class="fa fa-inr"></i> Manage Payroll</li>
			             </ol>
		            </div>
		            <div class="col-md-4">
		            <a href="payroll.do" class="btn btn-primary btn-large" data-toggle="tooltip" data-placement="left" title="Back"> Back</a>
	             	<!-- <button name="back" class="btn btn-primary btn-large" onclick="backs()"><i class="fa fa-reply"></i> Back</button> -->			   
	             	</div>
		            </div>
		         </div>
		         </div>				
					<br> 						
		             	<div class="col-md-12">
		             		<div class="panel">
		             			<div class="panel-body">
									<ul class="nav nav-tabs" id="mytab">
										<li class="active"><a href="#tab1" data-toggle="tab"><span class="badge">1</span> Confirm</a></li>
									</ul>
									<div class="tab-content">
										<div class="tab-pane fade in active" id="tab1">	
										<form:form action="" modelAttribute="processConfirm"> 	
										
											<div class="row"> 
											<c:forEach items="${payListConfirm}" var="payListConfirm" begin="0" end="0"> 											
												<div class="col-md-6">
													<div class="row">	
															<div class="col-md-5">
																<label>Account to pay From : </label>
															</div>	
															<div>${payListConfirm.accounttoPay}</div>
													</div>
												</div>	
												<div class="col-md-5">
													<div class="row">
															<div class="col-md-5">
																<label>Payroll Schedule Date</label>
															</div>
															<div>${payListConfirm.schuduleDate}</div>
														</div>
												</div>		
												</c:forEach>																					
											</div><br>											
											<div class="table-responsive">
												<table class="table table-striped table-bordered">
													<thead>
														<tr>
															<th>For Employee</th>															
															<th>Days Absent</th>
															<th>Net Salary</th>
														</tr>
													</thead>	
													<tbody>
													<c:forEach items="${payListConfirm}" var="payListConfirm">
													<tr>			
														<td>${payListConfirm.txtfname}&nbsp;${payListConfirm.txtmname}&nbsp;${payListConfirm.txtlname}</td>
														<td>${payListConfirm.daysAbsent}</td>														
														<td>${payListConfirm.totalSalary}</td> 
													</tr>
													</c:forEach>
													</tbody>
												</table>
											</div>								
											</form:form>					
										</div>										
									</div>
		             			</div>
		             		</div>
		             	</div>
				
	</div>
</div>
</body>
</html>