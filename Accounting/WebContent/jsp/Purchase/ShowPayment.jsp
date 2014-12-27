<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Payments</title>
<link rel="icon" href="<c:url value="/resources/images/favicon.ico" />" type="image/icon">
<!-- <link href="../css/bootstrap.css" rel="stylesheet">
<link href="../css/sb-admin.css" rel="stylesheet">
<link href="../css/main.css" rel="stylesheet">
<link href="../css/MoneAdmin.css" rel="stylesheet">
<link rel="stylesheet" href="../font-awesome/css/font-awesome.min.css">
<script src="../js/jquery-2.0.3.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/modernizr-2.6.2-respond-1.1.0.min.js"></script> -->
    
    <link href="<c:url value="resources/assets/plugins/bootstrap/css/bootstrap.css" /> "rel="stylesheet" type="text/css" />
    <link href="<c:url value="resources/assets/css/main.css" />"rel="stylesheet" type="text/css" />
	<link href="<c:url value="resources/assets/css/theme.css" />"rel="stylesheet" type="text/css" />
	<link href="<c:url value="resources/assets/css/MoneAdmin.css" />"rel="stylesheet" type="text/css" />
	<link href="<c:url value="resources/assets/plugins/Font-Awesome/css/font-awesome.css" />"rel="stylesheet" type="text/css" />
	<link href="<c:url value="resources/plugins/dataTables/dataTables.bootstrap.css"/>"rel="stylesheet" type="text/css" />

	<script src="<c:url value="resources/assets/plugins/jquery-2.0.3.min.js" /> "type="text/javascript"></script>
	<%-- <script src="<c:url value="resources/assets/plugins/bootstrap/js/bootstrap.min.js" /> "type="text/javascript"></script> --%>
	<script src="<c:url value="resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js" />"type="text/javascript"></script>
	<script src="<c:url value="resources/assets/plugins/dataTables/jquery.dataTables.js" /> "type="text/javascript"></script>
	<script src="<c:url value="resources/assets/plugins/dataTables/dataTables.bootstrap.js" /> "type="text/javascript"></script>

     <script>
         $(document).ready(function () {
             $('#dataTables-example1').dataTable();
             $('#dataTables-example2').dataTable();
             $('#dataTables-example3').dataTable();
             $('#dataTables-example4').dataTable();
             $('#dataTables-example5').dataTable();
             
         });
    </script>
<script type="text/javascript">
function urlSubmit1(url)
{
	if((confirmDelete()==true))
		{
		
			window.location.assign(url);
		}
	else
		{
			return false;
		}

}
function confirmDelete()
{
	var res=confirm("Are You Sure To Delete Record");
	if(res==true)
		{
			return true;
		}
	else
		{
			return false;
		}
}
</script>
</head>
<body style="overflow-x: hidden;">
<div id="wrapper">
<%@ include file="../header.jsp" %>
	<!-- <div id="container"> -->
		<%@ include file="innerHeader.jsp" %>							
<form:form action="ApplyPayment" cssClass="form-inline" modelAttribute="applypayment"> 
		<br>
						<div class="col-md-12">
						<div class="panel">
						<div class="panel-body">
						<div >
						<ul class="breadcrumb">
							<li class="active"><i class="icon-file-alt"></i> Apply Payment</li>
		             	</ul>
		             	</div>
			             	<!-- <div class="col-md-2">
			             	<a href="NewPurchaseEnquiry.do"><button type="button" class="btn btn-primary " value=""><i class="fa fa-plus-square"></i> Add New Enquiry</button></a>
			             	</div> -->
		             	</div>
		             	</div>
		             </div>
											
	<div class="col-md-12">
		             		<div class="panel">	                    
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example1">
                                    <thead>
                                        <tr>
                                            <th>Order ID</th>
                                            <th>Customer Name</th>
                                            <th>Date</th>
                                            <th>Total</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${listPayment}" var="paymentList">
                                        <tr class="odd gradeX">
                                            <td>${paymentList.txtPurchaseID}</td>
                                            <td>${paymentList.lblNameOfCustomer}</td>
                                            <td>${paymentList.txtDate}</td>
                                            <td>${paymentList.txtbalance}</td>
                                            <td>                                            
                                            <div class="btn-group">
											  <button data-toggle="dropdown" class="btn dropdown-toggle btn-xs">View <span class="caret"></span></button>
											  <ul class="dropdown-menu">
											  	<li><a href="newApplyPayment.do">Apply Payment</a></li>
												<li><a href="#">Edit</a></li>
												<li><a href="#">Disable</a></li>
											  </ul></div></td>
                                        </tr>
                                        </c:forEach>
                                        </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    </div>
</</form:form>    		
</div>
<!-- </div> -->
</body>
</html>