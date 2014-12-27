<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Payhead</title>
<link rel="icon" href="<c:url value="/resources/images/favicon.ico" />"
	type="image/icon">
<link href="<c:url value="/resources/css/bootstrap.css" />"
	rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/css/sb-admin.css" />"
	rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/css/font-awesome.min.css" />"
	rel="stylesheet" type="text/css">
<link
	href="<c:url value="/resources/assets/plugins/Font-Awesome/css/font-awesome.css"/>"
	rel="stylesheet" type="text/css">
<script
	src="<c:url value="/resources/assets/plugins/jquery-2.0.3.min.js"/>"
	type="text/javascript"></script>
<script
	src="<c:url value="/resources/assets/plugins/bootstrap/js/bootstrap.min.js"/>"
	type="text/javascript"></script>
<script
	src="<c:url value="/resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js"/>"
	type="text/javascript"></script>
<link rel="stylesheet"
	href="<c:url value="http://cdn.oemdith.co.uk/morris-0.4.3.min.css"/>">
<script
	src="<c:url value="/resources/assets/plugins/jquery-2.0.3.min.js"/>"></script>
<script
	src="<c:url value="/resources/assets/plugins/bootstrap/js/bootstrap.min.js"/>"></script>
<script
	src="<c:url value="/resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js"/>"></script>
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
				<div class="panel">
					<div class="panel-body">
						<div class="col-md-10">
							<ul class="breadcrumb">
								<li class="active"><small><i
										class="fa fa-2x fa-table"></i></small>&nbsp;New<small>&nbsp;Payhead</small>
							</ul>
						</div>
						<div class="col-md-2">
							<a href="payrollSetting.do" class="btn btn-primary btn-large" data-toggle="tooltip" data-placement="left" title="Back"> Back</a>
							<!-- <button name="back" class="btn btn-primary btn-large"
								onclick="backs()">
								<i class="fa fa-reply" ></i> Back
							</button> -->
						</div>
					</div>
				</div>
			</div>
			<br>

			<form:form cssClass="form-horizontal" action="" modelAttribute="viewpayhead">
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="form-group">
								<label class="col-md-3 control-label">Payhead Applicable to : </label>
								<div class="col-md-3" >
								<c:if test="${viewpayhead.applicable_type == 'S'}">
								 <label>Salary</label>
								 </c:if>
								 <c:if test="${viewpayhead.applicable_type == 'W'}">
								 <label>Wages</label>
								 </c:if>
								 <c:if test="${viewpayhead.applicable_type == 'B'}">
								 <label>Both</label>
								 </c:if>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">Payhead Id : </label>
								<div class="col-md-3">
									<label>${viewpayhead.txtPayId}</label>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">Payhead Name : </label>
								<div class="col-md-3">
									<label>${viewpayhead.txtPayheadName}</label>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">Name appear in Payslip : </label>
								<div class="col-md-3">
									<label>${viewpayhead.txtPayslipName}</label>
								</div>
							</div>
							<div class="form-group">
								<label for="inputPassword3" class="col-md-3 control-label">Payhead Type : </label>
								<div class="col-md-3">
									<label>${viewpayhead.txtPayheadType}</label>
								</div>
							</div>
							<div class="form-group">
								<label for="inputPassword3" class="col-md-3 control-label">Applicable : </label>
								<div class="col-md-3">
									<label>${viewpayhead.getvalue}</label>
								</div>
							</div>
							<div class="form-group">
								<label for="inputPassword3" class="col-md-3 control-label">Affect net salary : </label>
								<div class="col-md-3">
									<label>${viewpayhead.getyesno}</label>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form:form>
		</div>
	</div>
</body>
</html>