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
<link href="<c:url value="/resources/datepicker/css/datepicker.css"  />"  rel="stylesheet" type="text/css"/>	
	<script type="text/javascript">
                $(document).ready(function () {            	
                $('#dp1').datepicker({
                    format: "yyyy-mm-dd"
                });
                $('#dp2').datepicker({
                    format: "yyyy/mm/dd"
                });
                
                $( document).ready(function() {
                 	  $('#frmDt').datepicker({ format: "yyyy-mm-dd" }).on('changeDate', function(ev){
                 	    $(this).datepicker('hide');
                 	});
                 	});
                $( document).ready(function() {
               	  $('#toDt').datepicker({ format: "yyyy/mm/dd" }).on('changeDate', function(ev){
               	    $(this).datepicker('hide');
               	});
               	});
            });
             	</script>
             	
             	<script type="text/javascript">
function showDetails()
{
		var fromdate = document.getElementById("frmDt").value;
		//alert("fromdate"+fromdate);
		var todate = document.getElementById("toDt").value;
		//alert("todate"+todate);
		var xmlhttp;
		if (window.XMLHttpRequest) {
			xmlhttp = new XMLHttpRequest();
		} else {
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
					document.getElementById("stocktransfer").innerHTML = xmlhttp.responseText;
				}
			}
		}
		/* xmlhttp.open("GET", "retrivestockwastage.do?fromdate=" + fromdate + "&todate="+ todate, true); */
		xmlhttp.open("GET", "retriveTransferstock.do?fromdate=" + fromdate + "&todate=" + todate, true);
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
									<li class="active"><small>Stock Transfers</small>
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
										
										<div class="col-md-2">
											<input type="text" name="frmDt" id="frmDt" class="form-control" placeholder="From Date">
										</div>
										<div class="col-md-2">
											<input type="text" name="toDt" id="toDt" class="form-control" placeholder="To Date">
										</div>
										<div class="col-md-1">
											<input type="button" class="btn btn-primary" value="Search" onclick="showDetails();">
										</div>
										
									</div>
								</div><br>
						</div>
			</div>
			<%-- <div class="col-md-12">
<div class="panel panel-default">
<div class="panel-body">
<div class="row">
<div class="col-md-12">	
   	   <div class="col-md-2">From Date</div> 
   	   <div class="col-md-2">
   	    	 <input type="text" name="frmDt" id="frmDt" class="form-control">
   	    </div>
   	     <div class="col-md-2">To Date</div>
   	   <div class="col-md-2">	    	     
   	    	 <input type="text" name="toDt" id="toDt" class="form-control">
   	    </div>
   	    <div class="col-md-4">
         <div class="col-md-4"><input type="button" class="form-control" value="GO" onclick="showDetails();"> </div> 
   	    	 <a href="#"><img src="<c:url value="/resources/images/PDF-icon.png" />" height="30" width="30"></img></a>
   	    	 <a href="#"><img src="<c:url value="/resources/images/excel-icon.png" />" height="33" width="35"></img></a>
   	    </div>
   </div>
</div>
</div>
</div></div> --%>
			<div class="col-md-12">
			<div class="panel panel-default">                       
                        <div class="panel-body">
                        <div id="stocktransfer">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example1">
                                    <thead>
                                        <tr>
                                            <th>Voucher No</th>
                                            <th>Voucher Date</th>
                                            <th>Product</th>
                                            <th>Quantity</th>
                                            <th>Destination Warehouse</th>
                                            <th>Description</th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                    
                                    <c:forEach items="${stocktransfer}" var="stocktransfer">
                                        <tr class="odd gradeX">
                                        <td>${stocktransfer.stktrnvno}</td>
                                        <td>${stocktransfer.stktrnvdate}</td>
                                        <td>${stocktransfer.stktrnproduct}</td>
                                        <td>${stocktransfer.stktrnqty}</td>
                                        <td>${stocktransfer.stktrndestwarehouse}</td>
                                        <td>${stocktransfer.stktrndesc}</td>
                                             
                                            
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
                
 <script src="<c:url value="/resources/datepicker/js/bootstrap-datepicker.js" />"></script>
                
                </body>
                </html>
                