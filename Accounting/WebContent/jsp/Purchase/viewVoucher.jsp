<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>	 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>	
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Purchase Voucher</title>
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
function urlSubmit(url,target)
{
if(target=="1")
{

window.location.assign(url);
}
else
{
window.open(url,target);
}
}
</script>
<script type="text/javascript">
function backPage()
{
	window.history.back();
}
</script>
<script type="text/javascript">
$(document).ready(function(){
$("#edit").hover(
	  function(){
	    $(this).animate({width: 50,height: 50}, 300);
	  },
	  function(){
	      $(this).animate({width: 25,height: 25}, 300);
	});
$("#print").hover(
		  function(){
		    $(this).animate({width: 50,height: 50}, 300);
		  },
		  function(){
		      $(this).animate({width: 30,height: 30}, 300);
		});
$("#mail").hover(
		  function(){
		    $(this).animate({width: 50,height: 50}, 300);
		  },
		  function(){
		      $(this).animate({width: 35,height: 35}, 300);
		});
});
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
						<div class="col-md-10">
						<ul class="breadcrumb">
							<li class="active"><small><i class="fa fa-2x fa-table"></i></small>&nbsp;View<small>&nbsp;Voucher</small>
		             	</ul>
		             	</div>
			             	<div class="col-md-2">
			             	<a href="purchaseVoucher.do" class="btn btn-primary btn-large" data-toggle="tooltip" data-placement="left" title="Back"> Back</a>
			             	</div>
		             	</div>
		             	</div>
		             </div>
		            <br> 
		           <div><div class="col-md-9"></div>
							<a onclick="urlSubmit('editVoucher.do?voucherNo=${viewvoucher.voucherNo}','1')" title="Edit"><img id="edit" alt="" src="<c:url value="/resources/images/edit.png" />" width="25px" height="25px"></a>
							<a onclick="urlSubmit('purchaseVoucherPDF.do?voucherID=${viewvoucher.voucherNo}','_blank')" title="Print"><img id="print" alt="" src="<c:url value="/resources/images/print.png" />" width="30px" height="30px"></a>
							<a onclick="urlSubmit('purchaseVouchercompose_Mail.do?vendId=${viewvoucher.venderId}&id1=${viewvoucher.voucherNo}','1')" title="E-Mail"><img id="mail" alt="" src="<c:url value="/resources/images/email.png" />" width="35px" height="35px"></a>
					</div>
		             <br>
		             <form:form action="" cssClass="form-inline" modelAttribute="viewvoucher">
		            <div class="col-md-12">
						<div class="panel panel-default">
							<div class="panel-body">
								<div class="row">
								<div class="col-md-4">
									<div class="row">
										<div class="col-md-5">
											<form:label path="voucherNo">Voucher&nbsp;No&nbsp;: </form:label>
										</div>
										<div class="col-md-7">
											<u>${viewvoucher.voucherNo}</u>
										</div>
									</div>
								</div>
								<div class="col-sm-1"></div>
								<div class="col-md-4">
									<div class="row">
										<div class="col-md-5">
											<form:label path="orderId">Purchase&nbsp;No&nbsp;: </form:label>
										</div>
										<div class="col-md-7">
										<u>${viewvoucher.orderId}</u>
										</div>
									</div>
								</div>					
							</div><br>
							<div class="row">
								<div class="col-md-4">
									<div class="row">
										<div class="col-md-5">
											<form:label path="accountNo">From&nbsp;Account&nbsp;: </form:label>
										</div>
										<div class="col-md-7">
										${viewvoucher.accName}
										</div>
									</div>
								</div>
								<div class="col-sm-1"></div>
								<div class="col-md-4">
									<div class="row">
										<div class="col-md-5">
											<form:label path="date">Date&nbsp;: </form:label>
										</div>
										<div class="col-md-7"> 
											<%-- <input type="date" name="date" class="form-control" value="${viewvoucher.date}"/> --%>
											<%-- <label>${viewvoucher.date}</label> --%>${viewvoucher.date}
										</div>
									</div>
								</div>
							</div><br>
							<div class="row">
								<div class="col-md-4">
									<div class="row">
										<div class="col-md-5">
											<form:label path="amount">Amount&nbsp;: </form:label>
										</div>
										<div class="col-md-7">
											<u>${viewvoucher.amount}</u>
										</div>
									</div>
								</div>
								<div class="col-sm-1"></div>
								<div class="col-md-4">
									<div class="row">
										<div class="col-md-5">
											<form:label path="tds">TDS&nbsp;: </form:label>
										</div>
										<div class="col-md-7">
											<u>${viewvoucher.tds}</u>
										</div>
									</div>
								</div>
							</div><br>
							<div class="row">
								<div class="col-md-4">
									<div class="row">
										<div class="col-md-5">
											<form:label path="payMode">Payment&nbsp;Mode&nbsp;: </form:label>
										</div> 
										<div class="col-md-7">
										${viewvoucher.payMode}
										</div>
									</div>
								</div>
								<div class="col-sm-1"></div>
								<div class="col-md-4">
									<div class="row">
										<div class="col-md-5">
											<form:label path="description">Description&nbsp;: </form:label>
										</div>
										<div class="col-md-7">
											${viewvoucher.description}
										</div>
									</div>
								</div>
							</div><br>
							<%-- <div class="row">
								<div class="col-md-3">
										<input type="button" value="Edit" name="btn" class="btn btn-primary" onclick="urlSubmit('editVoucher.do?voucherNo=${viewvoucher.voucherNo}','1')">
										<input type="button" value="Print" name="btn" class="btn btn-primary" onclick="urlSubmit('purchaseVoucherPDF.do?voucherID=${viewvoucher.voucherNo}','_blank')">
										<input type="button" value="E-Mail" name="btn" class="btn btn-primary" onclick="urlSubmit('purchaseVouchercompose_Mail.do?vendId=${viewvoucher.venderId}&id1=${viewvoucher.voucherNo}','1')">
								</div>								
							</div> --%>
							</div>
						</div>
					</div>
					<br>	
					</form:form>
	</div>
<!-- </div> -->					
</body>
</html>