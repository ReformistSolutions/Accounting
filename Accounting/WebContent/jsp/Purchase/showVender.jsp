<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib  uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Show Vendor</title>
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
<script src="<c:url value="resources/assets/plugins/bootstrap/js/bootstrap.min.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/dataTables/jquery.dataTables.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/dataTables/dataTables.bootstrap.js" />" type="text/javascript"></script>

     <script>
         $(document).ready(function () {
             $('#dataTables-example').dataTable(); 
         });
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
</head>	
<body style="overflow-x: hidden;">
<div id="wrapper">
<%@ include file="../header.jsp" %>
	<!-- <div id="container"> -->		
		<%@ include file="innerHeader.jsp" %>
				<%-- <form:form action="post" cssClass="form-inline" modelAttribute="PurchaseEnquiry"> --%>
					
					<div class="col-md-12">
						<div class="panel panel-default">
						<div class="panel-body">
						<div class="col-md-9">
						<ul class="breadcrumb">
							<li class="active"><i class="icon-file-alt"></i> Vendor</li>
		             	</ul>
		             	</div>
			             	<div class="col-md-3">
			             	<a href="NewVender.do"><button type="button" data-toggle="tooltip" data-placement="bottom" title="Purchase Vender" class="btn btn-primary " value=""><i class="fa fa-plus-square"></i> Add New Vendor</button></a>
			             	<!-- <a href="#" class="btn btn-primary btn-large"><i class="fa fa-reply"></i>Back</a> -->
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
		             	<div class="col-md-12">
		             	<br>
		             		<div class="panel panel-default">		             			
		             			<div class="panel-body">
		             				<div class="table-responsive">
				                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
				                                    <thead>
				                                        <tr>
				                                            <th>Vendor ID</th>
				                                            <th>Vendor Name</th>
				                                            <th>Region</th>
				                                            <th>Status</th>
				                                            <th>Actions</th>
				                                        </tr>
				                                    </thead>
				                                    <tbody>
				                                    
				                                   <c:forEach items="${venderList}" var="venderList">
				                                        <tr class="odd gradeX">
				                                            <td>${venderList.txtCustID}</td>
				                                            <td>${venderList.txtCustName}</td>
				                                            <td>${venderList.slctRegion}</td>
				                                            <c:choose>
				                                            	<c:when test="${venderList.status=='Active'}">
				                                            		<td><font color="green">${venderList.status}</font></td>
				                                            	</c:when>
				                                            	<c:otherwise>
				                                            		<td><font color="red">${venderList.status}</font></td>
				                                            	</c:otherwise>
				                                            </c:choose>
				                                            <td><div class="btn-group">
															  <button data-toggle="dropdown" class="btn dropdown-toggle btn-xs">Action <span class="caret"></span></button>
															  <ul class="dropdown-menu">
															  	<li><a href="viewVender.do?venderNo=${venderList.txtCustID}" data-toggle="tooltip" data-placement="bottom" title="Vender View">View</a></li>
																<li><a href="editVender.do?venderNo=${venderList.txtCustID}" data-toggle="tooltip" data-placement="bottom" title="Vender Edit">Edit</a></li>
																<c:choose>
				                                            	<c:when test="${venderList.status=='Active'}">
				                                            		<li><a onclick="urlSubmit1('deleteVender.do?venderID=${venderList.txtCustID}')" href="#" data-toggle="tooltip" data-placement="bottom" title="Inactivate Vender">Inactive</a></li>
				                                            	</c:when>
				                                            	<c:otherwise>
				                                            		<li><a onclick="urlSubmit2('activeVender.do?venderID=${venderList.txtCustID}')" href="#" data-toggle="tooltip" data-placement="bottom" title="Activate Vender">Active</a></li>
				                                            	</c:otherwise>
				                                            </c:choose>
																
																
															  </ul></div></td>
				                                        </tr>
				                                    </c:forEach>
				                                    
				                                        </tbody>
				                                </table>
				                            </div>
		             			</div>
		             		</div>
		             	</div>
					<%-- </form:form> --%>
	</div>			
<!-- </div> -->
</body>
</html>