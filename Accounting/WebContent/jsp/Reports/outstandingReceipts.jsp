<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	 <%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,java.text.*" %>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Outstanding Receipts</title>
<link rel="icon" href="<c:url value="/resources/images/favicon.ico" />"	type="image/icon">
<link href="<c:url value="resources/css/bootstrap.css" />"	rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/css/sb-admin.css" />"	rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/css/table.css" />" rel="stylesheet"	type="text/css" />
<link href="<c:url value="resources/css/table.css" />" rel="stylesheet" 	type="text/css" />
<link href="<c:url value="resources/css/font-awesome.min.css" />" 	rel="stylesheet" type="text/css">
<link href="<c:url value="resources/assets/css/main.css" />" 	rel="stylesheet" type="text/css">
<link href="<c:url value="resources/assets/css/theme.css" />"	rel="stylesheet" type="text/css">
<link href="<c:url value="resources/assets/css/MoneAdmin.css" />" 	rel="stylesheet" type="text/css">
<link href="<c:url value="resources/assets/plugins/Font-Awesome/css/font-awesome.css" />" 	rel="stylesheet" type="text/css">
<script src="<c:url value="resources/assets/plugins/jquery-2.0.3.min.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js" />" type="text/javascript"></script>
<link href="<c:url value="/resources/datepicker/css/datepicker.css"  />"  rel="stylesheet" type="text/css"/>	
 <script src="<c:url value="resources/assets/plugins/tableToExcel.js" />" type="text/javascript"></script>
<script src="<c:url value="http://code.jquery.com/jquery-git2.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/jspdf.debug.js" />" type="text/javascript"></script>

<script src="<c:url value="resources/assets/pdf/jspdf.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/pdf/libs/Deflate/adler32cs.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/pdf/libs/FileSaver.js/FileSaver.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/pdf/libs/Blob.js/BlobBuilder.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/pdf/jspdf.plugin.table.js" />" type="text/javascript"></script>

<script>
var today = new Date();
var dd = today.getDate();
var mm = today.getMonth()+1; //January is 0!
var yyyy = today.getFullYear();

if(dd<10) {
    dd='0'+dd;
} 

if(mm<10) {
    mm='0'+mm;
} 
today = dd+'/'+mm+'/'+yyyy;//Current Date
			var data = [], fontSize = 12, height = 0, doc;
			doc = new jsPDF('p', 'pt', 'a4', true);
			doc.setFont("times", "normal");
			doc.setFontSize(fontSize);
			doc.text(230, 50, "Outstanding Receipts");
			doc.text(235, 65, "As On  "+today);
			function generate() {
				data = doc.tableToJson('testTable1');
				height = doc.drawTable(data, {
					xstart : 15,
					ystart : 20,
					tablestart : 100,
					marginleft : 60
				});
				//doc.text(50, height + 20, 'hi world');
				doc.save("Outstanding-Receipts.pdf");
			};
		</script>

<script type="text/javascript">
            // When the document is ready
            $(document).ready(function () {
            	
                $('#fromDt').datepicker({
                	format: "yyyy/mm/dd"
                });
            });
			$(document).ready(function () {
            	
                $('#toDt').datepicker({
                	format: "yyyy/mm/dd"
                });
            });
            $( document ).ready(function() {
          	  $('#fromDt').datepicker({ format: "yyyy/mm/dd" }).on('changeDate', function(ev){
          	    $(this).datepicker('hide');
          	}); 
          	});
          $( document ).ready(function() {
          	  $('#toDt').datepicker({ format: "yyyy/mm/dd" }).on('changeDate', function(ev){
          	    $(this).datepicker('hide');
          	});
          	});
    </script>
<script type="text/javascript">
	function backs() {
		window.history.back();
	}
	function beingDevelope()
	{
		alert("This Functionality is Under Construction");
	}
</script>


<!-- <script type='text/javascript'>
            function htmltopdf() {
                var pdf = new jsPDF('p', 'pt', 'A4');
                source = $('#testTable')[0]; //table Id
                specialElementHandlers = { 
                    '#bypassme': function (element, renderer) {
                        return true
                    }
                };
                margins = { //table margins and width
                    top: 60,
                    bottom: 40,
                    left: 20,
                    width: 1000
                };
                pdf.fromHTML(
                source, 
                margins.left,
                margins.top, { 
                    'width': margins.width, 
                    'elementHandlers': specialElementHandlers
                },

                function (dispose) {
                    pdf.save('Outstanding Receipts.pdf'); //Filename
                }, margins);
            }

        </script> -->
<script>
function showOsReceipts()
{  
	var custId=document.getElementById("custId").value;
	var frmDate=document.getElementById("fromDt").value;
	var toDate=document.getElementById("toDt").value;
var xmlhttp; 
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    document.getElementById("osReceipts").innerHTML=xmlhttp.responseText;
    }
  }
xmlhttp.open("GET","retrieveOsReceipts.do?custId="+custId+"&frmDate="+frmDate+"&toDate="+toDate,true);
xmlhttp.send();
}
</script>
</head>
<body style="overflow-x: hidden;">
	<div id="wrapper">
		<%@include file="../header.jsp"%>
		<div class="page-wrapper">
		<%@include file="innerHeader.jsp"%>
			<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="col-md-10">
								<ul class="breadcrumb">
									<li class="active"><small>Outstanding Receipts</small>
								</ul>
							</div>
							
							<div class="col-md-2">
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
											<select name="custId" id="custId" class="form-control">
						   		   			<option value="">Customer Name</option>
						   		   			<c:forEach items="${customerList}" var="customerList"> 
												<option value="${customerList.txtCustID}">${customerList.txtCustName}</option>
											</c:forEach>						   		   			
						   		   		</select>
										</div>
										<div class="col-md-2">
											<input type="text" name="frmDt" id="fromDt" class="form-control" placeholder="From Date">
										</div>
										<div class="col-md-2">
											<input type="text" name="toDt" id="toDt" class="form-control" placeholder="To Date">
										</div>
										<div class="col-md-1">
											<a href="#" onclick="showOsReceipts();"><img src="<c:url value="/resources/images/search.png" />" height="33" width="35"></img></a>
										</div>										
										<div class="col-md-2">
											<a href="#" onclick="generate();"><img src="<c:url value="/resources/images/PDF-icon.png" />" height="30" width="30"></img></a>
						   		   		<a href="#" onclick="tableToExcel('testTable', '')"><img src="<c:url value="/resources/images/excel-icon.png" />" height="33" width="35"></img></a>
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
								<div class="col-md-1">Customer</div> 
						   		  <div class="col-md-2">
						   		   		<select name="custId" id="custId" class="form-control">
						   		   			<option value="">--Select--</option>
						   		   			<c:forEach items="${customerList}" var="customerList"> 
												<option value="${customerList.txtCustID}">${customerList.txtCustName}</option>
											</c:forEach>						   		   			
						   		   		</select>
						   		   </div>
						   		  <div class="col-md-1">From&nbsp;Date</div> 
						   		  <div class="col-md-2">
						   		   		<input type="text" name="frmDt" id="fromDt" class="form-control">
						   		   </div>
						   		    <div class="col-md-1">To&nbsp;Date</div>
						   		  <div class="col-md-2">						   		    
						   		   		<input type="text" name="toDt" id="toDt" class="form-control">
						   		   </div>
						   		   <div class="col-md-1">
						   		   		<a href="#" onclick="showOsReceipts();"><img src="<c:url value="/resources/images/search.png" />" height="33" width="35"></img></a>
						   		    </div>
						   		   <div class="col-md-2 pull-right"> <!-- javascript:htmltopdf(); -->
						   		   		<a href="#" onclick="generate();"><img src="<c:url value="/resources/images/PDF-icon.png" />" height="30" width="30"></img></a>
						   		   		<a href="#" onclick="tableToExcel('testTable', '')"><img src="<c:url value="/resources/images/excel-icon.png" />" height="33" width="35"></img></a>
						   		   </div>
						   </div>
						</div>
						</div>
			</div>
			</div> --%>
			<%
				 DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");	     
			     Date date = new Date();	     
			     String dt=dateFormat.format(date);
			%>
		<%-- 	<form:form modelAttribute="invoice"> --%>
			<div class="col-md-12">
				<div id="osReceipts">
					<div class="panel panel-default" id="testTable">
						<div class="panel-body">						  
							<div class="panel panel-default">				         
				                <div class="panel-heading"><center>Outstanding Receipts</center><br><center> As On <%=dt%></center> </div>	
								<div class="table-responsive">
                                <table border="1" id="testTable1" width="820" class="table table-striped table-bordered table-hover">
                                    <thead>
                                        <tr>
                                       		<th width="50" style="text-align: center;">Invoice</th>
                                            <th width="200" style="text-align: center;">Customer Name</th>                                           
                                            <th width="50" style="text-align: center;">Date</th>
                                            <th width="50" style="text-align: center;">Due Date</th>
                                            <th width="90" style="text-align: center;">Pending Amt   (<i class="fa fa-inr"></i>)</th>                                                                                
                                            <th width="50" style="text-align: center;">Extra Days</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${outsReceiptList}" var="outsReceiptList">
                                    	<tr>
                                    		<td>${outsReceiptList.txtInvID}</td>
                                    		<td>${outsReceiptList.txtCName}</td>
                                    		<td>${outsReceiptList.txtDate}</td>
                                    		<td>${outsReceiptList.txtDueDate}<%-- <input type="text" value="${outsReceiptList.txtDueDate}"> --%></td>
                                    		<td style="text-align: right;">${outsReceiptList.balance}</td>
                                    		<c:choose>
                                    			<c:when test="${outsReceiptList.dateDiff >=1}">
                                    				<td style="text-align: right;">${outsReceiptList.dateDiff}</td>
                                    			</c:when>
                                    			<c:otherwise>
                                    				<td style="text-align: right;">-</td>
                                    			</c:otherwise>
                                    		</c:choose>
                                    		
                                    	</tr>   
                                    	</c:forEach>                            	
                                    	<tr style="border-collapse: collapse;">
                                    	<td></td>
                                    	<td></td>
                                    	<td></td>
                                    		<td style="text-align: right;">Total</td>
                                    		<td style="text-align: right;text-decoration: underline;"> ${outsReceiptTotal}</td>
                                    		<td></td>
                                    	</tr>
                                    </tbody>
                                </table>
                            </div>
							</div>   
						</div>
					</div>
					</div>
			</div>
	<%-- 		</form:form> --%>
		</div>
	</div>
	<script src="<c:url value="/resources/datepicker/js/bootstrap-datepicker.js" />"></script>
</body>
</html>