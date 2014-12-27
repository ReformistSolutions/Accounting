<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Accounts Chart</title>
<head>
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
<link class="cssdeck" rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/2.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/2.3.1/css/bootstrap-responsive.min.css" class="cssdeck">

     <script>
         $(document).ready(function () {
             $('#dataTables-example1').dataTable();
             $('#dataTables-example2').dataTable();
         });
     </script>

<!-- <script>
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
  -->
</head>


<body>

<div class="" id="loginModal">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		<h3>Have an Account?</h3>
	</div>
	<div class="modal-body" >
		<div class="well">
			<ul class="nav nav-tabs">
				<li class="active"><a href="#login" data-toggle="tab">User Login</a></li>
				<li><a href="#create" data-toggle="tab">Login For Admin</a></li>
			</ul>
			<div id="myTabContent" class="tab-content" style="overflow: auto;">
				<div class="tab-pane active in" id="login">
					<form:form cssClass="form-horizontal" action="loginform.do" method="POST" modelAttribute="userLogin">
						<fieldset>
							<div id="legend">
								<legend class="">User Login </legend>
							</div>    
							<div class="control-group">
								<!-- Username -->
								<label class="control-label"  for="username">Username</label>
								<div class="controls">
									<form:input path="txtUname" cssClass="input-xlarge"></form:input>
								</div>
							</div>
							
							<div class="control-group">
								<!-- Password-->
								<label class="control-label" for="password">Password</label>
								<div class="controls">
									<form:input path="txtPassword" cssClass="input-xlarge"></form:input>
								</div>
							</div>
							
					
							
							<div class="control-group">
								<!-- Button -->
								<div class="controls">
									<button class="btn btn-success">Login</button>
									<a href="/auditor_login/forgot_pass" class="pull-center m-t-mini"><small>Forgot password?</small></a>
									
								</div>
							</div>
							<hr>
							<div class="control-group">
								<!-- Button -->
								<div class="controls">
									<div class="line line-dashed"></div>
									<a href="#" class="pull-center m-t-mini"><small>Do not have an account?</small></a>
	                            <input type="button" name="btnAdd" value="Create New Account" class="btn btn-primary" data-toggle="modal" data-target="#myModal" />
								<!-- <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">Create New Account</button> -->
								</a>
								</div>
							</div>
						
						</fieldset>
					</form:form>                
				</div>
				<div class="tab-pane fade" style="width:auto; height:500px;" id="create">
				
						<form:form cssClass="form-horizontal" action="loginforms.do" method="POST" modelAttribute="adminlogin">
						<fieldset>
							<div id="legend">
								<legend class="">Admin Login </legend>
							</div>    
							<div class="control-group">
								<!-- Username -->
								<label class="control-label"  for="username">Username</label>
								<div class="controls">
									<form:input path="txtUname" cssClass="input-xlarge"></form:input>
								</div>
							</div>
							
							<div class="control-group">
								<!-- Password-->
								<label class="control-label" for="password">Password</label>
								<div class="controls">
									<form:input path="txtPassword" cssClass="input-xlarge"></form:input>
								</div>
							</div>
							
					
							
							<div class="control-group">
								<!-- Button -->
								<div class="controls">
									<button class="btn btn-success">Login</button>
									<a href="/auditor_login/forgot_pass" class="pull-center m-t-mini"><small>Forgot password?</small></a>
									
								</div>
							</div>
							<hr>
							<div class="control-group">
								<!-- Button -->
								<div class="controls">
									<div class="line line-dashed"></div>
									<a href="#" class="pull-center m-t-mini"><small>Do not have an account?</small></a>
	                           
	                            <!-- <a href=""><input type="button" name="btnAdd" value="+ New Account Group" class="btn btn-primary" data-toggle="modal" data-target="#myModal" /></a> -->
								<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">Create Account</button>
								
								</div>
							</div>
							</fieldset>
							  </form:form>
							  
					
  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="js/jquery.js"></script>
 
  <!-- Include all compiled plugins (below), or include individual files as needed -->
  <script src="js/bootstrap.min.js"></script>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Button trigger modal -->
<!-- <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal"> Launch demo modal</button> -->

<!-- Modal -->
<form:form cssClass="form-horizontal" action="registration.do" method="POST" modelAttribute="newLoginUser">
<div class="modal fade" style="height: 800px; width: 600px; margin-top: -50px;" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header"  style="background-color: blue;">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel" style="color: white;">Registration Form</h4>
      </div>
    <!--  <div class="modal-body"> --> 
      
    <!--   <div class="col-md-12">
						<div class="panel">
						<div class="panel-body">
						<div class="col-md-11">
						<ul class="breadcrumb">
							<li class="active"><small><i class="fa fa-2x fa-table"></i></small>&nbsp;Registration <small>&nbsp;Details</small>
		             	    	
		             	</ul>
		             	</div>
			             	<div class="col-md-1">
			             	
			             	</div>
		             	</div>
		             	</div>
		</div>
		 -->
		 <c:if test="${message==1}">                     
<h4 class="msg-succ">
Thank you For Registration...!!
</h4> 
</c:if>
<c:if test="${message==0}">                     
<h4 class="msg-error">
Registration failed...!!
</h4> 
</c:if>
		 
		 
		<hr>
	<div class="form-horizontal">
    <div class="control-group">
    <label for="name" class="control-label"><p class="text-info">First Name&nbsp;</p></label>
    <div class="controls">
        <form:input path="txtFname" id="name" cssClass="span3"></form:input>
    </div>
</div>
</div>

<div class="form-horizontal">
    <div class="control-group">
    <label for="name" class="control-label"><p class="text-info">Last Name&nbsp;</p></label>
    <div class="controls">
        <form:input path="txtLName" id="name" cssClass="span3"></form:input>
    </div>
</div>
</div>

<div class="form-horizontal">
    <div class="control-group">
    <label for="name" class="control-label"><p class="text-info">Email address&nbsp;</p></label>
    <div class="controls">
        <form:input path="txtEmail" id="name" cssClass="span3"></form:input>
    </div>
</div>
</div>
        
   <div class="form-horizontal">
    <div class="control-group">
    <label for="name" class="control-label"><p class="text-info">Contact Number&nbsp;</p></label>
    <div class="controls">
        <form:input path="txtContactNo" id="name" cssClass="span3"></form:input>
    </div>
</div>
</div>
        
        <div class="form-horizontal">
    <div class="control-group">
    <label for="name" class="control-label"><p class="text-info">User Name&nbsp;</p></label>
    <div class="controls">
        <form:input path="txtUname" id="name" cssClass="span3"></form:input>
    </div>
</div>
</div>
        
  <div class="form-horizontal">
    <div class="control-group">
    <label class="control-label"><p class="text-info">Passwords&nbsp;</p></label>
    <div class="controls">
        <form:input path="txtPassword" id="name" cssClass="span3"></form:input>
    </div>
</div>
</div>
        
    <div class="form-horizontal">
    <div class="control-group">
    <label for="name" class="control-label"><p class="text-info">Conform Password&nbsp;</p></label>
    <div class="controls">
        <input name="txtConpassword" id="name" class="span3"></input>
        <p class="help-block">
          Min: 6 characters (combination to digit and character)
        </p>
    </div>
</div>
</div>

<div class="form-horizontal">
    <div class="control-group">
    <label for="txtSex" class="control-label"><p class="text-info">Sex&nbsp;</p></label>
    <div class="controls">
        <label class="radio">
        <form:radiobutton path="userSex" id="sex" value="male"></form:radiobutton>
          Male
        </label>
        <label class="radio">
          <form:radiobutton path="userSex" id="sex" value="female" ></form:radiobutton>
          Female
        </label>
    </div>
</div>
</div>

 <div class="form-horizontal">
    <div class="control-group">
    <label for="name" class="control-label"><p class="text-info">Company Name :&nbsp;</p></label>
    <div class="controls">
        <form:input path="txtCompanyName" id="name" cssClass="span3"></form:input>
    </div>
</div>
</div>


<div class="form-horizontal">
    <div class="control-group">
    <label for="name" class="control-label"><p class="text-info">Upload Image :&nbsp;</p></label>
    <div class="controls">
       <input type="file" name="uploadimage" id="uploadimage">
        <p class="help-block">
          Allowed formats: jpeg, jpg, gif, png
        </p>
    </div>
</div>
</div>


<div class="blocked">
<div class="form-horizontal">
    <div class="control-group">
    <div class="controls">
       <input type="checkbox">Terms and Conditions</label>
    </div>
</div>
</div>
<hr>
 <CENTER>
 <%-- <input type="submit" value="Print" name="btn" class="btn btn-primary" onclick="urlSubmit('groupAccountPDF.do?groupID=${viewGrpAccount.txtAccGrpNo}','_blank')"> --%>
  <button type="submit" class="btn btn-info">Register</button>
  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>  <hr>
  <div class="line line-dashed"></div>
  
</CENTER>
<CENTER>
<div class="form-horizontal">
    <div class="control-group">
    <div class="controls">    
       <label for="name" class="control-label" style="width: 200px;">Already have an account?<p class="text-info"><a href="login.jsp">Sign in </a>&nbsp;</p></label>
    </div>
</div>
</div>
</CENTER>
  <br>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <!-- <button type="button" class="btn btn-primary">Save changes</button> -->
 
    <!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</div>
<script class="cssdeck" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script class="cssdeck" src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/2.3.1/js/bootstrap.min.js"></script>
</div>
</form:form>
</div>

</body>
</html>