<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib  uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Inner Header</title>
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
             $('#dataTables-example').dataTable(); 
         });
    </script>
     <script type="text/javascript">
$(document).ready(function(){

$("#${customer}").css('color','red');
$("#${enquiry}").css('color','red');
$("#${estimate}").css('color','red');
$("#${invoice}").css('color','red');
$("#${salesorder}").css('color','red');
$("#${deliverychallan}").css('color','red');
$("#${receipts}").css('color','red');
});
</script>
</head>
<body>
<div class="container">	
 <div class="row">
       <ol class="breadcrumb">
      		  <li class="active"><i class="icon-file-alt"></i> Sales</li>
              <li><a href="sales.do" id="${customer}" data-toggle="tooltip" data-placement="bottom" title="Customer"><i class="icon-file-alt"></i> Customer</a> </li>             
              <li><a href="enquiry.do" id="${enquiry}" data-toggle="tooltip" data-placement="bottom" title="Enquiry"><i class="icon-file-alt"></i> Enquiry</a></li>
              <li><a href="estimate.do" id="${estimate}" data-toggle="tooltip" data-placement="bottom" title="Estimate"><i class="icon-file-alt"></i> Estimate</a> </li>
              <li><a href="salesOrder.do" id="${salesorder}" data-toggle="tooltip" data-placement="bottom" title="Order"><i class="icon-file-alt" ></i> Order</a> </li>             
              <li><a href="invoice.do" id="${invoice}" data-toggle="tooltip" data-placement="bottom" title="Invoice"><i class="icon-file-alt" ></i> Invoice</a> </li>
              <li><a href="deliveryChallan.do" id="${deliverychallan}" data-toggle="tooltip" data-placement="bottom" title="Delivery Challan"><i class="icon-file-alt"></i> Delivery Challan</a> </li>
          <!--    <li><a href="payment.do"><i class="icon-file-alt"></i> Payment</a> </li> -->
              <li><a href="receipts.do" id="${receipts}" data-toggle="tooltip" data-placement="bottom" title="Receipts"><i class="icon-file-alt"></i> Receipts</a> </li>
           
            
            </ol>
         
		</div>
       </div>
</body>
</html>