<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Record Expense</title>
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
</script>
</head>
<body style="overflow-x: hidden;">
<div id="wrapper">
 <%@include file="../header.jsp" %>
<div class="page-wrapper">							
<%@include file="innerHeader.jsp"%>	
<br>
<div class="col-md-12">
		<div class="panel panel-default">
			<div class="panel-body">
				<div class="col-md-6">
					<ul class="breadcrumb">
						 <li class="active"><small><i class="fa fa-2x fa-table"></i></small>&nbsp;Create<small>&nbsp;Expense</small>
		         	</ul>
		         </div>
		         <div class="col-md-6">
		         <a href="newexpense.do"><button type="button" class="btn btn-primary " value="+"><i class="fa fa-plus-square"></i> Create New Expense</button></a>
					<a href="accounting.do" class="btn btn-primary btn-large"> Back</a>	
		         </div>
			</div>
		</div>
</div><br>
<c:if test="${delete==1}">
					<div class="col-md-12">
					<div class="alert alert-success" role="alert" id="success">${msg}</div>
					</div>
					<script type="text/javascript">	
					  $('#success').fadeOut(4000, function() 
					{
					  });
					</script>
					</c:if>
					<c:if test="${delete==0}">	
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
 <form:form action="Recordexpense.do" method="" modelAttribute="recordexpense" cssClass="form-inline">		 

	<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-body">
		         <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example1">
                                    <thead>
                                        <tr>
                                            <th>Expense ID</th>
                                            <th>Paid From Account</th>
                                            <th>Expense Date</th>
                                            <th>Total</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${expList}" var="expList">
                                        <tr class="odd gradeX">
                                             <td>${expList.expid}</td>
                                            <td>${expList.paidfrom }</td>
                                            <td>${expList.expdate }</td>
                                            <td>${expList.txttotal }</td>
                                            <td><div class="btn-group">
											  <button data-toggle="dropdown" class="btn dropdown-toggle btn-xs">Action <span class="caret"></span></button>
											  <ul class="dropdown-menu">
												 
												
												<li><a href="expenseView.do?expid=${expList.expid}">View</a></li>
												<li><a href="editexpense.do?expid=${expList.expid}">Edit</a></li> 
												<li><a href="delexpense.do?expid=${expList.expid}">Delete</a></li>
												</ul></div></td>
                                        </tr>
                                       </c:forEach>
                                        </tbody>
                                </table>
                                </div>
                                </div>
                                </div>
                                </div>

</form:form>
</div>
</div>
</body>
</html>