<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Employee</title>
<link rel="icon" href="<c:url value="/resources/images/favicon.ico" />" type="image/icon">
	<link href="<c:url value="resources/css/bootstrap.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/css/sb-admin.css" />" rel="stylesheet" type="text/css" />
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

<%-- <script src="<c:url value="http://code.jquery.com/jquery-git2.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/jspdf.debug.js" />" type="text/javascript"></script> --%>
<script src="<c:url value="resources/assets/plugins/tableToExcel.js" />" type="text/javascript"></script>
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

<!-- <script type="text/javascript">
$(window).on("load", function() {
	  $('#no').fadeOut(3500, function() {
	    // First Animation complete
	    
	  });
	});
</script> -->
</head>
<script src="<c:url value="../js/jquery-1.10.2.js"/>"></script>
<script src="<c:url value="../js/bootstrap.js"/>"></script>
<script type="text/javascript">
function urlSubmit1(url)
{
	if((confirmDelete()==true))
		{
		
			window.location.assign(url);
		}
	else
		{
			return false;
		}
}
function confirmDelete()
{
	var res=confirm("Are You Sure To Delete Record");
	if(res==true)
		{
			return true;
		}
	else
		{
			return false;
		}
}
function urlSubmit2(url)
{
	if((confirmRestore()==true))
	{
	
		window.location.assign(url);
	}
	else
	{
		return false;
	}
}
function confirmRestore()
{
	var res1=confirm("Are You Sure To Restore Record");
	if(res1==true)
		{
			return true;
		}
	else
		{
			return false;
		}
}
</script>
<script type="text/javascript">
$(document).ready(function(){
    $("#showimport").click(function(){
        $("#showimportdiv").show(800);
      });
      $("#importCancel").click(function(){
          $("#showimportdiv").hide(800);
        });
});
</script>
</head>
<body style="overflow-x: hidden;">
	<div id="wrapper">
		<%@include file="../header.jsp"%>		
			<div class="page-wrapper">
				<%@include file="innerHeader.jsp"%>
				<br>
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="col-md-7">
								<ul class="breadcrumb">
									<li class="active"><small><i
											class="fa fa-2x fa-user"></i></small>&nbsp;Employees
								</ul>
							</div>
							<div class="col-md-5"><a href="addEmployee.do"> 
								<button type="button" class="btn btn-primary " value="" data-toggle="tooltip" data-placement="top" title="New Employee"><small><i class="fa fa-1x fa-user"></i></small>&nbsp;New Employee</button></a>
								<button type="button" class="btn btn-primary " id="showimport" value="" data-toggle="tooltip" data-placement="top" title="Import"><small><i class="fa fa-1x fa-user"></i></small>&nbsp;Import</button>
								<a href="payroll.do" class="btn btn-primary btn-large" data-toggle="tooltip" data-placement="top" title="Back"> Back</a>	
							</div>
						</div>
					</div>
				</div>
				<br>
				<c:if test="${message==1}">
				<div class="col-md-12">
					<div class="alert alert-success" role="alert" id="success">File Uploaded Successfully</div>
				</div>
					<script type="text/javascript">	
					  $('#success').fadeOut(4000, function() 
					{
					  });
					</script>
					</c:if>
					<c:if test="${message==0}">
					<div class="col-md-12">
					<div class="alert alert-danger" role="alert" id="failure">File Not Upload</div>
					</div>
					<script type="text/javascript">	
					  $('#failure').fadeOut(4000, function() 
					{
					  });
					</script>
					</c:if>
				<c:if test="${msg1==1}">
				<div class="col-md-12">
					<div class="alert alert-success" role="alert" id="success">${msg}</div>
				</div>
					<script type="text/javascript">	
					  $('#success').fadeOut(4000, function() 
					{
					  });
					</script>
					</c:if>
					<c:if test="${msg1==0}">
					<div class="col-md-12">
					<div class="alert alert-danger" role="alert" id="failure">${msg}</div>
					</div>
					<script type="text/javascript">	
					  $('#failure').fadeOut(4000, function() 
					{
					  });
					</script>
					</c:if>
					<c:if test="${restore==1}">
				<div class="col-md-12">
					<div class="alert alert-success" role="alert" id="success">${msg}</div>
				</div>
					<script type="text/javascript">	
					  $('#success').fadeOut(4000, function() 
					{
					  });
					</script>
					</c:if>
					<c:if test="${restore==0}">
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
				<c:choose>
				<c:when test="${msg=='No'}">
				<div class = "col-md-12">				
				 <lable id="no" style = "color:green;" >Your Salary not processed yet.</lable>
				 <script type="text/javascript">					
							  $('#no').fadeOut(3500, function() {
							    // First Animation complete							    
							  });
						</script>
						</div>
				</c:when>
				<c:otherwise>
				
				<br>
				<div id="showimportdiv" style="display: none;">
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-body">
				<form:form action="upload.do" method="post" enctype="multipart/form-data">
                      <div class="panel panel-default">
                      <div class="panel-heading">
                          Import Employee Data
                      </div>
                      <div class="panel-body">
                      	<div class="row">
                      		<div class="col-md-12">                      			
                      			<div class="col-md-6">
                      				<div style="position:relative;">
										<input type="file" name="file" />
										<!-- <a class='btn btn-primary btn-xs' href='javascript:;'>Choose File...
											<input type="file" name="file" style='position:absolute;z-index:2;top:0;left:0;filter: alpha(opacity=0);-ms-filter:"progid:DXImageTransform.Microsoft.Alpha(Opacity=0)";opacity:0;background-color:transparent;color:transparent;'  size="40"  onchange='$("#upload-file-info").html($(this).val());' >
										</a>
										&nbsp;
										<span class='label label-info' id="upload-file-info"></span> -->
                      				</div>
                      			</div>
                      		</div>
                      	</div>	
                      		<br>
                      	<div class="col-md-12">
                      		<input type="submit" value="Import" onclick="import();" class="btn btn-primary btn-xs">
                      		<input type="button" value="Cancel" id="importCancel" class="btn btn-primary btn-xs">
                      	</div>
                      </div>
                   </div>
                   </form:form>
                  </div>
                   </div>
                   </div>
                   </div>
				<br>
				<form:form action="employee.do" modelAttribute="employee">
				
				<div class="col-md-4">
                    <div class="panel panel-default">
                      <div class="panel-body">
                        <div class="media">
                          <span class="pull-left thumb-large">
                            <img alt="" src="<c:url value="/resources/images/User-icon.png" />" width="70px" height="70px">
                          </span>
                          <div class="media-body">
                          <c:forEach items="${adminList}" var="adminList">
                            <div>${adminList.txtfname}</div>
                            <div>Owner</div> 
                            <div></div>
                            <small class="text-muted"><i class="icon-envelope"></i>&nbsp;${adminList.txtEmail}</small>
                        	</c:forEach>
                          </div>
                          
                          <!-- <div class="m-t-xmini">
                              <a href="/users/2927/edit">Edit</a>
                              | <a href="#" data-toggle="modal" data-target='#modal1'>Change password</a>
                          </div> -->
                        </div>
                      </div>  
                    </div>
                  </div>
				
				<%-- <div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-body">
					   		
					   		<img alt="" src="<c:url value="/resources/images/User-icon.png" />" width="70px" height="70px">
					   		
					   	</div>
					</div>				
				</div> --%>
				<br>
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-body">
							<ul class="nav nav-tabs">
								<li class="active"><a href="#tab1" data-toggle="tab"> Active Users</a></li>
								<li><a href="#tab2" data-toggle="tab"> Inactive Users</a></li>
							</ul>
							<div class="tab-content">
								<div class="tab-pane fade in active" id="tab1">
									<!-- <div class="col-lg-12"> -->
									<div align="right">
										<!-- <input type="button" class="btn btn-primary btn-xs" onclick="tableToExcel('testTable', 'Employee Leave Card')" value="Export to Excel"> -->
										<!-- <input type="button" class="btn btn-primary btn-xs" onclick="javascript:htmltopdf();" value="Export to PDF"> -->
									</div><br>
										<div class="table-responsive"> <!--  id="htmlexportPDF" --> 
														<table class="table table-striped table-bordered table-hover" id="dataTables-example1">
															<thead>
																<tr>
																	<th>Employee Id</th>
																	<th>First Name</th>
																	<th>Middle Name</th>
																	<th>Last Name</th>
																	<th>Action</th>
																</tr>
															</thead>
															<tbody>
																<c:forEach items="${empList}" var="emplist">
																	<tr class="odd gradeX">
																		<td>${emplist.txtEmpId}</td>
																		<td>${emplist.txtfname}</td>
																		<td>${emplist.txtmname }</td>
																		<td>${emplist.txtlname }</td>
																		<td>
																			<div class="btn-group">
																				<button data-toggle="dropdown"class="btn dropdown-toggle btn-xs">Action <span class="caret"></span></button>
																				<ul class="dropdown-menu">
																					<li><a href="viewemp.do?emp_ID=${emplist.txtEmpId}" data-toggle="tooltip" data-placement="left" title="View">View</a></li>
																					<li><a href="viewSalarySlip.do?emp_ID=${emplist.txtEmpId}" data-toggle="tooltip" data-placement="left" title="Salary Slip">View Salary Slip</a></li>
																					<li><a href="editEmployee.do?emp_ID=${emplist.txtEmpId}" data-toggle="tooltip" data-placement="left" title="Edit">Edit</a></li>
																					<li><a onclick="urlSubmit1('deleteEmployee.do?emp_ID=${emplist.txtEmpId}')" href="#" data-toggle="tooltip" data-placement="left" title="Disable">Disable</a></li>
																					<%-- <li><a href="deleteEmployee.do?emp_ID=${emplist.txtEmpId}">Delete</a></li> --%>
																				</ul>
																			</div>
																		</td>
																	</tr>
																</c:forEach>
															</tbody>
														</table>
														</div>

										
									</div>
								
								<!-- BASIC AND WORK DETAILS END -->
								<!-- SALARY STRUCTURE START -->
								<div class="tab-pane fade" id="tab2">
									<!-- <div class="col-lg-12"> -->
										<!--     <div class="panel panel-default">  -->
										<div class="table-responsive">
														<table
															class="table table-striped table-bordered table-hover"
															id="dataTables-example2">
															<thead>
																<tr>
																	<th>Employee Id</th>
																	<th>First Name</th>
																	<th>Middle Name</th>
																	<th>Last Name</th>
																	<th>Action</th>
																</tr>
															</thead>
															<tbody>
																<c:forEach items="${empLists}" var="empLists">
																	<tr class="odd gradeX">
																		<td>${empLists.txtEmpId}</td>
																		<td>${empLists.txtfname}</td>
																		<td>${empLists.txtmname }</td>
																		<td>${empLists.txtlname }</td>
																		<td>
																			<div class="btn-group">
																				<button data-toggle="dropdown"class="btn dropdown-toggle">Action <span class="caret"></span></button>
																				<ul class="dropdown-menu">
																				<li><a href="viewemp.do?emp_ID=${empLists.txtEmpId}" data-toggle="tooltip" data-placement="left" title="View">View</a></li>
																				<li><a onclick="urlSubmit2('restoreEmp.do?emp_ID=${empLists.txtEmpId}')" href="#" data-toggle="tooltip" data-placement="left" title="Restore">Restore</a></li>
																					<%-- <li><a href="restoreEmp.do?emp_ID=${empLists.txtEmpId}">Restore</a></li> --%>
																					<%-- <li><a href="editEmployee.do?emp_ID=${empLists.txtEmpId}">Edit</a></li>
																					<li><a href="deleteEmployee.do?emp_ID=${empLists.txtEmpId}">Delete</a></li> --%>

																				</ul>
																			</div>
																		</td>
																	</tr>
																</c:forEach>
															</tbody>
														</table>
													</div>	
											
										</div>
									<!-- </div> -->
								</div>
								</div>
								<!-- END DIPOSIT CASH -->
								<c:out value="${ TxtFname}"></c:out>
							<!-- </div> -->
						</div>
						</div>
				</form:form>
				
				</c:otherwise>
				</c:choose>		
</div>	
			</div>
		
	
	
</body>
</html>