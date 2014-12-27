<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib  uri="http://www.springframework.org/tags/form" prefix="form" %>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer</title>
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
             $('#dataTables-example1').dataTable();
             $('#dataTables-example2').dataTable();
             $('#dataTables-example3').dataTable();       
         });
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
</head>	
<body style="overflow-x: hidden;">
<div id="wrapper">
<%@ include file="../header.jsp" %>
<!-- <div id="container"> -->
<%@ include file="innerHeader.jsp" %>						
<form:form action="" cssClass="form-inline" modelAttribute="customerAddedList">
<br>					
<div class="col-md-12">   
<div class="panel panel-default">
<div class="panel-body"> 
       <div class="col-md-9">
			            	<ol class="breadcrumb">
			             		<li class="active"><i class="icon-file-alt"></i> Customers</li>          
			             	</ol>
			              </div>            
			             <div class="col-md-2 pull right" >	
			             		<button type="button" class="btn btn-primary " onclick="urlSubmit('newCustomer.do','1')" data-toggle="tooltip" data-placement="left" title="New Customer"><small><i class="fa fa-2x fa-edit"></i></small>Add New Customer</button>
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
<c:if test="${updatemsg==1}">
	<div class="col-md-12">  
<div class="alert alert-success" role="alert" id="success">${msg}</div>
</div>
<script type="text/javascript">	
  $('#success').fadeOut(4000, function() 
{
  });
</script>
</c:if>
<c:if test="${updatemsg==0}">
	<div class="col-md-12">  
<div class="alert alert-danger" role="alert" id="failure">${msg}</div>
</div>
<script type="text/javascript">	
  $('#failure').fadeOut(4000, function() 
{
  });
</script>
</c:if>
<c:if test="${deletemsg==1}">
	<div class="col-md-12">  
<div class="alert alert-success" role="alert" id="success">${msg}</div>
</div>
<script type="text/javascript">	
  $('#success').fadeOut(4000, function() 
{
  });
</script>
</c:if>
<c:if test="${deletemsg==0}">
	<div class="col-md-12">  
<div class="alert alert-danger" role="alert" id="failure">${msg}</div>
</div>
<script type="text/javascript">	
  $('#failure').fadeOut(4000, function() 
{
  });
</script>
</c:if>
<c:if test="${restoremsg==1}">
	<div class="col-md-12">  
<div class="alert alert-success" role="alert" id="success">${msg}</div>
</div>
<script type="text/javascript">	
  $('#success').fadeOut(4000, function() 
{
  });
</script>
</c:if>
<c:if test="${restoremsg==0}">
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
 				<div class="panel panel-default">        
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>Customer ID</th>                                           
                                            <th>Customer Name</th>
                                            <th>Region</th>
                                            <th>Status</th>
                                            <th>Actions</th>                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <!--invoiceList  -->
                                   <c:forEach items="${customerList}" var="custlist"> 
                                        <tr class="odd gradeX">
                                             <td>${custlist.txtCustID}</td> 
                                            <td>${custlist.txtCustName}</td>
                                            <td>${custlist.slctRegion}</td>                                                                   
                                            <c:choose>
                                            	<c:when test="${custlist.status=='Active'}">
                                            		<td><font color="green">${custlist.status}</font></td>
                                            	</c:when>
                                            	<c:otherwise>
                                            		<td><font color="red">${custlist.status}</font></td>
                                            	</c:otherwise>
                                            </c:choose>
                                            <td>
                                            <div class="btn-group">
											  <button data-toggle="dropdown" class="btn dropdown-toggle btn-xs">Action <span class="caret"></span></button>
											  <ul class="dropdown-menu">	
											  <li><a href="viewCustomer.do?customerID=${custlist.txtCustID}" data-toggle="tooltip" data-placement="left" title="View">View</a></li>											
												<li><a href="editCustomer.do?customerID=${custlist.txtCustID}" data-toggle="tooltip" data-placement="left" title="Edit">Edit</a></li>
												<c:choose>
	                                            	<c:when test="${custlist.status=='Active'}">
	                                            		<li><a href="#" onclick="urlSubmit1('deleteCustomer.do?customerID=${custlist.txtCustID}')" data-toggle="tooltip" data-placement="left" title="Inactive">Inactive</a></li>
	                                            	</c:when>
	                                            	<c:otherwise>
	                                            		<li><a onclick="urlSubmit2('activeCustomer.do?customerID=${custlist.txtCustID}')" href="#" data-toggle="tooltip" data-placement="left" title="Active">Active</a></li>
	                                            	</c:otherwise>
	                                            </c:choose>
												
											  
											  </ul>
											 </div>
											  </td>
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
<!-- </div> -->
</body>
</html>

