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
	var custID = document.getElementById("selectCustomer").value;
	var frmdate=document.getElementById("dp1").value;
    var todate=document.getElementById("dp2").value;
		var xmlhttp;
		if (window.XMLHttpRequest) {
			xmlhttp = new XMLHttpRequest();
		} else {
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
					document.getElementById("CustomerOrder").innerHTML = xmlhttp.responseText;
				}
			}
		}
			xmlhttp.open("GET", "retrivecustpending.do?custID=" + custID + "&frmdate=" + frmdate + "&todate=" + todate, true);
		xmlhttp.send();
	}
</script><link href="<c:url value="/resources/datepicker/css/datepicker.css"  />"  rel="stylesheet" type="text/css"/>	
	<script type="text/javascript">
                $(document).ready(function () {            	
                $('#dp1').datepicker({
                    format: "yyyy-mm-dd"
                });
                $('#dp2').datepicker({
                    format: "yyyy/mm/dd"
                });
                
                $( document).ready(function() {
                 	  $('#dp1').datepicker({ format: "yyyy-mm-dd" }).on('changeDate', function(ev){
                 	    $(this).datepicker('hide');
                 	});
                 	});
                $( document).ready(function() {
               	  $('#dp2').datepicker({ format: "yyyy/mm/dd" }).on('changeDate', function(ev){
               	    $(this).datepicker('hide');
               	});
               	});
            });
             	</script>
</head>	
<body>
<div id="wrapper">
 <%@include file="../header.jsp" %>
<div class="page-wrapper">							
<%@include file="innerHeader.jsp"%>	
<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="col-md-8">
								<ul class="breadcrumb">
									<li class="active"><small>CustomerWise Pending Order</small>
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
										<div class="col-md-3">
											<select name="selectCustomer" class="form-control" style="width: 150px;" id="selectCustomer">										
												<option value="">Customer Name</option>
												<c:forEach items="${customers}" var="customerList"> 
												<option value="${customerList.txtCustID}">${customerList.txtCustName}</option>
												</c:forEach>
											</select>
										</div>
										<div class="col-md-2">
											<input type="text" name="frmdate" id="dp1" class="form-control" placeholder="From Date">
										</div>
										<div class="col-md-2">
											<input type="text" name="todate" id="dp2" class="form-control" placeholder="To Date">
										</div>
										<div class="col-md-1">
											<input type="button" onclick="showDetails();" value="Search" class="btn btn-primary">
										</div>
										<div class="col-md-2">
											<!-- <input type="button" class="btn btn-primary" onclick="tableToExcel('testTable', '')" value="Export to Excel"> -->
										</div>
									</div>
								</div><br>
						</div>
			</div>
			<%-- <div class="col-md-12">
<div class="panel panel-default">
<div class="panel-body">
<div class="row">
<div>
<div class="col-md-1"><label>Customer&nbsp;: </label></div>
<div class="col-md-3">
<select name="selectCustomer" class="form-control" style="width: 150px;" id="selectCustomer">										
												<option value="">---Select---</option>
												<c:forEach items="${customers}" var="customerList"> 
												<option value="${customerList.txtCustID}">${customerList.txtCustName}</option>
												</c:forEach>
											</select>
</div>
<div class="col-sm-1"><label>Start&nbsp;Date&nbsp;: </label></div>
<div class="col-sm-2">
<input type="text" name="frmdate" id="dp1" class="form-control">
</div>
<div class="col-sm-1"><label>End&nbsp;Date&nbsp;: </label></div>	
<div class="col-sm-2">
<input type="text" name="todate" id="dp2" class="form-control">
</div>
</div> 
<div class="col-md-1">
<input type="button" onclick="showDetails();" value="Go" class="btn btn-default">
</div>
<br><br><br>
<div align="right">
     	  <input type="button" class="btn btn-primary btn-xs" onclick="tableToExcel('testTable', '')" value="Export to Excel">
     	  <a href="#"><img alt="" src="<c:url value="/resources/images/filetype_pdf.ico" />" width="25px" height="25px"></a>
     	  <a href="#"><img alt="" src="<c:url value="/resources/images/e_mail.ico" />" width="25px" height="25px"></a>
   	 </div>
</div>	
</div>
</div>
</div> --%>

				<br>
			<div class="col-md-12">
			<div class="panel panel-default">                       
                        <div class="panel-body">
                        <div id="CustomerOrder">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example1">
                                    <thead>
                                        <tr>
                                        <th>Date</th>
                                            <th>Sales Order</th>
                                            <th>Product</th>
                                            <th>Quantity</th>
                                            <th>Executed</th>
                                             <th>UnExecuted</th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                    
                                    <c:forEach items="${customerList}" var="customerList">
                                        <tr class="odd gradeX"> 
                                        <td>${customerList.txtDate}</td>
                                            <td>${customerList.txtSOID}</td>
                                            <td>${customerList.product}</td>
                                            <td>${customerList.quantity}</td>
                                            <td>0.0</td>
                                            <td>${customerList.quantity}</td>
                                            
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
                