<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>	
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Company Details</title>
	<link href="<c:url value="resources/css/bootstrap.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/css/sb-admin.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/css/table.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/css/table.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/css/font-awesome.min.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="resources/assets/css/main.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="resources/assets/css/theme.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="resources/assets/css/MoneAdmin.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="resources/assets/plugins/Font-Awesome/css/font-awesome.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="resources/assets/plugins/Font-Awesome/css/font-awesome.css" />" rel="stylesheet" type="text/css">

<script src="<c:url value="resources/assets/plugins/jquery-2.0.3.min.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/bootstrap/js/bootstrap.min.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/dataTables/jquery.dataTables.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/dataTables/dataTables.bootstrap.js" />" type="text/javascript"></script>
<script type="text/javascript">
            // When the document is ready
            $(document).ready(function () {
            	
                $('#date').datepicker({
                    format: "yyyy/mm/dd"
                });

                $('#ddate').datepicker({
                    format: "yyyy/mm/dd"
                });
                
            });
    </script>
 
  
  
</head>
<script>
function goBack() {	
    window.history.back();
   
}
</script>

<body>
<div id="container">
<%-- <%@ include file="/header.jsp" %> --%>
	<!-- <div id="page-wrapper"> -->
	<%-- <%@include file="innerHeader.jsp"%><br> --%>
						<!-- <div class="col-md-12">
						<div class="panel">
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
		             </div> -->
			<form:form action="addCompany.do" cssClass="form-inline" id="formMain"  modelAttribute="companyDetails" onsubmit="reloadpage()" >
		            <div class="col-md-12">
						<div class="panel">
							<div class="panel-body">
								<div class="row">
								<div class="col-md-10">
									<div class="row">
										<div class="col-md-2">
											<label>Company&nbsp;Name&nbsp;: </label>
										</div>
										<div class="col-md-4">
											<form:input path="compName" cssClass="form-control" ></form:input>
										</div>
										<%-- <div class="col-md-2">
											<label>Date&nbsp;:- </label>
										</div>
										<div class="col-md-4">
											<form:input path="txtdate" id="date" cssClass="form-control" ></form:input>
										</div> --%>
									</div>
								</div>
											
							</div><br>
							<div class="row">
								<div class="col-md-10">
									<div class="row">
										<div class="col-md-2">
											<label>&nbsp;Address: </label>
										</div>
										<div class="col-md-4">										
											<form:textarea path="compAddress" rows="3" cols="25" cssClass="form-control"></form:textarea>
										</div>									
										<div class="col-md-2">
											<label>&nbsp;Nature&nbsp;of&nbsp;Business: </label>
										</div>	
										<div class="col-md-4">
											<form:textarea path="compDesc" rows="3" cols="25" cssClass="form-control"></form:textarea>
										</div>
									</div>
								</div>								
							</div><br>
							<div class="row">
								<div class="col-md-10">
									<div class="row">
										<div class="col-md-2">
											<label>&nbsp;Tax Declaration: </label>
										</div>
										<div class="col-md-8">										
											<form:textarea path="compTerms" rows="3" cols="40" cssClass="form-control"></form:textarea>
										</div>
									</div>
								</div>								
														
							</div><br>
							<div class="row">
								<div class="col-md-10">
									<div class="row">
										<div class="col-md-2">
											<label>Contact&nbsp;No&nbsp;: </label>
										</div>
										<div class="col-md-4">																				
											<form:input path="contactNo" cssClass="form-control"></form:input>
										</div>
										<div class="col-md-2">
											<label>E-Mail&nbsp;: </label>
										</div>
										<div class="col-md-4">																				
											<form:input path="email" cssClass="form-control"></form:input>
										</div>
									</div>
								</div>
								
							</div><br>
							<div class="row">
								<div class="col-md-10">
									<div class="row">
										<div class="col-md-2">
											<label>VAT TIN&nbsp;No&nbsp;: </label>
										</div>
										<div class="col-md-4">																				
											<form:input path="vatNo" cssClass="form-control"></form:input>
										</div>
										<div class="col-md-2">
											<label>CST TIN&nbsp;No: </label>
										</div>
										<div class="col-md-4">																				
											<form:input path="cstNo" cssClass="form-control"></form:input>
										</div>
									</div>
								</div>
								
							</div><br>
							
						<div class="row">								
								
								<div class="col-md-10">
									<div class="row">
									<div class="col-md-2">
											<label>Website:- </label>
										</div>
										<div class="col-md-4">
											<form:input path="website" cssClass="form-control"></form:input>
										</div>
										<div class="col-md-2">
											<label>&nbsp;Logo:- </label>
										</div>
										<div class="col-md-4">
											<input type="file" name="compLogo" class="form-control">
										</div>
									</div>
								</div>
							</div><br>
							<div class="row">								
								
								<div class="col-md-10">
									<div class="row">
									<div class="col-md-2">
											<label>User Name:- </label>
										</div>
										<div class="col-md-4">
											<form:input path="Ausername" cssClass="form-control"></form:input>
										</div>
										<div class="col-md-2">
											<label>&nbsp;Password:- </label>
										</div>
										<div class="col-md-4"> 
											<input type="password" name="Apassword" class="form-control">
										</div>
									</div>
								</div>
							</div><br>
							<div class="row">
								<div class="col-md-3">
								<input type="submit" class="btn btn-primary" name="btn" value="Save" >
								<input type="reset" class="btn btn-primary" name="btn" value="Cancel">
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
	alert("Company Details Added Successfully");
</script>
</h4> 
</c:if>
<c:if test="${message==0}">                     
<h4 class="msg-error">
<script>
	alert("Company Details Not Added Successfully");
</script>
</h4> 
</c:if>
	<!-- </div> -->
</div>	
<script src="<c:url value="/resources/datepicker/js/bootstrap-datepicker.js"/>"></script>	

</body>
</html>