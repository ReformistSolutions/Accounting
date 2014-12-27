<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib  uri="http://www.springframework.org/tags/form" prefix="form" %>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customers</title>
 <link rel="stylesheet" href="<c:url value="/resources/assets/plugins/bootstrap/css/bootstrap.css" />" />
    <link rel="stylesheet" href="<c:url value="/resources/assets/css/main.css" />" />
    <link rel="stylesheet" href="<c:url value="/resources/assets/css/theme.css" />" />
    <link rel="stylesheet" href="<c:url value="/resources/assets/css/MoneAdmin.css" />" />
    <link rel="stylesheet" href="<c:url value="/resources/assets/plugins/Font-Awesome/css/font-awesome.css" />" />
        <link href="<c:url value="/resources/assets/plugins/dataTables/dataTables.bootstrap.css" />" rel="stylesheet" />
    <script src="<c:url value="/resources/assets/plugins/jquery-2.0.3.min.js" />" ></script>
     <script src="<c:url value="/resources/assets/plugins/bootstrap/js/bootstrap.min.js" />" ></script>
    <script src="<c:url value="/resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js" />" ></script>
    <script src="<c:url value="/resources/assets/plugins/dataTables/jquery.dataTables.js" />" > </script>
    <script src="<c:url value="/resources/assets/plugins/dataTables/dataTables.bootstrap.js" />" ></script>
    <link rel="stylesheet" href="<c:url value="/resources/font-awesome/css/font-awesome.min.css" />" >

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
<form:form action="" modelAttribute="addedCustomer" cssClass="form-inline">
<br>					
<div class="col-md-12">    
       <div class="col-md-10">
			            	<ol class="breadcrumb">
			             		<li class="active"><i class="fa fa-edit"></i><i class="icon-file-alt"></i>Customer</li>          
			             	</ol>			             	
		     </div><br>	            
			             <div class="col-md-2 pull right" >			             	
			             		<a href="addnewCustomer.do"><button type="button" class="btn btn-primary " value=""><small><i class="fa fa-2x fa-edit"></i></small> Add New Customer</button></a>
			             </div><br>
</div><br>
			<div class="col-md-12">    
 				<div class="panel">        
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example1">
                                    <thead>
                                        <tr>
                                            
                                            <th>Customer Name</th>
                                            <th>Customer_Id</th>
                                            <th> Date</th>
                                           <!--  <th>Details</th>
                                            <th>Actions</th>  -->                                           
                                        </tr>
                                    </thead>
                                   
                                    <tbody>
                                    <c:forEach items="${customerAddList}" var="customerAddList">  
                                        <tr class="odd gradeX">
                                            <td>${customerAddList.txtCustName}</td>
                                            <td>${customerAddList.txtCustID }</td>
                                            <td>${customerAddList.txtDate }</td> 
                                                                                                                      
                                            <td><a href="viewCustomerDetails.do?customerID=${customerAddList.txtCustID}">Details</a></td>
                                            <td>
                                            <div class="btn-group">
											  <button data-toggle="dropdown" class="btn dropdown-toggle">Action <span class="caret"></span></button>
											  <ul class="dropdown-menu">	
											  <%-- <li><a href="viewEnquiry.do?enquiryID=${salesEnquiryList.txtEnqId}">View</a>											
												<li><a href="editEnquiry.do?enquiryID=${salesEnquiryList.txtEnqId}">Edit</a></li> --%>
												<li><a href="#?enquiryID=${customerAddList.customerAddList}">Delete</a></li>
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
</div>

</body>
</html>