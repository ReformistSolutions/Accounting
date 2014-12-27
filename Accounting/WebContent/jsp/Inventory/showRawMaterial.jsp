<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>	
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Production Raw Material</title>
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
             $('#dataTables-example1').dataTable(); 
         });
    </script>
</head>
<body>

	<form:form action="" cssClass="form-inline" modelAttribute="production">
					<br>			
						<div class="col-md-12">
						<div class="panel">
						<div class="panel-body">
						<div class="col-md-10">
						<ul class="breadcrumb">
							<li class="active"><small><i class="fa fa-2x fa-table"></i></small>&nbsp;Raw Material<small>&nbsp;Details</small>
		             	</ul>
		             	</div>
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
											<th colspan="8" style="text-align: center;"><u>Production Order ID</u>:&nbsp;${productionId}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<u>Product Name </u>&nbsp;:${pName}</th>
										</tr>
										<tr>
                                            <th>Sr No</th>
                                            <th>Product</th>
                                            <th>Description</th>   
                                            <th>Re. Qty</th>                                         
                                            <th>Total Quantity</th>                                                                                    
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
                                   <c:forEach items="${rawMaterialList}" var="rawMaterialList">
                                        <tr class="odd gradeX">
                                            <td>${rawMaterialList.srno}</td>
                                            <td>${rawMaterialList.productName}</td>
                                            <td>${rawMaterialList.desc}</td> 
                                            <td>${rawMaterialList.reqty}</td>                                             
                                           	<td>${rawMaterialList.quantity}</td>                                           	
                                        </tr>
                                        
                                     </c:forEach>
                                      </tbody>
											</tbody>
										</table>							
							</div>
						</div>
						</div>
						</div>
		             
	</form:form>
</body>
</html>