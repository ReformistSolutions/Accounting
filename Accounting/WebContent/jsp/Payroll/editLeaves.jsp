<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Leaves</title>
<link rel="icon" href="<c:url value="/resources/images/favicon.ico" />" type="image/icon">
<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/css/sb-admin.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/css/font-awesome.min.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/assets/plugins/Font-Awesome/css/font-awesome.css"/>" rel="stylesheet" type="text/css">
<script src="<c:url value="/resources/assets/plugins/jquery-2.0.3.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/assets/plugins/bootstrap/js/bootstrap.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js"/>" type="text/javascript"></script>
<link rel="stylesheet" href="<c:url value="http://cdn.oemdith.co.uk/morris-0.4.3.min.css"/>">
<script src="<c:url value="/resources/assets/plugins/jquery-2.0.3.min.js"/>"></script>
<script src="<c:url value="/resources/assets/plugins/bootstrap/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js"/>"></script>
<script type="text/javascript">
function backs()
{
	
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
							<li class="active"><small><i class="fa fa-2x fa-table"></i></small>&nbsp;Update<small>&nbsp;Leaves</small>
		             	</ul>
		             	</div>
			             	<div class="col-md-2"> 
			             	<button name="back" class="btn btn-primary btn-large" onclick="backs()" data-toggle="tooltip" data-placement="left" title="Back"><i class="fa fa-reply"></i> Back</button>			   
			             	</div>
		             	</div>
		             	</div>
		</div>
		<br>

<form:form cssClass="form-horizontal" action="updateLeaves.do" modelAttribute="leaves">
<div class=col-md-12>
									<c:if test="${message==1}">                     
								<h4 class="msg-succ">
								added
								</h4> 
							</c:if>
							<c:if test="${message==0}">                     
								<h4 class="msg-error">
								not added
								</h4> 
							</c:if>
							</div>
<div class="col-md-12">
	<div class="panel panel-default">
		<div class="panel-body">  

  <div class="form-group">
    <label class="col-md-3 control-label">Leave Id :</label>
    <div class="col-md-3">
      <form:input path="leaveId"  cssClass="form-control" readonly="true"/> 
      <!-- <input type="text" name="txtPayId" class="form-control"> -->
    </div>
  </div>
  <div class="form-group">
    <label class="col-md-3 control-label">Employee Name :</label>
    <div class="col-md-3">
      <form:input path="txtEmpId" cssClass="form-control" readonly="true"/>
    </div>
  </div>
  <div class="form-group">
    <label class="col-md-3 control-label">Leaves Name :</label>
    <div class="col-md-3">
      <form:input path="leaveName" cssClass="form-control" />
    </div>
  </div>
  <div class="form-group">
    <label class="col-md-3 control-label">Total Leaves :</label>
    <div class="col-md-3">
      <form:input path="noLeaves" cssClass="form-control" />
    </div>
  </div>
    <div class="form-group">
    <div class="col-md-offset-2 col-md-10">
      <button type="submit" class="btn btn-default" data-toggle="tooltip" data-placement="top" title="Update">Update</button>
      <button type="submit" class="btn btn-default" data-toggle="tooltip" data-placement="top" title="Cancel">Cancel</button>
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