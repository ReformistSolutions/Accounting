<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib  uri="http://www.springframework.org/tags/form" prefix="form" %>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Payment</title>
<link rel="icon" href="<c:url value="/resources/images/favicon.ico" />" type="image/icon">
<link href="<c:url value="resources/css/bootstrap.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/css/sb-admin.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/css/table.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/css/table.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/css/font-awesome.min.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="resources/assets/css/main.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="resources/assets/css/theme.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="resources/assets/css/MoneAdmin.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="resources/assets/plugins/Font-Awesome/css/font-awesome.css" />" rel="stylesheet" type="text/css">
<script src="<c:url value="resources/assets/plugins/jquery-2.0.3.min.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/bootstrap/js/bootstrap.min.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/dataTables/jquery.dataTables.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/dataTables/dataTables.bootstrap.js" />" type="text/javascript"></script>

     <script>
     
     
         $(document).ready(function () {
             $('#dataTables-example1').dataTable();
             $('#dataTables-example2').dataTable();
             $('#dataTables-example3').dataTable();       
         });
    </script>

</head>	
<body>
<div id="wrapper">
<%@ include file="../header.jsp" %>
<div id="container">
<%@ include file="innerHeader.jsp" %>						
<form:form action="" cssClass="form-inline" modelAttribute="payments">
	
<br>					
<div class="col-md-12">    
       <div class="col-md-10">
			            	<ol class="breadcrumb">
			             		<li class="active"><i class="fa fa-edit"></i><i class="icon-file-alt"></i>Apply Payment</li>          
			             	</ol>
			            </div><br>	            
</div><br>
<div class="col-md-12">    
 				<div class="panel">        
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example1">
                                    <thead>
                                        <tr>
                                            <th>Payment ID</th>
                                            <th>Invoice ID</th> 
                                            <th>Date</th>                                          
                                            <th>Amount</th>
                                            <th>Balance</th>                                            
                                            <th>Actions</th>                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                   <c:forEach items="${paymentList}" var="paymentList"> </c:forEach>
                                        <tr class="odd gradeX">
                                           <td>${paymentList.txtPayId}</td> 
                                            <td>${paymentList.txtInvId}</td>
                                            <td>${paymentList.txtDate}</td> 
                                            <td>${paymentList.txtInvAmt}</td> 
                                            <td>${paymentList.txtBal}</td>                                                                                                                          
                                            
                                            <td>
                                            <div class="btn-group">
											  <button data-toggle="dropdown" class="btn dropdown-toggle">Action <span class="caret"></span></button>
											  <ul class="dropdown-menu">											 	
											  <li><a href="viewPayment.do" data-toggle="tooltip" data-placement="left" title="View">View</a></li>											
												<li><a href="#">Edit</a></li>
												<li><a href="#">Delete</a></li>
											  </ul>
											 </div>
											  </td>
                                        </tr>
                                      
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