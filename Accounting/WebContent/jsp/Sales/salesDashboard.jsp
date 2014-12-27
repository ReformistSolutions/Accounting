<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib  uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <title>Sales</title>
<link rel="icon" href="<core:url value="/resources/images/favicon.ico" />" type="image/icon">
 
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

  </head>

  <body>

    <div id="wrapper">

      <div id="page-wrapper">

       
           <div class="row">
          
            <ol class="breadcrumb">
             
             <li class="active"><i class="fa fa-tags"></i><i class="icon-file-alt"></i> Sales</li>
             <li><a href="SalesEnquiry.spring" target="TargetFrm"><i class="icon-file-alt"></i> Enquiry</a></li>
             <li><a href="GenerateQuotation.jsp" target="TargetFrm"><i class="icon-file-alt"></i> Estimate</a> </li>
             <li><a href="CreateSalesOrder.jsp" target="TargetFrm"><i class="icon-file-alt"></i> Order</a> </li>
             <li><a href="CreateInvoice.jsp" target="TargetFrm"><i class="icon-file-alt"></i> Invoice</a> </li>
             <li><a href="Applypaymentheader.jsp" target="TargetFrm"><i class="icon-file-alt"></i> Payment</a> </li>
            </ol>
         
		</div>

    

    </div>

  </div><!-- /#page-wrapper -->
    <!-- JavaScript -->
    <script src="../js/jquery-1.10.2.js"></script>
    <script src="../js/bootstrap.js"></script>

  </body>
</html>