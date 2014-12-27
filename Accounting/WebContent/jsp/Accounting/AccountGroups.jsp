<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Account Groups</title>
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
<%-- <script src="<c:url value="/resources/assets/plugins/bootstrap/js/bootstrap.min.js" />" type="text/javascript"></script>
 --%><script src="<c:url value="/resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js" />" type="text/javascript"></script>
<script src="<c:url value="/resources/assets/plugins/dataTables/jquery.dataTables.js" />" type="text/javascript"></script>
<script src="<c:url value="/resources/assets/plugins/dataTables/dataTables.bootstrap.js" />" type="text/javascript"></script>
     <script>
         $(document).ready(function () {
             $('#dataTables-example').dataTable(); 
         });
    </script>
    
    <script>
function back(){
	window.history.back();
	
}
</script>
    
</head>	
<body style="overflow-x: hidden;">
<div id="wrapper">
	<%@include file="../header.jsp"%>
	<!-- <div class="container"> -->
		<%@include file="innerHeader.jsp"%>
<br>					
<div class="col-md-12">
					<div class="panel">
						<div class="panel-body">
							<div class="col-md-7">
								<ul class="breadcrumb">
									<li class="active"><small><i class="fa fa-2x fa-table"></i></small>&nbsp;Account Group</li>
								</ul>
							</div>
							<div class="col-md-5">
							<a href="newGroupfAccount.do"><input type="button" name="btnAdd" value="+ New Account Group" class="btn btn-primary"/></a>							
							<a href="newAccount.do"><input type="button" name="btnAdd" value="Account" style="background-color: #99b433;" class="btn btn-primary"/></a>
							<a href="accounting.do" class="btn btn-primary btn-large"> Back</a>
							</div>
						</div>
					</div>
</div>
<br>
				
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
<form:form action="AccountGroups.do" cssClass="form-inline" modelAttribute="newGroupAcc">
<div class="col-md-12">
    <div class="panel panel-default">
		<br>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>Group Name</th>
                                            <th>Parent Group</th>                                           
                                            <th>Created By</th>
                                            <th>Actions</th>                                            
                                        </tr>
                                    </thead>
                                    <tbody>  <c:forEach items="${listOfGroup}" var="listOfGroup">
                                        <tr class="odd gradeX"> 
                                            <td><input type="hidden" name="hideGrpID" value="${listOfGroup.txtAccGrpNo}" />${listOfGroup.txtName}</td>
                                            <td> Primary Group</td>                                           
                                            <td>User</td>
                                            
                                            <td>
                                            <div class="btn-group">
											  <button data-toggle="dropdown" class="btn dropdown-toggle">Action <span class="caret"></span></button>
											  
											  <ul class="dropdown-menu">
											 
												<li><a href="viewAccGroup.do?groupID=${listOfGroup.txtAccGrpNo}">View</a></li>
												<li><a href="editAccountGroup.do?groupID=${listOfGroup.txtAccGrpNo}">Edit</a></li>
												<li><a href="deleteAccountGroup.do?groupID=${listOfGroup.txtAccGrpNo}">Delete</a></li>
											  </ul>
											 </div>
											</td>
                                        </tr>
                                   </c:forEach>
                                    <c:forEach items="${listOfsGroup}" var="listOfsGroup">
                                        <tr class="odd gradeX"> 
                                            <td><input type="hidden" name="hideGrpID" value="${listOfsGroup.txtsAccGrpNo}" />${listOfsGroup.txtName}</td>
                                            <td> ${listOfsGroup.txtParentacntgrp}</td>                                           
                                            <td>User</td>
                                            
                                            <td>
                                            <div class="btn-group">
											  <button data-toggle="dropdown" class="btn dropdown-toggle">Action <span class="caret"></span></button>
											  
											  <ul class="dropdown-menu">
											 
												<li><a href="viewSubAccGroup.do?groupID=${listOfsGroup.txtsAccGrpNo}">View</a></li>
												<li><a href="editsAccountGroup.do?groupID=${listOfsGroup.txtsAccGrpNo}">Edit</a></li>
												<li><a href="deletesAccountGroup.do?groupID=${listOfsGroup.txtsAccGrpNo}">Delete</a></li>
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