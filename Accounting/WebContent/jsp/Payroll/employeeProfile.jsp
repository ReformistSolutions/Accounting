<%@page language="java"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,java.text.*" %>
<%@taglib  uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%> 
<html>
<head>
<title>Employee Profile</title>
<link rel="icon" href="<core:url value="/resources/images/favicon.ico" />" type="image/icon">
<link rel="stylesheet" href="<core:url value="/resources/font-awesome/css/font-awesome.min.css" />" />

<link rel="stylesheet" href="<core:url value="/resources/ccc/jquery-ui.css" />">
<script src="<core:url value="/resources/ccc/jquery-1.9.1.js" />"></script>
<script src="<core:url value="/resources/ccc/jquery-ui.js" />"></script>
<link rel="stylesheet" type="text/css" href="<core:url value="/resources/highslide/highslide.css"/>" />
<script type="text/javascript" src="<core:url value="/resources/highslide/highslide-with-html.js" />"></script>

<link rel="stylesheet" href="<core:url value="/resources/css/table.css" />">
<script src="<core:url value="/resources/js/jquery-1.10.2.js" />"></script>
<script src="<core:url value="/resources/js/bootstrap.js" />"></script>


<link href="<core:url value="/resources/css/bootstrap.css" />" rel="stylesheet" type="text/css">
    <link href="<core:url value="/resources/assets/plugins/Font-Awesome/css/font-awesome.css"/>" rel="stylesheet" type="text/css">
    <script src="<core:url value="/resources/assets/plugins/jquery-2.0.3.min.js"/>" type="text/javascript"></script>
    <script src="<core:url value="/resources/assets/plugins/bootstrap/js/bootstrap.min.js"/>" type="text/javascript"></script> 
    <script src="<core:url value="/resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js"/>" type="text/javascript"></script>

  
    <link rel="stylesheet" href="<core:url value="http://cdn.oesmith.co.uk/morris-0.4.3.min.css"/>">
     <script src="<core:url value="/resources/assets/plugins/jquery-2.0.3.min.js"/>"></script>
<%--      <script src="<core:url value="/resources/assets/plugins/bootstrap/js/bootstrap.min.js"/>"></script> --%>
    <script src="<core:url value="/resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js"/>"></script> 

<link href="<core:url value="/resources/css/bootstrap.css" />" rel="stylesheet" type="text/css" />
<link href="<core:url value="/resources/css/sb-admin.css" />" rel="stylesheet" type="text/css" />
<link href="<core:url value="/resources/font-awesome/css/font-awesome.min.css" />" rel="stylesheet" type="text/css" />
<script src="<core:url value="/resources/js/jquery-1.10.2.js" />" ></script>
<script src="<core:url value="/resources/js/bootstrap.js" />" ></script>
<script src="<core:url value="/resources/assets/plugins/jquery-2.0.3.min.js" />"></script>
<link href="<core:url value="/resources/datepicker/css/datepicker.css"/>"  rel="stylesheet" type="text/css" />	
<script type="text/javascript">
            // When the document is ready
            $(document).ready(function () {
            	
                $('#date').datepicker({
                    format: "yyyy/mm/dd"
                });

                $('#ddate').datepicker({
                    format: "yyyy/mm/dd"
                });                
            });
            $( document ).ready(function() {
            	  $('#date').datepicker({ format: "yyyy/mm/dd" }).on('changeDate', function(ev){
            	    $(this).datepicker('hide');
            	});
            	});
            $( document ).ready(function() {
            	  $('#ddate').datepicker({ format: "yyyy/mm/dd" }).on('changeDate', function(ev){
            	    $(this).datepicker('hide');
            	});
            	});
    </script>
<script>
$(function() {
$( "#tabs" ).tabs();
});
</script>
<script type="text/javascript">
function getValue(id,name)
{	
	document.getElementById("empId").value = id;	
	document.getElementById("userName").innerHTML = "Hello "+name;	
}
</script>


<script>
function goBack()
{
	window.history.back();
}
</script>


<script type="text/javascript">
    hs.graphicsDir = 'highslide/graphics/';
    hs.outlineType = 'rounded-white';
    hs.lang.creditsText = '';
    hs.lang.creditsTitle = '';
</script>


</head>
<body style="overflow-x: hidden;">
<div id="wrapper">
<%@ include file="../header.jsp" %>
	<!-- <div class="container"> -->
		<%@ include file="innerHeader.jsp" %>
			
				<!-- <div class="container"> -->
					<div class="col-md-12">
						<div class="panel panel-default">
						<div class="panel-body">
						<div class="col-md-10">
						<ul class="breadcrumb">
							<li class="active"><small><i class="fa fa-2x fa-table"></i></small>&nbsp;User <small>&nbsp;Profile</small>
		             	</ul>
		             	</div>
			             	<div class="col-md-2">
			             	<button name="back" onclick="goBack()" data-toggle="tooltip" data-placement="left" title="Back" class="btn btn-primary"><i class="fa fa-reply"></i> Back</button>
			             	</div>
		             	</div>
		             	</div>
		             </div>
				<br>		
				<div class="col-md-12">
						<div class="panel panel-default">
						<div class="panel-body">						
						<div class="col-md-6">
						<ul class="breadcrumb">
							<li>Hello ${empName}</li>
		             	</ul> 
		             	</div>
			            <div class="col-md-6">
			            <ul class="breadcrumb">
			            <li><a data-toggle="modal" href="#basic" onClick="getValue('${empId}','${empName} ')" data-toggle="tooltip" data-placement="top" title="Change Password"> Change Password</a></li>
						<%-- <li><a href="changePassword.do?userId=${empId}">Change Password</a></li> --%>
		             	</ul> 
			            </div>
		             	</div>
		             	</div>
		             </div><br>
				
				<c:choose>
					<c:when test="${record != 'Blank' }">
						<div class="col-md-12">
				<form:form action="#" commandName="employeeBeans" onsubmit="return validateForm()">
							<div class="panel panel-default">
							<div class="panel-body">
				<div class="panel panel-default">
				                        <div class="panel-heading">
				                            Profile
				                        </div>
				                        <%-- <c:forEach items="${empView}" var="empView"> --%>
				                        <div class="panel-body">
				                        	<div class="row">
												<div class="col-md-5">
												<label>Name : </label>												
												 ${employeeBeans.txtfname}&nbsp;${employeeBeans.txtmname}&nbsp;${employeeBeans.txtlname}
												</div>
												<div class="col-md-5 pull right">			
												<label>Gender : </label>												
												${employeeBeans.gender}
												</div>			
											</div><br>
											<div class="row">
												<div class="col-md-5">
												<label>User Name : </label>												
												 ${employeeBeans.txtUserName}
												</div>
												<div class="col-md-5 pull right">			
												<label>Blood Group : </label>												
												 ${employeeBeans.bloodgrp}
												</div>			
											</div><br>
											<div class="row">
												<div class="col-md-5">
												<label>Email : </label>												
												${employeeBeans.txtEmail} 
												</div>
												<div class="col-md-5 pull right">			
												<label>Birth Date : </label>												
												${employeeBeans.birthdt}
												</div>			
											</div><br>
											<div class="row">
												<div class="col-md-5">
												<label>Role : </label>
												
												<c:forEach var="i" begin="1" end="${employeeBeans.userrole[0]}">${employeeBeans.userrole[i]}&nbsp;
												</c:forEach>
												</div>
												<div class="col-md-5 pull right">			
												<label>Permanent Address : </label>												
												 ${employeeBeans.txtPermAdd} 
												</div>			
											</div><br>
											<div class="row">
												<div class="col-md-5">
												<label>Contact : </label>												
												${employeeBeans.txtContact} 
												</div>
												<div class="col-md-5 pull right">			
												<label>Present Address : </label>												
												 ${employeeBeans.txtPA} 
												</div>			
											</div><br>                            
				                        </div> 
				                        <%-- </c:forEach>   --%>                     
				                    </div>
			  
					
				<div>	 						
				<button type="button" onclick="goBack()" data-toggle="tooltip" data-placement="top" title="Cancel" class="btn btn-primary" name="btn">Cancel</button>
			</div>	
     </div>
     </div>
     </form:form>
     </div>
						
					</c:when>
					<c:otherwise>
					<div class="col-md-12">
					<div class="panel panel-default">
							<div class="panel-body">
				<div class="panel panel-default">
				                        <div class="panel-heading">
				                            Profile
				                        </div>
						<div class="panel-body">
									<label>Profile Not Available </label>	
								
							</div>
							
						</div>
						<div>	 						
								<button type="button" onclick="goBack()" class="btn btn-primary" name="btn" data-toggle="tooltip" data-placement="top" title="Cancel">Cancel</button>
							</div><br>
						</div>
						</div>
						</div>
					
					</c:otherwise>
				</c:choose>
				
</div>	

<script src="<core:url value="/resources/datepicker/js/bootstrap-datepicker.js"/>"></script>

<form:form action="addChangePassword.do" cssClass="form-inline" modelAttribute="employeeBeans">
<br>
<div class="modal fade" id="basic" tabindex="-1" role="basic" aria-hidden="true">	
<div class="modal-dialog modal-wide" style="width: 700px;">
									<div class="modal-content">
									
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
											<h4 id="userName"></h4><h5 class="modal-title">Change Your Password</h5>
										</div>
									
										<div class="modal-body">										
											<div class="row">
												<div class="col-md-12">
														<div class="col-md-6">
															<input type="hidden" name="empId" id="empId" class="form-control" style="width: 150px;" />
														</div>														
												</div>	
												<div class="row">
												<div class="col-md-12">
													<div class="col-md-6">
														<label>Old Password&nbsp;:</label>
														<input type="password" id="oldPass" name="oldPass" class="form-control">
													</div>
												</div>
												</div><br>
												<div class="row">
												<div class="col-md-12">
													<div class="col-md-6">
														<label>New Password&nbsp;:</label>
														<input type="password" id="newPass" name="newPass" class="form-control">
													</div>
												</div>
												</div><br>
												<div class="row">
												<div class="col-md-12">
														<label>Confirm Password&nbsp;:</label>
														<input type="password" id="confPass" name="confPass" onblur="confirmPass()" class="form-control">
													
												</div>
												</div>
										</div>
										<div class="modal-footer">
											<button type="submit" class="btn btn-primary" data-toggle="tooltip" data-placement="top" title="Change">Change</button>
											<button type="button" class="btn btn-default" data-dismiss="modal" data-toggle="tooltip" data-placement="top" title="Close">Close</button>
											
										</div>
									</div>								
							
								</div>						
							</div>	
</div>
</form:form>

 <core:if test="${res==1}">                     
<h4 class="msg-succ">
<script>
	alert("Password Changed Successfully");
</script>
</h4> 
</core:if>
<core:if test="${res==0}">                     
<h4 class="msg-error">
<script>
	alert("Please Enter Correct Old Password");
</script>
</h4> 
</core:if>
<script>
	function confirmPass()
	{
		var newPass=document.getElementById("newPass").value;
		var confPass=document.getElementById("confPass").value;
		if(confPass == newPass)
			{
				return true;
			}
		else
			{
				alert("Confirm Password & New Password Does Not Match");
				document.getElementById("confPass").value="";
				document.getElementById("confPass").focus();
				return false;
			}
	}
</script>
</body>
</html>
