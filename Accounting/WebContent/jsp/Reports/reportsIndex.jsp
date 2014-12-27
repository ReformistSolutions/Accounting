<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Reports</title>
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
</head>
<body style="overflow-x: hidden;"> 
	<div id="wrapper">
		<%@include file="../header.jsp"%>
		<div class="page-wrapper">
		<%@include file="innerHeader.jsp"%>
			<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="col-md-10">
								<ul class="breadcrumb">
									<li class="active"><small>Reports</small>
								</ul>
							</div>
							
							<div class="col-md-2">
							<button name="back" class="btn btn-primary btn-large" onclick="backs()"><i class="fa fa-reply"></i> Back</button>	
        					 </div>
							
						</div>
					</div>
				</div>
			<br>
			<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="panel panel-default">
				                        <div class="panel-heading">
				                           Financial Reports 
				                        </div>
				                        <div class="panel-body">
				                        	<div class="col-md-6">
				                        		<div><a href="trialBalance.do">Trial Balance</a></div>
											 	<div><a href="profitAndLoss.do">Profit and Loss</a></div>
												<div><a href="balanceSheet.do">Balance Sheet</a></div>
				                        	</div>				                        	
				                        	<div class="col-md-6">
				                        	<div><a href="taxesReports.do">Taxation</a></div>
											<div><a href="#">Tax Summury Reports</a></div>											
				                        	</div>
				                        </div>				                                         
				             </div>
				             <div class="panel panel-default">
				                        <div class="panel-heading">
				                           Other Reports
				                        </div>
				                        <div class="panel-body">
				                        	<div class="col-md-6">
				                        		<div><a href="#">Ledger</a></div>
											 	<div><a href="#">Day Book</a></div>
												<div><a href="#">Cash Book</a></div>
												<div><a href="#">Bank Book</a></div>
												<div><a href="#">Bank Reconciliation</a></div>
				                        	</div>				                        	
				                        	<div class="col-md-6">
				                        	<div><a href="#">Journal Register</a></div>
											<div><a href="#">Credit Note Register</a></div>
											<div><a href="#">Debit Note Register</a></div>											
				                        	</div>
				                        </div>					                                         
				             </div>
				             <div class="panel panel-default">
				                        <div class="panel-heading">
				                           Sales Reports
				                        </div>
				                        <div class="panel-body">	
				                        <div class="col-md-6">			                        	
				                        	<div><a href="salesRegister.do">Sales Register</a></div>
											<div><a href="outstandingReceipts.do">Oustanding Receipts</a></div>
											<div><a href="#">Customer Statement</a></div>											
				                        	<div><a href="#">Invoice Settlement</a></div>
				                        </div>	
				                        </div>				                                         
				             </div>
				              <div class="panel panel-default">
				                        <div class="panel-heading">
				                           Expense Reports
				                        </div>
				                        <div class="panel-body">	
				                        <div class="col-md-6">			                        	
				                        	<div><a href="#">Purchase Register</a></div>
											<div><a href="outstandingPayments.do">Oustanding Payments</a></div>
											<div><a href="#">Sundry Creditors</a></div>
				                        </div>	
				                        </div>				                                         
				             </div>
				              <div class="panel panel-default">
				                        <div class="panel-heading">
				                           Inventory Reports
				                        </div>
				                        <div class="panel-body">
				                        	<div class="col-md-6">
				                        		<div><a href="Productwisestock.do">Product Wise Stock</a></div>
											 	<div><a href="Stocktransfer.do"> Stock Transfer</a></div>
												<div><a href="Stockwastage.do">Stock Wastage Register</a></div>
												<div><a href="Warehosestock.do">Warehouse Wise Stock</a></div>
				                        	</div>				                        	
				                        	<div class="col-md-6">
				                        	<div><a href="inventoyvaluation.do">Inventory Valuation</a></div>
											<div><a href="customerpending.do">Customer Wise Pending Order</a></div>
											<div><a href="productpending.do">Product Wise Pending Order</a></div>
											<div><a href="#">Pending Delivery Challen</a></div>											
				                        	</div>
				                        </div>					                                         
				             </div>
							<div class="panel panel-default">
				                        <div class="panel-heading">
				                            Payroll Reports
				                        </div>
				                        <div class="panel-body">
				                        	<div><a href="paymentAdvice.do">Payment Advice</a></div>
											<div><a href="breakupByemp.do">Breakup by Employee</a></div>
											<br>                       
				                        </div>				                                         
				             </div>
				             <!-- <div class="panel panel-default">
				                        <div class="panel-heading">
				                            Profit or Loss Reports
				                        </div>
				                        <div class="panel-body">
				                        <div class="col-md-6">
				                        	<div><a href="paymentAdvice.do">Profit or Loss</a></div>
											<br>                       
				                        </div>	
				                        </div>			                                         
				             </div> -->
						</div>
					</div>
			</div>
		</div>
	</div>
</body>
</html>