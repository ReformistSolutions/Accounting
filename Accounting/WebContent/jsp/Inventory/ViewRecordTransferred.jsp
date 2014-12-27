<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Record Transferred</title>
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
<script src="<c:url value="/resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js" />" type="text/javascript"></script>
<script src="<c:url value="/resources/assets/plugins/dataTables/jquery.dataTables.js" />" type="text/javascript"></script>
<script src="<c:url value="/resources/assets/plugins/dataTables/dataTables.bootstrap.js" />" type="text/javascript"></script>
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
		<%@ include file="../header.jsp"%>
		<div class="page-wrapper">
			<%@include file="innerHeader.jsp"%>
			<br>
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="col-md-10">
							<ul class="breadcrumb">
								<li class="active"><small><i
										class="fa fa-2x fa-table"></i></small>&nbsp;View&nbsp;Record&nbsp;Transferred<small></small>
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
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-body">
						<form:form action="recordTransferredView.do" method="post"
							cssClass="form-inline" commandName="recordTransferredView"
							name="frmrecordTransferred">
							<div>
								<div class="panel-body">
									<div>
										<div class="row">
											<div class="col-md-6">
												<div class="row">
													<div class="col-md-4">
														<label>Voucher&nbsp;No:-</label>
													</div>
													<div class="col-md-4">
														<u>${recordTransferredView.txtVNo}</u>
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="row">
													<div class="col-md-5">
														<label>Voucher Date:-</label>
													</div>
													<div class="col-md-7">
														<u>${recordTransferredView.date}</u>
													</div>
												</div>
											</div>
										</div>
										<br>
										<div class="row">
											<div class="col-md-6">
												<div class="row">
													<div class="col-md-4">
														<label>Warehouse:-</label>
													</div>
													<div class="col-md-5">
														${recordTransferredView.selectWarehouse}</div>
												</div>
											</div>
										</div>
										<br>

										<div class="table-responsive" style="width: 50%;">
											<table id="tableID" class="table table-bordered">
												<tr>
													<th align="center">Sr No</th>
													<th align="center">Product</th>
													<th align="center">Destination Warehouse</th>
													<th align="center">Quantity</th>
												</tr>
												<c:forEach
													items="${recordTransferredView.recordTransferredDetailsList}"
													var="recordTransferredDetailsList">
													<tr>
														<td>${recordTransferredDetailsList.txtSrNo1}</td>

														<td>${recordTransferredDetailsList.txtItem1}</td>

														<td>${recordTransferredDetailsList.destWarehouse1}</td>

														<td>${recordTransferredDetailsList.txtQuant1}</td>

													</tr>
												</c:forEach>
											</table>
										</div><br>
										<div class="col-md-6">
												<div class="row">
													<div class="col-md-5">
														<label>Details:-</label>
													</div>
													<div class="col-md-7">
														<u>${recordTransferredView.txtDetails}</u>
													</div>
												</div>
											</div>
									</div>
								</div>
							</div>
							<br>
							<input type="button" value="Print" name="btn"
								class="btn btn-primary"
								onclick="urlSubmit('recordTransferredPDF.do?txtVNo=${recordTransferredView.txtVNo}','_blank')">
							<!-- <button type="reset" class="btn btn-primary" name="btn">Email</button> -->
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>