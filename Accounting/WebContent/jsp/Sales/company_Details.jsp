<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>	
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Company Details</title>
<link rel="icon" href="<c:url value="/resources/images/favicon.ico" />" type="image/icon">
<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/css/sb-admin.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/font-awesome/css/font-awesome.min.css" />" rel="stylesheet" type="text/css" />
<script src="<c:url value="/resources/js/jquery-1.10.2.js" />" ></script>
<script src="<c:url value="/resources/js/bootstrap.js" />" ></script>
</head>
<script>
function goBack() {	
    window.history.back();
}
</script>

<body>
<div id="wrapper">
<%@ include file="../header.jsp" %>
	<div id="container">
		<%@ include file="innerHeader.jsp" %>				
						<div class="col-md-12">
						<div class="panel panel-default">
						<div class="panel-body">
						<div class="col-md-10">
						<ul class="breadcrumb">
							<li class="active"><small><i class="fa fa-2x fa-table"></i></small>&nbsp;Company<small>&nbsp;Details</small>
		             	</ul>
		             	</div>
			             	<div class="col-md-2">
			             	<button onclick="goBack()" class="btn btn-primary btn-large"><i class="fa fa-reply"></i> Back</button>
			            
			             	</div>
		             	</div>
		             	</div>
		             </div>
			<form:form action="addCompany.do" cssClass="form-inline" modelAttribute="companyDetails">
		            <div class="col-md-12">
						<div class="panel panel-default">
							<div class="panel-body">
								<div class="row">
								<div class="col-md-3">
									<div class="row">
										<div class="col-md-8">
											<label>Company&nbsp;Name&nbsp;:- </label>
										</div>
										<div class="col-md-4">
											<form:input path="compName" cssClass="form-control" ></form:input>
										</div>
									</div>
								</div>
											
							</div><br>
							<div class="row">
								<div class="col-md-3">
									<div class="row">
										<div class="col-md-8">
											<label>Company&nbsp;Address:- </label>
										</div>
										<div class="col-md-4">										
											<form:textarea path="compAddress" rows="3" cols="25" cssClass="form-control"></form:textarea>
										</div>
									</div>
								</div>
								
							</div><br>
							<div class="row">
								<div class="col-md-3">
									<div class="row">
										<div class="col-md-8">
											<label>Contact&nbsp;No&nbsp;:- </label>
										</div>
										<div class="col-md-4">																				
											<form:input path="contactNo" cssClass="form-control"></form:input>
										</div>
									</div>
								</div>
								
							</div><br>
							<br>
						<div class="row">								
								
								<div class="col-md-3">
									<div class="row">
										<div class="col-md-8">
											<label>Upload&nbsp;Logo:- </label>
										</div>
										<div class="col-md-4">
											<input type="file" name="compLogo" class="form-control">
										</div>
									</div>
								</div>
							</div><br>
							<div class="row">
								<div class="col-md-3">
								<input type="submit" class="btn btn-primary" name="btn" value="Save">
								<button type="button" onclick="goBack()" class="btn btn-primary" name="btn">Cancel</button>
								</div>
							</div>
							</div>
						</div>
					</div>
					<br>	
					</form:form>
					
					<c:if test="${message==1}">                     
<h4 class="msg-succ">
<script>
	alert("Receipt Added Successfully");
</script>
</h4> 
</c:if>
<c:if test="${message==0}">                     
<h4 class="msg-error">
<script>
	alert("Receipt Not Added Successfully");
</script>
</h4> 
</c:if>
	</div>
</div>					
</body>
</html>