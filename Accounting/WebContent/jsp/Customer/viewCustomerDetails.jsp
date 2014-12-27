<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib  uri="http://www.springframework.org/tags/form" prefix="form" %>
   <%@taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer</title>
<%-- <link href="<core:url value="/resources/css/bootstrap.css" />" rel="stylesheet" type="text/css">
    <link href="<core:url value="/resources/css/sb-admin.css" />" rel="stylesheet" type="text/css">
    <link href="<core:url value="/resources/css/font-awesome.min.css" />" rel="stylesheet" type="text/css">
    <link href="<core:url value="/resources/assets/plugins/Font-Awesome/css/font-awesome.css"/>" rel="stylesheet" type="text/css">
    <script src="<core:url value="/resources/assets/plugins/jquery-2.0.3.min.js"/>" type="text/javascript"></script>
    <script src="<core:url value="/resources/assets/plugins/bootstrap/js/bootstrap.min.js"/>" type="text/javascript"></script>
    <script src="<core:url value="/resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js"/>" type="text/javascript"></script>

  
    <link rel="stylesheet" href="<core:url value="http://cdn.oesmith.co.uk/morris-0.4.3.min.css"/>">
     <script src="<core:url value="/resources/assets/plugins/jquery-2.0.3.min.js"/>"></script>
     <script src="<core:url value="/resources/assets/plugins/bootstrap/js/bootstrap.min.js"/>"></script>
    <script src="<core:url value="/resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js"/>"></script> 

     <script>
         $(document).ready(function () {
             $('#dataTables-example1').dataTable();
             $('#dataTables-example2').dataTable();
             $('#dataTables-example3').dataTable();
             $('#dataTables-example4').dataTable();
             $('#dataTables-example5').dataTable();
             
         });
    </script> --%>

</head>	

<body>
<div id="wrapper">
<%@ include file="../header.jsp" %>
<%@ include file="innerHeader.jsp" %>
<div class="container">						
<form:form action="" cssClass="form-inline" modelAttribute="customerAddList">
<input type="hidden" id="hide" name="hide1" value="0">		
<br>					
<div class="col-lg-12">
    <div class="panel panel-default">
       <div class="panel-body">
       <div class="col-lg-12">
        
       <div class="page-header">           
          		<div class="col-md-12">
	            	<div class="row first-column">
	            		<div class="col-md-9">
	            		
			            	<ol class="breadcrumb">
			             		<li class="active"><i class="fa fa-edit"></i><i class="icon-file-alt"></i> Customer</li>          
			             	</ol>
			             
			             </div>
			             <div class="col-md-3 pull right" >
			             	<div>
			             		<a href="addnewCustomer.do"><button type="button" class="btn btn-primary " value=""><small><i class="fa fa-2x fa-edit"></i></small> Add New Customer</button></a>
			             	</div>
			             </div>
	             	</div>
             	</div>
		</div>
		</div>
                              
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>Customer ID</th>
                                            <th>Customer Name</th>
                                            <th>Region</th>
                                            <th>Customer Type</th>
                                            <th>Details</th>
                                            <th>Action</th>                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                   <c:forEach items="${listCUST}" var="custlist"> 
                                        <tr class="odd gradeX">
                                            <td>${custlist.txtCustID}</td>
                                            <td>${custlist.txtCustName}</td>
                                            <td>${custlist.slctRegion}</td>
                                            <td>${custlist.slctType}</td>                                                                        
                                            <td><a href="ShowEnquiryDetails.jsp?btn=Details&enquiryID">Details</a></td>
                                            <td>
                                            <div class="btn-group">
											  <button data-toggle="dropdown" class="btn dropdown-toggle">Action <span class="caret"></span></button>
											  <ul class="dropdown-menu">												
												<li><a href="#">Edit</a></li>
												<li><a href="#">Delete</a></li>
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
             </div>
	    </form:form> 		
</div>
</div>
</body>
</html>