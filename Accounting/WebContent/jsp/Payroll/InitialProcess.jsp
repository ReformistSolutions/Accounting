<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,java.text.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Attendances</title>   
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
<script src="<c:url value="/resources/assets/plugins/jquery-2.0.3.min.js" />" type="text/javascript"></script>
<script src="<c:url value="/resources/assets/plugins/bootstrap/js/bootstrap.min.js" />" type="text/javascript"></script>
<script src="<c:url value="/resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js" />" type="text/javascript"></script>
<link href="<c:url value="/resources/datepicker/css/datepicker.css"  />" rel="stylesheet" type="text/css"/>	
<script type="text/javascript">
$(document).ready(function () {
	
	$('#btnNext').click(function ()
	{
	   $('#mytab a[href="#tab2"]').tab('show');	   
	});
    $('#dp1').datepicker({
        format: "yyyy/mm/dd"
    });    
});
$( document ).ready(function() {
	  $('#dp1').datepicker({ format: "yyyy-mm-dd" }).on('changeDate', function(ev){
	    $(this).datepicker('hide');
	});
	});
</script>
<script type="text/javascript">
function cal(obj)
{
	var id = document.getElementById(obj).id;
	//alert('id:'+id);
	var index1 = id.indexOf("[") + 1;
	//alert('index1:'+index1);
	var index2 = id.indexOf("]");
	//alert('index2:'+index2);
	var sr = id.slice(index1,index2);
	//alert('sr:'+sr);
	var cnt = id.slice(index1,index2);
	//alert(cnt);
		var daysAbsent = document.getElementById("processpayrolllist["+cnt+"].daysAbsent").value;
		//alert("daysAbsent="+daysAbsent);
		var netSalary = document.getElementById("processpayrolllist["+cnt+"].netSalary").value;
		//alert("netSalary="+netSalary);
		var crnetSalary = (parseFloat(netSalary) / 30 ) * parseFloat(daysAbsent);
		//alert("crnetSalary="+crnetSalary);
		document.getElementById("processpayrolllist["+cnt+"].absentValue").value = crnetSalary.toFixed(2);
		var totalSalary = parseFloat(netSalary) - parseFloat(crnetSalary);
		//alert("totalSalary="+totalSalary);
		document.getElementById("processpayrolllist["+cnt+"].totalSalary").value = totalSalary.toFixed(2);
	cnt++;
	/* var daysAbsent = document.getElementById("daysAbsent"+cnt).value;
	alert("daysAbsent="+daysAbsent);
	var netSalary = document.getElementById("netSalary"+cnt).value;
	alert("netSalary="+netSalary);
	var crnetSalary = (parseFloat(netSalary) / 30 ) * parseFloat(daysAbsent);
	alert("crnetSalary="+crnetSalary);
	document.getElementById("absentValue"+cnt).value = crnetSalary.toFixed(2);
	var totalSalary = parseFloat(netSalary) - parseFloat(crnetSalary);
	alert("totalSalary="+totalSalary);
	document.getElementById("totalSalary"+cnt).value = totalSalary.toFixed(2);
	cnt++; */
}
</script>    
<script type="text/javascript">
function getEmpid(id)
{			
	document.getElementById("empd").value = id;
	showPayheads(id);
}
</script>
<script type="text/javascript">
function backs()
{
	window.history.back();
}
</script>
<script type="text/javascript">
function showPayheads(id)
{	
	document.getElementById("retriveVariable").innerHTML="";
	var empid = id;
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
		  var abc = xmlhttp.responseText ;
		  var innerDiv = document.createElement('div');
		  innerDiv.id="linkedDiv";
		  innerDiv.innerHTML = abc;
		 document.getElementById("retriveVariable").appendChild(innerDiv);
	    }
	  }
	xmlhttp.open("GET","retriveVeriables.do?empid="+empid,true);
	xmlhttp.send();	
}
</script>
</head>
<body style="overflow-x: hidden;">
<div id="wrapper">
<%@ include file="../header.jsp" %> 
	<div id="container">
		<%@ include file="innerHeader.jsp" %>
				<div class="col-md-12">	
				<div class="panel panel-default">
					<div class="panel-body">
		          	<div class="col-md-8">
			            <ol class="breadcrumb">
			             <li class="active"><i class="fa fa-inr"></i> Manage Payroll</li>             
			             </ol>
		            </div>
		            <div class="col-md-4">
		            <a href="payroll.do" class="btn btn-primary btn-large" data-toggle="tooltip" data-placement="left" title="Back"> Back</a>
	             	<!-- <button name="back" class="btn btn-primary btn-large" onclick="backs()"><i class="fa fa-reply"></i> Back</button> -->
	             	</div>
		            </div>
		         </div>
		         </div>				
					<br> 						
		             	<div class="col-md-12">
		             		<div class="panel">
		             			<div class="panel-body">
									<ul class="nav nav-tabs" id="mytab">
										<li class="active"><a href="#tab1" data-toggle="tab"><span class="badge">1</span> Enter Attendance and Variable Pay</a></li>
										<!-- <li><a href="#tab2" data-toggle="tab"><span class="badge">2</span> Review Information</a></li> -->	
										<!-- <li><a href="#tab3" data-toggle="tab"><span class="badge  badge-info">2</span> Confirm !</a></li> -->
									</ul>
									<div class="tab-content">
										<div class="tab-pane fade in active" id="tab1">
										<form:form action="salaryApplicable.do"  modelAttribute="salaryApplicable">
											<div class="row">
												<div class="col-md-6">
													<div class="row">
															<div class="col-md-6">
																<label>Account to pay From : </label>
															</div>	
															<div class="col-md-5">
																<select name="accounttoPay" class="form-control">
																<option>---Select---</option>
																<c:forEach items="${accountList}" var="accountList">																	
																	<option value="${accountList.txtNewAccNo}">${accountList.txtAccountName}</option>
																</c:forEach>
																</select>
															</div>
													</div>
												</div>
												<div class="col-md-6">
													<div class="row">
															<div class="col-md-2">
																<label>Date</label>
															</div>
															<div class="col-md-6">	
															<%
    														/* String dformat=new SimpleDateFormat("yyyy-MMM-dd EEEE").format(new java.util.Date()); */
															 DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");	     
														     Date date = new Date();	     
														     String dt=dateFormat.format(date);
															%>
															<input type="text" name="schuduleDate" value="<%=dt%>" readonly="readonly" class="form-control"> 
															</div>
														</div>
												</div>												
											</div><br>
											<div class="table-responsive">
												<table id="empDetails" class="table table-striped table-bordered">
													<thead>
														<tr>
															<th>Users/Employee</th>
															<th>Net Salary</th>
															<th>Leaves Consumed</th>
															<th>Days Absent</th>															
															<th>Action</th>
														</tr>	
													</thead>	
													<tbody>	<%int cnt=0; %>	
													<c:forEach items="${empList}" var="empList"> 
													<tr>	
														<td>
														<input type="hidden" name="processpayrolllist[<%=cnt%>].count" id="processpayrolllist[<%=cnt%>].count" value="${empList.count}">
														<input type="hidden" name="processpayrolllist[<%=cnt%>].empId" id="processpayrolllist[<%=cnt%>].empId" value="${empList.empId}" />${empList.txtfname}&nbsp;${empList.txtmname}&nbsp;${empList.txtlname}</td>
														<td><input type="hidden" name="processpayrolllist[<%=cnt%>].totalSalary" id="processpayrolllist[<%=cnt%>].totalSalary"><input type = "hidden" id="processpayrolllist[<%=cnt%>].netSalary" name="processpayrolllist[<%=cnt%>].netSalary" value="${empList.payheadtotal}">INR&nbsp;${empList.payheadtotal}</td>
														<td><input type="hidden" name="leaveConsumed" value="${empList.leavesUsed}">${empList.leavesUsed}(out of ${empList.leavesTotal})</td>
														<td><input type="hidden" name="processpayrolllist[<%=cnt%>].absentName" id="processpayrolllist[<%=cnt%>].absentName" value="Days Absent"><input type="hidden" id="processpayrolllist[<%=cnt%>].absentValue" name="processpayrolllist[<%=cnt%>].absentValue"><input type="hidden" name="processpayrolllist[<%=cnt%>].absenttype" id="processpayrolllist[<%=cnt%>].absenttype" value="Deduction"> <input type="text" onblur="cal(this.id);" id="processpayrolllist[<%=cnt%>].daysAbsent" name="processpayrolllist[<%=cnt%>].daysAbsent" class="form-control" /> </td>
														<%-- <c:choose>	
														<c:when test="${message==1}">	  
															<td> 
																<font color="green">Veriable Name Enter Successfully</font> 
															</td>	
														</c:when>
														<c:otherwise> --%>	
															<c:if test="${empList.count==1}">
																<td>
																	<font color="green">Variable Added</font>
																</td>
															</c:if>
															<c:if test="${empList.count==0}">
															<td>		
															<%-- <a data-toggle="modal" href="#basic" onclick="getValue('${empList.empId}');" >Enter Veriable</a> --%>
															<a data-toggle="modal" href="#basic" onclick="getEmpid('${empList.empId}');" data-toggle="tooltip" data-placement="top" title="Veriable">Enter Veriable</a>
															</td> 
															</c:if>
														<%-- </c:otherwise>
														</c:choose> --%>	
													</tr>													
													<%cnt++; %>
													</c:forEach>
													<!-- <tr><td>Total</td><td></td><td></td><td></td><td></td></tr> -->
													</tbody>	
												</table>	
												</div>
												<div class="row" align="center">	
													<!-- <a href="#tab2" data-toggle="tab" id="btnNext" class="btn btn-primary">Next</a> -->
													<!-- <a href="#tab2" data-toggle="tab" id="btnNext"><input type="submit" name="btn"  value="Save & Continue" id="save" class="btn btn-primary"/></a> -->
													<button type="submit" class="btn btn-primary" data-toggle="tooltip" data-placement="top" title="Process">Process Payroll</button>
													<input type="button" name="btn" value="Cancel" class="btn btn-primary" data-toggle="tooltip" data-placement="top" title="Cancel"/>
												</div>
												</form:form>	
										</div>
										<%-- <div class="tab-pane fade" id="tab3">
											<div class="row">
												<div class="col-md-5">
													<div class="row">
															<div class="col-md-5">
																<label>Account to pay From : </label>
															</div>	
															<div>${salaryApplicable.accounttoPay}</div>
													</div>
												</div>	
												<div class="col-md-5">	
													<div class="row">
															<div class="col-md-5">
																<label>Payroll Schedule Date</label>
															</div>
															<div>${salaryApplicable.schuduleDate}</div>
														</div>
												</div>												
											</div><br>
											<div class="row">
												<div class="col-md-5">	
													<label>Account to pay From : </label>
												</div>
												<div class="col-md-5">		
												${salaryApplicable.accounttoPay}															
												</div>
											</div>
											<div class="row">
												<div class="col-md-5">
													<label>Payroll Schedule Date</label>
												</div>
												<div class="col-md-5">
												${salaryApplicable.schuduleDate}
												</div>
											</div>
											<div class="table-responsive">
												<table class="table table-striped table-bordered">
													<thead>
														<tr>
															<th>For Employee</th>															
															<th>Days Absent</th>
															<th>Net Salary</th>
														</tr>
													</thead>	
													<tbody>
													<c:forEach items="${salaryApplicable.processpayrolllist}" var="processpayrolllist">
													<tr>			
														<td>${processpayrolllist.txtfname}&nbsp;${processpayrolllist.txtmname}&nbsp;${processpayrolllist.txtlname}</td>
														<td>${processpayrolllist.daysAbsent}</td>														
														<td>${processpayrolllist.totalSalary}</td>
													</tr>
													</c:forEach>
													</tbody>
												</table>
											</div>
										</div> --%>
									</div>
		             			</div>
		             		</div>
		             	</div>
</div>
</div>
<form:form action="veriable_temp.do" modelAttribute="veriable_temp">
<div class="modal fade" id="basic" tabindex="-1" role="basic" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
											<h4 class="modal-title">Veriable Name</h4>
										</div>
										<div class="modal-body">
										<input type="hidden" name="emp_id" id="empd">
											<div id="retriveVariable">
											</div>
											 <br>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default" data-dismiss="modal" data-toggle="tooltip" data-placement="top" title="Close">Close</button>
											<button type="submit" class="btn btn-primary" data-toggle="tooltip" data-placement="top" title="Save">Save</button>
										</div>
									</div>
									<!-- /.modal-content -->
								</div>
								<!-- /.modal-dialog -->
							</div>
							</form:form>
<script src="<c:url value="/resources/datepicker/js/bootstrap-datepicker.js" />"></script>
</body>
</html>