<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Warehouse</title>
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
    
<!-- <script type="text/javascript">
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
	<input type="hidden" id="hide" name="hide1" value="0"> <br>
			<div class="col-md-12">
		<div class="panel panel-default">
			<div class="panel-body">
				<div class="col-md-10">
					<ul class="breadcrumb">
						 <li class="active"><small><i class="fa fa-2x fa-table"></i></small>&nbsp;Warehouse&nbsp;View<small></small>
		         	</ul>
		         </div>
		         <div class="col-md-2">
<!-- 					<button name="back" class="btn btn-primary btn-large" onclick="backPage()"><i class="fa fa-reply"></i> Back</button>	
 -->		        
  		            <a href="showwarehouse.do" class="btn btn-primary btn-large"><i class="fa fa-reply"></i> Back</a>
 
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
					<br>
<form:form action="warehouseview" method="post" cssClass="form-inline" modelAttribute="warehouseview" name="frmwarehouse"> 
							<div class="col-md-12">
<div class="panel panel-default">                       
                        <div class="panel-body">
							<div class="row">
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-4"> 
											<label>Warehouse&nbsp;ID:-</label>
										</div>
										<div class="col-md-4">  
											<label>${warehouseview.warehousrID}</label>
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-5">
											<label>Warehouse Name:-</label>
										</div>
										<div class="col-md-5">  
											
										<label>${warehouseview.wareHouseName}</label>
									</div>
								</div>								
							</div>
							</div><br>
							<div class="row">
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-6"> 
											<label>Warehouse Address:-</label>
										</div>
										<div>
														<label>${warehouseview.address}</label>
												</div>
												
									</div>
								</div>																
							</div><br>							
					<div class="table-responsive" style="width: 50%;">	
						         				<table id="tableID" class="table table-striped">        					         					
						        					<tr>
											        		<th align="center">Sr No</th>
											        		<th align="center">Product</th> 
											        		<th align="center">Unit</th>
											        		<th align="center">Description</th> 					        		  
											        		<th align="center">Quantity</th>
						        					</tr>  
						        					<c:forEach items="${warehouseview.warehousedetails}" var="warehousedetails"> 					
						         					<tr>
						         						<td>${warehousedetails.srNo}</td> 						         						
						         						           					
						            					<td>${warehousedetails.itemCode}</td> 					            						
						            					<td>${warehousedetails.unit}</td>
						            					<td>${warehousedetails.decription}</td>          				
						            					<td> ${warehousedetails.quantity}</td>
						            				   		
						           					 </tr>
						           					 </c:forEach>
						        					  
						         			 </table>
						         			 </div>
				<br>
												<div>
													<label>Comment :</label>
												</div>
												<div>
														<label> ${warehouseview.comments}</label>
												</div>
												<br>
												<br>
												<div>
												 <input type="button" value="Print" name="btn" class="btn btn-primary" onclick="urlSubmit('warehousePDF.do?warehousrID=${warehouseview.warehousrID}','_blank')">          
                                                 <%-- <input type="button" value="Email" name="btn" class="btn btn-primary" onclick="urlSubmit('composewarehouseMail.do?warehousrID=${warehouseview.warehousrID}','_blank')">						  				</div> --%>
						  				</div>
						  				</div>
						  				</div>
											</form:form>



</div>
</div>
</body>
</html>