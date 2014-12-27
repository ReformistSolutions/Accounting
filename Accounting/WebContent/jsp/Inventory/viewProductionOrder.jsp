<%@page language="java" import="java.sql.*"%>
<%@taglib  uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>Production Order</title>
<link rel="icon" href="<core:url value="/resources/images/favicon.ico" />" type="image/icon">
<link rel="stylesheet" href="<core:url value="/resources/font-awesome/css/font-awesome.min.css" />" />

<link rel="stylesheet" href="<core:url value="/resources/ccc/jquery-ui.css" />">
<script src="<core:url value="/resources/ccc/jquery-1.9.1.js" />"></script>
<script src="<core:url value="/resources/ccc/jquery-ui.js" />"></script>
<link rel="stylesheet" type="text/css" href="<core:url value="/resources/highslide/highslide.css"/>" />
<script type="text/javascript" src="<core:url value="/resources/highslide/highslide-with-html.js" />"></script>

<link rel="stylesheet" href="<core:url value="/resources/css/table.css" />">
<script src="<core:url value="/resources/js/jquery-1.10.2.js" />"></script>
<script src="<core:url value="/resources/js/bootstrap.js" />"></script>


<link href="<core:url value="/resources/css/bootstrap.css" />" rel="stylesheet" type="text/css">
    <link href="<core:url value="/resources/css/sb-admin.css" />" rel="stylesheet" type="text/css">
    <link href="<core:url value="/resources/css/font-awesome.min.css" />" rel="stylesheet" type="text/css">
    <link href="<core:url value="/resources/assets/plugins/Font-Awesome/css/font-awesome.css"/>" rel="stylesheet" type="text/css">
    <script src="<core:url value="/resources/assets/plugins/jquery-2.0.3.min.js"/>" type="text/javascript"></script>
    <script src="<core:url value="/resources/assets/plugins/bootstrap/js/bootstrap.min.js"/>" type="text/javascript"></script>
    <script src="<core:url value="/resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js"/>" type="text/javascript"></script>

  
    <link rel="stylesheet" href="<core:url value="http://cdn.oesmith.co.uk/morris-0.4.3.min.css"/>">
     <script src="<core:url value="/resources/assets/plugins/jquery-2.0.3.min.js"/>"></script>
     <script src="<core:url value="/resources/assets/plugins/bootstrap/js/bootstrap.min.js"/>"></script>
    <script src="<core:url value="/resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js"/>"></script> 

<link href="<core:url value="resources/css/bootstrap.css" />" rel="stylesheet" type="text/css" />
<link href="<core:url value="resources/css/sb-admin.css" />" rel="stylesheet" type="text/css" />
<link href="<core:url value="resources/font-awesome/css/font-awesome.min.css" />" rel="stylesheet" type="text/css" />
 <script type="text/javascript" src="<core:url value="/resources/highslide/highslide-with-html.js" />"></script>
<link rel="stylesheet" type="text/css" href="<core:url value="/resources/highslide/highslide.css" />"/>
<script type="text/javascript">
    hs.graphicsDir = 'resources/highslide/graphics/';
    hs.outlineType = 'rounded-white';
    hs.lang.creditsText = '';
    hs.lang.creditsTitle = '';
</script>
<script>
$(function() {
$( "#tabs" ).tabs();
});
</script>




<script>
$(function() {
$( "#tabs" ).tabs();
});
</script>
<script>
function goBack()
	{
		window.history.back();
	}
function beingDevelope()
{
	alert("This Functionality is Under Construction");
}
</script>
</head>
<body style="overflow-x: hidden;">
<div id="wrapper">
<%@ include file="../header.jsp" %>
<!-- <div class="container"> -->
<%@ include file="innerHeader.jsp" %>
<br>
					<div class="col-md-12">	   
					<div class="panel">
						<div class="panel-body">         
	            		<div class="col-md-10">	            		
			            	<ol class="breadcrumb">
			             		<li class="active"><small><i class="fa fa-2x fa-table"></i></small>&nbsp;Production<small>&nbsp;Order</small>          
			             	</ol>			             
			             </div>
			              <div class="col-md-2 pull right" >
			             	<div>
			             		<button type="button" class="btn btn-primary " onclick="goBack()"><small><i class="icon-reply"></i></small>&nbsp;Back</button>
			             	</div>
			             </div>
			             </div>
			             </div>
			      </div><br>
<br>
<div class="col-md-12">
<form:form action="" method="post" modelAttribute="production"> 
		<div class="panel">
		<div class="panel-body">
		<div class="row">
		<div class="col-md-6">
			<div class="panel-default">
				<div class="panel-heading"></div>
				<div class="panel-body">
					<div class="row">
					<div class="col-sm-1"></div>
						<div class=""> 						
						<label>Production Order No : </label>
						<u>${production.productionID}</u>
						</div><br>
						<c:choose>
							<c:when test="${production.sorderId !=' '}">
								<div class="col-sm-1"></div>
								<div class="">						
								<label>Sales&nbsp;Order No:</label>	
								<u>${production.sorderId}</u>
								</div><br>
							</c:when>
						</c:choose>
						
						<c:if test="${production.productionstatus=='P'}">
						<div class="col-sm-1"></div>
						<div class="">						
						<label>&nbsp;Status:</label>	
							Pending
						</div>
						</c:if>
						<c:if test="${production.productionstatus=='C'}">
						<div class="col-sm-1"></div>
						<div class="">						
						<label>&nbsp;Status:</label>	
							Completed
						</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-6">
			<div class="panel-default">
				<div class="panel-heading"></div>
				<div class="panel-body">
					<div class="row">	
					<div class="col-sm-1"></div>										
						<div class="">			
						<label>Date : </label>
						${production.prodDate}
						</div>
					</div>
					<c:if test="${production.productionstatus=='C'}">
						<div class="row">	
					<div class="col-sm-1"></div>										
						<div class="">			
						<label>Completed Date : </label>
						${production.completedDate}
						</div>
					</div>
					</c:if>
				</div>
			</div>
		</div>	
		</div><br>			
					<div class="table-responsive">
						<table id="tableID" class="table table-bordered">		
								<tr>
									<th>Sr No</th>
									<th>Product</th>
									<th>Description</th>
									<th>Quantity</th>
									<th>Unit</th>
									<th>Raw Material</th>
								</tr>								
								<c:forEach items="${production.productList}" var="productList">
								<tr>
									<td>${productList.srNo}</td>
									<td>${productList.productName}</td>           						
									<td>${productList.desc}</td>
									<td>${productList.quantity}</td>
									<td>${productList.unit}</td>
									<td><a href="showRawMaterial.do?productionId=${production.productionID}&productId=${productList.productId}&pName=${productList.productName}" onClick="return hs.htmlExpand(this, { contentId: 'highslide-html', objectType:   'iframe',height: '500',width: '850' })">Raw Material</a></td>																
								</tr>
								</c:forEach>
							</table>
							
						</div>
						<br>
						<c:choose>
							<c:when test="${production.productionstatus=='P'}">
								<div class="col-md-12">
									<input type="button" value="Print" name="btn" class="btn btn-primary" onclick="urlSubmit('productionOrderPDF.do?productionId=${production.productionID}','_blank')"> 									 
									<%-- <input type="button" value="E-Mail" name="btn" class="btn btn-primary" onclick="beingDevelope()"> onclick="urlSubmit('sendProductionPdfMail.do?id1=${production.productionID}','1')" class="btn btn-primary"> --%>
									<input type="button" name="btn" class="btn btn-primary" value="Edit" onclick="urlSubmit('editProduction.do?productionId=${production.productionID}','1')">
									<button type="button" onclick="goBack()" class="btn btn-primary" name="btn">Cancel</button>
								</div>
							</c:when>
							<c:otherwise>
									<input type="button" value="Print" name="btn" class="btn btn-primary" onclick="urlSubmit('productionOrderPDF.do?productionId=${production.productionID}','_blank')">								 
									<%-- <input type="button" value="E-Mail" name="btn" onclick="urlSubmit('sendProductionPdfMail.do?id1=${pendingProduction.productionID}','1')" class="btn btn-primary"> --%>
									<button type="button" onclick="goBack()" class="btn btn-primary" name="btn">Cancel</button>
							</c:otherwise>
						</c:choose>

				<br>
</div><br>		
</div>

						
	</form:form><!-- <a href="orderFromEstimate.do"> -->
	</div>
	</div>
<!-- </div> -->

</body>
</html>
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
