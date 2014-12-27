<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Sales Register</title>
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
			doc.text(245, 50, "Sales Register");
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
				doc.save("Sales-Register.pdf");
			};
		</script>

<script type="text/javascript">
	function backs() {
		window.history.back();
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
									<li class="active"><small>Sales Register</small>
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
			<div class="panel panel-default">
						<div class="panel-body">
							<div class="row">
							<div class="col-md-12">	
						   		 <div class="col-md-2 pull-right"> <!-- javascript:htmltopdf(); -->
						   		   		<a href="#" onclick="generate();"><img src="<c:url value="/resources/images/PDF-icon.png" />" height="30" width="30"></img></a>
						   		   		<a href="#" onclick="tableToExcel('testTable', '')"><img src="<c:url value="/resources/images/excel-icon.png" />" height="33" width="35"></img></a>
						   		   </div> 
						   </div>
						</div>
						</div>
			</div></div>
			<br>
			<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="panel panel-default" id="testTable">				         
				                <div class="panel-heading"><center>Sales Register</center><br><center> As On 24 September 2014</center> </div>	
								<div class="table-responsive">
                                <table border="1" id="testTable1" width="820" class="table table-striped table-bordered table-hover">
                                    <thead>
                                        <tr>
                                       		<th width="100" style="text-align: center;">Date</th>
                                            <th width="150" style="text-align: center;">Account</th>                                           
                                            <th width="200" style="text-align: center;">Particulars</th>
                                            <th width="100" style="text-align: center;">Type</th>
                                            <th width="100" style="text-align: center;">Debit  (<i class="fa fa-inr"></i>)</th>                                                                                
                                            <th width="100" style="text-align: center;">Credit  (<i class="fa fa-inr"></i>)</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <%for(int i=1;i<=5;i++){ %>
                                    	<tr>
                                    		<td>24/09/2014</td>
                                    		<td>Sales Account</td>
                                    		<td>Goods Sales</td>
                                    		<td>Invoice</td>
                                    		<td style="text-align: right;">10000</td>
                                    		<td style="text-align: right;">10000</td>
                                    	</tr>
                                    	<%} %>
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