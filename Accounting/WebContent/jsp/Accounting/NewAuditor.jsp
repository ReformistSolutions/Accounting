<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>	
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
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
             $('#dataTables-example3').dataTable();
             $('#dataTables-example4').dataTable();
             $('#dataTables-example5').dataTable();
             
         });
    </script>
    
     <script>
function validateForm()
{
    if(document.frmAddNewCustomer.txtName.value=="")
    {
      alert(" Name should be blank");
      document.frmAddNewCustomer.txtName.focus();
      return false;
    }
     else if(document.frmAddNewCustomer.txtEmail.value=="")
    {
      alert("Email Id should be wrong..");
      document.frmAddNewCustomer.txtEmail.focus();
      return false;
    } 
    else{
    	alert("Data Insert Successfully...");
    }
}
</script>

<SCRIPT language=Javascript>
 function isNumberKey(evt)
       {
          var charCode = (evt.which) ? evt.which : event.keyCode;
          if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57))
             return false;

          return true;
       }

 function AllowCharacters(e)
 {
     var keycode;
     if (window.event) keycode = window.event.keyCode;
     else if (event) keycode = event.keyCode;
     else if (e) keycode = e.which;
     else return true;

     
     if((keycode >= 65 && kecode <= 90) || (keycode >= 97 && keycode <= 122))
     {
         return true;
     }
    else
    {
        return false;
      }

  return false;   
}
 function validateEmail(sEmail) {
	  var reEmail = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;

	  if(!sEmail.match(reEmail)) {
	    alert("Invalid email address");
	    return false;
	  }

	  return true;

	}
 </SCRIPT>
<script>
	function back() {
		window.history.back();

	}
</script>
</head>
<body style="overflow-x: hidden;">
<div id="wrapper">
	<%@include file="../header.jsp"%>
	<!-- <div class="container"> -->
		<%@include file="innerHeader.jsp"%>
		
			<br>
			<div class="col-mg-12">
					<div class="panel">
						<div class="panel-body">
							<div class="col-md-10">
								<ul class="breadcrumb">
									<li class="active"><small><i class="fa fa-2x fa-table"></i></small>&nbsp;Auditor Invitation</li>
								</ul>
							</div>
							<div class="col-md-2">
								<button name="btnBack" class="btn btn-primary btn-large" onclick="back()"><i class="fa fa-reply"></i>Back</button>
							</div>
						</div>
					</div>
				</div>	
				<form:form action="addNewAuditor.do" cssClass="form-inline" name="frmAddNewCustomer" commandName="newAuditors" onsubmit="return validateForm()">		
<div class="col-md-12">
    <div class="panel panel-default">
       <div class="panel-body">	
       						
       						<div><br>
							<label style="vertical-align: top;">Audit No* :</label>
							<form:input path="txtAuditNo" cssClass="form-control" readonly="true" />
							</div><br>
       				
                        	<div><br>
							<label style="vertical-align: top;">Audit Name* :</label>
							<form:input path="txtName" cssClass="form-control" onkeypress="return AllowCharacters(this);"/>
							</div><br>
							<div>
							<label style="vertical-align: top;">Email* :</label>
							<form:input path="txtEmail" cssClass="form-control" onblur="validateEmail(this.value);"/>
							</div>
							<br>           				
           				<div >
           				<button id="submit" name="btn" value="Invite" class="btn btn-primary">Save</button>	
 			             <button id="reset" name="btn" value="Cancel" class="btn btn-primary">Cancel</button><br><br>
           			</div>	
           			</div>           			
           	</div>
           	</div>           	
		</form:form>
		 <c:if test="${msg==1}">                     
	<h4 class="msg-succ">
	Auditor Added Succesfully.
</h4> 
</c:if>
<c:if test="${msg==0}">                     
<h4 class="msg-error">
Auditors Not Added .
</h4> 
</c:if>
	</div>
	<!-- </div> -->
</body>
</html>