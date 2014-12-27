<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Details</title>
<link rel="icon" href="<c:url value="/resources/images/favicon.ico" />" type="image/icon">
	<link href="<c:url value="resources/css/bootstrap.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/css/sb-admin.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/css/table.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/css/table.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/css/font-awesome.min.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="resources/assets/css/main.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="resources/assets/css/theme.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="resources/assets/css/MoneAdmin.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="resources/assets/plugins/Font-Awesome/css/font-awesome.css" />" rel="stylesheet" type="text/css">
<script src="<c:url value="resources/assets/plugins/jquery-2.0.3.min.js" />" type="text/javascript"></script>
<%-- <script src="<c:url value="resources/assets/plugins/bootstrap/js/bootstrap.min.js" />" type="text/javascript"></script> --%>
<script src="<c:url value="resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/dataTables/jquery.dataTables.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/dataTables/dataTables.bootstrap.js" />" type="text/javascript"></script>
     
     <script>     
         $(document).ready(function () {
             $('#dataTables-example1').dataTable();
             $('#dataTables-example2').dataTable();
         });
    </script>
    <script type="text/javascript">
    function backs()
    {
    	window.history.back();
    }
</script>
</head>
<script src="<c:url value="../js/jquery-1.10.2.js"/>"></script>
<script src="<c:url value="../js/bootstrap.js"/>"></script>
</head>
<body style="overflow-x: hidden;">
	<div id="wrapper">
		<%@include file="../header.jsp"%>
		
<div class="page-wrapper">			
<div >
				<%@include file="innerHeader.jsp"%>
				<br>
				
					<div class="col-md-12">
						<div class="panel panel-default">
						<div class="panel-body">
						<div class="col-md-10">
						
		             	</div>
			             	<div class="col-md-2">
			             	<a href="users.do"> <button type="button" class="btn btn-primary " value=""><i class="fa fa-reply"></i> Back</button></a>
			             	</div>
		             	</div>
		             	</div>
		             </div>
		             <br>
		             <c:if test="${msg==1}">
		             <div class="col-md-12">
					<div class="alert alert-success" role="alert" id="success">${msg1}</div>
					</div>
					<script type="text/javascript">	
					  $('#success').fadeOut(4000, function() 
					{
					  });
					</script>
					</c:if>
					<c:if test="${msg==0}">
					<div class="col-md-12">
					<div class="alert alert-danger" role="alert" id="failure">${msg1}</div>
					</div>
					<script type="text/javascript">	
					  $('#failure').fadeOut(4000, function() 
					{
					  });
					</script>
					</c:if>
							<br>
				<form:form action="" modelAttribute="empView" name="frmAddEmployee" >
				<div class="col-md-12">
					<div class="panel panel-default">
					<div class="panel">
						<ul class="nav nav-tabs">
								<li class="active"><a href="#tab1" data-toggle="tab"> Basic Details</a></li>
								<li><a href="#tab2" data-toggle="tab"> Salary Details</a></li>
								<li><a href="#tab3" data-toggle="tab"> Leave Details</a></li>
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
												<input type="hidden" name="emp_id" value="${empView.txtEmpId}">
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
							<div class="tab-pane fade in" id="tab2">
								<div class="panel panel-default">
				                        <div class="panel-heading">
				                            Current Salary Structure
				                        </div>
				                        <div class="panel-body">
											<!-- <div class="table-responsive"> -->
												<table class="table">
													<thead>
														<tr>
															<th>Pay Head</th>
															<th>Pay Head Type</th>
															<th>Amount*</th>															
														</tr>
													</thead>
													<tbody>						
													<c:forEach items="${salList}" var="salList">								
														<tr class="odd gradeX">
															 <td>${salList.payheadid}</td>
															<td>${salList.payheadtype}</td>	
															<td>INR&nbsp;${salList.payamt}</td>
														</tr>
														</c:forEach>
														<tr>
															<td></td>
															<td>Total</td>	
															<td>INR&nbsp;${empView.totalSalary}</td>
														</tr>
													</tbody>
												</table>
											<!-- </div> -->
										</div>
										</div>
										<!-- </div>
			                        </div>
			                    </div> -->
							</div>
							<div class="tab-pane fade in" id="tab3">								
									<div class="row">
										<div class="col-md-6">
						                    <div class="panel panel-default">
						                        <div class="panel-heading">
						                            Pending Leave Request
						                        </div>
						                        <div class="panel-body">
						                            <p>No Pending Leaves</p>
						                        </div>						                        
						                    </div>
						                </div>
						                <div class="col-md-6">
						                    <div class="panel panel-default">
						                        <div class="panel-heading">
						                            <jsp:useBean id="date" class="java.util.Date" />
													<fmt:formatDate value="${date}" pattern="yyyy" var="currentYear" />
													Leave Request for Year <c:out value="${currentYear}" /> 
													<a class="btn btn-primary btn-xs" data-toggle="modal" href="#basic" style="float: right;">Add New</a>
													<!-- <button name="addLeave" class="btn btn-primary btn-xs" style="float: right;">Add New</button> -->
						                        </div>	
						                        <div class="panel-body">
						                            <table class="table table-striped table-bordered">
						                            	<thead>
														<tr>
															<th>Leave Type</th>
															<th>Total Leaves</th>
															<th>Used Leaves</th>
															<th>Pending Leaves</th>
															<th></th>
														</tr>
														</thead>
														<tbody>
														<c:forEach items="${leaveList}" var="leaveList">
															<tr> 
																<td><input type="hidden" value="${leaveList.leaveid}">${leaveList.leaveName}</td>
																<td>${leaveList.total}</td>		
																<td>${leaveList.leavetaken}</td>												
																<td>${leaveList.leavebal}</td>							
																<td>
																<a href="editLeave.do?empid=${empView.txtEmpId}&leaveid=${leaveList.leaveid}"><img alt="" src="<c:url value="/resources/images/document_edit.ico" />" width="25px" height="25px"></a>
																<%-- <a data-toggle="modal" href="#basic1" style="float: right;"><img alt="" src="<c:url value="/resources/images/text_edit.ico" />" width="25px" height="25px"></a> --%>
																</td>
															</tr>
														</c:forEach>
														</tbody>
						                            </table>
						                        </div>						                        
						                    </div>	
						                </div>
									</div><br>
									<div class="row">
										<div class="col-md-6">
						                    <div class="panel panel-default">
						                        <div class="panel-heading">
						                            Approve Request
						                        </div>
						                        <div class="panel-body">
						                            <p>No approve Leaves</p>
						                        </div>						                        
						                    </div>
						                </div>
						                <div class="col-md-6">
						                    <div class="panel panel-default">
						                        <div class="panel-heading">
						                             Rejected Leaves
						                        </div>
						                        <div class="panel-body">
						                            <p>No Leave Request</p>
						                        </div>						                        
						                    </div>
						                </div>
									</div>
							</div>
						</div>
					</div>
					</div>
				</div>
				<br>
				</form:form>
			</div>		
	</div>
	</div>

<form:form cssClass="form-horizontal" action="newLeaves.do" modelAttribute="newleaves">
<div class="modal fade" id="basic" tabindex="-1" role="basic" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
											<h4 class="modal-title">New Leave</h4>
										</div>
										<div class="modal-body">
										<input type="hidden" name="txtEmpId" value="${empView.txtEmpId}">
										<div class="col-md-12">
											<div class="panel panel-default">
												<div class="panel-body">
													<%-- <div class="form-group">
													    <label class="col-md-3 control-label">Leave Id</label>
													    <div class="col-md-3">
													      <input type="text" name="leaveId" class="form-control" value="${leadid}"/>
													    </div>	
													  </div> --%>	
													  <div class="form-group">
													    <label class="col-md-3 control-label">Leave Name</label>
													    <div class="col-md-5">
													      <input type="text" name="leaveName" class="form-control"/>
													      <!-- <input type="text" name="txtPayId" class="form-control"> -->
													    </div>
													  </div>
													  <div class="form-group">
													    <label class="col-md-3 control-label">Total Leaves</label>
													    <div class="col-md-3">
													      <input type="text" name="noLeaves" class="form-control"/>
													      <!-- <input type="text" name="txtPayId" class="form-control"> -->
													    </div>
													  </div>
												</div>
											</div>
										</div> 

										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
											<button type="submit" class="btn btn-primary">Save</button>
										</div>
									</div>
									<!-- /.modal-content -->
								</div>
								<!-- /.modal-dialog -->
							</div>
							</form:form>	
</body>
</html>