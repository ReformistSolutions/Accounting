<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Receive for sale</title>
<link rel="icon" href="<c:url value="/resources/images/favicon.ico" />" type="image/icon">
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
 <!--  <script type="text/javascript">
function backPage()
{
	window.history.back();
}
</script> -->
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
</head>
<body style="overflow-x: hidden;"> 
<div id="wrapper">
<%@ include file="../header.jsp" %>
	<div class="page-wrapper">	
<%@include file="innerHeader.jsp"%>	
	<br>
			<div class="col-md-12">
		<div class="panel panel-default">
			<div class="panel-body">
				<div class="col-md-10">
					<ul class="breadcrumb">
						 <li class="active"><small><i class="fa fa-2x fa-table"></i></small>&nbsp;View&nbsp;Receive&nbsp;Sales<small></small>
		         	</ul>
		         </div>
		         <div class="col-md-2">
<!-- 					<button name="back" class="btn btn-primary btn-large" onclick="backPage()"><i class="fa fa-reply"></i> Back</button>	
 -->		         
 		            <a href="inventory.do" class="btn btn-primary btn-large"><i class="fa fa-reply"></i> Back</a>
 
 </div>
			</div>
		</div>
</div>
						<form:form action="receiveforSalesView.do" method="post" cssClass="form-inline" commandName="receiveforSalesView"  name="frmreceiveforSales" >
						<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-body">
									<div class="row">
								<div class="col-md-4">
									<div class="row">
										<div class="col-md-4"> 
											<label>Voucher&nbsp;No:-</label>
										</div>
										<div class="col-md-4">  
											<label>${receiveforSalesView.txtVNo}</label>
										</div>
									</div>
								</div>
								<div class="col-md-4">
									<div class="row">
										<div class="col-md-5">
											<label>Voucher Date:-</label>
										</div>
										<div class="col-md-7">
											<label>${receiveforSalesView.date}</label>								
										</div>
									</div>
								</div>								
							</div><br>
							<div class="row">
								<div class="col-md-4">
									<div class="row">
										<div class="col-md-4"> 
											<label>Warehouse:-</label>
										</div>
										<div class="col-md-4">  
											<label>${receiveforSalesView.selectWarehouse}</label>
										</div>
									</div>
								</div>
																							
							</div><br>									
									<div class="table-responsive" style="width: 50%;">	
						         				<table id="tableID" class="table table-striped">        					         					
						        					<tr>
											        		<th align="center">Sr No</th>
											        		<th align="center">Product</th>        							        		
											        		<th align="center">Quantity</th>  					        		
						        					</tr>  
						        					<c:forEach items="${receiveforSalesView.productList}" var="productList"> 					
						         					<tr>
						         						<td>${productList.txtSrNo1}</td> 						         						
						         						           					
						            					<td>${productList.txtItemr}</td> 					            						
						            					          				
						            					<td>${productList.txtQuant1}</td>
						            				   		
						           					 </tr>
						           					 </c:forEach>   
						         			 </table> 
						         			 </div>						         	
								<div class="col-md-12">	
									<div><label>Details:-</label></div><div><label>${receiveforSalesView.txtDetails}</label></div><br>
								</div>													
											<div class="col-md-12">
<input type="button" value="Print" name="btn" class="btn btn-primary" onclick="urlSubmit('receiveForSalesPDF.do?txtVNo=${receiveforSalesView.txtVNo}','_blank')">
								            <button type="reset" class="btn btn-primary" name="btn">Email</button>
						  				</div>
						  				</div>
						  				</div>
						  				</div>						  				
						  			</form:form>
											
						    		
</div>							
</div>
					
                        
</body>
</html>




