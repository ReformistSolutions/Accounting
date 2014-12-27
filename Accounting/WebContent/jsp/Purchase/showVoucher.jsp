<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>	
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Show Voucher</title>
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
<script src="<c:url value="/resources/assets/plugins/bootstrap/js/bootstrap.min.js" />" type="text/javascript"></script> 
<script src="<c:url value="/resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js" />" type="text/javascript"></script>
<script src="<c:url value="/resources/assets/plugins/dataTables/jquery.dataTables.js" />" type="text/javascript"></script>
<script src="<c:url value="/resources/assets/plugins/dataTables/dataTables.bootstrap.js" />" type="text/javascript"></script>
     <script>
         $(document).ready(function () {
             $('#dataTables-example').dataTable(); 
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
	var res=confirm("Are You Sure To Disable Record");
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
					
					
					<!-- <div class="container">		 -->		<br>			
						<div class="col-md-12">
						<div class="panel panel-default">
						<div class="panel-body">
						<div class="col-md-9">
						<ul class="breadcrumb">
							<li class="active"><small><i class="fa fa-2x fa-table"></i></small>&nbsp;Purchase<small>&nbsp;Voucher</small>
		             	</ul>
		             	</div>
			             	<div class="col-md-3">
			             	<a href="NewPurchaseVoucher.do"><button type="button" data-toggle="tooltip" data-placement="bottom" title="Purchase Voucher" class="btn btn-primary " value=""><i class="fa fa-plus-square"></i> Add New Voucher</button></a>
			             	</div>
		             	</div>
		             	</div>
		             </div>
		             <br>
					<c:if test="${message==1}">
					<div class="col-md-12">
					<div class="alert alert-success" role="alert" id="success">${msg}</div>
					</div>
					<script type="text/javascript">	
					  $('#success').fadeOut(4000, function() 
					{
					  });
					</script>
					</c:if>
					<c:if test="${message==0}">
					<div class="col-md-12">
					<div class="alert alert-danger" role="alert" id="failure">${msg}</div>
					</div>
					<script type="text/javascript">	
					  $('#failure').fadeOut(4000, function() 
					{
					  });
					</script>
					</c:if>
					<c:if test="${update==1}">
					<div class="col-md-12">
					<div class="alert alert-success" role="alert" id="success">${msg}</div>
					</div>
					<script type="text/javascript">	
					  $('#success').fadeOut(4000, function() 
					{
					  });
					</script>
					</c:if>
					<c:if test="${update==0}">
					<div class="col-md-12">
					<div class="alert alert-danger" role="alert" id="failure">${msg}</div>
					</div>
					<script type="text/javascript">	
					  $('#failure').fadeOut(4000, function() 
					{
					  });
					</script>
					</c:if>
					<c:if test="${delete==1}">
					<div class="col-md-12">
					<div class="alert alert-success" role="alert" id="success">${msg}.</div>
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
					<form:form action="voucher.do" cssClass="form-inline" modelAttribute="purchasevoucher">
					<div class="col-md-12">
		             		<div class="panel panel-default">		             			
		             			<div class="panel-body">
		             				<div class="table-responsive">
				                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
				                                    <thead>
				                                        <tr>
				                                            <th>Voucher ID</th>
				                                            <th>From Account</th>
				                                            <th>Date</th>
				                                            <th>Amount</th>
				                                            <th>Actions</th>
				                                        </tr>
				                                    </thead>
				                                    <tbody>
				                                    <c:forEach items="${voucherList}" var="voucherList">
				                                        <tr class="odd gradeX">
				                                            <td>${voucherList.voucherNo}</td>
				                                            <td>${voucherList.accName}</td>
				                                            <td>${voucherList.date}</td>
				                                            <td>${voucherList.amount}</td>
				                                            <td><div class="btn-group">
															  <button data-toggle="dropdown" class="btn dropdown-toggle btn-xs">Action <span class="caret"></span></button>
															  <ul class="dropdown-menu">
															  	<li><a href="viewVoucher.do?voucherNo=${voucherList.voucherNo}" data-toggle="tooltip" data-placement="bottom" title="Voucher View">View</a></li>
																<li><a href="editVoucher.do?voucherNo=${voucherList.voucherNo}" data-toggle="tooltip" data-placement="bottom" title="Voucher Edit">Edit</a></li>
																<li><a onclick="urlSubmit1('deleteVoucher.do?voucherId=${voucherList.voucherNo}&amt=${voucherList.amount}')" href="#" data-toggle="tooltip" data-placement="bottom" title="Voucher Disable">Disable</a></li>
															  </ul></div></td>
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