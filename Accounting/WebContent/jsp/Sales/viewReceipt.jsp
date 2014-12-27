<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>	
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Sales Payment Receipt</title>
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
	<!-- <div id="container"> -->
		<%@ include file="innerHeader.jsp" %>
					
					<!-- <div class="container">		 -->		<br>			
						<div class="col-md-12">
						<div class="panel panel-default">
						<div class="panel-body">
						<div class="col-md-10">
						<ul class="breadcrumb">
							<li class="active"><small><i class="fa fa-2x fa-table"></i></small>&nbsp;Sales<small>&nbsp;Receipts</small>
		             	</ul>
		             	</div>
			             	<div class="col-md-2">
			             		<a href="receipts.do" class="btn btn-primary btn-large" data-toggle="tooltip" data-placement="left" title="Back"> Back</a>
			             	</div>
		             	</div>
		             	</div>
		             </div><br>
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
			      <div class="col-md-9"></div>
					<a onclick="urlSubmit('editReceipt.do?receiptId=${salesReceipts.receiptsNo}','1')" title="Edit" data-toggle="tooltip" data-placement="top" title="Edit"><img id="edit" src="<c:url value="/resources/images/edit.png" />" width="25px" height="25px"></a>
					<a onclick="urlSubmit('salesReceiptPDF.do?receiptId=${salesReceipts.receiptsNo}','_blank')" title="Print" data-toggle="tooltip" data-placement="top" title="Print"><img id="print" alt="" src="<c:url value="/resources/images/print.png" />" width="30px" height="30px"></a>
					<a onclick="urlSubmit('sendRcptPdfMail.do?custId=${salesReceipts.custId}&id1=${salesReceipts.receiptsNo}','1')" title="E-Mail" data-toggle="tooltip" data-placement="top" title="E-Mail"><img id="mail" alt="" src="<c:url value="/resources/images/email.png" />" width="35px" height="35px"></a>
					
				</div>
		<br>
	 <div class="col-md-12">
		<form:form action="addReceipt.do" cssClass="form-inline" modelAttribute="salesReceipts">
						<div class="panel panel-default">
							<div class="panel-body">
								<div class="row">
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-4">
											<label >Receipt&nbsp;No&nbsp;: </label>
										</div>
										<div class="col-md-4">
										<u>${salesReceipts.receiptsNo}</u>
											
										</div>
									</div>
								</div>								
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-4">
											<label>Date&nbsp;: </label>
										</div>
										<div class="col-md-4">
											<u>${salesReceipts.date}</u>
										</div>
									</div>
								</div>					
							</div><br>
							<div class="row">
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-4">
											<label>Invoice&nbsp;Id: </label>
										</div>
										<div class="col-md-4">
										<u>${salesReceipts.invoiceId}</u>
											
										</div>
									</div>
								</div>
							<div class="col-md-6">
									<div class="row">
										<div class="col-md-4">
											<label>Payment&nbsp;Mode&nbsp;: </label>
										</div>
										<div class="col-md-4">											
										${salesReceipts.payMode}												
										</div>
									</div>
								</div>
							</div><br>
							<div class="row">
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-4">
											<label>From&nbsp;Account&nbsp;No&nbsp;:</label>
										</div>
										<div class="col-md-6">
										${salesReceipts.fromaccount}											
										</div>
									</div>
								</div>								
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-4">
											<label>To&nbsp;Account&nbsp;No&nbsp;: </label>
										</div>
										<div class="col-md-4">
											${salesReceipts.toaccount}
											
										</div>
									</div>
								</div>
							</div><br>
							<div class="row">
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-4">
											<label>Total&nbsp;Amount&nbsp;: </label>
										</div>
										<div class="col-md-4">											
										<u>${salesReceipts.balAmt}</u>											
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-4">
											<label>Amount&nbsp;Paid: </label>
										</div>
										<div class="col-md-4">
										<u>${salesReceipts.amount}</u>										
										</div>
									</div>
								</div>
							</div><br>
							<div class="row">
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-4">
											<label>Amount&nbsp;Due&nbsp;: </label>
										</div>
										<div class="col-md-4">											
										<u>${salesReceipts.amountDue}</u>											
										</div>
									</div>
								</div>
								
							</div><br>
							
							<div class="row">
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-4">
											<label>TDS&nbsp;: </label>
										</div>
										<div class="col-md-4">
										<u>${salesReceipts.tds}</u>											
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-4">
											<label>Description&nbsp;: </label>
										</div>
										<div class="col-md-4">
										${salesReceipts.description}	
											
										</div>
									</div>
								</div>
							</div><br>
							<%-- <div class="row">
								<div class="col-md-5">
								<button type="button" class="btn btn-primary" onclick="urlSubmit('salesReceiptPDF.do?receiptId=${salesReceipts.receiptsNo}','_blank')" name="btn" value="Save">Print</button>
								<button type="button" class="btn btn-primary" onclick="urlSubmit('sendRcptPdfMail.do?custId=${salesReceipts.custId}&id1=${salesReceipts.receiptsNo}','1')" name="btn">E-Mail</button>
								<input type="button" name="btn" class="btn btn-primary" value="Edit" onclick="urlSubmit('editReceipt.do?receiptId=${salesReceipts.receiptsNo}','1')">
								<button type="button" onclick="goBack()" class="btn btn-primary" name="btn">Cancel</button>
								</div>
							</div> --%>
							</div>
						</div>
					
					</form:form>
					</div>
					<br>	
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