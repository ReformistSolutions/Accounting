<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New Product</title>
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
<link
	href="<c:url value="/resources/assets/plugins/Font-Awesome/css/font-awesome.css" />"
	rel="stylesheet" type="text/css">

<link href="<c:url value="/resources/assets/css/main.css" />"
	rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/assets/css/theme.css" />"
	rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/assets/css/MoneAdmin.css" />"
	rel="stylesheet" type="text/css">

<script
	src="<c:url value="/resources/assets/plugins/jquery-2.0.3.min.js" />"
	type="text/javascript"></script>
<%-- <script src="<c:url value="/resources/assets/plugins/bootstrap/js/bootstrap.min.js" />" type="text/javascript"></script> --%>
<script
	src="<c:url value="/resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js" />"
	type="text/javascript"></script>
<script
	src="<c:url value="/resources/assets/plugins/dataTables/jquery.dataTables.js" />"
	type="text/javascript"></script>
<script
	src="<c:url value="/resources/assets/plugins/dataTables/dataTables.bootstrap.js" />"
	type="text/javascript"></script>
<!-- <script type="text/javascript">
function backPage()
{
	window.history.back();
}
</script> -->
<script>
	function urlSubmit(url, target) {
		if (target == "1") {

			window.location.assign(url);
		} else {
			window.open(url, target);
		}
	}
</script>
</head>
<body>

	<div id="wrapper">
		<script src="../js/jquery-1.10.2.js"></script>
		<script src="../js/bootstrap.js"></script>
		<%@include file="../header.jsp"%>
		<div class="page-wrapper">
			<%@include file="innerHeader.jsp"%>
			<br> <input type="hidden" id="hide" name="hide1" value="0">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="col-md-10">
							<ul class="breadcrumb">
								<li class="active"><small><i
										class="fa fa-2x fa-table"></i></small>&nbsp;view&nbsp;Product<small></small>
							</ul>
						</div>
						<div class="col-md-2">
							<!-- 					<button name="back" class="btn btn-primary btn-large" onclick="backPage()"><i class="fa fa-reply"></i> Back</button>	
 -->
							<a href="inventory.do" class="btn btn-primary btn-large"><i
								class="fa fa-reply"></i> Back</a>
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
			<form:form action="addProduct.do" cssClass="form-inline"
				commandName="createNewProView" name="frmCreateNewProduct">
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="row">
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-4">
											<label>Product Code :</label>
										</div>
										<div class="col-md-4">
											<u>${createNewProView.productCode}</u>
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-4">
											<label>Product Name :</label>
										</div>
										<div class="col-md-4">
											${createNewProView.txtName}
										</div>
									</div>
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-4">
											<label>Description : </label>
										</div>
										<div class="col-md-4">
											${createNewProView.txtDes}
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-4">
											<label>Unit&nbsp;of&nbsp;Measure&nbsp;: </label>
										</div>
										<div class="col-md-4">
											${createNewProView.txtUnitOfMeasure}
										</div>
									</div>
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-4">
											<label>Stock :</label>
										</div>
										<div class="col-md-4">
											<u>${createNewProView.txtOpeningStock} </u>
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-4">
											<label>Reorder&nbsp;Level&nbsp;: </label>
										</div>
										<div class="col-md-4">
											<u>${createNewProView.txtReorderlevel}</u>
										</div>
									</div>
								</div>
							</div>
							<br>
								<c:if test="${resale == 'Resale Product'}">
									<div class="row">
										<div class="col-md-6">
											<div class="row">
												<div class="col-md-4">
													<label>Sales Price : </label>
												</div>
												<div class="col-md-4">
													<u>${createNewProView.txtSalesPrice} INR</u>
												</div>
											</div>
										</div>
										<div class="col-md-6"> 

											<div class="row">
												<div class="col-md-4">
													<label>Purchase&nbsp;Price&nbsp;:</label>
												</div>
												<div class="col-md-4">
													<u>${createNewProView.txtPurchasePrice} INR</u>
												</div>
											</div>
										</div>
									</div>
								</c:if>

								<c:if test="${purchase == 'Purchase Item'}">
									<div class="row">
										<div class="col-md-6">
											<div class="row">
												<div class="col-md-4">
													<label>Purchase&nbsp;Price&nbsp;:</label>
												</div>
												<div class="col-md-4">
													<u>${createNewProView.txtPurchasePrice} INR</u>
												</div>
											</div>
										</div>
									</div>
								</c:if>

								<c:if test="${sale == 'Sale Item'}">
									<div class="row">
										<div class="col-md-6">
											<div class="row">
												<div class="col-md-4">
													<label>Sales Price : </label>
												</div>
												<div class="col-md-4">
													<u>${createNewProView.txtSalesPrice} INR</u>
												</div>
											</div>
										</div>
									</div>
													<div class="row">
														<div class="table-responsive">
																<table id="tablemanufacture" class="table table-bordered">
																	<thead>
																		<tr>
																			<th align="center">Sr No</th>
																			<th align="center">Product</th>
																			<th align="center">Unit</th>
																			<th align="center">Description</th>
																			<th align="center">Quantity</th>
																		</tr>
																	</thead>
																	<tbody>
																		<c:forEach items="${detailsList}"
																			var="createNewPdetails">
																			<tr>

																				<td>${createNewPdetails.txtSrNo1}</td>

																				<td>${createNewPdetails.prodName}</td>

																				<td>${createNewPdetails.unit}</td>

																				<td>${createNewPdetails.decription}</td>

																				<td>${createNewPdetails.quantity}</td>
																			</tr>
																		</c:forEach>
																	</tbody>
																</table>
														</div>
											
									</div>
								</c:if>

								<div class="col-md-12">
									<input type="button" value="Print" name="btn"
										class="btn btn-primary"
										onclick="urlSubmit('inventoryPDF.do?productCode=${createNewProView.productCode}','_blank')">
									<!-- <button type="reset" class="btn btn-primary" name="btn">EMAIL</button> -->
								</div>
							</div>
						</div>
					</div>
			</form:form>
		</div>
	</div>
</body>
</html>

