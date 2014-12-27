<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Pay Heads</title>   
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
             $('#dataTables-example').dataTable(); 
         });
    </script>
<script type="text/javascript">
function backs()
{
	window.history.back();
}
</script>
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
	var res=confirm("Are You Sure To Disable Record");
	if(res==true)
		{
			return true;
		}
	else
		{
			return false;
		}
}
</script>
</head>	
<body style="overflow-x: hidden;">
<div id="wrapper">
<%@ include file="../header.jsp" %> 
	<div class="page-wrapper">
		<%@ include file="innerHeader.jsp" %>
		
		
				<form:form action="" cssClass="form-inline" modelAttribute="">
					<br> 
						<div class="col-md-12">
						<div class="panel panel-default">
						<div class="panel-body">
						<div class="col-md-8">
						<ul class="breadcrumb">
							<li class="active"><i class="icon-file-alt"></i> Pay Heads</li>
		             	</ul>
		             	</div>
			             	<div class="col-md-4">
			             	<a href="NewPayHeads.do"><button type="button" class="btn btn-primary " value=""><i class="fa fa-plus-square"></i> Add New Pay Head</button></a>
			             	<!-- <button name="back" class="btn btn-primary btn-large" onclick="back()"><i class="fa fa-reply"></i> Back</button> -->
			             	<!-- <input type="button" name="back" class="btn btn-primary btn-large" onclick="backs();" value="Back"/> -->
			             	<a href="payroll.do" class="btn btn-primary btn-large" data-toggle="tooltip" data-placement="top" title="Back"> Back</a>
			             	</div>
		             	</div>
		             	</div>
		             </div>	<br>
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
					 <c:if test="${update==1}">
					<div class="col-md-12">
					<div class="alert alert-success" role="alert" id="success">${msg}</div>
				</div>	
					<script type="text/javascript">	
					  $('#success').fadeOut(4000, function() 
					{
					  });
					</script>
					</c:if>
					<c:if test="${update==0}">
					<div class="col-md-12">
					<div class="alert alert-danger" role="alert" id="failure">${msg}</div>
					</div>
					<script type="text/javascript">	
					  $('#failure').fadeOut(4000, function() 
					{
					  });
					</script>
					</c:if>
					<c:if test="${delete==1}">
					<div class="col-md-12">
					<div class="alert alert-success" role="alert" id="success">${msg}</div>
				</div>	
					<script type="text/javascript">	
					  $('#success').fadeOut(4000, function() 
					{
					  });
					</script>
					</c:if>
					<c:if test="${delete==0}">
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
		             	<div class="col-md-12">
		             		<div class="panel">
		             			<div class="panel-body">
		             				<div class="table-responsive">
				                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
				                                    <thead>
				                                        <tr>
				                                            <th>Payhead Name</th>
				                                            <th>Name appear in payslip</th>
				                                            <th>Payhead Type</th>				                                            
				                                            <th>Applicable</th>
				                                            <th>Actions</th>
				                                        </tr>
				                                    </thead>
				                                    <tbody>
				                                    <c:forEach items="${payheadlist}" var="payheadlist">
				                                        <tr class="odd gradeX">
				                                            <td>${payheadlist.txtPayheadName}</td>
				                                            <td>${payheadlist.txtPayslipName}</td>
				                                            <c:if test="${((payheadlist.txtPayheadType == 'Indirect Expenses') || (payheadlist.txtPayheadType == 'Direct Expenses')) }">				                                            
				                                            <td>Earning</td>
				                                            </c:if>
				                                            <c:if test="${payheadlist.txtPayheadType == 'Duties and Taxes'}">				                                            
				                                            <td>Deduction</td>
				                                            </c:if>
				                                            <td>${payheadlist.getvalue}</td>
				                                            <td><div class="btn-group">
															  <button data-toggle="dropdown" class="btn dropdown-toggle btn-xs ">Action <span class="caret"></span></button>
															  <ul class="dropdown-menu">
															  	<li><a href="viewPayhead.do?payheadId=${payheadlist.txtPayId}" data-toggle="tooltip" data-placement="top" title="View">View</a></li>
																<li><a href="editPayhead.do?payheadId=${payheadlist.txtPayId}" data-toggle="tooltip" data-placement="top" title="Edit">Edit</a></li>
																<li><a onclick="urlSubmit1('deletePayhead.do?payheadId=${payheadlist.txtPayId}')" href="#" data-toggle="tooltip" data-placement="top" title="Disable">Disable</a></li>	
															</ul></div></td>
				                                        </tr>
				                                    </c:forEach>				                                    
				                                        </tbody>
				                                </table>
				                            </div>
		             			</div>
		             		</div>
		             	</div>
					</form:form>
	</div>			
</div>
</body>
</html>