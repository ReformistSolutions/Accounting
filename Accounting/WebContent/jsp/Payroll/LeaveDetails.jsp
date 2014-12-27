<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Leave Details</title>
<link rel="icon" href="<c:url value="/resources/images/favicon.ico" />" type="image/icon">
<link href="<c:url value="resources/css/bootstrap.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/css/sb-admin.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/css/table.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/css/font-awesome.min.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="resources/assets/css/main.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="resources/assets/css/theme.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="resources/assets/css/MoneAdmin.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="resources/assets/plugins/Font-Awesome/css/font-awesome.css" />" rel="stylesheet" type="text/css">
<script src="<c:url value="http://code.jquery.com/jquery-git2.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/jspdf.debug.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/tableToExcel.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/jquery-2.0.3.min.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/dataTables/jquery.dataTables.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/dataTables/dataTables.bootstrap.js" />" type="text/javascript"></script>
<script>     
$(document).ready(function () {
    $('#dataTables-example1').dataTable();
    $('#dataTables-example2').dataTable();
    $('#dataTables-example3').dataTable();
    $('#dataTables-example4').dataTable();
});
</script>
<script type="text/javascript">
function backs()
{
	window.history.back();
}
</script>
</head>
<script type='text/javascript'>
function htmltopdf() {
    var pdf = new jsPDF('p', 'pt', 'letter');
    source = $('#htmlexportPDF')[0]; //table Id
    specialElementHandlers = { 
        '#bypassme': function (element, renderer) {
            return true
        }
    };
    margins = { //table margins and width
        top: 80,
        bottom: 60,
        left: 40,
        width: 522
    };
    pdf.fromHTML(
    source, 
    margins.left,
    margins.top, { 
        'width': margins.width, 
        'elementHandlers': specialElementHandlers
    },
    function (dispose) {
        pdf.save('Employee Leave Card.pdf'); //Filename
    }, margins);
}
</script>
<script type="text/javascript">
function getIds(empId,leaveID)
{			
	document.getElementById("txtempId").value = empId;
	document.getElementById("leaveId").value = leaveID;
}
</script>
<script type="text/javascript">
function saveRejection()
{
	var empdId = document.getElementById("empd").value;
	var leaveId = document.getElementById("leaveid").value;
	var reason = document.getElementById("rejection").value;
	var xmlhttp;
	if (window.XMLHttpRequest)
	  {
	  xmlhttp=new XMLHttpRequest();
	  }
	else
	  {
	  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	  }
	xmlhttp.onreadystatechange=function()
	  {
	  if (xmlhttp.readyState==4 && xmlhttp.status==200)
	    {	    
	    //document.getElementById("showDept").innerHTML=xmlhttp.responseText;
	    //window.location.reload();
		  window.history.back();
	    }
	  }
	xmlhttp.open("GET","rejectLeave.do?empid="+empdId+"&leaveid="+leaveId+"&reason="+reason+"",true);
	xmlhttp.send();
}
</script>
<body style="overflow-x: hidden;">
	<div id="wrapper">
		<%@include file="../header.jsp"%>
		<div class="page-wrapper">
		<!-- <div class="container"> -->
				<%@include file="innerHeader.jsp"%>
				<br>
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="col-md-8">
								<ul class="breadcrumb">
									<li class="active"><small></small>Leave&nbsp;Details
								</ul>
							</div>
							<div class="col-md-4"><a href="leaveApplication.do"> <button type="button" class="btn btn-primary " value="" data-toggle="tooltip" data-placement="top" title="Leave Application"><small></small>Leave&nbsp;Application</button></a>
							<a href="payroll.do" class="btn btn-primary btn-large" data-toggle="tooltip" data-placement="top" title="Back"> Back</a>
							<!-- <button name="back" class="btn btn-primary btn-large" onclick="backs();"><i class="fa fa-reply"></i> Back</button> -->
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
					<c:if test="${approve==1}">
					<div class="col-md-12">
					<div class="alert alert-success" role="alert" id="success">${msg}</div>
					</div>	
					<script type="text/javascript">	
					  $('#success').fadeOut(4000, function() 
					{
					  });
					</script>
					</c:if>
					<c:if test="${approve==0}">
					<div class="col-md-12">
					<div class="alert alert-danger" role="alert" id="failure">${msg}</div>
					</div>
					<script type="text/javascript">	
					  $('#failure').fadeOut(4000, function() 
					{
					  });
					</script>
					</c:if>
					<c:if test="${reject==1}">
					<div class="col-md-12">
					<div class="alert alert-success" role="alert" id="success">${msg}</div>
					</div>	
					<script type="text/javascript">	
					  $('#success').fadeOut(4000, function() 
					{
					  });
					</script>
					</c:if>
					<c:if test="${reject==0}">
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
				<form:form action="" modelAttribute="">
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-body">
							<ul class="nav nav-tabs">
								<li class="active"><a href="#tab1" data-toggle="tab" data-toggle="tooltip" data-placement="top" title="Leave Request">Employee Leave Request</a></li>
								<li><a href="#tab2" data-toggle="tab" data-toggle="tooltip" data-placement="top" title="Leave Card">Employee Leave Card</a></li>
								<li><a href="#tab3" data-toggle="tab" data-toggle="tooltip" data-placement="top" title="Leave Approved">Employee Leave Approved</a></li>
								<li><a href="#tab4" data-toggle="tab" data-toggle="tooltip" data-placement="top" title="Leave Rejected">Employee Leave Rejected</a></li>
							</ul>
							<div class="tab-content">
								<div class="tab-pane fade in active" id="tab1">
									<div class="table-responsive">
														<table class="table table-striped table-bordered table-hover" id="dataTables-example1">
															<thead>
																<tr>
																	<th>Employee Name</th>																	
																	<th>Date of Application</th>
																	<th>Leave Type</th>																	
																	<th>No of Days</th>
																	<th>From Date</th>
																	<th>To Date</th>
																	<th>Reason</th>
																	<th>Action</th>
																</tr>
															</thead>
															<tbody>
																<c:forEach items="${leaveDetailsList}" var="leaveDetailsList">
																	<tr>																		
																		<td>${leaveDetailsList.txtempName}</td>
																		<td>${leaveDetailsList.txtDateApplication}</td>
																		<td>${leaveDetailsList.txtLeavetype}</td>
																		<td>${leaveDetailsList.txtNoDays}</td>
																		<td>${leaveDetailsList.txtfrmDate}</td>
																		<td>${leaveDetailsList.txttoDaate}</td>
																		<td>${leaveDetailsList.txtReason}</td>
																		<td>
																			<div class="btn-group">
																			<input type="hidden" name="txtempId" value="${leaveDetailsList.txtempId}">
																			<input type="hidden" name="leaveId" value="${leaveDetailsList.leaveId}">
																			  <button data-toggle="dropdown" class="btn dropdown-toggle btn-xs">Action <span class="caret"></span></button>
																			  <ul class="dropdown-menu">
																			  	<li><a href="approveLeave.do?empid=${leaveDetailsList.txtempId}&leaveid=${leaveDetailsList.leaveId}" data-toggle="tooltip" data-placement="top" title="Approve">Approve</a></li>
																			  	<li><a data-toggle="modal" href="#basic" onclick="getIds('${leaveDetailsList.txtempId}','${leaveDetailsList.leaveId}');" data-toggle="tooltip" data-placement="top" title="Reject">Reject</a></li>
																				<%-- <li><a href="rejectLeave.do?empid=${leaveDetailsList.txtempId}&leaveid=${leaveDetailsList.leaveId}">Reject</a></li> --%>
																			  </ul>
																			 </div>
															  			</td>
																	</tr>
																</c:forEach>
															</tbody>
														</table>
													</div>
								</div>							
								<div class="tab-pane fade" id="tab2">
									<div align="right">
										<input type="button" class="btn btn-primary btn-xs" onclick="tableToExcel('testTable', 'Employee Leave Card')" value="Export to Excel" data-toggle="tooltip" data-placement="top" title="Export to Excel">
										<input type="button" class="btn btn-primary btn-xs" onclick="javascript:htmltopdf();" value="Export to PDF" data-toggle="tooltip" data-placement="top" title="Export to PDF">
									</div>
					  					<br> 
							 			<div class="table-responsive" id="htmlexportPDF"> <!-- id="dataTables-example2" --><!-- id="exportPDF" --> <!-- id="testTable" -->
														<table class="table table-striped table-bordered table-hover"  id="testTable">	
															<thead>
																<tr>
																	<th>Employee Id</th>
																	<th>Employee Name</th>
																	<!-- <th>Leave Type</th> -->
																	<th>Total Leaves</th>
																	<th>Total Used</th>
																	<th>Leaves Pending</th>
																	<!-- <th>Status</th> -->
																</tr>
															</thead>
															<tbody>									
															<%-- <c:if test="${approve}"> --%>						
																	<c:forEach items="${approvelist}" var="approvelist">
																	<tr>
																		<td>${approvelist.employeeid}</td>
																		<td>${approvelist.empid}</td>
																		<%-- <td>${approvelist.leaveid}</td> --%>
																		<td>${approvelist.total}</td>
																		<td>${approvelist.leavetaken}</td>
																		<td>${approvelist.leavebal}</td>
																		<%-- <td>${approvelist.status}</td> --%>
																	</tr>
																</c:forEach>
															<%-- </c:if> --%>
																<%-- <c:forEach items="${countLeaves}" var="countLeaves">
																	<tr>
																		<td>${countLeaves.leaveid}</td>
																		<td>${countLeaves.empid}</td>
																		<td>${countLeaves.total}</td>
																		<td>${countLeaves.leavetaken}</td>
																		<td>${countLeaves.leavebal}</td>																																			
																	</tr>
																</c:forEach> --%>
															</tbody>
														</table>
													</div>												
										</div>
										<div class="tab-pane fade" id="tab3">
									<div class="table-responsive">
														<table class="table table-striped table-bordered table-hover" id="dataTables-example3">
															<thead>
																<tr>
																	<th>Employee Name</th>																	
																	<th>Date of Application</th>
																	<th>Leave Type</th>																	
																	<th>No of Days</th>
																	<th>From Date</th>
																	<th>To Date</th>
																	<th>Reason</th>
																	<th>Status</th>
																</tr>
															</thead>
															<tbody>
																<c:forEach items="${approveLeaves}" var="approveLeaves">
																	<tr>																		
																		<td>${approveLeaves.txtempName}</td>
																		<td>${approveLeaves.txtDateApplication}</td>
																		<td>${approveLeaves.txtLeavetype}</td>
																		<td>${approveLeaves.txtNoDays}</td>
																		<td>${approveLeaves.txtfrmDate}</td>
																		<td>${approveLeaves.txttoDaate}</td>
																		<td>${approveLeaves.txtReason}</td>
																		<td>${approveLeaves.txtApprovStatus}</td>
																	</tr>
																</c:forEach>
															</tbody>
														</table>
													</div>
								</div>
								<div class="tab-pane fade" id="tab4">
									<div class="table-responsive">
														<table class="table table-striped table-bordered table-hover" id="dataTables-example4">
															<thead>
																<tr>
																	<th>Employee Name</th>																	
																	<th>Date of Application</th>
																	<th>Leave Type</th>																	
																	<th>No of Days</th>
																	<th>From Date</th>
																	<th>To Date</th>
																	<th>Reason for Rejection</th>
																	<th>Status</th>
																</tr>
															</thead>
															<tbody>
																<c:forEach items="${rejectedLeaves}" var="rejectedLeaves">
																	<tr>
																		<td>${rejectedLeaves.txtempName}</td>
																		<td>${rejectedLeaves.txtDateApplication}</td>
																		<td>${rejectedLeaves.txtLeavetype}</td>
																		<td>${rejectedLeaves.txtNoDays}</td>
																		<td>${rejectedLeaves.txtfrmDate}</td>
																		<td>${rejectedLeaves.txttoDaate}</td>
																		<td>${rejectedLeaves.txtReason}</td>
																		<td>${rejectedLeaves.txtApprovStatus}</td>
																	</tr>
																</c:forEach>
															</tbody>
														</table>
													</div>
								</div>
									<!-- </div> -->
								</div>
								</div>
							</div>
						</div>
				</form:form>
			</div>
	</div> 
<form:form cssClass="form-horizontal" action="rejectLeave.do">
<div class="modal fade" id="basic" tabindex="-1" role="basic" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
				<h4 class="modal-title">Reson for Rejection</h4>
			</div>
			<div class="modal-body">
			<br>
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-body">
				<div class="form-group">
				    <label class="col-md-5 control-label">Employee ID</label>
				    <div class="col-md-5"> 
				      <input type="text" Class="form-control" id="txtempId" name="txtempId" readonly="readonly">
				    </div>
				</div>
				<div class="form-group">
				    <label class="col-md-5 control-label">Leave ID</label>  
				    <div class="col-md-5"> 
				      <input type="text" Class="form-control" id="leaveId" name="leaveId" readonly="readonly">
				    </div>
				 </div>
				<div class="form-group">
				    <label class="col-md-5 control-label">Reason for Rejection</label>
				    <div class="col-md-6">
				      <textarea rows="" cols="" name="rejection" id="rejection" class="form-control"></textarea>
				    </div>
				  </div>
				 <!--  <div class="form-group">
				    <div class="col-md-offset-4 col-md-10">
				      <button type="submit" class="btn btn-primary">Reject</button>
				      <button type="button" class="btn btn-primary">Cancel</button>
				    </div>
				  </div> -->
			</div>
			</div>
			</div>
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-primary" data-toggle="tooltip" data-placement="top" title="Reject">Reject</button>
				<button type="button" class="btn btn-default" data-dismiss="modal" data-toggle="tooltip" data-placement="top" title="Close">Close</button>				
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
</form:form>
</body>
</html>