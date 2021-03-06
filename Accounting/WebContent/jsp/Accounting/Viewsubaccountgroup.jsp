<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>	
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="resources/css/bootstrap.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/css/sb-admin.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/css/table.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/css/table.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/css/font-awesome.min.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="resources/assets/css/main.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="resources/assets/css/theme.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="resources/assets/css/MoneAdmin.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="resources/assets/plugins/Font-Awesome/css/font-awesome.css" />" rel="stylesheet" type="text/css">
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
 </script>
 <!-- <script>
	function back() {
		window.history.back();

	}
</script> -->
</head>	
<body style="overflow-x: hidden;">
<div id="wrapper">
		<%@include file="../header.jsp"%>
		<!-- <div class="container"> -->
			<%@include file="innerHeader.jsp"%>	

<%-- <form:input path="hidden" id="hide" name="hide1" value="0"></form:input> --%>		

<br>					
<div class="col-md-12">
					<div class="panel">
						<div class="panel-body">
							<div class="col-md-10">
								<ul class="breadcrumb">
									<li class="active"><small><i class="fa fa-2x fa-table"></i></small>&nbsp;New Account Group</li>
								</ul>
							</div>
							<div class="col-md-2">							
<!-- 							<button name="btnBack" class="btn btn-primary btn-large" onclick="back()"><i class="fa fa-reply"></i>Back</button>
 -->						
<a href="frmAccountGroups.do" class="btn btn-primary btn-large"><i class="fa fa-reply"></i> Back</a>

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
					
					<br>
<form:form action="" cssClass="form-inline" name="frmCreateAccount" modelAttribute="viewGrpAccount" onsubmit="return validateForm()">
	         <div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-body">
							<br> <br>
							<hr></hr>
							<div class="col-sm-3">
								<div>                            
                            	<label>SubAccount Group No* :-</label>                            	
                            </div><br>
                            <div> 
                        	<div>                            
                            	<label>Sub Group Name* :-</label>                            	
                            </div><br>
                            <div>                            
                            	<label>Parent Account Group* :-</label>                           	
                            	
                            </div><br>
                            <div>                            
                            	<label>Description:-</label>                            	
                            </div><br>      		
                   		</div>
							</div>
							<div class="col-sm-3">
							<div>  
                            	<label>${viewGrpAccount.txtsAccGrpNo}</label>
                            </div><br>                		
                   		<div>  
                            	<label>${viewGrpAccount.txtName}</label>
                            </div><br>
                            <div>                            
                                <label>${viewGrpAccount.txtParentacntgrp}</label>                            	
                            </div><br> 
                            <div>                            
                            	<label>${viewGrpAccount.txtDescription}</label>                              	                        	
                            </div><br>                             
                             
                            <div><center>
                                <input type="button" value="Print" name="btn" class="btn btn-primary" onclick="urlSubmit('subgroupAccountPDF.do?groupID=${viewGrpAccount.txtsAccGrpNo}')">           								
								<%-- <input type="button" value="Email" name="btn" class="btn btn-primary" onclick="urlSubmit('accountEmail.do?groupID=${viewGrpAccount.txtAccGrpNo}')"> --%> 
                                  </center>                   			
                         	</div>
                      		</div>
                   		
                   	</div>
                  	<br>
						</div>
					</div>
					</form:form>
				</div> 	
<!-- </div> -->
</body>
</html>