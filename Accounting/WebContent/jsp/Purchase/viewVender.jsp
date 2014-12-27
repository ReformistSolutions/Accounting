<%@page language="java" import="java.sql.*"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Vendor</title>
<link rel="icon" href="<c:url value="/resources/images/favicon.ico" />"
	type="image/icon">
<link href="<c:url value="/resources/css/bootstrap.css" />"
	rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/css/sb-admin.css" />"
	rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/css/table.css" />" rel="stylesheet"
	type="text/css" />
<link href="<c:url value="/resources/css/table.css" />" rel="stylesheet"
	type="text/css" />
<link href="<c:url value="/resources/css/font-awesome.min.css" />"
	rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/assets/css/main.css" />"
	rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/assets/css/theme.css" />"
	rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/assets/css/MoneAdmin.css" />"
	rel="stylesheet" type="text/css">
<link
	href="<c:url value="/resources/assets/plugins/Font-Awesome/css/font-awesome.css" />"
	rel="stylesheet" type="text/css">
<link
	href="<c:url value="/resources/assets/plugins/Font-Awesome/css/font-awesome.css" />"
	rel="stylesheet" type="text/css">

<script
	src="<c:url value="/resources/assets/plugins/jquery-2.0.3.min.js" />"
	type="text/javascript"></script>
<script
	src="<c:url value="/resources/assets/plugins/bootstrap/js/bootstrap.min.js" />"
	type="text/javascript"></script>
<script
	src="<c:url value="/resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js" />"
	type="text/javascript"></script>
<script
	src="<c:url value="/resources/assets/plugins/dataTables/jquery.dataTables.js" />"
	type="text/javascript"></script>
<script
	src="<c:url value="/resources/assets/plugins/dataTables/dataTables.bootstrap.js" />"
	type="text/javascript"></script>

<script>
$(function() {
$( "#tabs" ).tabs();
});
</script>

<script>
         $(document).ready(function () {
             $('#dataTables-example1').dataTable();                                  
         });
    </script>

<script type="text/javascript">
function backPage()
{
	window.history.back();
}
function cancel()
{
	window.history.back();
}
</script>
</head>

<body style="overflow-x: hidden;">
	<div id="wrapper">
		<%@ include file="../header.jsp"%>
		<!-- <div id="container"> -->
			<%@ include file="innerHeader.jsp"%>

			<br>
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="col-md-10">
							<ul class="breadcrumb">
								<li class="active"><small><i
										class="fa fa-2x fa-table"></i></small>&nbsp;View<small>&nbsp;Vendor</small>
							</ul>
						</div>
						<div class="col-md-2">
							<a href="purchase.do" class="btn btn-primary btn-large" data-toggle="tooltip" data-placement="left" title="Back"> Back</a>
						</div>
					</div>
				</div>
			</div>
			<form:form method="post" action="" modelAttribute="viewvender" name="frmAddNewCustomer" onsubmit="return validateForm()">
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-body">
						<ul class="nav nav-tabs">
								<li class="active"><a href="#tab1" data-toggle="tab"> Basic Details</a></li>
								<li><a href="#tab2" data-toggle="tab"> Contact Details</a></li>
								<li><a href="#tab3" data-toggle="tab"> Bank Details</a></li>
								<li><a href="#tab4" data-toggle="tab"> Contact Person Details</a></li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane fade in active" id="tab1">
									<div class="panel panel-default">
				                        <div class="panel-heading"> Basic Details </div>
				                        <div class="panel-body">
											<div class="col-md-12">
												<div class="row">
													<div class="col-md-3">
														<label>Vendor ID:</label> ${viewvender.txtCustID}
													</div>
													<div class="col-md-6">
														<label>Vendor Name:</label> ${viewvender.txtCustName}
													</div>
												</div>
												<br>
												<div class="row">
													<div class="col-md-3">
														<label>Region:</label> ${viewvender.slctRegion}
													</div>
													<div class="col-md-3">
														<label>Date:</label> ${viewvender.txtDate}
													</div>
												</div>
											</div>
											<br>
											<div class="col-md-12">
												<br>
												<div class="panel panel-default">
												<div class="panel-heading">Billing Address</div>
												<div class="panel-body">
												<div class="row">
													<div class="col-md-5">
														<label>Address&nbsp;:</label> ${viewvender.txtBillingAdd}
													</div>
													<div class="col-md-3">
														<label>City&nbsp;:</label> ${viewvender.txtBillingCity}
													</div>
													<div class="col-md-3">
														<label>State:</label> ${viewvender.txtBillingState}
													</div>
												</div>
												<br>
												<div class="row">
													<div class="col-md-5">
														<label>Country:</label> ${viewvender.txtBillingCountry}
													</div>
													<div class="col-md-3">
														<label>Pin Code:</label> ${viewvender.txtBillingPinCode}
													</div>
												</div>
												</div>
												</div>
												<div class="panel panel-default">
												<div class="panel-heading">Shipping Address</div>
												<div class="panel-body">
												<div class="row">
													<div class="col-md-5">
														<label>Address&nbsp;:</label>
														${viewvender.txtShippingAdd}
													</div>
													<div class="col-md-3">
														<label>City&nbsp;:</label> ${viewvender.txtShippingCity}
													</div>
													<div class="col-md-3">
														<label>State:</label> ${viewvender.txtShippingState}
													</div>
												</div>
												<br>
												<div class="row">
													<div class="col-md-5">
														<label>Country:</label> ${viewvender.txtShippingCountry}
													</div>
													<div class="col-md-3">
														<label>Pin Code:</label> ${viewvender.txtShippingPinCode}
													</div>
												</div>
												</div>
												</div>
											</div>
										</div>
				                    </div>
				            </div>
				            <div class="tab-pane fade" id="tab2">
									<div class="panel panel-default">
				                        <div class="panel-heading"> Contact Details </div>
				                        <div class="panel-body">
											<div class="col-md-12">
												<div class="row">
													<div class="col-md-4">
														<label>E-Mail:</label> ${viewvender.txtMail1}
													</div>
													<div class="col-md-4">
														<label>Mobile No:</label> ${viewvender.txtMob}
													</div>
													<div class="col-md-4">
														<label>Telephone:</label> ${viewvender.txtTel}
													</div><br><br>
													<div class="col-md-4">
														<label>Fax:</label> ${viewvender.txtFax}
													</div>
													<div class="col-md-4">
														<label>Website</label> ${viewvender.txtWeb}
													</div>
												</div>
											</div>
										</div>
				                    </div>
				            </div>
				            <div class="tab-pane fade" id="tab3">
									<div class="panel panel-default">
				                        <div class="panel-heading"> Bank Details </div>
				                        <div class="panel-body">
											<div class="col-md-12">
												<div class="row">
													<div class="col-md-4">
														<label>Account No:</label> ${viewvender.txtAcNo}
													</div>
													<div class="col-md-4">
														<label>Bank Name:</label> ${viewvender.txtBankNm}
													</div>
													<div class="col-md-4">
														<label>IFSC Code:</label> ${viewvender.txtIfscCode}
													</div>													
												</div><br>
												<div class="row">
													<div class="col-md-4">
														<label>PAN No:</label> ${viewvender.txtPanNo}
													</div>
													<div class="col-md-4">
														<label>CST No:</label> ${viewvender.txtCstNo}
													</div>
													<div class="col-md-4">
														<label>VAT No:</label> ${viewvender.txtVatNo}
													</div>
												</div><br>
												<div class="row">
													<div class="col-md-4">
														<label>LBT No:</label> ${viewvender.txtLbtNo}
													</div>
													<div class="col-md-4">
														<label>Excise No:</label> ${viewvender.txtExcNo}
													</div>
													<div class="col-md-4">
														<label>Service Tax No:</label>
														${viewvender.txtServiceTaxNo}
													</div>
												</div>
											</div>
										</div>
				                    </div>
				            </div>
				            <div class="tab-pane fade" id="tab4">
									<div class="panel panel-default">
				                        <div class="panel-heading"> Contact Person Details </div>
				                        <div class="panel-body">
											<div class="col-md-12">
												<div class="row">
													<div class="table-responsive">
														<div style="width: overflow:auto;">
															<table id="table1" class="table table-striped">
																<tr>
																	<td align="center">Sr No</td>
																	<td align="center">Name</td>
																	<td align="center">Contact No</td>
																	<td align="center">E-Mail</td>
																	<td align="center">Designation</td>
																</tr>
																<c:forEach items="${viewvender.venderDetails}" var="venderDetails">
																	<tr>
																		<td align="center">${venderDetails.txtSrNo}</td>
																		<td align="center">${venderDetails.txtName}</td>
																		<td align="center">${venderDetails.txtCon}</td>
																		<td align="center">${venderDetails.txtMail}</td>
																		<td align="center">${venderDetails.txtDes}</td>
																	</tr>
																</c:forEach>
															</table>
														</div>
													</div>
												</div>
											</div>
										</div>
				                    </div>
				            </div>
				         </div>
						</div>
					</div>
				</div>
			</form:form>
		</div>
	<!-- </div> -->
</body>
</html>