<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">  
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

$("#${vendor}").css('color','red');
$("#${enquiry}").css('color','red');
$("#${quotation}").css('color','red');
$("#${order}").css('color','red');
$("#${purchases1}").css('color','red');
$("#${voucher}").css('color','red');
});
</script>
</head>
<body>
<div class="container">	
 <div class="row">
       <ol class="breadcrumb">
             <li><i class="icon-file-alt"></i> Purchase</li>
             <li><a href="purchaseVender.do" id="${vendor}" data-toggle="tooltip" data-placement="bottom" title="Vender"><i class="icon-file-alt"></i> Vendor</a> </li>
             <li><a href="purchaseEnquiry.do" id="${enquiry}" data-toggle="tooltip" data-placement="bottom" title="Enquiry"><i class="icon-file-alt"></i> Enquiry</a></li>
             <li><a href="purchaseQuotation.do" id="${quotation}" data-toggle="tooltip" data-placement="bottom" title="Quotation"><i class="icon-file-alt"></i> Quotation</a> </li>
             <li><a href="purchaseOrder.do" id="${order}" data-toggle="tooltip" data-placement="bottom" title="Order"><i class="icon-file-alt"></i> Orders</a> </li>
             <li><a href="purchases.do" id="${purchases1}" data-toggle="tooltip" data-placement="bottom" title="Purchase"><i class="icon-file-alt"></i> Purchases</a> </li>                         
             <!-- <li><a href="purchasePayment.do" ><i class="icon-file-alt"></i> Payment</a> </li> -->
             <li><a href="purchaseVoucher.do" id="${voucher}" data-toggle="tooltip" data-placement="bottom" title="Voucher"><i class="icon-file-alt"></i> Voucher</a> </li>             
            </ol>
         
		</div>
       </div>
</body>
</html>