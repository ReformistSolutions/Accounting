<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page language="java"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,java.text.*" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Breakup by Employee</title>   
<link rel="icon" href="<c:url value="/resources/images/favicon.ico" />" type="image/icon"> 
<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/css/sb-admin.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/css/table.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/css/font-awesome.min.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/assets/css/main.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/assets/css/theme.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/assets/css/MoneAdmin.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/assets/plugins/Font-Awesome/css/font-awesome.css" />" rel="stylesheet" type="text/css">
<script src="<c:url value="/resources/assets/plugins/jquery-2.0.3.min.js" />" type="text/javascript"></script>
<script src="<c:url value="/resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js" />" type="text/javascript"></script>
<script src="<c:url value="/resources/assets/plugins/dataTables/jquery.dataTables.js" />" type="text/javascript"></script>
<script src="<c:url value="/resources/assets/plugins/dataTables/dataTables.bootstrap.js" />" type="text/javascript"></script>

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
			doc.text(230, 50, "Breakup By Employee");
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
				doc.save("Breakup-By-Employee.pdf");
			};
		</script>
     
     <script>
         $(document).ready(function () {
             $('#dataTables-example').dataTable(); 
         });
    </script>
    
<script>
function goBack()
{
	window.history.back();
}
</script>
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
		<%@ include file="innerHeader.jsp" %>
		<div class="col-md-12">
						<div class="panel panel-default">
						<div class="panel-body">
						<div class="col-md-10">
						<ul class="breadcrumb">
							<li class="active"><small><i class="fa fa-2x fa-table"></i></small>&nbsp;Breakup<small>&nbsp;By Employee</small>
		             	</ul>
		             	</div>
			             	<div class="col-md-2">
			             
			             	<a href="payroll.do" class="btn btn-primary btn-large" data-toggle="tooltip" data-placement="left" title="Back"> Back</a>
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
						   		   		<%-- <a onclick="urlSubmit('breakupbyPDF.do','_blank')" title="Print"><img id="print" alt="" src="<c:url value="/resources/images/print.png" />" width="30px" height="30px"></a> --%>
						   		   		<%-- <a href="#" onclick="generate();"><img src="<c:url value="/resources/images/PDF-icon.png" />" height="30" width="30"></img></a> --%>
						   		   		<a href="#" onclick="tableToExcel('testTable', '')">Export to Excel</a>
						   		   </div> 
						   </div>
						</div>
						</div>
			</div></div><br>	
				<form:form action="" cssClass="form-inline" modelAttribute="breakupByEmployee">
					<br> 					
					 <%
					 
								DateFormat dateFormat4 = new SimpleDateFormat("MM");	     
								Date date4 = new Date();	     
								String mm=dateFormat4.format(date4);
								
					%>	
		             	<div class="col-md-12">
		             		<div class="panel panel-default" id="testTable">
		             			<div class="panel-body">
		             			<h4 align="center">Breakup by Employee</h4>
		             			<h6 align="center">For Month <%=mm %></h6>

							<h5 align="left">Breakup by Salary</h5>
							<div class="table-responsive">
								<table class="table table-bordered" id="testTable1">
									<thead>
										<tr>
											<th>Name</th>
											<c:forEach items="${payhedList}" var="payhedList">
												<th>${payhedList.payheadid}</th>
											</c:forEach>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${empList}" var="payamtListName">
											<tr>
												<td>${payamtListName.txtfname}</td>
												<c:forEach items="${payamtList}" var="payamtList">
													<c:choose>
														<c:when test="${payamtListName.empId==payamtList.empid}">
															<td>${payamtList.payamt}</td>
														</c:when>
													</c:choose>
												</c:forEach>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<br>
							<h5 align="left">Breakup by Wages</h5>
							<div class="table-responsive">
								<table class="table table-bordered" id="testTable1">
									<thead>
										<tr>
											<th>Name</th>
											<c:forEach items="${payhedListW}" var="payhedList">
												<th>${payhedList.payheadid}</th>
											</c:forEach>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${empListW}" var="payamtListName">
											<tr>
												<td>${payamtListName.txtfname}</td>
												<c:forEach items="${payamtListW}" var="payamtList">
													<c:choose>
														<c:when test="${payamtListName.empId==payamtList.empid}">
															<td>${payamtList.payamt}</td>
														</c:when>
													</c:choose>
												</c:forEach>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<%
												DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");	     
										     	Date date = new Date();	     
										     	String dt=dateFormat.format(date);
											%>	
				                    <div>
				                    	<h5 align="right">Generated on : <%=dt %> </h5>
				                    </div>
		             			</div>
		             			
		             		</div>
		             	</div>	
				</form:form>
	</div>
</div>
</body>
</html>