<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>	
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Taxes</title>

<link href="<c:url value="resources/css/bootstrap.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/css/sb-admin.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/css/table.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/css/table.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/css/font-awesome.min.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="resources/assets/css/main.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="resources/assets/css/theme.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="resources/assets/css/MoneAdmin.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="resources/assets/plugins/Font-Awesome/css/font-awesome.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="resources/assets/plugins/Font-Awesome/css/font-awesome.css" />" rel="stylesheet" type="text/css">

<script src="<c:url value="resources/assets/plugins/jquery-2.0.3.min.js" />" type="text/javascript"></script>
<%-- <script src="<c:url value="resources/assets/plugins/bootstrap/js/bootstrap.min.js" />" type="text/javascript"></script> --%>
<script src="<c:url value="resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/dataTables/jquery.dataTables.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/dataTables/dataTables.bootstrap.js" />" type="text/javascript"></script>
     
     <script>
         $(document).ready(function () {
             $('#dataTables-example1').dataTable();
             $('#dataTables-example2').dataTable();
            
             
         });
    </script>
    <script>
	function back() {
		window.history.back();

	}
</script>
<body style="overflow-x: hidden;">
<body>
<div id="wrapper">
		<%@include file="../header.jsp"%>
		<!-- <div class="container"> -->
			<%@include file="innerHeader.jsp"%>	
<br>					
<div class="col-md-12">
					<div class="panel panel-default"">
						<div class="panel-body">
							<div class="col-md-8">
								<ul class="breadcrumb">
									<li class="active"><small><i class="fa fa-2x fa-table"></i></small>&nbsp;Taxes For Sales & Purchase</li>
								</ul>
							</div>
							<div class="col-md-4">							
							<a href="addNew.do"><input type="button" name="btnAdd" value="New Tax" class="btn btn-primary"/></a>
							
							<a href="newGroupAccount.do"><input type="button" name="btnAdd" value="Tax Receieved" style="background-color: #99b433;" class="btn btn-primary"/></a>
							</div>
						</div>
					</div>
</div>
<div class="col-md-12">
    <div class="panel panel-default">
       <div class="panel-body">
       
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#tab1" data-toggle="tab"><i class="glyphicon glyphicon-text-width"></i> Taxes For Sales</a></li>
                                <li><a href="#tab2" data-toggle="tab"><i class="glyphicon glyphicon-text-width "></i> Taxes For Purchase</a></li>
                               
                            </ul>
                            
                            
           <div class="tab-content">
             <div class="tab-pane fade in active" id="tab1">
                <!-- <div class="col-md-12"> -->
                    <!-- <div class="panel panel-default">                       
                        <div class="panel-body"> -->                    
 <form:form action="" method="post" cssClass="form-inline" commandName="taxes">
	<div class="row first-column">  
	<c:forEach items="${salesTaxList}" var="totalSalesTaxList">
		<div class="col-md-6">
		<div class="panel panel-default">
			<div class="panel-body">
				<div class="panel">
					<div style="background-color:#E9E9E9;text-align: center;">
					<label>${totalSalesTaxList.taxName}&nbsp;&nbsp;@&nbsp;${totalSalesTaxList.taxRate}%</label></div>
					<hr>
					<div><label>Registration No: ${totalSalesTaxList.regNo}</label></div>
					<div><label>Filling Frequency: ${totalSalesTaxList.fillFreq}</label></div>
					<div><label>Tax Rate: ${totalSalesTaxList.taxRate}%</label></div>
					<%-- <div><label>Total Tax: ${totalSalesTaxList.totalTaxAmt}</label></div> --%>
				</div>
				</div>
			</div>
		</div>
		</c:forEach>
		<c:forEach items="${salesLinkedTaxList}" var="totalSalesLTaxList">
			<div class="col-md-6">
		<div class="panel panel-default">
			<div class="panel-body">
				<div class="panel">
					<div style="background-color:#E9E9E9;text-align: center;">
					<label>${totalSalesLTaxList.linkTaxName}&nbsp;&nbsp;@&nbsp;${totalSalesLTaxList.linksalesTax}%</label></div>
					<hr>
					<div><label>Registration No: ${totalSalesLTaxList.linkregNo}</label></div>
					<div><label>Filling Frequency: ${totalSalesLTaxList.lTaxFillingFreq}</label></div>
					<div><label>Tax Rate: ${totalSalesLTaxList.linksalesTax}%</label></div>
					<%-- <div><label>Total Tax: ${totalSalesLTaxList.totalLinkedTax}</label></div> --%>
				</div>
				</div>
			</div>
		</div>
		</c:forEach>		
</div>		

</form:form>
             </div>
	           <div class="tab-pane fade" id="tab2">
	            
<form:form action="" method="post" cssClass="form-inline" name="frm2">  			
<div class="row first-column">  
	<c:forEach items="${purchaseTaxList}" var="totalPurTaxList">
		<div class="col-md-6">
		<div class="panel panel-default"> 
			<div class="panel-body">
				<div class="panel">
					<div style="background-color:#E9E9E9;text-align: center;">
					<label>${totalPurTaxList.taxName}&nbsp;&nbsp;@&nbsp;${totalPurTaxList.taxRate}%</label></div>
					<hr>
					<div><label>Registration No: ${totalPurTaxList.regNo}</label></div>
					<div><label>Filling Frequency: ${totalPurTaxList.fillFreq}</label></div>
					<div><label>Tax Rate: ${totalPurTaxList.taxRate}%</label></div>
					<%-- <div><label>Total Tax: ${totalPurTaxList.totalTaxAmt}</label></div> --%>
				</div>
				</div>
			</div>
		</div>
		</c:forEach>
		<c:forEach items="${purchaseLinkedTaxList}" var="totalPurLTaxList">
			<div class="col-md-6">
		<div class="panel panel-default">
			<div class="panel-body">
				<div class="panel">
					<div style="background-color:#E9E9E9;text-align: center;">
					<label>${totalPurLTaxList.linkTaxName}&nbsp;&nbsp;@&nbsp;${totalPurLTaxList.linksalesTax}%</label></div>
					<hr>
					<div><label>Registration No: ${totalPurLTaxList.linkregNo}</label></div>
					<div><label>Filling Frequency: ${totalPurLTaxList.lTaxFillingFreq}</label></div>
					<div><label>Tax Rate: ${totalPurLTaxList.linksalesTax}%</label></div>
					<%-- <div><label>Total Tax: ${totalPurLTaxList.totalLinkedTax}</label></div> --%>
				</div>
				</div>
			</div>
		</div>
		</c:forEach>		
</div>		
	
</form:form>
                    </div>
           </div>
        </div>
     </div>
</div>
</div>

<!-- </div> -->
</body>
</html>