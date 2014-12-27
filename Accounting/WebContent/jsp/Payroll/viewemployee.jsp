<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Employee Details</title>
<link rel="icon" href="<c:url value="/resources/images/favicon.ico" />" type="image/icon">
<link href="<c:url value="/resources/css/bootstrap.css" />"
	rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/css/sb-admin.css" />"
	rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/css/font-awesome.min.css" />"
	rel="stylesheet" type="text/css">
<link
	href="<c:url value="/resources/assets/plugins/Font-Awesome/css/font-awesome.css"/>"
	rel="stylesheet" type="text/css">
<script
	src="<c:url value="/resources/assets/plugins/jquery-2.0.3.min.js"/>"
	type="text/javascript"></script>
<script
	src="<c:url value="/resources/assets/plugins/bootstrap/js/bootstrap.min.js"/>"
	type="text/javascript"></script>
<script
	src="<c:url value="/resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js"/>"
	type="text/javascript"></script>


<link rel="stylesheet"
	href="<c:url value="http://cdn.oesmith.co.uk/morris-0.4.3.min.css"/>">
<script
	src="<c:url value="/resources/assets/plugins/jquery-2.0.3.min.js"/>"></script>
<script
	src="<c:url value="/resources/assets/plugins/bootstrap/js/bootstrap.min.js"/>"></script>
<script
	src="<c:url value="/resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js"/>"></script>

<script>
	$(document).ready(function() {
		$('#dataTables-example1').dataTable();
		$('#dataTables-example2').dataTable();
		$('#dataTables-example3').dataTable();
		$('#dataTables-example4').dataTable();
		$('#dataTables-example5').dataTable();
		$('#btnNext').click(function () {
    		
    	    $('#mytab a[href="#tab2"]').tab('show');
    	});

	});
</script>
<script>
function backs()
{
	
window.history.back();
}
</script>
</head>
<body style="overflow-x: hidden;">
	<div id="wrapper">
		<%@include file="../header.jsp"%>
		<div class="page-wrapper">
			<%@include file="innerHeader.jsp"%>
			
				<input type="hidden" id="hide" name="hide1" value="0">
				<input type="hidden" name="hide2" value="Save">
				<br>
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="col-md-8">
								<ul class="breadcrumb">
									<li class="active"><small><i
											class="fa fa-2x fa-user"></i></small>&nbsp;New<small>&nbsp;Employee</small>
								</ul>
							</div>
							
							<div class="col-md-3">
							<a href="users.do" class="btn btn-primary btn-large" data-toggle="tooltip" data-placement="left" title="Back"> Back</a>	
        					 </div>
							
						</div>
					</div>
				</div>
				<form:form action="viewemps.do" modelAttribute="empView" name="frmAddEmployee" onsubmit="return validateForm()">
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-body">
							<ul class="nav nav-tabs" id="mytab">
								<li class="active"><a href="#tab1" data-toggle="tab" data-toggle="tooltip" data-placement="top" title="Basic Details"> BasicDetails</a></li>
								<li><a href="#tab2" data-toggle="tab" data-toggle="tooltip" data-placement="top" title="Work Details"> Work Details</a></li>
								<li><a href="#tab3" data-toggle="tab" data-toggle="tooltip" data-placement="top" title="Salary Structure"> Salary Structure</a></li>
								<li><a href="#tab4" data-toggle="tab" data-toggle="tooltip" data-placement="top" title="Leave Details"> Leave Details</a></li>
							</ul>
							<div class="tab-content">
								<div class="tab-pane fade in active" id="tab1">
								<div class="panel panel-default">
				                        <div class="panel-heading">
				                            Basic Info
				                        </div>
				                        <%-- <c:forEach items="${empView}" var="empView"> --%>
				                        <div class="panel-body">
				                        	<div class="row">
												<div class="col-md-5">
												<label>Name : </label>												
												<label> ${empView.txtfname}&nbsp;${empView.txtmname}&nbsp;${empView.txtlname} </label>
												</div>
												<div class="col-md-5 pull right">			
												<label>Gender : </label>												
												<label>${empView.gender}</label>
												</div>			
											</div><br>
											<div class="row">
												<div class="col-md-5">
												<label>User Name : </label>												
												<label> ${empView.txtUserName} </label>
												</div>
												<div class="col-md-5 pull right">			
												<label>Blood Group : </label>												
												<label> ${empView.bloodgrp} </label>
												</div>			
											</div><br>
											<div class="row">
												<div class="col-md-5">
												<label>Email : </label>												
												<label> ${empView.txtEmail} </label>
												</div>
												<div class="col-md-5 pull right">			
												<label>Birth Date : </label>												
												<label> ${empView.birthdt} </label>
												</div>			
											</div><br>
											<div class="row">
												<div class="col-md-5">
												<label>Role : </label>
												<label>
												<c:forEach var="i" begin="1" end="${empView.userrole[0]}">${empView.userrole[i]}&nbsp;
												</c:forEach></label>
												</div>
												<div class="col-md-5 pull right">			
												<label>Present Address : </label>												
												<label> ${empView.txtPA} </label>
												</div>	
											</div><br>
											<div class="row">
												<div class="col-md-5">
												<label>Contact : </label>												
												<label> ${empView.txtContact} </label>
												</div>
												<div class="col-md-5 pull right">			
												<label>Permanent Address : </label>												
												<label> ${empView.txtPermAdd} </label>
												</div>			
											</div><br>                            
				                        </div> 
				                        <%-- </c:forEach>   --%>                     
				                    </div>
				                   </div>
				                   <div class="tab-pane fade" id="tab2">
				                    <div class="panel panel-default">
				                        <div class="panel-heading">
				                           Work Details
				                        </div>
				                        <div class="panel-body">
				                        	<div class="row">
												<div class="col-md-5">
												<label>Employee Id :</label>												
												<label> ${empView.txtEmpId}</label>
												</div>
												<div class="col-md-5 pull right">			
												<label>Work&nbsp;Type : </label>												
												<label> ${empView.worktype}</label>
												</div>			
											</div><br>
											<div class="row">
												<div class="col-md-5">
												<label>Payment Type :</label>												
												<label>${empView.payType}</label>
												</div>
												<div class="col-md-5 pull right">			
												<label>Department :</label>
												<label>${empView.dept}</label>
												</div>			
											</div><br>
											<div class="row">
												<div class="col-md-5">
												<label>Designation :</label>												
												<label>${empView.designation}</label>
												</div>
												<div class="col-md-5">
												<label>Joing Date :</label>												
												<label>${empView.JDdt}</label>
												</div>			
											</div><br>
										</div>												
				                     </div>   				                  
							</div>
							<div class="tab-pane fade" id="tab3">
								<div class="panel panel-default">
				                        <div class="panel-heading">
				                            Current Salary Structure
				                        </div>
				                        <div class="panel-body">
											<!-- <div class="table-responsive"> -->
											<div class="row">
												<div class="col-md-6"">
											<div class="row">
													<div class="col-md-4">													
														<label>Payroll Type : </label>
													</div>
													<div class="col-md-3">
														<c:if test="${empView.payrollType == 'S'}">
															<label>Salary</label>
														</c:if>
														<c:if test="${empView.payrollType == 'W'}">
															<label>Wages</label>
														</c:if>
													</div>
											</div>
										</div>
											</div>
												<table class="table">
													<thead>
														<tr>
															<th>Pay Head</th>
															<th>Pay Head Type</th>
															<th></th>
															<th>Amount*</th>
														</tr>														
													</thead>
													<tbody>						
													<c:forEach items="${empView.salaryBeans}" var="salList">
														<tr class="odd gradeX">	
															 <td>${salList.payheadname}</td>
															<td>${salList.payheadtype}</td>
															<td>INR</td>
															<td>${salList.payamt}</td>
														</tr>
														</c:forEach>
														<tr>
															<td></td>
															<td>Total</td>
															<td>INR</td>
															<td>${empView.payheadtotal}</td>
														</tr>
													</tbody>
												</table>
											<!-- </div> -->
										</div>
										</div>
										</div>
										<div class="tab-pane fade" id="tab4">
								<div class="panel panel-default">
				                        <div class="panel-heading">
				                            Leave Details
				                        </div>
				                        <div class="panel-body">
											<div class="panel-body">
						                            <table class="table table-striped table-bordered">
						                            	<thead>
														<tr>
															<th>Leave Type</th>
															<th>Total Leaves</th>
															<th>Used Leaves</th>
															<th>Pending Leaves</th>
														</tr>
														</thead>
														<tbody>
														<c:forEach items="${leaveList}" var="leaveList">
															<tr> 
																<td><input type="hidden" value="${leaveList.leaveid}">${leaveList.leaveName}</td>
																<td>${leaveList.total}</td>
																<td>${leaveList.leavetaken}</td>
																<td>${leaveList.leavebal}</td>
															</tr>
														</c:forEach>
														</tbody>
						                            </table>
						                        </div>	
										</div>
										</div>
										</div>
			                </div>
			                
							<%-- <div class="tab-pane fade" id="tab2">
									<div class="col-lg-12">
										<!--     <div class="panel panel-default">  -->
										<div class="panel-body">
											<div class="row">
												<div class="col-md-6"></div>
												<div class="col-md-6">
													<!-- <div class="row">
														<div class="col-md-6">
															<label>Effective From Date*</label>
														</div>
														<div class="col-md-6">
															<input type="date" Class="form-control" name="TxtEffdt">
														</div>-->
													</div> 


												</div>
											</div>
											<br>
											<div class="table-responsive">
												<table class="table table-striped table-bordered table-hover">
													<thead>
														<tr>
															<th>Pay Head</th>
															<th>Pay Head Type</th>
															<th>Amount*</th>

														</tr>
													</thead>

													<tbody>

														<tr class="odd gradeX">
															<td>Basic</td>
															<td>Earnings</td>
															<td>
															<form:input path="Txtbasic"
																	cssClass="form-control" />
																
															<label>${empView.txtbasic}</label> 	
																	</td>

														</tr>
														<tr class="odd gradeX">
															<td>House Rent Allowance</td>
															<td>Earnings</td>
															<td><form:input path="TxtHRA"
																	cssClass="form-control" /></td>
															<td><label>${empView.txtHRA}</label> 	</td>
														</tr>
														<tr class="odd gradeX">
															<td>Dearness Allowance</td>
															<td>Earnings</td>
															<td><form:input path="TxtDA" cssClass="form-control" />
															
															<label>${empView.txtDA}</label> 	
															
															</td>

														</tr>
														<tr class="odd gradeX">
															<td>Travelling Allowance</td>
															<td>Earnings</td>
															<td>
															<form:input path="TxtTA" cssClass="form-control" />
															<label>${empView.txtTA}</label> 	
															</td>

														</tr>
														
														<tr class="odd gradeX">
															<td>Provident Fund</td>
															<td>Deduciton</td>
															<td>
															<form:input path="TxtTA" cssClass="form-control" />
															<label>${empView.txtprovfund}</label> 	
															</td>

														</tr>
														<tr class="odd gradeX">
															<td>Profession Tax</td>
															<td>Deduciton</td>
															<td>
															<form:input path="TxtTA" cssClass="form-control" />
															<label>${empView.txtprofestax}</label> 	
															</td>

														</tr>
														<tr class="odd gradeX">
															<td>Income Tax</td>
															<td>Deduciton</td>
															<td>
															<form:input path="TxtTA" cssClass="form-control" />
															<label>${empView.txtincometax}</label> 	
															</td>

														</tr>
																										
														
													</tbody>
												</table>
												<div class="row">
													<div class="col-md-12">
														<div class="row">
															<div class="col-md-5"></div>
															<div class="col-md-1">
														<input type="button" class="btn btn-primary" value="Print" onclick="urlSubmit('employeedetailPDF.do?emp_ID=${empView.txtEmpId}','_blank')"> 
														 
														</div>
														<div class="col-md-1">
															<input type="button" class="btn btn-primary" value="Email" onclick="urlSubmit('composeMail.do?emp_ID=${empView.txtEmpId}','1')">	
															</div>
															<div class="col-md-1">
																<input type="button" value="Cancel"
																	class="btn btn-primary">
															</div>
															<div class="col-md-5"></div>


														</div>
													</div>
												</div>
											</div>
										</div>
									</div> --%>
						<!-- </div> -->
						
						<%-- <div class="row">
								<div class="col-md-12">
									<div class="row">
										<div class="col-md-5"></div>
										<div class="col-md-1">
									<input type="button" class="btn btn-primary" value="Print" onclick="urlSubmit('employeedetailPDF.do?emp_ID=${empView.txtEmpId}','_blank')"> 
									 
									</div>
									<div class="col-md-1">
										<input type="button" class="btn btn-primary" value="Email" onclick="urlSubmit('composeMail.do?emp_ID=${empView.txtEmpId}','1')">	
										</div>
										<div class="col-md-1">
											<input type="button" value="Cancel"
												class="btn btn-primary">
										</div>
										<div class="col-md-5"></div>
									</div>
						</div></div> --%>
						
						</div>
						</div>
						</div>
					
	
							</form:form>
					</div>
				</div>
		
				<%-- <c:if test="${msg==1}">
			
				<h4 class="msg-succ">
				<script type="text/javascript">
				alert("Employee Added Succesfully And Username And Password Send on Email");
				</script>
				</h4>
				
			</c:if>
			<c:if test="${msg==0}">
				<h4 class="msg-error">
				<script type="text/javascript">
				alert("Employee Not Added");
				</script>
				</h4>
			</c:if> --%>
	
	
</body>
</html>