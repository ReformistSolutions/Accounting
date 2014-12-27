<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>	
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Accounts Chart</title>
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
<%-- <script src="<c:url value="resources/assets/plugins/bootstrap/js/bootstrap.min.js" />" type="text/javascript"></script> --%>
<script src="<c:url value="resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/dataTables/jquery.dataTables.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/dataTables/dataTables.bootstrap.js" />" type="text/javascript"></script>
     <script>
         $(document).ready(function () {
             $('#dataTables-example').dataTable(); 
         });
    </script>
    <script>
	function back() {
		window.history.back();

	}
</script>
</head>	
<body style="overflow-x: hidden;">
<div id="wrapper">
	<%@include file="../header.jsp"%>
	<!-- <div class="container"> -->
		<%@include file="innerHeader.jsp"%>
		
			<%-- <form:hidden path="hide1"/> --%>
			<br>
				<div class="col-md-12">
					<div class="panel">
						<div class="panel-body">  
							<div class="col-md-6">
								<ul class="breadcrumb">
									<li class="active"><small><i class="fa fa-2x fa-table"></i></small>&nbsp;List Of Account</li>
								</ul>
							</div>
							<div class="col-md-6">
								<a href="newAccount.do">
									<input type="button" name="btnAdd" value="Create Account" class="btn btn-primary" />
								</a> 
								<a href="frmAccountGroups.do">
									<input type="button" name="btnAdd" value="Account Groups" style="background-color: #99b433;" class="btn btn-primary" />
								</a>
								<button name="btnBack" class="btn btn-primary btn-large" onclick="back()"><i class="fa fa-reply"></i>Back</button>
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
<form:form action="ChartOfAccounts.do" cssClass="form-inline" modelAttribute="accoLists">
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="table-responsive">
								<table class="table table-striped table-bordered table-hover" id="dataTables-example">
									<thead>
										<tr>
											<br>
											<th>Account No</th>
											<th>Account Name</th>
											<th>Account Group</th>
											<th>Account Type</th>
											<th>Balance</th>
											<th>Owner</th>
											<th>Actions</th>
										</tr>
									</thead>
									
									
									  <tbody>
                                     <c:forEach items="${accountList}" var="accountList">

                                        <tr class="odd gradeX">
                                           <td>${accountList.txtNewAccNo}</td>
                                            <td>${accountList.txtAccountName}</td>                                           
                                            <td>${accountList.groupID}</td>
                                            <td>${accountList.accnttype}</td>
                                            <td>${accountList.txtOpeningBalance}</td>
                                           
                                            <th>Owner</th>                                           
                                            <td>
                                            <div class="btn-group">
											  <button data-toggle="dropdown" class="btn dropdown-toggle">Action <span class="caret"></span></button>
											  <ul class="dropdown-menu">
											  <li><a href="viewAccountList.do?accountID=${accountList.txtNewAccNo}">View</a></li>
											  <li><a href="editAccountList.do?accountID=${accountList.txtNewAccNo}">Edit</a></li>
												<li><a href="deletepAccount.do?accountID=${accountList.txtNewAccNo}">Delete</a></li>
											  </ul>
											</div>  
											</td>
                                        </tr>
                                       </c:forEach>
                                       <c:forEach items="${accountsList}" var="accountsList">

                                        <tr class="odd gradeX">
                                           <td>${accountsList.txtNewAccNo}</td>
                                            <td>${accountsList.txtAccountName}</td>                                           
                                            <td>${accountsList.groupID}</td>
                                            <td>${accountsList.accnttype}</td>
                                            <td>${accountsList.txtOpeningBalance}</td>
                                            <th>Owner</th>                                           
                                            <td>
                                            <div class="btn-group">
											  <button data-toggle="dropdown" class="btn dropdown-toggle">Action <span class="caret"></span></button>
											  <ul class="dropdown-menu">
											  <li><a href="viewsAccountList.do?accountID=${accountsList.txtNewAccNo}">View</a></li>
											  <li><a href="editsAccountList.do?accountID=${accountsList.txtNewAccNo}">Edit</a></li>
												<li><a href="deletesAccount.do?accountID=${accountsList.txtNewAccNo}">Delete</a></li>
											  </ul>
											</div>  
											</td>
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
<!-- </div> -->	
</body>
</html>