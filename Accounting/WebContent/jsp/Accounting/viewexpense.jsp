<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Expense</title>
<link rel="icon" href="<c:url value="/resources/images/favicon.ico" />" type="image/icon">
 <link rel="stylesheet" href="<c:url value="/resources/assets/plugins/bootstrap/css/bootstrap.css" />" />
    <link rel="stylesheet" href="<c:url value="/resources/assets/css/main.css" />" />
    <link rel="stylesheet" href="<c:url value="/resources/assets/css/theme.css" />" />
    <link rel="stylesheet" href="<c:url value="/resources/assets/css/MoneAdmin.css" />" />
    <link rel="stylesheet" href="<c:url value="/resources/assets/plugins/Font-Awesome/css/font-awesome.css" />" />
        <link href="<c:url value="/resources/assets/plugins/dataTables/dataTables.bootstrap.css" />" rel="stylesheet" />
    <script src="<c:url value="/resources/assets/plugins/jquery-2.0.3.min.js" />" ></script>
     <script src="<c:url value="/resources/assets/plugins/bootstrap/js/bootstrap.min.js" />" ></script>
    <script src="<c:url value="/resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js" />" ></script>
    <script src="<c:url value="/resources/assets/plugins/dataTables/jquery.dataTables.js" />" > </script>
    <script src="<c:url value="/resources/assets/plugins/dataTables/dataTables.bootstrap.js" />" ></script>
    <link rel="stylesheet" href="<c:url value="/resources/font-awesome/css/font-awesome.min.css" />" >
    <!-- <script type="text/javascript">
function backPage()
{
	window.history.back();
}
</script> -->
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
</head>
<body style="overflow-x: hidden;">
<div id="wrapper">
<%@ include file="../header.jsp" %>
	<div class="page-wrapper">	
<%@include file="innerHeader.jsp"%>
	<input type="hidden" id="hide" name="hide1" value="0"> <br>
			<div class="col-md-12">
		<div class="panel panel-default">
			<div class="panel-body">
				<div class="col-md-10">
					<ul class="breadcrumb">
						 <li class="active"><small><i class="fa fa-2x fa-table"></i></small>&nbsp;View&nbsp;Expense&nbsp;<small></small>
		         	</ul>
		         </div>
		         <div class="col-md-2">
<!-- 					<button name="back" class="btn btn-primary btn-large" onclick="backPage()"><i class="fa fa-reply"></i> Back</button>	
 -->		        
 <a href="createexpense.do" class="btn btn-primary btn-large"><i class="fa fa-reply"></i> Back</a>
 
  </div>
			</div>
		</div>
</div>
<br>
			<c:if test="${message==1}">
					<div class="col-md-12">
					<div class="alert alert-success" role="alert" id="success">${msg}</div>
					</div>
					<script type="text/javascript">	
					  $('#success').fadeOut(4000, function() 
					{
					  });
					</script>
					</c:if>
					<c:if test="${message==0}">
					<div class="col-md-12">
					<div class="alert alert-danger" role="alert" id="failure">${msg}</div>
					</div>
					<script type="text/javascript">	
					  $('#failure').fadeOut(4000, function() 
					{
					  });
					</script>
					</c:if>
					<c:if test="${update==1}">
					<div class="col-md-12">
					<div class="alert alert-success" role="alert" id="success">${msg}</div>
					</div>
					<script type="text/javascript">	
					  $('#success').fadeOut(4000, function() 
					{
					  });
					</script>
					</c:if>
					<c:if test="${update==0}">
					<div class="col-md-12">
					<div class="alert alert-danger" role="alert" id="failure">${msg}</div>
					</div>
					<script type="text/javascript">	
					  $('#failure').fadeOut(4000, function() 
					{
					  });
					</script>
					</c:if>
					
					<br>
		              <div class="col-md-12">
                    <div class="panel panel-default">                       
                        <div class="panel-body">
						<form:form action="expenseView.do" method="post" cssClass="form-inline" commandName="expenseView"  name="frmrecordTransferred" >
						<div>
						<div class="panel-body">
								<div>
									<div class="row">
								<div class="col-md-8">
									<div class="row">
										<div class="col-md-4"> 
											<label>Expense&nbsp;ID:-</label>
										</div>
										<div class="col-md-4">  
											<label>${expenseView.expid}</label>
										</div>
									</div>
								</div>
														
							</div><br>
							<div class="row">
								<div class="col-md-8">
									<div class="row">
										<div class="col-md-4"> 
											<label>Paid From Account:-</label>
										</div>
										<div class="col-md-3">  
											<label>${expenseView.paidfrmaccno}</label>
										</div>
									</div>
								</div>	
								<div class="col-md-4">
									<div class="row">
										<div class="col-md-5">
											<label>Expense Date:-</label>
										</div>
										<div class="col-md-5">
											<label>${expenseView.expdate}</label>
										</div>
									</div>
								</div>																	
							</div><br>
									
									<div class="table-responsive" style="width: 50%;">	
						         				<table id="tableID" class="table table-striped">        					         					
						        					<tr>
											        		<th align="center">Sr No</th>
											        		<th align="center">Expense Type</th>     
											        		<th align="center">Description</th>   							        		
											        		<th align="center">Amount</th>  					        		
						        					</tr>  
						        					<c:forEach items="${expenseView.expenseDetailsList}" var="expenseDetailsList"> 					
						         					<tr>
						         						<td>${expenseDetailsList.txtSrNo1}</td> 						         						
						         						           					
						            					<td>${expenseDetailsList.typefrmaccno}</td> 					            						
						            					
						            					<td>${expenseDetailsList.remark}</td>
						            					
						            					<td> ${expenseDetailsList.txtamount}</td>
						            				   		
						           					 </tr>
						           					 </c:forEach>   
						         			 </table> 
						         			 </div>
									</div></div></div><br>
									<div><label>Total:-&nbsp;&nbsp;&nbsp;</label><label>${expenseView.txttotal}</label></div><br>
									<div><label>Narration:-&nbsp;&nbsp;&nbsp;</label><label>${expenseView.narration}</label></div><br>		
<input type="button" value="Print" name="btn" class="btn btn-primary" onclick="urlSubmit('expensePDF.do?expid=${expenseView.expid}')"><!-- 											<div><button type="submit" class="btn btn-primary" name="btn" value="Edit">Print</button>
 -->								            <!-- <button type="reset" class="btn btn-primary" name="btn">Email</button> -->
 </form:form>
</div>
</div>
</div>							
</div>
</div>         
</body>
</html>