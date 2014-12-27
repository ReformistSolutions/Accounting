<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib  uri="http://www.springframework.org/tags/form" prefix="form" %>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Manage Payroll</title>
<link rel="icon" href="<c:url value="/resources/images/favicon.ico" />" type="image/icon">
<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet" type="text/css">
    <link href="<c:url value="/resources/css/sb-admin.css" />" rel="stylesheet" type="text/css">
    <link href="<c:url value="/resources/css/font-awesome.min.css" />" rel="stylesheet" type="text/css">
    <link href="<c:url value="/resources/assets/plugins/Font-Awesome/css/font-awesome.css"/>" rel="stylesheet" type="text/css">
    <script src="<c:url value="/resources/assets/plugins/jquery-2.0.3.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/assets/plugins/bootstrap/js/bootstrap.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js"/>" type="text/javascript"></script>

  
    <link rel="stylesheet" href="<c:url value="http://cdn.oesmith.co.uk/morris-0.4.3.min.css"/>">
     <script src="<c:url value="/resources/assets/plugins/jquery-2.0.3.min.js"/>"></script>
     <script src="<c:url value="/resources/assets/plugins/bootstrap/js/bootstrap.min.js"/>"></script>
    <script src="<c:url value="/resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js"/>"></script> 

     <script>
         $(document).ready(function () {
             $('#dataTables-example1').dataTable();
             $('#dataTables-example2').dataTable();
             $('#dataTables-example3').dataTable();
             $('#dataTables-example4').dataTable();
             $('#dataTables-example5').dataTable();
             
         });
    </script>
<script src="<c:url value="../js/jquery-1.10.2.js"/>"></script>
<script src="<c:url value="../js/bootstrap.js"/>"></script>
</head>	
<%@ include file="../header.jsp" %>
<body style="overflow-x: hidden;">
<div class="container">
<form:form method="POST" commandName="Employees.jsp">
	<div class="page-header">
  			<h2><small><i class="fa fa-2x fa-user"></i></small>&nbsp;Employees</h2>
	</div>
	<div class="panel panel-default">                       
          <div class="panel-body">
          	<ul class="nav nav-tabs">
		         <li class="active"><a href="#tab1" data-toggle="tab"><i class="fa fa-users"></i>  Active Users</a></li>
		         <li><a href="#tab2" data-toggle="tab"><i class="fa fa-users"></i>  Inactive Users</a></li>
		    </ul>
		    <div class="tab-content">                 
              <div class="tab-pane fade in active" id="tab1">
              		<div class="row first-column">
              			<div  class="col-md-4">
          							<div class="panel panel-default" >
          								<div class="panel-body">
          									<div class="row">
          									<!-- <div class="col-md-12">
          										<div class="row">
          										<div class="col-md-4">
          											<img src="../Images/user.png" width="70px" height="70px">
          										</div>
          										<div class="col-md-8">
          											ABC CORP.<br>Owner<br><i class="fa fa-envelope"></i>  xyz@gmail.com
          										</div>
          										</div>
          									</div> -->
          									<div class="col-md-12">
		             		<div class="panel">		             			
		             			<div class="panel-body">
		             				<div class="table-responsive">
				                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
				                                    <thead>
				                                        <tr>
				                                            <th>Enquiry ID</th>
				                                            <th>Customer Name</th>
				                                            <th>Date</th>
				                                            <th>Details</th>
				                                            <th>Actions</th>
				                                        </tr>
				                                    </thead>
				                                    <tbody>
				                                    
				                                   
				                                        <tr class="odd gradeX">
				                                            <td></td>
				                                            <td></td>
				                                            <td></td>
				                                            <td></td>
				                                            <td><div class="btn-group">
															  <button data-toggle="dropdown" class="btn dropdown-toggle">Action <span class="caret"></span></button>
															  <ul class="dropdown-menu">
															  	<li><a href="viewEnquiry.do">View</a></li>
																<li><a href="#">Edit</a></li>
																<li><a href="#">Delete</a></li>
															  </ul></div></td>
				                                        </tr>
				                                  
				                                    
				                                        </tbody>
				                                </table>
				                            </div>
		             			</div>
		             		</div>
		             	</div>
          									</div><br>
          									<div>
          										<a href="">Edit</a><small><b> | </b></small><a href="">Change Password</a>
          									</div>
          								</div>
          								
          							</div>	
              			</div>
              			<div  class="col-md-4">
              				<div class="panel panel-default">                       
          						<div class="panel-body">
          							<div class="row">
          									<!-- <div class="col-md-12">
          										<div class="row">
          										<div class="col-md-4">
          											<img src="../Images/user.png" width="70px" height="70px">
          										</div>
          										<div class="col-md-8">
          											ABC CORP.<br>Staff<br><i class="fa fa-envelope"></i>  xyz@gmail.com
          										</div>
          										</div>
          									</div> -->
          							</div><br>
          							<div>
          										<a href="">Edit</a><small><b> | </b></small><a href="">Delete</a>
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

</body>
</html>