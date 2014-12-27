<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/css/sb-admin.css" />" rel="stylesheet" type="text/css">
    <link href="<c:url value="/resources/css/font-awesome.min.css" />" rel="stylesheet" type="text/css">
    <link href="<c:url value="/resources/assets/plugins/Font-Awesome/css/font-awesome.css" />" rel="stylesheet" type="text/css">
    <script src="<c:url value="/resources/assets/plugins/jquery-2.0.3.min.js" />" type="text/javascript"></script>
    <script src="<c:url value="/resources/assets/plugins/bootstrap/js/bootstrap.min.js" />" type="text/javascript"></script>
    <script src="<c:url value="/resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js" />" type="text/javascript"></script>

 
     <script>
         $(document).ready(function () {
             $('#dataTables-example').dataTable();
            
             
         });
    </script>
</head>
<body>
<div class="container">	
 <div class="row">
       <ol class="breadcrumb">
            
             <li class="active"><i class="fa fa-tags"></i><i class="icon-file-alt"></i> Customer</li>
             
             <!-- <li><a href="Invoice.do" target="TargetFrm"><i class="icon-file-alt"></i> Invoice</a> </li>
             <li><a href="payment.do" target="TargetFrm"><i class="icon-file-alt"></i> Payment</a> </li> -->
            </ol>
         
		</div>
       </div>
</body>
</html>