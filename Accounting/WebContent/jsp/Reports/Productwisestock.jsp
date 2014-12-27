<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Inventory</title>
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
<%-- <script src="<c:url value="/resources/assets/plugins/bootstrap/js/bootstrap.min.js" />" type="text/javascript"></script> --%>
<script src="<c:url value="/resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js" />" type="text/javascript"></script>
<script src="<c:url value="/resources/assets/plugins/dataTables/jquery.dataTables.js" />" type="text/javascript"></script>
<script src="<c:url value="/resources/assets/plugins/dataTables/dataTables.bootstrap.js" />" type="text/javascript"></script>
     <script>
         $(document).ready(function () {
             $('#dataTables-example1').dataTable();
              });
    </script>
    <script type="text/javascript">
	function backs() {
		window.history.back();
	}

</script>

<script type="text/javascript">
function showDetails()
{
		var productType = document.getElementById("productname").value;
		var xmlhttp;
		if (window.XMLHttpRequest) {
			xmlhttp = new XMLHttpRequest();
		} else {
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
					document.getElementById("showproductdetails").innerHTML = xmlhttp.responseText;
				}
			}
		}
			xmlhttp.open("GET", "retriveProductwise.do?productType=" + productType , true);
		xmlhttp.send();
	}
</script>
</head>	
<body style="overflow-x: hidden;"> 
<div id="wrapper">
 <%@include file="../header.jsp" %>
<div class="page-wrapper">							
<%@include file="innerHeader.jsp"%>	
<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="col-md-8">
								<ul class="breadcrumb">
									<li class="active"><small>Product Stock</small>
								</ul>
							</div>
							<div class="col-md-3">
							<button name="back" class="btn btn-primary btn-large" onclick="backs()"><i class="fa fa-reply"></i> Back</button>	
        					 </div>
						</div>
					</div>
				</div>
			<br>
			<div class="col-md-12">
						<div class="panel panel-info">
							<div class="panel-heading">
								<h4 class="panel-title">Filter</h4>
							</div>
								<div class="row">
									<div class="form-group">
										<br />
										<div class="col-md-1"></div>
										<div class="col-md-4">
											<select name="productname" class="form-control" style="width: 150px;" id="productname" >										
												<option value="Select">Select Product</option>
												<c:forEach items="${prodID}" var="prodID">
											<option value="${prodID.productCode}">${prodID.txtName}</option>
										</c:forEach>
											</select>
										</div>
										<div class="col-md-1">
											<input type="button" onclick="showDetails();" value="Search" class="btn btn-primary">
										</div>										
									</div>
								</div><br>
						</div>
			</div>
			<%-- <div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-body">
							
							<div class="col-md-4"> 
											<label>Product Name:-</label>
										</div>
										<div class="col-md-4">   
											<select name="productname" class="form-control" style="width: 150px;" id="productname" >										
												<option value="Select">---Select---</option>
												<c:forEach items="${prodID}" var="prodID">
											<option value="${prodID.productCode}">${prodID.txtName}</option>
										</c:forEach>
											</select>
										</div> 
										
										<div class="col-md-4">
   	    	 <div class="col-md-4"><input type="button" class="form-control" value="GO" onclick="showDetails();"> </div>
   	    <!--  </div>
   	    <div class="col-md-2 pull-right">
   	     -->	 <a href="#"><img src="<c:url value="/resources/images/PDF-icon.png" />" height="30" width="30"></img></a>
   	    	 <a href="#"><img src="<c:url value="/resources/images/excel-icon.png" />" height="33" width="35"></img></a>
   	    </div>
						</div>
					</div>
				</div> --%>
			<div class="col-md-12">
			<div class="panel panel-default">                       
                        <div class="panel-body">
                            <div id="showproductdetails">
                        
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example1">
                                    <thead>
                                        <tr>
                                        <th>Product Code</th>
                                            <th>Item Name</th>
                                            <th>Unit of Measure</th>
                                            <th>Reorder Level</th>
                                            <th>Quantity</th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                    
                                    <c:forEach items="${showproductlists}" var="showProductList">
                                        <tr class="odd gradeX">
                                        <td>${showProductList.productCode}</td>
                                            <td>${showProductList.txtName}</td>
                                             
                                            <td>${showProductList.txtUnitOfMeasure}</td>
                                           
                                            <td>${showProductList.txtReorderlevel}</td>
                                            <td>${showProductList.txtOpeningStock}</td>
                                             
                                            
                                        </tr>
                                        </c:forEach>
                                        </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                </div>
                </div>
                </div>
                </body>
                </html>
                