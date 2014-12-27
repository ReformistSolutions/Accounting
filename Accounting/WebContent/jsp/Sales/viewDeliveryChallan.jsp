<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>	
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Delivery Challan</title>
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
<script src="<c:url value="resources/assets/plugins/bootstrap/js/bootstrap.min.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/dataTables/jquery.dataTables.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/dataTables/dataTables.bootstrap.js" />" type="text/javascript"></script>
<script>
function goBack()
	{
		window.history.back();
	}
</script>
</head>
<body style="overflow-x: hidden;">
<div id="wrapper">
<%@ include file="../header.jsp" %>
<!-- 	<div id="container"> -->
		<%@ include file="innerHeader.jsp" %>
					
					<!-- <div class="container">		 -->		<br>			
						<div class="col-md-12">
						<div class="panel panel-default">
						<div class="panel-body">
						<div class="col-md-10">
						<ul class="breadcrumb">
							<li class="active"><small><i class="fa fa-2x fa-table"></i></small>&nbsp;Delivery<small>&nbsp;Challan</small>
		             	</ul>
		             	</div>
			             	<div class="col-md-2">
			             		<a href="deliveryChallan.do" class="btn btn-primary btn-large" data-toggle="tooltip" data-placement="left" title="Back"> Back</a>
			             	</div>
		             	</div>
		             	</div>
		             </div>
		             <br>
<script type="text/javascript">
$(document).ready(function(){
$("#edit").hover(
	  function(){
	    $(this).animate({width: 50,height: 50}, 300);
	  },
	  function(){
	      $(this).animate({width: 25,height: 25}, 300);
	});
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
		          <div>
			      <div class="col-md-10"></div>
					<%-- <a onclick="urlSubmit('editDevilveryChallan.do?challanId=${deliveryChallan.challanID}','1')" title="Edit"><img id="edit" src="<c:url value="/resources/images/edit.png" />" width="25px" height="25px"></a> --%>
					<a onclick="urlSubmit('deliveryChallanPDF.do?challanId=${deliveryChallan.challanID }','_blank')" title="Print" data-toggle="tooltip" data-placement="top" title="Print"><img id="print" alt="" src="<c:url value="/resources/images/print.png" />" width="30px" height="30px"></a>
					<a onclick="urlSubmit('sendDChlPdfMail.do?custId=${deliveryChallan.custId}&id1=${deliveryChallan.challanID }','1')" title="E-Mail" data-toggle="tooltip" data-placement="top" title="Email"><img id="mail" alt="" src="<c:url value="/resources/images/email.png" />" width="35px" height="35px"></a>
				</div>
				
				 <br>
		            <div class="col-md-12">
<form:form action="" cssClass="form-inline" modelAttribute="deliveryChallan">
	<div class="panel panel-default">
		<div class="panel-body">
		<div class="row">
		<div class="col-md-6">
			<div class="panel-default">
				<div class="panel-heading"></div>
				<div class="panel-body">
					<div class="row">
					<div class="col-sm-1"></div>
						<div class=""> 						
						<label>Challan No : </label>
						<u>${deliveryChallan.challanID }</u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<label>Invoice No : </label>
						<c:choose>
							<c:when test="${deliveryChallan.invoiceID=='0' }">
								<u>Free Use</u>
							</c:when>
							<c:otherwise>
								<u>${deliveryChallan.invoiceID }</u>
							</c:otherwise>
						</c:choose>						
						</div><br>
					<div class="col-sm-1"></div>
						<div class="">						
						<label>Customer&nbsp;Name:</label>	
							${deliveryChallan.customerName }
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-6">
			<div class="panel-default">
				<div class="panel-heading"></div>
				<div class="panel-body">
					<div class="row">
					<div class="col-sm-1"></div>									
						<div class="">			
						<label>Date : </label>
						${deliveryChallan.date }
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col-sm-1"></div>
						<div class="">						
						<label>Challan&nbsp;Type:</label>
							<c:choose>
							<c:when test="${deliveryChallan.chType=='o' }">
								<u>From Invoice</u>
							</c:when>
							<c:otherwise>
								<u>Free Use</u>
							</c:otherwise>
						</c:choose>	
						</div>
						</div>
				</div>
			</div>
		</div>	
		</div>
								<%-- <div class="row">
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-4">
											<label>Challan&nbsp;ID&nbsp;:- </label>
										</div>
										<div class="col-md-3">
										<label>${deliveryChallan.challanID }</label>
										</div>
									</div>
								</div>
								
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-4">
											<label>Invoice&nbsp;ID:- </label>
										</div>
										<div class="col-md-3">
											<label>${deliveryChallan.invoiceID }</label>
										</div>
									</div>
								</div>					
							</div><br>
							<div class="row">
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-4">
											<label >Customer&nbsp;Name&nbsp;:- </label>
										</div>
										<div class="col-md-5">
											<label>${deliveryChallan.customerName }</label>
										</div>
									</div>									
								</div>								
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-4">
											<label>Date&nbsp;:- </label>
										</div>
										<div class="col-md-3">
											<label>${deliveryChallan.date }</label>
										</div>
									</div>
								</div>
							</div> --%><br> 
							
							<div class="row">
							<div class="col-md-6">
								<div class="panel-default">
									<div class="panel-heading"><label>Billing Address</label></div>
									<div class="panel-body">
										<div class="row">											
											<div class="col-md-6">
												${deliveryChallan.billingAdd}
											</div>
										</div>
									</div>
								</div>
							</div>							
						</div>							
						<br>
								<div class="table-responsive">
										<table id="tableID" class="table table-bordered">
										<thead>
											<tr>
												<th align="center">Sr No</th>
												<th align="center">Product Id</th>
												<th align="center">Unit</th>
												<th align="center">Quantity</th>
												
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${deliveryChallan.deliveryChallandetails}" var="deliveryChallandetails">
											<tr>
												<td>${deliveryChallandetails.srNo}</td>
												<td>${deliveryChallandetails.itemCode}</td>
												<td>${deliveryChallandetails.unit}</td>
												<td>${deliveryChallandetails.quantity}</td>							

											</tr>		
											</c:forEach>										
											</tbody>
										</table>
							</div><br>					
									<%-- <div class="col-md-12">
									<input type="button" value="Print" name="btn" onclick="urlSubmit('deliveryChallanPDF.do?challanId=${deliveryChallan.challanID }','_blank')" class="btn btn-primary">		 						
									<input type="button" value="E-Mail" name="btn" onclick="urlSubmit('sendDChlPdfMail.do?custId=${deliveryChallan.custId}&id1=${deliveryChallan.challanID }','1')" class="btn btn-primary">										
									<input type="button" value="Edit" name="btn" class="btn btn-primary" onclick="urlSubmit('editDevilveryChallan.do?challanId=${deliveryChallan.challanID}','1')">
									<button type="button" onclick="goBack()" class="btn btn-primary" name="btn">Cancel</button>
							</div>	 --%>				
						</div>
					</div>
				
					</form:form>
				</div>
	</div>
								

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
</body>
</html>